; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0027/build/s16_div_s32_s16_alarm_0027.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [111 x i8] c"KLEE-ALARM-0027: signed overflow. assert -2147483648 <= (s32)(s32Temp1 / (s32)denominator) * (s32)denominator;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0027.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %numerator = alloca i32, align 4
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i16* %result, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = bitcast i32* %numerator to i8*, !dbg !53
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !54
  %1 = bitcast i16* %denominator to i8*, !dbg !55
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  %2 = load i32, i32* %numerator, align 4, !dbg !57
  %3 = load i16, i16* %denominator, align 2, !dbg !58
  %call = call signext i16 @s16_div_s32_s16(i32 %2, i16 signext %3), !dbg !59
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
  br i1 %cmp6, label %if.then8, label %if.else32, !dbg !211

if.then8:                                         ; preds = %if.else5
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !212
  %conv9 = sext i16 %4 to i64, !dbg !215
  %call = call i32 @klee_alarm_divisor_nonzero(i64 %conv9), !dbg !216
  %tobool = icmp ne i32 %call, 0, !dbg !216
  br i1 %tobool, label %if.end, label %if.then10, !dbg !217

if.then10:                                        ; preds = %if.then8
  store i16 0, i16* %retval, align 2, !dbg !218
  br label %return, !dbg !218

if.end:                                           ; preds = %if.then8
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !220
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !222
  %conv11 = sext i16 %6 to i32, !dbg !223
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !224
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !224
  %div = sdiv i32 %5, %conv11, !dbg !224, !klee.check.div !101
  %conv12 = sext i32 %div to i64, !dbg !225
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !226
  %conv13 = sext i16 %7 to i32, !dbg !227
  %conv14 = sext i32 %conv13 to i64, !dbg !228
  %call15 = call i32 @klee_alarm_s32_mul_upper(i64 %conv12, i64 %conv14), !dbg !229
  %tobool16 = icmp ne i32 %call15, 0, !dbg !229
  br i1 %tobool16, label %if.end18, label %if.then17, !dbg !230

if.then17:                                        ; preds = %if.end
  store i16 0, i16* %retval, align 2, !dbg !231
  br label %return, !dbg !231

if.end18:                                         ; preds = %if.end
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !233
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !235
  %conv19 = sext i16 %9 to i32, !dbg !236
  %int_cast_to_i641 = zext i32 %conv19 to i64, !dbg !237
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !237
  %div20 = sdiv i32 %8, %conv19, !dbg !237, !klee.check.div !101
  %conv21 = sext i32 %div20 to i64, !dbg !238
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !239
  %conv22 = sext i16 %10 to i32, !dbg !240
  %conv23 = sext i32 %conv22 to i64, !dbg !241
  %call24 = call i32 @klee_alarm_s32_mul_lower(i64 %conv21, i64 %conv23), !dbg !242
  %tobool25 = icmp ne i32 %call24, 0, !dbg !242
  br i1 %tobool25, label %if.end27, label %if.then26, !dbg !243

if.then26:                                        ; preds = %if.end18
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 286, i8* getelementptr inbounds ([111 x i8], [111 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !244
  unreachable, !dbg !244

if.end27:                                         ; preds = %if.end18
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !246
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !247
  %conv28 = sext i16 %12 to i32, !dbg !248
  %int_cast_to_i642 = zext i32 %conv28 to i64, !dbg !249
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !249
  %div29 = sdiv i32 %11, %conv28, !dbg !249, !klee.check.div !101
  %13 = load i16, i16* %denominator.addr, align 2, !dbg !250
  %conv30 = sext i16 %13 to i32, !dbg !251
  %mul = mul nsw i32 %div29, %conv30, !dbg !252
  %conv31 = sext i32 %mul to i64, !dbg !253
  store volatile i64 %conv31, i64* @klee_alarm_sink_s64, align 8, !dbg !254
  store i16 0, i16* %retval, align 2, !dbg !255
  br label %return, !dbg !255

if.else32:                                        ; preds = %if.else5
  %14 = load i16, i16* %denominator.addr, align 2, !dbg !256
  %conv33 = sext i16 %14 to i32, !dbg !256
  %cmp34 = icmp ne i32 %conv33, -1, !dbg !259
  br i1 %cmp34, label %if.then36, label %if.else54, !dbg !260

if.then36:                                        ; preds = %if.else32
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !261
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !263
  %17 = load i16, i16* %denominator.addr, align 2, !dbg !264
  %conv37 = sext i16 %17 to i32, !dbg !264
  %int_cast_to_i643 = zext i32 %conv37 to i64, !dbg !265
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !265
  %div38 = sdiv i32 %16, %conv37, !dbg !265, !klee.check.div !101
  %18 = load i16, i16* %denominator.addr, align 2, !dbg !266
  %conv39 = sext i16 %18 to i32, !dbg !266
  %mul40 = mul nsw i32 %div38, %conv39, !dbg !267
  %sub = sub nsw i32 %15, %mul40, !dbg !268
  %shl = shl i32 %sub, 1, !dbg !269
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !270
  %19 = load i32, i32* %s32Temp2, align 4, !dbg !271
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !272
  %conv41 = sext i16 %20 to i32, !dbg !272
  %int_cast_to_i644 = zext i32 %conv41 to i64, !dbg !273
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !273
  %div42 = sdiv i32 %19, %conv41, !dbg !273, !klee.check.div !101
  store i32 %div42, i32* %s32Temp1, align 4, !dbg !274
  %21 = load i32, i32* %s32Temp1, align 4, !dbg !275
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !276
  %23 = load i16, i16* %denominator.addr, align 2, !dbg !277
  %conv43 = sext i16 %23 to i32, !dbg !277
  %int_cast_to_i645 = zext i32 %conv43 to i64, !dbg !278
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !278
  %div44 = sdiv i32 %22, %conv43, !dbg !278, !klee.check.div !101
  %add = add nsw i32 %21, %div44, !dbg !279
  store i32 %add, i32* %s32Temp1, align 4, !dbg !280
  %24 = load i32, i32* %s32Temp1, align 4, !dbg !281
  %cmp45 = icmp slt i32 %24, 32767, !dbg !283
  br i1 %cmp45, label %if.then47, label %if.else53, !dbg !284

if.then47:                                        ; preds = %if.then36
  %25 = load i32, i32* %s32Temp1, align 4, !dbg !285
  %cmp48 = icmp sgt i32 %25, -32768, !dbg !288
  br i1 %cmp48, label %if.then50, label %if.else52, !dbg !289

if.then50:                                        ; preds = %if.then47
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !290
  %conv51 = trunc i32 %26 to i16, !dbg !292
  store i16 %conv51, i16* %retval, align 2, !dbg !293
  br label %return, !dbg !293

if.else52:                                        ; preds = %if.then47
  store i16 -32768, i16* %retval, align 2, !dbg !294
  br label %return, !dbg !294

if.else53:                                        ; preds = %if.then36
  store i16 32767, i16* %retval, align 2, !dbg !296
  br label %return, !dbg !296

if.else54:                                        ; preds = %if.else32
  store i16 32767, i16* %retval, align 2, !dbg !298
  br label %return, !dbg !298

return:                                           ; preds = %if.else54, %if.else53, %if.else52, %if.then50, %if.end27, %if.then17, %if.then10, %if.else, %if.then4
  %27 = load i16, i16* %retval, align 2, !dbg !300
  ret i16 %27, !dbg !300
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !301 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !304, metadata !DIExpression()), !dbg !305
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !306
  %cmp = icmp ne i64 %0, 0, !dbg !307
  %conv = zext i1 %cmp to i32, !dbg !307
  ret i32 %conv, !dbg !308
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !309 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !312, metadata !DIExpression()), !dbg !313
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !314, metadata !DIExpression()), !dbg !315
  %0 = load i64, i64* %left.addr, align 8, !dbg !316
  %1 = load i64, i64* %right.addr, align 8, !dbg !317
  %mul = mul nsw i64 %0, %1, !dbg !318
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !319
  %conv = zext i1 %cmp to i32, !dbg !319
  ret i32 %conv, !dbg !320
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !321 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !322, metadata !DIExpression()), !dbg !323
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !324, metadata !DIExpression()), !dbg !325
  %0 = load i64, i64* %left.addr, align 8, !dbg !326
  %1 = load i64, i64* %right.addr, align 8, !dbg !327
  %mul = mul nsw i64 %0, %1, !dbg !328
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !329
  %conv = zext i1 %cmp to i32, !dbg !329
  ret i32 %conv, !dbg !330
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !331 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !334, metadata !DIExpression()), !dbg !335
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !336, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !338, metadata !DIExpression()), !dbg !339
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !340, metadata !DIExpression()), !dbg !341
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !342, metadata !DIExpression()), !dbg !343
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !344
  %conv = zext i16 %0 to i32, !dbg !344
  %and = and i32 %conv, 65535, !dbg !345
  %conv1 = trunc i32 %and to i16, !dbg !344
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !346
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !347
  %conv2 = sext i16 %1 to i32, !dbg !347
  %shl = shl i32 %conv2, 16, !dbg !348
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !349
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !350
  %conv3 = zext i16 %2 to i32, !dbg !350
  %cmp = icmp eq i32 %conv3, 0, !dbg !352
  br i1 %cmp, label %if.then, label %if.else9, !dbg !353

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !354
  %conv5 = sext i16 %3 to i32, !dbg !354
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !357
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !358

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !359
  br label %return, !dbg !359

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !361
  br label %return, !dbg !361

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !363
  %conv10 = sext i16 %4 to i32, !dbg !363
  %shl11 = shl i32 %conv10, 16, !dbg !365
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !366
  %conv12 = sext i16 %5 to i32, !dbg !366
  %shl13 = shl i32 %conv12, 16, !dbg !367
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !368
  %conv14 = zext i16 %6 to i32, !dbg !368
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !369
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !369
  %div = sdiv i32 %shl13, %conv14, !dbg !369, !klee.check.div !101
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !370
  %conv15 = zext i16 %7 to i32, !dbg !370
  %mul = mul nsw i32 %div, %conv15, !dbg !371
  %sub = sub nsw i32 %shl11, %mul, !dbg !372
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !373
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !374
  %shl16 = shl i32 %8, 1, !dbg !375
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !376
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !377
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !378
  %conv17 = zext i16 %10 to i32, !dbg !378
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !379
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !379
  %div18 = sdiv i32 %9, %conv17, !dbg !379, !klee.check.div !101
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !380
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !381
  %conv19 = sext i16 %11 to i32, !dbg !381
  %shl20 = shl i32 %conv19, 16, !dbg !382
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !383
  %conv21 = zext i16 %12 to i32, !dbg !383
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !384
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !384
  %div22 = sdiv i32 %shl20, %conv21, !dbg !384, !klee.check.div !101
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !385
  %add = add nsw i32 %div22, %13, !dbg !386
  store i32 %add, i32* %s32Temp1, align 4, !dbg !387
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !388
  %cmp23 = icmp slt i32 %14, 32767, !dbg !390
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !391

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !392
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !395
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !396

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !397
  %conv29 = trunc i32 %16 to i16, !dbg !399
  store i16 %conv29, i16* %retval, align 2, !dbg !400
  br label %return, !dbg !400

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !401
  br label %return, !dbg !401

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !403
  br label %return, !dbg !403

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !405
  ret i16 %17, !dbg !405
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !406 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !407, metadata !DIExpression()), !dbg !408
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !409, metadata !DIExpression()), !dbg !410
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !411, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !413, metadata !DIExpression()), !dbg !414
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !415
  %conv = zext i16 %0 to i32, !dbg !415
  %and = and i32 %conv, 65535, !dbg !416
  %conv1 = trunc i32 %and to i16, !dbg !415
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !417
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !418
  %conv2 = zext i16 %1 to i32, !dbg !418
  %cmp = icmp eq i32 %conv2, 0, !dbg !420
  br i1 %cmp, label %if.then, label %if.else8, !dbg !421

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !422
  %conv4 = sext i16 %2 to i32, !dbg !422
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !425
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !426

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !427
  br label %return, !dbg !427

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !429
  br label %return, !dbg !429

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !431
  %conv9 = sext i16 %3 to i32, !dbg !431
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !433
  %conv10 = sext i16 %4 to i32, !dbg !433
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !434
  %conv11 = zext i16 %5 to i32, !dbg !434
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !435
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !435
  %div = sdiv i32 %conv10, %conv11, !dbg !435, !klee.check.div !101
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !436
  %conv12 = zext i16 %6 to i32, !dbg !436
  %mul = mul nsw i32 %div, %conv12, !dbg !437
  %sub = sub nsw i32 %conv9, %mul, !dbg !438
  %shl = shl i32 %sub, 1, !dbg !439
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !440
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !441
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !442
  %conv13 = zext i16 %8 to i32, !dbg !442
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !443
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !443
  %div14 = sdiv i32 %7, %conv13, !dbg !443, !klee.check.div !101
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !444
  %conv15 = sext i16 %9 to i32, !dbg !444
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !445
  %conv16 = zext i16 %10 to i32, !dbg !445
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !446
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !446
  %div17 = sdiv i32 %conv15, %conv16, !dbg !446, !klee.check.div !101
  %add = add nsw i32 %div14, %div17, !dbg !447
  store i32 %add, i32* %s32Temp1, align 4, !dbg !448
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !449
  %conv18 = trunc i32 %11 to i16, !dbg !449
  store i16 %conv18, i16* %retval, align 2, !dbg !450
  br label %return, !dbg !450

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !451
  ret i16 %12, !dbg !451
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !452 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !455, metadata !DIExpression()), !dbg !456
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !457, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !459, metadata !DIExpression()), !dbg !464
  store i32 0, i32* %u32Temp1, align 4, !dbg !464
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !465, metadata !DIExpression()), !dbg !466
  store i32 0, i32* %u32Temp2, align 4, !dbg !466
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !467, metadata !DIExpression()), !dbg !468
  store i32 0, i32* %u32Temp3, align 4, !dbg !468
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !469
  %conv = zext i16 %0 to i32, !dbg !469
  %cmp = icmp eq i32 %conv, 0, !dbg !471
  br i1 %cmp, label %if.then, label %if.else, !dbg !472

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !473
  br label %return, !dbg !473

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !475
  %conv2 = zext i16 %1 to i32, !dbg !475
  %shl = shl i32 %conv2, 16, !dbg !477
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !478
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !479
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !480
  %conv3 = zext i16 %3 to i32, !dbg !480
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !481
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !481
  %div = udiv i32 %2, %conv3, !dbg !481, !klee.check.div !101
  store i32 %div, i32* %u32Temp2, align 4, !dbg !482
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !483
  %add = add i32 %4, 128, !dbg !484
  %shr = lshr i32 %add, 8, !dbg !485
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !486
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !487
  %cmp4 = icmp ult i32 %5, 255, !dbg !489
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !490

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !491
  %conv7 = trunc i32 %6 to i8, !dbg !493
  store i8 %conv7, i8* %retval, align 1, !dbg !494
  br label %return, !dbg !494

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !495
  br label %return, !dbg !495

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !497
  ret i8 %7, !dbg !497
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !498 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !501, metadata !DIExpression()), !dbg !502
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !503, metadata !DIExpression()), !dbg !504
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !505, metadata !DIExpression()), !dbg !506
  store i32 0, i32* %s32Temp1, align 4, !dbg !506
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !507
  %conv = zext i16 %0 to i32, !dbg !507
  %and = and i32 %conv, 65535, !dbg !508
  %conv1 = trunc i32 %and to i16, !dbg !507
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !509
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !510
  %conv2 = zext i16 %1 to i32, !dbg !510
  %and3 = and i32 %conv2, 65535, !dbg !512
  %cmp = icmp eq i32 %and3, 0, !dbg !513
  br i1 %cmp, label %if.then, label %if.else8, !dbg !514

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !515
  %cmp5 = icmp sge i32 %2, 0, !dbg !518
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !519

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !520
  br label %return, !dbg !520

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !522
  br label %return, !dbg !522

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !524
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !526
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !527
  %conv9 = zext i16 %5 to i32, !dbg !527
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !528
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !528
  %div = sdiv i32 %4, %conv9, !dbg !528, !klee.check.div !101
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !529
  %conv10 = zext i16 %6 to i32, !dbg !529
  %mul = mul nsw i32 %div, %conv10, !dbg !530
  %sub = sub nsw i32 %3, %mul, !dbg !531
  %shl = shl i32 %sub, 1, !dbg !532
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !533
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !534
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !535
  %conv11 = zext i16 %8 to i32, !dbg !535
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !536
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !536
  %div12 = sdiv i32 %7, %conv11, !dbg !536, !klee.check.div !101
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !537
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !538
  %conv13 = zext i16 %10 to i32, !dbg !538
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !539
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !539
  %div14 = sdiv i32 %9, %conv13, !dbg !539, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !540
  store i32 %add, i32* %s32Temp1, align 4, !dbg !541
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !542
  %cmp15 = icmp slt i32 %11, 65535, !dbg !544
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !545

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !546
  %cmp18 = icmp sgt i32 %12, 0, !dbg !549
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !550

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !551
  %conv21 = trunc i32 %13 to i16, !dbg !553
  store i16 %conv21, i16* %retval, align 2, !dbg !554
  br label %return, !dbg !554

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !555
  br label %return, !dbg !555

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !557
  br label %return, !dbg !557

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !559
  ret i16 %14, !dbg !559
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !560 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !563, metadata !DIExpression()), !dbg !564
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !565, metadata !DIExpression()), !dbg !566
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !567, metadata !DIExpression()), !dbg !568
  store i32 0, i32* %u32Temp, align 4, !dbg !568
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !569
  %conv = zext i16 %0 to i32, !dbg !569
  %cmp = icmp eq i32 %conv, 0, !dbg !571
  br i1 %cmp, label %if.then, label %if.else, !dbg !572

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !573
  br label %return, !dbg !573

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !575
  %conv2 = zext i16 %1 to i32, !dbg !575
  %shl = shl i32 %conv2, 16, !dbg !577
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !578
  %conv3 = zext i16 %2 to i32, !dbg !578
  %shr = ashr i32 %conv3, 1, !dbg !579
  %add = add nsw i32 %shl, %shr, !dbg !580
  store i32 %add, i32* %u32Temp, align 4, !dbg !581
  %3 = load i32, i32* %u32Temp, align 4, !dbg !582
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !583
  %conv4 = zext i16 %4 to i32, !dbg !583
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !584
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !584
  %div = udiv i32 %3, %conv4, !dbg !584, !klee.check.div !101
  store i32 %div, i32* %u32Temp, align 4, !dbg !585
  %5 = load i32, i32* %u32Temp, align 4, !dbg !586
  %cmp5 = icmp ult i32 %5, 65535, !dbg !588
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !589

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !590
  %and = and i32 %6, 65535, !dbg !592
  %conv8 = trunc i32 %and to i16, !dbg !590
  store i16 %conv8, i16* %retval, align 2, !dbg !593
  br label %return, !dbg !593

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !594
  br label %return, !dbg !594

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !596
  ret i16 %7, !dbg !596
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !597 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !600, metadata !DIExpression()), !dbg !601
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !602, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !604, metadata !DIExpression()), !dbg !605
  store i32 0, i32* %u32Temp1, align 4, !dbg !605
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !606, metadata !DIExpression()), !dbg !607
  store i32 0, i32* %u32Temp2, align 4, !dbg !607
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !608
  %conv = zext i16 %0 to i32, !dbg !608
  %and = and i32 %conv, 65535, !dbg !609
  %conv1 = trunc i32 %and to i16, !dbg !608
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !610
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !611
  %conv2 = zext i16 %1 to i32, !dbg !611
  %cmp = icmp eq i32 %conv2, 0, !dbg !613
  br i1 %cmp, label %if.then, label %if.else, !dbg !614

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !615
  br label %return, !dbg !615

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !617
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !619
  %conv4 = zext i16 %3 to i32, !dbg !619
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !620
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !620
  %div = udiv i32 %2, %conv4, !dbg !620, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !621
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !622
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !623
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !624
  %conv5 = zext i16 %6 to i32, !dbg !624
  %mul = mul i32 %5, %conv5, !dbg !625
  %sub = sub i32 %4, %mul, !dbg !626
  %shl = shl i32 %sub, 1, !dbg !627
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !628
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !629
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !630
  %conv6 = zext i16 %8 to i32, !dbg !630
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !631
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !631
  %div7 = udiv i32 %7, %conv6, !dbg !631, !klee.check.div !101
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !632
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !633
  %conv8 = zext i16 %10 to i32, !dbg !633
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !634
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !634
  %div9 = udiv i32 %9, %conv8, !dbg !634, !klee.check.div !101
  %add = add i32 %div7, %div9, !dbg !635
  store i32 %add, i32* %u32Temp2, align 4, !dbg !636
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !637
  %cmp10 = icmp ult i32 %11, 65535, !dbg !639
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !640

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !641
  %and13 = and i32 %12, 65535, !dbg !643
  %conv14 = trunc i32 %and13 to i16, !dbg !641
  store i16 %conv14, i16* %retval, align 2, !dbg !644
  br label %return, !dbg !644

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !645
  br label %return, !dbg !645

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !647
  ret i16 %13, !dbg !647
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !648 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !651, metadata !DIExpression()), !dbg !652
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !653, metadata !DIExpression()), !dbg !654
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !655, metadata !DIExpression()), !dbg !656
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !657, metadata !DIExpression()), !dbg !658
  store i32 0, i32* %s32Result, align 4, !dbg !658
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !659, metadata !DIExpression()), !dbg !660
  store i32 0, i32* %s32Temp1, align 4, !dbg !660
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !661
  %conv = sext i16 %0 to i32, !dbg !661
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !662
  %conv1 = zext i16 %1 to i32, !dbg !662
  %mul = mul nsw i32 %conv, %conv1, !dbg !663
  store i32 %mul, i32* %s32Result, align 4, !dbg !664
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !665
  %conv2 = sext i16 %2 to i32, !dbg !665
  %cmp = icmp eq i32 %conv2, 0, !dbg !667
  br i1 %cmp, label %if.then, label %if.else7, !dbg !668

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !669
  %cmp4 = icmp slt i32 %3, 0, !dbg !672
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !673

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !674
  br label %return, !dbg !674

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !676
  br label %return, !dbg !676

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !678
  %5 = load i32, i32* %s32Result, align 4, !dbg !680
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !681
  %conv8 = sext i16 %6 to i32, !dbg !681
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !682
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !682
  %div = sdiv i32 %5, %conv8, !dbg !682, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !683
  %conv9 = sext i16 %7 to i32, !dbg !683
  %mul10 = mul nsw i32 %div, %conv9, !dbg !684
  %sub = sub nsw i32 %4, %mul10, !dbg !685
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !686
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !687
  %shl = shl i32 %8, 1, !dbg !688
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !689
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !690
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !691
  %conv11 = sext i16 %10 to i32, !dbg !691
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !692
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !692
  %div12 = sdiv i32 %9, %conv11, !dbg !692, !klee.check.div !101
  %11 = load i32, i32* %s32Result, align 4, !dbg !693
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !694
  %conv13 = sext i16 %12 to i32, !dbg !694
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !695
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !695
  %div14 = sdiv i32 %11, %conv13, !dbg !695, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !696
  store i32 %add, i32* %s32Result, align 4, !dbg !697
  %13 = load i32, i32* %s32Result, align 4, !dbg !698
  %cmp15 = icmp slt i32 %13, 32767, !dbg !700
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !701

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !702
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !705
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !706

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !707
  %conv21 = trunc i32 %15 to i16, !dbg !709
  store i16 %conv21, i16* %retval, align 2, !dbg !710
  br label %return, !dbg !710

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !711
  br label %return, !dbg !711

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !713
  br label %return, !dbg !713

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !715
  ret i16 %16, !dbg !715
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !716 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !719, metadata !DIExpression()), !dbg !720
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !721, metadata !DIExpression()), !dbg !722
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !723, metadata !DIExpression()), !dbg !724
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !725, metadata !DIExpression()), !dbg !726
  store i32 0, i32* %s32Result, align 4, !dbg !726
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !727, metadata !DIExpression()), !dbg !728
  store i32 0, i32* %s32Temp1, align 4, !dbg !728
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !729
  %conv = zext i16 %0 to i32, !dbg !729
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !730
  %conv1 = sext i16 %1 to i32, !dbg !730
  %mul = mul nsw i32 %conv, %conv1, !dbg !731
  store i32 %mul, i32* %s32Result, align 4, !dbg !732
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !733
  %conv2 = zext i16 %2 to i32, !dbg !733
  %cmp = icmp eq i32 %conv2, 0, !dbg !735
  br i1 %cmp, label %if.then, label %if.else7, !dbg !736

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !737
  %cmp4 = icmp slt i32 %3, 0, !dbg !740
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !741

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !742
  br label %return, !dbg !742

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !744
  br label %return, !dbg !744

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !746
  %5 = load i32, i32* %s32Result, align 4, !dbg !748
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !749
  %conv8 = zext i16 %6 to i32, !dbg !749
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !750
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !750
  %div = sdiv i32 %5, %conv8, !dbg !750, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !751
  %conv9 = zext i16 %7 to i32, !dbg !751
  %mul10 = mul nsw i32 %div, %conv9, !dbg !752
  %sub = sub nsw i32 %4, %mul10, !dbg !753
  %shl = shl i32 %sub, 1, !dbg !754
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !755
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !756
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !757
  %conv11 = zext i16 %9 to i32, !dbg !757
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !758
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !758
  %div12 = sdiv i32 %8, %conv11, !dbg !758, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !759
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !760
  %conv13 = zext i16 %11 to i32, !dbg !760
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !761
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !761
  %div14 = sdiv i32 %10, %conv13, !dbg !761, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !762
  store i32 %add, i32* %s32Result, align 4, !dbg !763
  %12 = load i32, i32* %s32Result, align 4, !dbg !764
  %cmp15 = icmp slt i32 %12, 32767, !dbg !766
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !767

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !768
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !771
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !772

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !773
  %conv21 = trunc i32 %14 to i16, !dbg !775
  store i16 %conv21, i16* %retval, align 2, !dbg !776
  br label %return, !dbg !776

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !777
  br label %return, !dbg !777

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !779
  br label %return, !dbg !779

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !781
  ret i16 %15, !dbg !781
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !782 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !785, metadata !DIExpression()), !dbg !786
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !787, metadata !DIExpression()), !dbg !788
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !789, metadata !DIExpression()), !dbg !790
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !791, metadata !DIExpression()), !dbg !792
  store i32 0, i32* %u32Result, align 4, !dbg !792
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !793, metadata !DIExpression()), !dbg !794
  store i32 0, i32* %u32Temp1, align 4, !dbg !794
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !795, metadata !DIExpression()), !dbg !796
  store i32 0, i32* %s32Result, align 4, !dbg !796
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !797, metadata !DIExpression()), !dbg !798
  store i32 0, i32* %s32Temp1, align 4, !dbg !798
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !799
  %conv = sext i16 %0 to i32, !dbg !799
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !800
  %conv1 = zext i16 %1 to i32, !dbg !800
  %mul = mul nsw i32 %conv, %conv1, !dbg !801
  store i32 %mul, i32* %s32Result, align 4, !dbg !802
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !803
  %conv2 = sext i16 %2 to i32, !dbg !803
  %cmp = icmp eq i32 %conv2, 0, !dbg !805
  br i1 %cmp, label %if.then, label %if.else7, !dbg !806

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !807
  %cmp4 = icmp sge i32 %3, 0, !dbg !810
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !811

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !812
  br label %return, !dbg !812

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !814
  br label %return, !dbg !814

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !816
  %5 = load i32, i32* %s32Result, align 4, !dbg !818
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !819
  %conv8 = sext i16 %6 to i32, !dbg !819
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !820
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !820
  %div = sdiv i32 %5, %conv8, !dbg !820, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !821
  %conv9 = sext i16 %7 to i32, !dbg !821
  %mul10 = mul nsw i32 %div, %conv9, !dbg !822
  %sub = sub nsw i32 %4, %mul10, !dbg !823
  %shl = shl i32 %sub, 1, !dbg !824
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !825
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !826
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !827
  %conv11 = sext i16 %9 to i32, !dbg !827
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !828
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !828
  %div12 = sdiv i32 %8, %conv11, !dbg !828, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !829
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !830
  %conv13 = sext i16 %11 to i32, !dbg !830
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !831
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !831
  %div14 = sdiv i32 %10, %conv13, !dbg !831, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !832
  store i32 %add, i32* %s32Result, align 4, !dbg !833
  %12 = load i32, i32* %s32Result, align 4, !dbg !834
  %cmp15 = icmp slt i32 %12, 65535, !dbg !836
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !837

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !838
  %cmp18 = icmp sgt i32 %13, 0, !dbg !841
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !842

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !843
  %conv21 = trunc i32 %14 to i16, !dbg !845
  store i16 %conv21, i16* %retval, align 2, !dbg !846
  br label %return, !dbg !846

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !847
  br label %return, !dbg !847

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !849
  br label %return, !dbg !849

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !851
  ret i16 %15, !dbg !851
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !852 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !855, metadata !DIExpression()), !dbg !856
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !857, metadata !DIExpression()), !dbg !858
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !859, metadata !DIExpression()), !dbg !860
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !861, metadata !DIExpression()), !dbg !862
  store i32 0, i32* %s32Result, align 4, !dbg !862
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !863, metadata !DIExpression()), !dbg !864
  store i32 0, i32* %s32Temp1, align 4, !dbg !864
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !865
  %conv = sext i16 %0 to i32, !dbg !865
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !866
  %conv1 = zext i16 %1 to i32, !dbg !866
  %mul = mul nsw i32 %conv, %conv1, !dbg !867
  store i32 %mul, i32* %s32Result, align 4, !dbg !868
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !869
  %conv2 = zext i16 %2 to i32, !dbg !869
  %cmp = icmp eq i32 %conv2, 0, !dbg !871
  br i1 %cmp, label %if.then, label %if.else7, !dbg !872

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !873
  %cmp4 = icmp sge i32 %3, 0, !dbg !876
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !877

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !878
  br label %return, !dbg !878

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !880
  br label %return, !dbg !880

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !882
  %5 = load i32, i32* %s32Result, align 4, !dbg !884
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !885
  %conv8 = zext i16 %6 to i32, !dbg !885
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !886
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !886
  %div = sdiv i32 %5, %conv8, !dbg !886, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !887
  %conv9 = zext i16 %7 to i32, !dbg !887
  %mul10 = mul nsw i32 %div, %conv9, !dbg !888
  %sub = sub nsw i32 %4, %mul10, !dbg !889
  %shl = shl i32 %sub, 1, !dbg !890
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !891
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !892
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !893
  %conv11 = zext i16 %9 to i32, !dbg !893
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !894
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !894
  %div12 = sdiv i32 %8, %conv11, !dbg !894, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !895
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !896
  %conv13 = zext i16 %11 to i32, !dbg !896
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !897
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !897
  %div14 = sdiv i32 %10, %conv13, !dbg !897, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !898
  store i32 %add, i32* %s32Result, align 4, !dbg !899
  %12 = load i32, i32* %s32Result, align 4, !dbg !900
  %cmp15 = icmp slt i32 %12, 65535, !dbg !902
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !903

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !904
  %cmp18 = icmp sgt i32 %13, 0, !dbg !907
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !908

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !909
  %conv21 = trunc i32 %14 to i16, !dbg !911
  store i16 %conv21, i16* %retval, align 2, !dbg !912
  br label %return, !dbg !912

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !913
  br label %return, !dbg !913

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !915
  br label %return, !dbg !915

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !917
  ret i16 %15, !dbg !917
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !918 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !921, metadata !DIExpression()), !dbg !922
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !923, metadata !DIExpression()), !dbg !924
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !925, metadata !DIExpression()), !dbg !926
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !927, metadata !DIExpression()), !dbg !928
  store i32 0, i32* %u32Temp1, align 4, !dbg !928
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !929, metadata !DIExpression()), !dbg !930
  store i16 0, i16* %u16TempDenom, align 2, !dbg !930
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !931
  %conv = zext i16 %0 to i32, !dbg !931
  %cmp = icmp eq i32 %conv, 0, !dbg !933
  br i1 %cmp, label %if.then, label %if.else, !dbg !934

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !935
  br label %return, !dbg !935

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !937
  %conv2 = zext i16 %1 to i32, !dbg !937
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !939
  %conv3 = zext i16 %2 to i32, !dbg !939
  %mul = mul nsw i32 %conv2, %conv3, !dbg !940
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !941
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !942
  %conv4 = zext i16 %3 to i32, !dbg !942
  %shr = ashr i32 %conv4, 1, !dbg !943
  %conv5 = trunc i32 %shr to i16, !dbg !942
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !944
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !945
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !946
  %conv6 = zext i16 %5 to i32, !dbg !946
  %add = add i32 %4, %conv6, !dbg !947
  store i32 %add, i32* %u32Temp1, align 4, !dbg !948
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !949
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !950
  %conv7 = zext i16 %7 to i32, !dbg !950
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !951
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !951
  %div = udiv i32 %6, %conv7, !dbg !951, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !952
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !953
  %cmp8 = icmp ult i32 %8, 65535, !dbg !955
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !956

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !957
  %and = and i32 %9, 65535, !dbg !959
  %conv11 = trunc i32 %and to i16, !dbg !960
  store i16 %conv11, i16* %retval, align 2, !dbg !961
  br label %return, !dbg !961

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !962
  br label %return, !dbg !962

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !964
  ret i16 %10, !dbg !964
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !965 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !968, metadata !DIExpression()), !dbg !969
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !970, metadata !DIExpression()), !dbg !971
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !972, metadata !DIExpression()), !dbg !973
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !974, metadata !DIExpression()), !dbg !975
  store i32 0, i32* %u32Temp1, align 4, !dbg !975
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !976
  %cmp = icmp eq i32 %0, 0, !dbg !978
  br i1 %cmp, label %if.then, label %if.else, !dbg !979

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !980
  br label %return, !dbg !980

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !982
  %conv = zext i16 %1 to i32, !dbg !982
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !984
  %conv1 = zext i16 %2 to i32, !dbg !984
  %mul = mul nsw i32 %conv, %conv1, !dbg !985
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !986
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !987
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !987
  %div = udiv i32 %mul, %3, !dbg !987, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !988
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !989
  %conv2 = zext i16 %4 to i32, !dbg !989
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !991
  %conv3 = zext i16 %5 to i32, !dbg !991
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !992
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !993
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !994
  %mul5 = mul i32 %6, %7, !dbg !995
  %sub = sub i32 %mul4, %mul5, !dbg !996
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !997
  %div6 = udiv i32 %8, 2, !dbg !998
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !999
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1000

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1001
  %inc = add i32 %9, 1, !dbg !1001
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1001
  br label %if.end, !dbg !1003

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1004
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1006
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1007

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1008
  %and = and i32 %11, 65535, !dbg !1010
  %conv13 = trunc i32 %and to i16, !dbg !1011
  store i16 %conv13, i16* %retval, align 2, !dbg !1012
  br label %return, !dbg !1012

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1013
  br label %return, !dbg !1013

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1015
  ret i16 %12, !dbg !1015
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1016 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1019, metadata !DIExpression()), !dbg !1020
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1021, metadata !DIExpression()), !dbg !1022
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1023, metadata !DIExpression()), !dbg !1024
  store i32 0, i32* %u32Temp1, align 4, !dbg !1024
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1025
  %conv = zext i16 %0 to i32, !dbg !1025
  %cmp = icmp eq i32 %conv, 0, !dbg !1027
  br i1 %cmp, label %if.then, label %if.else, !dbg !1028

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1029
  br label %return, !dbg !1029

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1031
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1033
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1034
  %conv2 = zext i16 %3 to i32, !dbg !1034
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1035
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1035
  %div = udiv i32 %2, %conv2, !dbg !1035, !klee.check.div !101
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1036
  %conv3 = zext i16 %4 to i32, !dbg !1036
  %mul = mul i32 %div, %conv3, !dbg !1037
  %sub = sub i32 %1, %mul, !dbg !1038
  %shl = shl i32 %sub, 1, !dbg !1039
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1040
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1041
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1042
  %conv4 = zext i16 %6 to i32, !dbg !1042
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1043
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1043
  %div5 = udiv i32 %5, %conv4, !dbg !1043, !klee.check.div !101
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1044
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1045
  %conv6 = zext i16 %8 to i32, !dbg !1045
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1046
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1046
  %div7 = udiv i32 %7, %conv6, !dbg !1046, !klee.check.div !101
  %add = add i32 %div5, %div7, !dbg !1047
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1048
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1049
  store i32 %9, i32* %retval, align 4, !dbg !1050
  br label %return, !dbg !1050

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1051
  ret i32 %10, !dbg !1051
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1052 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1055, metadata !DIExpression()), !dbg !1056
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1057, metadata !DIExpression()), !dbg !1058
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1059, metadata !DIExpression()), !dbg !1060
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1061, metadata !DIExpression()), !dbg !1062
  store i32 0, i32* %s32Temp1, align 4, !dbg !1062
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1063, metadata !DIExpression()), !dbg !1064
  store i32 0, i32* %s32Temp2, align 4, !dbg !1064
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1065, metadata !DIExpression()), !dbg !1066
  store i32 0, i32* %s32Temp3, align 4, !dbg !1066
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1067
  %conv = sext i16 %0 to i32, !dbg !1067
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1068
  %conv1 = sext i16 %1 to i32, !dbg !1068
  %mul = mul nsw i32 %conv, %conv1, !dbg !1069
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1070
  %2 = load i16, i16* %div.addr, align 2, !dbg !1071
  %conv2 = sext i16 %2 to i32, !dbg !1071
  %cmp = icmp eq i32 %conv2, 0, !dbg !1073
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1074

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1075
  %cmp4 = icmp slt i32 %3, 0, !dbg !1078
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1079

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1080
  br label %return, !dbg !1080

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1082
  br label %return, !dbg !1082

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1084
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1086
  %6 = load i16, i16* %div.addr, align 2, !dbg !1087
  %conv8 = sext i16 %6 to i32, !dbg !1087
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1088
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1088
  %div9 = sdiv i32 %5, %conv8, !dbg !1088, !klee.check.div !101
  %7 = load i16, i16* %div.addr, align 2, !dbg !1089
  %conv10 = sext i16 %7 to i32, !dbg !1089
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1090
  %sub = sub nsw i32 %4, %mul11, !dbg !1091
  %shl = shl i32 %sub, 1, !dbg !1092
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1093
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1094
  %9 = load i16, i16* %div.addr, align 2, !dbg !1095
  %conv12 = sext i16 %9 to i32, !dbg !1095
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1096
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1096
  %div13 = sdiv i32 %8, %conv12, !dbg !1096, !klee.check.div !101
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1097
  %11 = load i16, i16* %div.addr, align 2, !dbg !1098
  %conv14 = sext i16 %11 to i32, !dbg !1098
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1099
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1099
  %div15 = sdiv i32 %10, %conv14, !dbg !1099, !klee.check.div !101
  %add = add nsw i32 %div13, %div15, !dbg !1100
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1101
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1102
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1104
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1105

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1106
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1109
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1110

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1111
  %conv22 = trunc i32 %14 to i16, !dbg !1113
  store i16 %conv22, i16* %retval, align 2, !dbg !1114
  br label %return, !dbg !1114

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1115
  br label %return, !dbg !1115

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1117
  br label %return, !dbg !1117

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1119
  ret i16 %15, !dbg !1119
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1120 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1123, metadata !DIExpression()), !dbg !1124
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1125, metadata !DIExpression()), !dbg !1126
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1127, metadata !DIExpression()), !dbg !1128
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1129, metadata !DIExpression()), !dbg !1130
  store i32 0, i32* %s32Result, align 4, !dbg !1130
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1131, metadata !DIExpression()), !dbg !1132
  store i32 0, i32* %s32Temp1, align 4, !dbg !1132
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1133
  %conv = sext i16 %0 to i32, !dbg !1133
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1134
  %conv1 = sext i16 %1 to i32, !dbg !1134
  %mul = mul nsw i32 %conv, %conv1, !dbg !1135
  store i32 %mul, i32* %s32Result, align 4, !dbg !1136
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1137
  %conv2 = zext i16 %2 to i32, !dbg !1137
  %cmp = icmp eq i32 %conv2, 0, !dbg !1139
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1140

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1141
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1144
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1145

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1146
  br label %return, !dbg !1146

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1148
  %cmp7 = icmp eq i32 %4, 0, !dbg !1150
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1151

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1152
  br label %return, !dbg !1152

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1154
  br label %return, !dbg !1154

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1156
  %6 = load i32, i32* %s32Result, align 4, !dbg !1158
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1159
  %conv12 = zext i16 %7 to i32, !dbg !1159
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1160
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1160
  %div = sdiv i32 %6, %conv12, !dbg !1160, !klee.check.div !101
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1161
  %conv13 = zext i16 %8 to i32, !dbg !1161
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1162
  %sub = sub nsw i32 %5, %mul14, !dbg !1163
  %shl = shl i32 %sub, 1, !dbg !1164
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1165
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1166
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1167
  %conv15 = zext i16 %10 to i32, !dbg !1167
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1168
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1168
  %div16 = sdiv i32 %9, %conv15, !dbg !1168, !klee.check.div !101
  %11 = load i32, i32* %s32Result, align 4, !dbg !1169
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1170
  %conv17 = zext i16 %12 to i32, !dbg !1170
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1171
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1171
  %div18 = sdiv i32 %11, %conv17, !dbg !1171, !klee.check.div !101
  %add = add nsw i32 %div16, %div18, !dbg !1172
  store i32 %add, i32* %s32Result, align 4, !dbg !1173
  %13 = load i32, i32* %s32Result, align 4, !dbg !1174
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1176
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1177

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1178
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1181
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1182

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1183
  %conv25 = trunc i32 %15 to i16, !dbg !1185
  store i16 %conv25, i16* %retval, align 2, !dbg !1186
  br label %return, !dbg !1186

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1187
  br label %return, !dbg !1187

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1189
  br label %return, !dbg !1189

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1191
  ret i16 %16, !dbg !1191
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1192 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1195, metadata !DIExpression()), !dbg !1196
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1197, metadata !DIExpression()), !dbg !1198
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1199, metadata !DIExpression()), !dbg !1200
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1201
  %cmp = icmp eq i32 %0, 0, !dbg !1203
  br i1 %cmp, label %if.then, label %if.else, !dbg !1204

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1205
  br label %return, !dbg !1205

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1207
  %cmp1 = icmp sle i32 %1, 0, !dbg !1210
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1211

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1212
  br label %return, !dbg !1212

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1214
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1216
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1217
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1218
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1218
  %div = udiv i32 %3, %4, !dbg !1218, !klee.check.div !101
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1219
  %mul = mul i32 %div, %5, !dbg !1220
  %sub = sub i32 %2, %mul, !dbg !1221
  %shl = shl i32 %sub, 1, !dbg !1222
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1223
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1224
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1225
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1226
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1226
  %div4 = udiv i32 %6, %7, !dbg !1226, !klee.check.div !101
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1227
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1228
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1229
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1229
  %div5 = udiv i32 %8, %9, !dbg !1229, !klee.check.div !101
  %add = add i32 %div4, %div5, !dbg !1230
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1231
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1232
  store i32 %10, i32* %retval, align 4, !dbg !1233
  br label %return, !dbg !1233

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1234
  ret i32 %11, !dbg !1234
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1235 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1238, metadata !DIExpression()), !dbg !1239
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1240, metadata !DIExpression()), !dbg !1241
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1242, metadata !DIExpression()), !dbg !1243
  store i32 0, i32* %s32Temp1, align 4, !dbg !1243
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1244
  %cmp = icmp eq i32 %0, 0, !dbg !1246
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1247

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1248
  %cmp1 = icmp sge i32 %1, 0, !dbg !1251
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1252

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1253
  br label %return, !dbg !1253

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1255
  br label %return, !dbg !1255

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1257
  %cmp4 = icmp sge i32 %2, 0, !dbg !1260
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1261

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1262
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1264
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1265
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1266
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1266
  %div = udiv i32 %4, %5, !dbg !1266, !klee.check.div !101
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1267
  %mul = mul i32 %div, %6, !dbg !1268
  %sub = sub i32 %3, %mul, !dbg !1269
  %shl = shl i32 %sub, 1, !dbg !1270
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1271
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1272
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1273
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1274
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1274
  %div6 = udiv i32 %7, %8, !dbg !1274, !klee.check.div !101
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1275
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1276
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1277
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1277
  %div7 = udiv i32 %9, %10, !dbg !1277, !klee.check.div !101
  %add = add i32 %div6, %div7, !dbg !1278
  store i32 %add, i32* %retval, align 4, !dbg !1279
  br label %return, !dbg !1279

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1280
  br label %return, !dbg !1280

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1282
  ret i32 %11, !dbg !1282
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1283 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1286, metadata !DIExpression()), !dbg !1287
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1288, metadata !DIExpression()), !dbg !1289
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1290, metadata !DIExpression()), !dbg !1291
  store i32 0, i32* %u32Temp1, align 4, !dbg !1291
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1292, metadata !DIExpression()), !dbg !1293
  store i32 0, i32* %u32Temp2, align 4, !dbg !1293
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1294
  %cmp = icmp eq i32 %0, 0, !dbg !1296
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1297

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1298
  %cmp1 = icmp slt i32 %1, 0, !dbg !1301
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1302

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1303
  br label %return, !dbg !1303

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1305
  br label %return, !dbg !1305

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1307
  %cmp4 = icmp sge i32 %2, 0, !dbg !1310
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1311

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1312
  %cmp6 = icmp eq i32 %3, 0, !dbg !1315
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1316

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1317
  br label %return, !dbg !1317

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1319
  %cmp9 = icmp sle i32 %4, 0, !dbg !1322
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1323

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1324
  br label %return, !dbg !1324

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1326
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1328
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1329
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1330
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1330
  %div = sdiv i32 %6, %7, !dbg !1330, !klee.check.div !101
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1331
  %mul = mul nsw i32 %div, %8, !dbg !1332
  %sub = sub nsw i32 %5, %mul, !dbg !1333
  %shl = shl i32 %sub, 1, !dbg !1334
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1335
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1336
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1337
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1338
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1338
  %div12 = udiv i32 %9, %10, !dbg !1338, !klee.check.div !101
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1339
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1340
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1341
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1341
  %div13 = sdiv i32 %11, %12, !dbg !1341, !klee.check.div !101
  %add = add i32 %div12, %div13, !dbg !1342
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1343
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1344
  store i32 %13, i32* %retval, align 4, !dbg !1345
  br label %return, !dbg !1345

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1346
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1349
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1350

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1351
  br label %return, !dbg !1351

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1353
  %sub18 = sub nsw i32 0, %15, !dbg !1355
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1356
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1357
  %sub19 = sub nsw i32 0, %16, !dbg !1358
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1359
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1360
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1361
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1362
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1363
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1363
  %div20 = sdiv i32 %18, %19, !dbg !1363, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1364
  %mul21 = mul nsw i32 %div20, %20, !dbg !1365
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1366
  %shl23 = shl i32 %sub22, 1, !dbg !1367
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1368
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1369
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1370
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1371
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1371
  %div24 = udiv i32 %21, %22, !dbg !1371, !klee.check.div !101
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1372
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1373
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1374
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1374
  %div25 = sdiv i32 %23, %24, !dbg !1374, !klee.check.div !101
  %add26 = add i32 %div24, %div25, !dbg !1375
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1376
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1377
  store i32 %25, i32* %retval, align 4, !dbg !1378
  br label %return, !dbg !1378

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1379
  ret i32 %26, !dbg !1379
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1380 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1383, metadata !DIExpression()), !dbg !1384
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1385, metadata !DIExpression()), !dbg !1386
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1387, metadata !DIExpression()), !dbg !1388
  store i32 0, i32* %u32Temp1, align 4, !dbg !1388
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1389, metadata !DIExpression()), !dbg !1390
  store i32 0, i32* %u32Temp2, align 4, !dbg !1390
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1391, metadata !DIExpression()), !dbg !1392
  store i32 0, i32* %u32Temp3, align 4, !dbg !1392
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1393, metadata !DIExpression()), !dbg !1394
  store i32 0, i32* %numerator_old, align 4, !dbg !1394
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1395
  %cmp = icmp eq i32 %0, 0, !dbg !1397
  br i1 %cmp, label %if.then, label %if.else, !dbg !1398

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1399
  br label %return, !dbg !1399

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1401
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1403
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1404
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1405
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1406
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1406
  %div = udiv i32 %3, %4, !dbg !1406, !klee.check.div !101
  %mul = mul i32 %2, %div, !dbg !1407
  %sub = sub i32 %1, %mul, !dbg !1408
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1409
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1410
  %and = and i32 %5, 1, !dbg !1412
  %cmp1 = icmp eq i32 %and, 0, !dbg !1413
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1414

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1415
  %shr = lshr i32 %6, 1, !dbg !1417
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1418
  br label %if.end, !dbg !1419

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1420
  %shr4 = lshr i32 %7, 1, !dbg !1422
  %add = add i32 %shr4, 1, !dbg !1423
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1424
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1425
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1427
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1428
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1429

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1430
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1432
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1433
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1433
  %div7 = udiv i32 %10, %11, !dbg !1433, !klee.check.div !101
  store i32 %div7, i32* %retval, align 4, !dbg !1434
  br label %return, !dbg !1434

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1435
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1437
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1438
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1438
  %div9 = udiv i32 %12, %13, !dbg !1438, !klee.check.div !101
  %add10 = add i32 %div9, 1, !dbg !1439
  store i32 %add10, i32* %retval, align 4, !dbg !1440
  br label %return, !dbg !1440

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1441
  ret i32 %14, !dbg !1441
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1442 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1445, metadata !DIExpression()), !dbg !1446
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1447, metadata !DIExpression()), !dbg !1448
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1449, metadata !DIExpression()), !dbg !1450
  store i32 0, i32* %u32Temp1, align 4, !dbg !1450
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1451, metadata !DIExpression()), !dbg !1452
  store i32 0, i32* %u32Temp2, align 4, !dbg !1452
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1453
  %cmp = icmp sle i32 %0, 0, !dbg !1455
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1456

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1457
  %cmp1 = icmp sge i32 %1, 0, !dbg !1460
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1461

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1462
  br label %return, !dbg !1462

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1464
  %sub = sub nsw i32 0, %2, !dbg !1466
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1467
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1468
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1469
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1470
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1471
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1471
  %div = udiv i32 %4, %5, !dbg !1471, !klee.check.div !101
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1472
  %mul = mul i32 %div, %6, !dbg !1473
  %sub3 = sub i32 %3, %mul, !dbg !1474
  %shl = shl i32 %sub3, 1, !dbg !1475
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1476
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1477
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1478
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1479
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1479
  %div4 = udiv i32 %7, %8, !dbg !1479, !klee.check.div !101
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1480
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1481
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1482
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1482
  %div5 = udiv i32 %9, %10, !dbg !1482, !klee.check.div !101
  %add = add i32 %div4, %div5, !dbg !1483
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1484
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1485
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1487
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1488

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1489
  %sub8 = sub i32 0, %12, !dbg !1491
  store i32 %sub8, i32* %retval, align 4, !dbg !1492
  br label %return, !dbg !1492

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1493
  br label %return, !dbg !1493

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1495
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1497
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1498
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1499
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1499
  %div11 = udiv i32 %14, %15, !dbg !1499, !klee.check.div !101
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1500
  %mul12 = mul i32 %div11, %16, !dbg !1501
  %sub13 = sub i32 %13, %mul12, !dbg !1502
  %shl14 = shl i32 %sub13, 1, !dbg !1503
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1504
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1505
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1506
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1507
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1507
  %div15 = udiv i32 %17, %18, !dbg !1507, !klee.check.div !101
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1508
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1509
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1510
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1510
  %div16 = udiv i32 %19, %20, !dbg !1510, !klee.check.div !101
  %add17 = add i32 %div15, %div16, !dbg !1511
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1512
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1513
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1515
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1516

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1517
  store i32 %22, i32* %retval, align 4, !dbg !1519
  br label %return, !dbg !1519

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1520
  br label %return, !dbg !1520

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1522
  ret i32 %23, !dbg !1522
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1523 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1526, metadata !DIExpression()), !dbg !1527
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1528, metadata !DIExpression()), !dbg !1529
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1530, metadata !DIExpression()), !dbg !1531
  store i32 0, i32* %s32Temp1, align 4, !dbg !1531
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1532, metadata !DIExpression()), !dbg !1533
  store i32 0, i32* %s32Temp2, align 4, !dbg !1533
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1534, metadata !DIExpression()), !dbg !1535
  store i32 0, i32* %u32Temp0, align 4, !dbg !1535
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1536, metadata !DIExpression()), !dbg !1537
  store i32 0, i32* %u32Temp1, align 4, !dbg !1537
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1538, metadata !DIExpression()), !dbg !1539
  store i32 0, i32* %u32Temp2, align 4, !dbg !1539
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1540
  %cmp = icmp eq i32 %0, 0, !dbg !1542
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1543

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1544
  %cmp1 = icmp slt i32 %1, 0, !dbg !1547
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1548

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1549
  br label %return, !dbg !1549

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1551
  br label %return, !dbg !1551

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1553
  %cmp4 = icmp sle i32 %2, 0, !dbg !1556
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1557

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1558
  %sub = sub nsw i32 0, %3, !dbg !1560
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1561
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1562
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1563
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1564
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1564
  %div = udiv i32 %4, %5, !dbg !1564, !klee.check.div !101
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1565
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1566
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1567
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1568
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1569
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1569
  %div6 = udiv i32 %7, %8, !dbg !1569, !klee.check.div !101
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1570
  %mul = mul i32 %div6, %9, !dbg !1571
  %sub7 = sub i32 %6, %mul, !dbg !1572
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1573
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1574
  %and = and i32 %10, 1, !dbg !1576
  %cmp8 = icmp eq i32 %and, 0, !dbg !1577
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1578

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1579
  %shr = lshr i32 %11, 1, !dbg !1581
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1582
  br label %if.end, !dbg !1583

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1584
  %shr11 = lshr i32 %12, 1, !dbg !1586
  %add = add i32 %shr11, 1, !dbg !1587
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1588
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1589
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1591
  %cmp12 = icmp ult i32 %13, %14, !dbg !1592
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1593

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1594
  %neg = xor i32 %15, -1, !dbg !1596
  %add14 = add i32 %neg, 1, !dbg !1597
  store i32 %add14, i32* %retval, align 4, !dbg !1598
  br label %return, !dbg !1598

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1599
  %add16 = add i32 %16, 1, !dbg !1601
  %neg17 = xor i32 %add16, -1, !dbg !1602
  %add18 = add i32 %neg17, 1, !dbg !1603
  store i32 %add18, i32* %retval, align 4, !dbg !1604
  br label %return, !dbg !1604

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1605
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1607
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1608
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1609
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1609
  %div20 = udiv i32 %18, %19, !dbg !1609, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1610
  %mul21 = mul i32 %div20, %20, !dbg !1611
  %sub22 = sub i32 %17, %mul21, !dbg !1612
  %shl = shl i32 %sub22, 1, !dbg !1613
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1614
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1615
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1616
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1617
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1617
  %div23 = udiv i32 %21, %22, !dbg !1617, !klee.check.div !101
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1618
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1619
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1620
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1620
  %div24 = udiv i32 %23, %24, !dbg !1620, !klee.check.div !101
  %add25 = add i32 %div23, %div24, !dbg !1621
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1622
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1623
  store i32 %25, i32* %retval, align 4, !dbg !1624
  br label %return, !dbg !1624

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1625
  ret i32 %26, !dbg !1625
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1626 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1629, metadata !DIExpression()), !dbg !1630
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1631, metadata !DIExpression()), !dbg !1632
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1633, metadata !DIExpression()), !dbg !1634
  store i32 0, i32* %s32Temp1, align 4, !dbg !1634
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1635, metadata !DIExpression()), !dbg !1636
  store i32 0, i32* %s32Temp2, align 4, !dbg !1636
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1637, metadata !DIExpression()), !dbg !1638
  store i32 0, i32* %denominator_prime, align 4, !dbg !1638
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1639, metadata !DIExpression()), !dbg !1640
  store i32 0, i32* %u32Temp1, align 4, !dbg !1640
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1641, metadata !DIExpression()), !dbg !1642
  store i32 0, i32* %u32Temp2, align 4, !dbg !1642
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1643, metadata !DIExpression()), !dbg !1644
  store i32 0, i32* %u32numerator, align 4, !dbg !1644
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1645, metadata !DIExpression()), !dbg !1646
  store i32 0, i32* %u32denominator, align 4, !dbg !1646
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1647
  %cmp = icmp slt i32 %0, 0, !dbg !1649
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1650

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1651
  %cmp1 = icmp sle i32 %1, 0, !dbg !1654
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1655

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1656
  %cmp3 = icmp sge i32 %2, 0, !dbg !1659
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1660

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1661
  br label %return, !dbg !1661

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1663
  %sub = sub nsw i32 0, %3, !dbg !1665
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1666
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1667
  %sub5 = sub nsw i32 0, %4, !dbg !1668
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1669
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1670
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1671
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1672
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1673
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1673
  %div = udiv i32 %6, %7, !dbg !1673, !klee.check.div !101
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1674
  %mul = mul i32 %div, %8, !dbg !1675
  %sub6 = sub i32 %5, %mul, !dbg !1676
  %shl = shl i32 %sub6, 1, !dbg !1677
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1678
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1679
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1680
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1681
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1681
  %div7 = udiv i32 %9, %10, !dbg !1681, !klee.check.div !101
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1682
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1683
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1684
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1684
  %div8 = udiv i32 %11, %12, !dbg !1684, !klee.check.div !101
  %add = add i32 %div7, %div8, !dbg !1685
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1686
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1687
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1689
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1690

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1691
  store i32 %14, i32* %retval, align 4, !dbg !1693
  br label %return, !dbg !1693

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1694
  br label %return, !dbg !1694

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1696
  %neg = xor i32 %15, -1, !dbg !1698
  %add13 = add nsw i32 %neg, 1, !dbg !1699
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1700
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1701
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1702
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1703
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1704
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1704
  %div14 = udiv i32 %17, %18, !dbg !1704, !klee.check.div !101
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1705
  %mul15 = mul i32 %div14, %19, !dbg !1706
  %sub16 = sub i32 %16, %mul15, !dbg !1707
  %shl17 = shl i32 %sub16, 1, !dbg !1708
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1709
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1710
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1711
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1712
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1712
  %div18 = udiv i32 %20, %21, !dbg !1712, !klee.check.div !101
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1713
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1714
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1715
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1715
  %div19 = sdiv i32 %22, %23, !dbg !1715, !klee.check.div !101
  %add20 = add i32 %div18, %div19, !dbg !1716
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1717
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1718
  %neg21 = xor i32 %24, -1, !dbg !1719
  %add22 = add nsw i32 %neg21, 1, !dbg !1720
  store i32 %add22, i32* %retval, align 4, !dbg !1721
  br label %return, !dbg !1721

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1722
  %cmp24 = icmp sle i32 %25, 0, !dbg !1725
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1726

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1727
  %cmp26 = icmp sge i32 %26, 0, !dbg !1730
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1731

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1732
  br label %return, !dbg !1732

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1734
  %neg29 = xor i32 %27, -1, !dbg !1736
  %add30 = add nsw i32 %neg29, 1, !dbg !1737
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1738
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1739
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1740
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1741
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1742
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1742
  %div31 = udiv i32 %29, %30, !dbg !1742, !klee.check.div !101
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1743
  %mul32 = mul i32 %div31, %31, !dbg !1744
  %sub33 = sub i32 %28, %mul32, !dbg !1745
  %shl34 = shl i32 %sub33, 1, !dbg !1746
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1747
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1748
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1749
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1750
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1750
  %div35 = udiv i32 %32, %33, !dbg !1750, !klee.check.div !101
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1751
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1752
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1753
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1753
  %div36 = udiv i32 %34, %35, !dbg !1753, !klee.check.div !101
  %add37 = add i32 %div35, %div36, !dbg !1754
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1755
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1756
  %neg38 = xor i32 %36, -1, !dbg !1757
  %add39 = add nsw i32 %neg38, 1, !dbg !1758
  store i32 %add39, i32* %retval, align 4, !dbg !1759
  br label %return, !dbg !1759

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1760
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1762
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1763
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1764
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1764
  %div41 = sdiv i32 %38, %39, !dbg !1764, !klee.check.div !101
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1765
  %mul42 = mul nsw i32 %div41, %40, !dbg !1766
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1767
  %shl44 = shl i32 %sub43, 1, !dbg !1768
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1769
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1770
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1771
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1772
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1772
  %div45 = sdiv i32 %41, %42, !dbg !1772, !klee.check.div !101
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1773
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1774
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1775
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1775
  %div46 = udiv i32 %43, %44, !dbg !1775, !klee.check.div !101
  %add47 = add i32 %div45, %div46, !dbg !1776
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1777
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1778
  store i32 %45, i32* %retval, align 4, !dbg !1779
  br label %return, !dbg !1779

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1780
  ret i32 %46, !dbg !1780
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1781 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1784, metadata !DIExpression()), !dbg !1785
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1786, metadata !DIExpression()), !dbg !1787
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1788, metadata !DIExpression()), !dbg !1789
  store i32 0, i32* %numerator_prime, align 4, !dbg !1789
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1790, metadata !DIExpression()), !dbg !1791
  store i32 0, i32* %u32Temp1, align 4, !dbg !1791
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1792, metadata !DIExpression()), !dbg !1793
  store i32 0, i32* %u32Temp2, align 4, !dbg !1793
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1794, metadata !DIExpression()), !dbg !1795
  store i32 0, i32* %u32Temp3, align 4, !dbg !1795
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1796, metadata !DIExpression()), !dbg !1797
  store i32 0, i32* %s32Temp1, align 4, !dbg !1797
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1798, metadata !DIExpression()), !dbg !1799
  store i32 0, i32* %s32Temp2, align 4, !dbg !1799
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1800, metadata !DIExpression()), !dbg !1801
  store i32 0, i32* %s32Temp3, align 4, !dbg !1801
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1802
  %cmp = icmp eq i32 %0, 0, !dbg !1804
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1805

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1806
  %cmp1 = icmp slt i32 %1, 0, !dbg !1809
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1810

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1811
  br label %return, !dbg !1811

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1813
  br label %return, !dbg !1813

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1815
  %cmp4 = icmp slt i32 %2, 0, !dbg !1818
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1819

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1820
  %sub = sub nsw i32 0, %3, !dbg !1822
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1823
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1824
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1825
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1826
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1826
  %div = udiv i32 %4, %5, !dbg !1826, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1827
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1828
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1829
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1830
  %mul = mul i32 %7, %8, !dbg !1831
  %sub6 = sub i32 %6, %mul, !dbg !1832
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1833
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1834
  %and = and i32 %9, 1, !dbg !1836
  %cmp7 = icmp eq i32 %and, 0, !dbg !1837
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1838

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1839
  %shr = lshr i32 %10, 1, !dbg !1841
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1842
  br label %if.end, !dbg !1843

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1844
  %shr10 = lshr i32 %11, 1, !dbg !1846
  %add = add i32 %shr10, 1, !dbg !1847
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1848
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1849
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1851
  %cmp11 = icmp ult i32 %12, %13, !dbg !1852
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1853

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1854
  %neg = xor i32 %14, -1, !dbg !1856
  %add13 = add i32 %neg, 1, !dbg !1857
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1858
  br label %if.end18, !dbg !1859

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1860
  %add15 = add i32 %15, 1, !dbg !1862
  %neg16 = xor i32 %add15, -1, !dbg !1863
  %add17 = add i32 %neg16, 1, !dbg !1864
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1865
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1866
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1868
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1869

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1870
  %conv = trunc i32 %17 to i16, !dbg !1872
  store i16 %conv, i16* %retval, align 2, !dbg !1873
  br label %return, !dbg !1873

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1874
  br label %return, !dbg !1874

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1876
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1878
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1879
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1879
  %div23 = udiv i32 %18, %19, !dbg !1879, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1880
  %mul24 = mul i32 %div23, %20, !dbg !1881
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1882
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1883
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1884
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1885
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1886
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1886
  %div25 = udiv i32 %22, %23, !dbg !1886, !klee.check.div !101
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1887
  %mul26 = mul i32 %div25, %24, !dbg !1888
  %sub27 = sub i32 %21, %mul26, !dbg !1889
  %shl = shl i32 %sub27, 1, !dbg !1890
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1891
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1892
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1893
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1894
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1894
  %div28 = udiv i32 %25, %26, !dbg !1894, !klee.check.div !101
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1895
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1896
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1897
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1897
  %div29 = udiv i32 %27, %28, !dbg !1897, !klee.check.div !101
  %add30 = add i32 %div28, %div29, !dbg !1898
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1899
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1900
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1902
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1903

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1904
  %conv34 = trunc i32 %30 to i16, !dbg !1906
  store i16 %conv34, i16* %retval, align 2, !dbg !1907
  br label %return, !dbg !1907

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1908
  br label %return, !dbg !1908

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1910
  ret i16 %31, !dbg !1910
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1911 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1917, metadata !DIExpression()), !dbg !1918
  %2 = icmp eq i64 %0, 0, !dbg !1919
  br i1 %2, label %3, label %4, !dbg !1921

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1922
  unreachable, !dbg !1922

4:                                                ; preds = %1
  ret void, !dbg !1923
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0027/div_Ccode_alarm_0027.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0027")
!4 = !{}
!5 = !{!6, !13, !16, !20, !25}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0027")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !9, line: 25, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !11, line: 39, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!12 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !9, line: 27, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 44, baseType: !15)
!15 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !7, line: 6, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !22, line: 24, baseType: !23)
!22 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !11, line: 38, baseType: !24)
!24 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !7, line: 8, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !22, line: 25, baseType: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 40, baseType: !28)
!28 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!29 = !{!0}
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0027")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0027/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0027")
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
!44 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0027")
!45 = !DISubroutineType(types: !46)
!46 = !{!19}
!47 = !DILocalVariable(name: "numerator", scope: !43, file: !44, line: 9, type: !17)
!48 = !DILocation(line: 9, column: 13, scope: !43)
!49 = !DILocalVariable(name: "denominator", scope: !43, file: !44, line: 10, type: !8)
!50 = !DILocation(line: 10, column: 13, scope: !43)
!51 = !DILocalVariable(name: "result", scope: !43, file: !44, line: 11, type: !8)
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
!64 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0027")
!65 = !DISubroutineType(types: !66)
!66 = !{!6, !6, !6}
!67 = !DILocalVariable(name: "numerator", arg: 1, scope: !63, file: !64, line: 170, type: !6)
!68 = !DILocation(line: 170, column: 31, scope: !63)
!69 = !DILocalVariable(name: "denominator", arg: 2, scope: !63, file: !64, line: 170, type: !6)
!70 = !DILocation(line: 170, column: 47, scope: !63)
!71 = !DILocalVariable(name: "s32Temp1", scope: !63, file: !64, line: 172, type: !16)
!72 = !DILocation(line: 172, column: 6, scope: !63)
!73 = !DILocalVariable(name: "s32Temp2", scope: !63, file: !64, line: 172, type: !16)
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
!183 = !{!6, !16, !6}
!184 = !DILocalVariable(name: "numerator", arg: 1, scope: !181, file: !64, line: 255, type: !16)
!185 = !DILocation(line: 255, column: 25, scope: !181)
!186 = !DILocalVariable(name: "denominator", arg: 2, scope: !181, file: !64, line: 255, type: !6)
!187 = !DILocation(line: 255, column: 41, scope: !181)
!188 = !DILocalVariable(name: "s32Temp1", scope: !181, file: !64, line: 257, type: !16)
!189 = !DILocation(line: 257, column: 6, scope: !181)
!190 = !DILocalVariable(name: "s32Temp2", scope: !181, file: !64, line: 257, type: !16)
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
!212 = !DILocation(line: 275, column: 47, scope: !213)
!213 = distinct !DILexicalBlock(scope: !214, file: !64, line: 275, column: 8)
!214 = distinct !DILexicalBlock(scope: !208, file: !64, line: 273, column: 3)
!215 = !DILocation(line: 275, column: 37, scope: !213)
!216 = !DILocation(line: 275, column: 10, scope: !213)
!217 = !DILocation(line: 275, column: 8, scope: !214)
!218 = !DILocation(line: 276, column: 8, scope: !219)
!219 = distinct !DILexicalBlock(scope: !213, file: !64, line: 275, column: 63)
!220 = !DILocation(line: 279, column: 51, scope: !221)
!221 = distinct !DILexicalBlock(scope: !214, file: !64, line: 279, column: 8)
!222 = !DILocation(line: 279, column: 67, scope: !221)
!223 = !DILocation(line: 279, column: 62, scope: !221)
!224 = !DILocation(line: 279, column: 60, scope: !221)
!225 = !DILocation(line: 279, column: 35, scope: !221)
!226 = !DILocation(line: 279, column: 97, scope: !221)
!227 = !DILocation(line: 279, column: 92, scope: !221)
!228 = !DILocation(line: 279, column: 82, scope: !221)
!229 = !DILocation(line: 279, column: 10, scope: !221)
!230 = !DILocation(line: 279, column: 8, scope: !214)
!231 = !DILocation(line: 280, column: 8, scope: !232)
!232 = distinct !DILexicalBlock(scope: !221, file: !64, line: 279, column: 113)
!233 = !DILocation(line: 283, column: 51, scope: !234)
!234 = distinct !DILexicalBlock(scope: !214, file: !64, line: 283, column: 8)
!235 = !DILocation(line: 283, column: 67, scope: !234)
!236 = !DILocation(line: 283, column: 62, scope: !234)
!237 = !DILocation(line: 283, column: 60, scope: !234)
!238 = !DILocation(line: 283, column: 35, scope: !234)
!239 = !DILocation(line: 283, column: 97, scope: !234)
!240 = !DILocation(line: 283, column: 92, scope: !234)
!241 = !DILocation(line: 283, column: 82, scope: !234)
!242 = !DILocation(line: 283, column: 10, scope: !234)
!243 = !DILocation(line: 283, column: 8, scope: !214)
!244 = !DILocation(line: 284, column: 8, scope: !245)
!245 = distinct !DILexicalBlock(scope: !234, file: !64, line: 283, column: 113)
!246 = !DILocation(line: 291, column: 42, scope: !214)
!247 = !DILocation(line: 291, column: 58, scope: !214)
!248 = !DILocation(line: 291, column: 53, scope: !214)
!249 = !DILocation(line: 291, column: 51, scope: !214)
!250 = !DILocation(line: 291, column: 78, scope: !214)
!251 = !DILocation(line: 291, column: 73, scope: !214)
!252 = !DILocation(line: 291, column: 71, scope: !214)
!253 = !DILocation(line: 291, column: 26, scope: !214)
!254 = !DILocation(line: 291, column: 24, scope: !214)
!255 = !DILocation(line: 292, column: 4, scope: !214)
!256 = !DILocation(line: 313, column: 7, scope: !257)
!257 = distinct !DILexicalBlock(scope: !258, file: !64, line: 313, column: 7)
!258 = distinct !DILexicalBlock(scope: !208, file: !64, line: 312, column: 3)
!259 = !DILocation(line: 313, column: 19, scope: !257)
!260 = !DILocation(line: 313, column: 7, scope: !258)
!261 = !DILocation(line: 315, column: 17, scope: !262)
!262 = distinct !DILexicalBlock(scope: !257, file: !64, line: 314, column: 4)
!263 = !DILocation(line: 315, column: 29, scope: !262)
!264 = !DILocation(line: 315, column: 38, scope: !262)
!265 = !DILocation(line: 315, column: 37, scope: !262)
!266 = !DILocation(line: 315, column: 53, scope: !262)
!267 = !DILocation(line: 315, column: 51, scope: !262)
!268 = !DILocation(line: 315, column: 26, scope: !262)
!269 = !DILocation(line: 315, column: 66, scope: !262)
!270 = !DILocation(line: 315, column: 14, scope: !262)
!271 = !DILocation(line: 316, column: 16, scope: !262)
!272 = !DILocation(line: 316, column: 25, scope: !262)
!273 = !DILocation(line: 316, column: 24, scope: !262)
!274 = !DILocation(line: 316, column: 14, scope: !262)
!275 = !DILocation(line: 317, column: 16, scope: !262)
!276 = !DILocation(line: 317, column: 28, scope: !262)
!277 = !DILocation(line: 317, column: 39, scope: !262)
!278 = !DILocation(line: 317, column: 38, scope: !262)
!279 = !DILocation(line: 317, column: 25, scope: !262)
!280 = !DILocation(line: 317, column: 14, scope: !262)
!281 = !DILocation(line: 318, column: 8, scope: !282)
!282 = distinct !DILexicalBlock(scope: !262, file: !64, line: 318, column: 8)
!283 = !DILocation(line: 318, column: 17, scope: !282)
!284 = !DILocation(line: 318, column: 8, scope: !262)
!285 = !DILocation(line: 320, column: 9, scope: !286)
!286 = distinct !DILexicalBlock(scope: !287, file: !64, line: 320, column: 9)
!287 = distinct !DILexicalBlock(scope: !282, file: !64, line: 319, column: 5)
!288 = !DILocation(line: 320, column: 18, scope: !286)
!289 = !DILocation(line: 320, column: 9, scope: !287)
!290 = !DILocation(line: 322, column: 19, scope: !291)
!291 = distinct !DILexicalBlock(scope: !286, file: !64, line: 321, column: 6)
!292 = !DILocation(line: 322, column: 14, scope: !291)
!293 = !DILocation(line: 322, column: 7, scope: !291)
!294 = !DILocation(line: 326, column: 7, scope: !295)
!295 = distinct !DILexicalBlock(scope: !286, file: !64, line: 325, column: 6)
!296 = !DILocation(line: 331, column: 6, scope: !297)
!297 = distinct !DILexicalBlock(scope: !282, file: !64, line: 330, column: 5)
!298 = !DILocation(line: 337, column: 5, scope: !299)
!299 = distinct !DILexicalBlock(scope: !257, file: !64, line: 336, column: 4)
!300 = !DILocation(line: 343, column: 1, scope: !181)
!301 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !30, file: !30, line: 24, type: !302, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!302 = !DISubroutineType(types: !303)
!303 = !{!19, !13}
!304 = !DILocalVariable(name: "denominator", arg: 1, scope: !301, file: !30, line: 24, type: !13)
!305 = !DILocation(line: 24, column: 40, scope: !301)
!306 = !DILocation(line: 26, column: 12, scope: !301)
!307 = !DILocation(line: 26, column: 24, scope: !301)
!308 = !DILocation(line: 26, column: 5, scope: !301)
!309 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !30, file: !30, line: 78, type: !310, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!310 = !DISubroutineType(types: !311)
!311 = !{!19, !13, !13}
!312 = !DILocalVariable(name: "left", arg: 1, scope: !309, file: !30, line: 78, type: !13)
!313 = !DILocation(line: 78, column: 38, scope: !309)
!314 = !DILocalVariable(name: "right", arg: 2, scope: !309, file: !30, line: 78, type: !13)
!315 = !DILocation(line: 78, column: 52, scope: !309)
!316 = !DILocation(line: 80, column: 12, scope: !309)
!317 = !DILocation(line: 80, column: 19, scope: !309)
!318 = !DILocation(line: 80, column: 17, scope: !309)
!319 = !DILocation(line: 80, column: 25, scope: !309)
!320 = !DILocation(line: 80, column: 5, scope: !309)
!321 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !30, file: !30, line: 72, type: !310, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!322 = !DILocalVariable(name: "left", arg: 1, scope: !321, file: !30, line: 72, type: !13)
!323 = !DILocation(line: 72, column: 38, scope: !321)
!324 = !DILocalVariable(name: "right", arg: 2, scope: !321, file: !30, line: 72, type: !13)
!325 = !DILocation(line: 72, column: 52, scope: !321)
!326 = !DILocation(line: 74, column: 12, scope: !321)
!327 = !DILocation(line: 74, column: 19, scope: !321)
!328 = !DILocation(line: 74, column: 17, scope: !321)
!329 = !DILocation(line: 74, column: 25, scope: !321)
!330 = !DILocation(line: 74, column: 5, scope: !321)
!331 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !64, file: !64, line: 361, type: !332, scopeLine: 362, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!332 = !DISubroutineType(types: !333)
!333 = !{!6, !6, !25}
!334 = !DILocalVariable(name: "numerator", arg: 1, scope: !331, file: !64, line: 361, type: !6)
!335 = !DILocation(line: 361, column: 31, scope: !331)
!336 = !DILocalVariable(name: "denominator", arg: 2, scope: !331, file: !64, line: 361, type: !25)
!337 = !DILocation(line: 361, column: 47, scope: !331)
!338 = !DILocalVariable(name: "u16Temp1", scope: !331, file: !64, line: 363, type: !25)
!339 = !DILocation(line: 363, column: 6, scope: !331)
!340 = !DILocalVariable(name: "s32Temp1", scope: !331, file: !64, line: 364, type: !16)
!341 = !DILocation(line: 364, column: 6, scope: !331)
!342 = !DILocalVariable(name: "s32Temp2", scope: !331, file: !64, line: 364, type: !16)
!343 = !DILocation(line: 364, column: 15, scope: !331)
!344 = !DILocation(line: 365, column: 13, scope: !331)
!345 = !DILocation(line: 365, column: 25, scope: !331)
!346 = !DILocation(line: 365, column: 11, scope: !331)
!347 = !DILocation(line: 366, column: 13, scope: !331)
!348 = !DILocation(line: 366, column: 22, scope: !331)
!349 = !DILocation(line: 366, column: 11, scope: !331)
!350 = !DILocation(line: 367, column: 5, scope: !351)
!351 = distinct !DILexicalBlock(scope: !331, file: !64, line: 367, column: 5)
!352 = !DILocation(line: 367, column: 14, scope: !351)
!353 = !DILocation(line: 367, column: 5, scope: !331)
!354 = !DILocation(line: 369, column: 7, scope: !355)
!355 = distinct !DILexicalBlock(scope: !356, file: !64, line: 369, column: 7)
!356 = distinct !DILexicalBlock(scope: !351, file: !64, line: 368, column: 2)
!357 = !DILocation(line: 369, column: 17, scope: !355)
!358 = !DILocation(line: 369, column: 7, scope: !356)
!359 = !DILocation(line: 371, column: 4, scope: !360)
!360 = distinct !DILexicalBlock(scope: !355, file: !64, line: 370, column: 3)
!361 = !DILocation(line: 375, column: 4, scope: !362)
!362 = distinct !DILexicalBlock(scope: !355, file: !64, line: 374, column: 3)
!363 = !DILocation(line: 380, column: 15, scope: !364)
!364 = distinct !DILexicalBlock(scope: !351, file: !64, line: 379, column: 2)
!365 = !DILocation(line: 380, column: 24, scope: !364)
!366 = !DILocation(line: 380, column: 32, scope: !364)
!367 = !DILocation(line: 380, column: 41, scope: !364)
!368 = !DILocation(line: 380, column: 47, scope: !364)
!369 = !DILocation(line: 380, column: 46, scope: !364)
!370 = !DILocation(line: 380, column: 57, scope: !364)
!371 = !DILocation(line: 380, column: 56, scope: !364)
!372 = !DILocation(line: 380, column: 29, scope: !364)
!373 = !DILocation(line: 380, column: 12, scope: !364)
!374 = !DILocation(line: 381, column: 14, scope: !364)
!375 = !DILocation(line: 381, column: 22, scope: !364)
!376 = !DILocation(line: 381, column: 12, scope: !364)
!377 = !DILocation(line: 382, column: 14, scope: !364)
!378 = !DILocation(line: 382, column: 23, scope: !364)
!379 = !DILocation(line: 382, column: 22, scope: !364)
!380 = !DILocation(line: 382, column: 12, scope: !364)
!381 = !DILocation(line: 383, column: 16, scope: !364)
!382 = !DILocation(line: 383, column: 25, scope: !364)
!383 = !DILocation(line: 383, column: 31, scope: !364)
!384 = !DILocation(line: 383, column: 30, scope: !364)
!385 = !DILocation(line: 383, column: 43, scope: !364)
!386 = !DILocation(line: 383, column: 41, scope: !364)
!387 = !DILocation(line: 383, column: 12, scope: !364)
!388 = !DILocation(line: 384, column: 6, scope: !389)
!389 = distinct !DILexicalBlock(scope: !364, file: !64, line: 384, column: 6)
!390 = !DILocation(line: 384, column: 15, scope: !389)
!391 = !DILocation(line: 384, column: 6, scope: !364)
!392 = !DILocation(line: 386, column: 7, scope: !393)
!393 = distinct !DILexicalBlock(scope: !394, file: !64, line: 386, column: 7)
!394 = distinct !DILexicalBlock(scope: !389, file: !64, line: 385, column: 3)
!395 = !DILocation(line: 386, column: 16, scope: !393)
!396 = !DILocation(line: 386, column: 7, scope: !394)
!397 = !DILocation(line: 388, column: 17, scope: !398)
!398 = distinct !DILexicalBlock(scope: !393, file: !64, line: 387, column: 4)
!399 = !DILocation(line: 388, column: 12, scope: !398)
!400 = !DILocation(line: 388, column: 5, scope: !398)
!401 = !DILocation(line: 392, column: 5, scope: !402)
!402 = distinct !DILexicalBlock(scope: !393, file: !64, line: 391, column: 4)
!403 = !DILocation(line: 397, column: 4, scope: !404)
!404 = distinct !DILexicalBlock(scope: !389, file: !64, line: 396, column: 3)
!405 = !DILocation(line: 400, column: 1, scope: !331)
!406 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !64, file: !64, line: 417, type: !332, scopeLine: 418, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!407 = !DILocalVariable(name: "numerator", arg: 1, scope: !406, file: !64, line: 417, type: !6)
!408 = !DILocation(line: 417, column: 30, scope: !406)
!409 = !DILocalVariable(name: "denominator", arg: 2, scope: !406, file: !64, line: 417, type: !25)
!410 = !DILocation(line: 417, column: 45, scope: !406)
!411 = !DILocalVariable(name: "u16Temp1", scope: !406, file: !64, line: 419, type: !25)
!412 = !DILocation(line: 419, column: 6, scope: !406)
!413 = !DILocalVariable(name: "s32Temp1", scope: !406, file: !64, line: 420, type: !16)
!414 = !DILocation(line: 420, column: 6, scope: !406)
!415 = !DILocation(line: 421, column: 13, scope: !406)
!416 = !DILocation(line: 421, column: 25, scope: !406)
!417 = !DILocation(line: 421, column: 11, scope: !406)
!418 = !DILocation(line: 422, column: 5, scope: !419)
!419 = distinct !DILexicalBlock(scope: !406, file: !64, line: 422, column: 5)
!420 = !DILocation(line: 422, column: 13, scope: !419)
!421 = !DILocation(line: 422, column: 5, scope: !406)
!422 = !DILocation(line: 424, column: 6, scope: !423)
!423 = distinct !DILexicalBlock(scope: !424, file: !64, line: 424, column: 6)
!424 = distinct !DILexicalBlock(scope: !419, file: !64, line: 423, column: 2)
!425 = !DILocation(line: 424, column: 15, scope: !423)
!426 = !DILocation(line: 424, column: 6, scope: !424)
!427 = !DILocation(line: 426, column: 4, scope: !428)
!428 = distinct !DILexicalBlock(scope: !423, file: !64, line: 425, column: 3)
!429 = !DILocation(line: 430, column: 4, scope: !430)
!430 = distinct !DILexicalBlock(scope: !423, file: !64, line: 429, column: 3)
!431 = !DILocation(line: 436, column: 15, scope: !432)
!432 = distinct !DILexicalBlock(scope: !419, file: !64, line: 435, column: 2)
!433 = !DILocation(line: 436, column: 27, scope: !432)
!434 = !DILocation(line: 436, column: 37, scope: !432)
!435 = !DILocation(line: 436, column: 36, scope: !432)
!436 = !DILocation(line: 436, column: 49, scope: !432)
!437 = !DILocation(line: 436, column: 47, scope: !432)
!438 = !DILocation(line: 436, column: 25, scope: !432)
!439 = !DILocation(line: 436, column: 59, scope: !432)
!440 = !DILocation(line: 436, column: 12, scope: !432)
!441 = !DILocation(line: 437, column: 15, scope: !432)
!442 = !DILocation(line: 437, column: 24, scope: !432)
!443 = !DILocation(line: 437, column: 23, scope: !432)
!444 = !DILocation(line: 437, column: 37, scope: !432)
!445 = !DILocation(line: 437, column: 47, scope: !432)
!446 = !DILocation(line: 437, column: 46, scope: !432)
!447 = !DILocation(line: 437, column: 34, scope: !432)
!448 = !DILocation(line: 437, column: 12, scope: !432)
!449 = !DILocation(line: 438, column: 10, scope: !432)
!450 = !DILocation(line: 438, column: 3, scope: !432)
!451 = !DILocation(line: 440, column: 1, scope: !406)
!452 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !64, file: !64, line: 458, type: !453, scopeLine: 459, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!453 = !DISubroutineType(types: !454)
!454 = !{!20, !25, !25}
!455 = !DILocalVariable(name: "numerator", arg: 1, scope: !452, file: !64, line: 458, type: !25)
!456 = !DILocation(line: 458, column: 28, scope: !452)
!457 = !DILocalVariable(name: "denominator", arg: 2, scope: !452, file: !64, line: 458, type: !25)
!458 = !DILocation(line: 458, column: 43, scope: !452)
!459 = !DILocalVariable(name: "u32Temp1", scope: !452, file: !64, line: 460, type: !460)
!460 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !461)
!461 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !22, line: 26, baseType: !462)
!462 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !463)
!463 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!464 = !DILocation(line: 460, column: 6, scope: !452)
!465 = !DILocalVariable(name: "u32Temp2", scope: !452, file: !64, line: 460, type: !460)
!466 = !DILocation(line: 460, column: 20, scope: !452)
!467 = !DILocalVariable(name: "u32Temp3", scope: !452, file: !64, line: 460, type: !460)
!468 = !DILocation(line: 460, column: 33, scope: !452)
!469 = !DILocation(line: 461, column: 5, scope: !470)
!470 = distinct !DILexicalBlock(scope: !452, file: !64, line: 461, column: 5)
!471 = !DILocation(line: 461, column: 16, scope: !470)
!472 = !DILocation(line: 461, column: 5, scope: !452)
!473 = !DILocation(line: 463, column: 3, scope: !474)
!474 = distinct !DILexicalBlock(scope: !470, file: !64, line: 462, column: 2)
!475 = !DILocation(line: 467, column: 15, scope: !476)
!476 = distinct !DILexicalBlock(scope: !470, file: !64, line: 466, column: 2)
!477 = !DILocation(line: 467, column: 24, scope: !476)
!478 = !DILocation(line: 467, column: 12, scope: !476)
!479 = !DILocation(line: 468, column: 14, scope: !476)
!480 = !DILocation(line: 468, column: 25, scope: !476)
!481 = !DILocation(line: 468, column: 23, scope: !476)
!482 = !DILocation(line: 468, column: 12, scope: !476)
!483 = !DILocation(line: 469, column: 15, scope: !476)
!484 = !DILocation(line: 469, column: 24, scope: !476)
!485 = !DILocation(line: 469, column: 32, scope: !476)
!486 = !DILocation(line: 469, column: 12, scope: !476)
!487 = !DILocation(line: 470, column: 6, scope: !488)
!488 = distinct !DILexicalBlock(scope: !476, file: !64, line: 470, column: 6)
!489 = !DILocation(line: 470, column: 15, scope: !488)
!490 = !DILocation(line: 470, column: 6, scope: !476)
!491 = !DILocation(line: 472, column: 15, scope: !492)
!492 = distinct !DILexicalBlock(scope: !488, file: !64, line: 471, column: 3)
!493 = !DILocation(line: 472, column: 11, scope: !492)
!494 = !DILocation(line: 472, column: 4, scope: !492)
!495 = !DILocation(line: 476, column: 4, scope: !496)
!496 = distinct !DILexicalBlock(scope: !488, file: !64, line: 475, column: 3)
!497 = !DILocation(line: 479, column: 1, scope: !452)
!498 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !64, file: !64, line: 496, type: !499, scopeLine: 497, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!499 = !DISubroutineType(types: !500)
!500 = !{!25, !16, !25}
!501 = !DILocalVariable(name: "x_value", arg: 1, scope: !498, file: !64, line: 496, type: !16)
!502 = !DILocation(line: 496, column: 25, scope: !498)
!503 = !DILocalVariable(name: "y_value", arg: 2, scope: !498, file: !64, line: 496, type: !25)
!504 = !DILocation(line: 496, column: 38, scope: !498)
!505 = !DILocalVariable(name: "s32Temp1", scope: !498, file: !64, line: 498, type: !16)
!506 = !DILocation(line: 498, column: 6, scope: !498)
!507 = !DILocation(line: 499, column: 12, scope: !498)
!508 = !DILocation(line: 499, column: 20, scope: !498)
!509 = !DILocation(line: 499, column: 10, scope: !498)
!510 = !DILocation(line: 500, column: 6, scope: !511)
!511 = distinct !DILexicalBlock(scope: !498, file: !64, line: 500, column: 5)
!512 = !DILocation(line: 500, column: 14, scope: !511)
!513 = !DILocation(line: 500, column: 24, scope: !511)
!514 = !DILocation(line: 500, column: 5, scope: !498)
!515 = !DILocation(line: 502, column: 6, scope: !516)
!516 = distinct !DILexicalBlock(scope: !517, file: !64, line: 502, column: 6)
!517 = distinct !DILexicalBlock(scope: !511, file: !64, line: 501, column: 2)
!518 = !DILocation(line: 502, column: 14, scope: !516)
!519 = !DILocation(line: 502, column: 6, scope: !517)
!520 = !DILocation(line: 504, column: 4, scope: !521)
!521 = distinct !DILexicalBlock(scope: !516, file: !64, line: 503, column: 3)
!522 = !DILocation(line: 508, column: 4, scope: !523)
!523 = distinct !DILexicalBlock(scope: !516, file: !64, line: 507, column: 3)
!524 = !DILocation(line: 513, column: 15, scope: !525)
!525 = distinct !DILexicalBlock(scope: !511, file: !64, line: 512, column: 2)
!526 = !DILocation(line: 513, column: 27, scope: !525)
!527 = !DILocation(line: 513, column: 35, scope: !525)
!528 = !DILocation(line: 513, column: 34, scope: !525)
!529 = !DILocation(line: 513, column: 46, scope: !525)
!530 = !DILocation(line: 513, column: 44, scope: !525)
!531 = !DILocation(line: 513, column: 23, scope: !525)
!532 = !DILocation(line: 513, column: 56, scope: !525)
!533 = !DILocation(line: 513, column: 12, scope: !525)
!534 = !DILocation(line: 514, column: 15, scope: !525)
!535 = !DILocation(line: 514, column: 24, scope: !525)
!536 = !DILocation(line: 514, column: 23, scope: !525)
!537 = !DILocation(line: 514, column: 36, scope: !525)
!538 = !DILocation(line: 514, column: 44, scope: !525)
!539 = !DILocation(line: 514, column: 43, scope: !525)
!540 = !DILocation(line: 514, column: 33, scope: !525)
!541 = !DILocation(line: 514, column: 12, scope: !525)
!542 = !DILocation(line: 515, column: 6, scope: !543)
!543 = distinct !DILexicalBlock(scope: !525, file: !64, line: 515, column: 6)
!544 = !DILocation(line: 515, column: 15, scope: !543)
!545 = !DILocation(line: 515, column: 6, scope: !525)
!546 = !DILocation(line: 517, column: 7, scope: !547)
!547 = distinct !DILexicalBlock(scope: !548, file: !64, line: 517, column: 7)
!548 = distinct !DILexicalBlock(scope: !543, file: !64, line: 516, column: 3)
!549 = !DILocation(line: 517, column: 16, scope: !547)
!550 = !DILocation(line: 517, column: 7, scope: !548)
!551 = !DILocation(line: 519, column: 17, scope: !552)
!552 = distinct !DILexicalBlock(scope: !547, file: !64, line: 518, column: 4)
!553 = !DILocation(line: 519, column: 12, scope: !552)
!554 = !DILocation(line: 519, column: 5, scope: !552)
!555 = !DILocation(line: 523, column: 5, scope: !556)
!556 = distinct !DILexicalBlock(scope: !547, file: !64, line: 522, column: 4)
!557 = !DILocation(line: 528, column: 4, scope: !558)
!558 = distinct !DILexicalBlock(scope: !543, file: !64, line: 527, column: 3)
!559 = !DILocation(line: 531, column: 1, scope: !498)
!560 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !64, file: !64, line: 549, type: !561, scopeLine: 550, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!561 = !DISubroutineType(types: !562)
!562 = !{!25, !25, !25}
!563 = !DILocalVariable(name: "numerator", arg: 1, scope: !560, file: !64, line: 549, type: !25)
!564 = !DILocation(line: 549, column: 31, scope: !560)
!565 = !DILocalVariable(name: "denominator", arg: 2, scope: !560, file: !64, line: 549, type: !25)
!566 = !DILocation(line: 549, column: 46, scope: !560)
!567 = !DILocalVariable(name: "u32Temp", scope: !560, file: !64, line: 551, type: !460)
!568 = !DILocation(line: 551, column: 6, scope: !560)
!569 = !DILocation(line: 552, column: 5, scope: !570)
!570 = distinct !DILexicalBlock(scope: !560, file: !64, line: 552, column: 5)
!571 = !DILocation(line: 552, column: 17, scope: !570)
!572 = !DILocation(line: 552, column: 5, scope: !560)
!573 = !DILocation(line: 554, column: 3, scope: !574)
!574 = distinct !DILexicalBlock(scope: !570, file: !64, line: 553, column: 2)
!575 = !DILocation(line: 558, column: 14, scope: !576)
!576 = distinct !DILexicalBlock(scope: !570, file: !64, line: 557, column: 2)
!577 = !DILocation(line: 558, column: 23, scope: !576)
!578 = !DILocation(line: 558, column: 32, scope: !576)
!579 = !DILocation(line: 558, column: 44, scope: !576)
!580 = !DILocation(line: 558, column: 29, scope: !576)
!581 = !DILocation(line: 558, column: 11, scope: !576)
!582 = !DILocation(line: 559, column: 13, scope: !576)
!583 = !DILocation(line: 559, column: 21, scope: !576)
!584 = !DILocation(line: 559, column: 20, scope: !576)
!585 = !DILocation(line: 559, column: 11, scope: !576)
!586 = !DILocation(line: 560, column: 6, scope: !587)
!587 = distinct !DILexicalBlock(scope: !576, file: !64, line: 560, column: 6)
!588 = !DILocation(line: 560, column: 14, scope: !587)
!589 = !DILocation(line: 560, column: 6, scope: !576)
!590 = !DILocation(line: 562, column: 11, scope: !591)
!591 = distinct !DILexicalBlock(scope: !587, file: !64, line: 561, column: 3)
!592 = !DILocation(line: 562, column: 19, scope: !591)
!593 = !DILocation(line: 562, column: 4, scope: !591)
!594 = !DILocation(line: 566, column: 4, scope: !595)
!595 = distinct !DILexicalBlock(scope: !587, file: !64, line: 565, column: 3)
!596 = !DILocation(line: 570, column: 1, scope: !560)
!597 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !64, file: !64, line: 587, type: !598, scopeLine: 588, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!598 = !DISubroutineType(types: !599)
!599 = !{!25, !460, !25}
!600 = !DILocalVariable(name: "x_value", arg: 1, scope: !597, file: !64, line: 587, type: !460)
!601 = !DILocation(line: 587, column: 25, scope: !597)
!602 = !DILocalVariable(name: "y_value", arg: 2, scope: !597, file: !64, line: 587, type: !25)
!603 = !DILocation(line: 587, column: 38, scope: !597)
!604 = !DILocalVariable(name: "u32Temp1", scope: !597, file: !64, line: 589, type: !460)
!605 = !DILocation(line: 589, column: 6, scope: !597)
!606 = !DILocalVariable(name: "u32Temp2", scope: !597, file: !64, line: 589, type: !460)
!607 = !DILocation(line: 589, column: 17, scope: !597)
!608 = !DILocation(line: 590, column: 12, scope: !597)
!609 = !DILocation(line: 590, column: 20, scope: !597)
!610 = !DILocation(line: 590, column: 10, scope: !597)
!611 = !DILocation(line: 591, column: 5, scope: !612)
!612 = distinct !DILexicalBlock(scope: !597, file: !64, line: 591, column: 5)
!613 = !DILocation(line: 591, column: 13, scope: !612)
!614 = !DILocation(line: 591, column: 5, scope: !597)
!615 = !DILocation(line: 593, column: 3, scope: !616)
!616 = distinct !DILexicalBlock(scope: !612, file: !64, line: 592, column: 2)
!617 = !DILocation(line: 597, column: 14, scope: !618)
!618 = distinct !DILexicalBlock(scope: !612, file: !64, line: 596, column: 2)
!619 = !DILocation(line: 597, column: 22, scope: !618)
!620 = !DILocation(line: 597, column: 21, scope: !618)
!621 = !DILocation(line: 597, column: 12, scope: !618)
!622 = !DILocation(line: 598, column: 14, scope: !618)
!623 = !DILocation(line: 598, column: 25, scope: !618)
!624 = !DILocation(line: 598, column: 36, scope: !618)
!625 = !DILocation(line: 598, column: 34, scope: !618)
!626 = !DILocation(line: 598, column: 22, scope: !618)
!627 = !DILocation(line: 598, column: 45, scope: !618)
!628 = !DILocation(line: 598, column: 12, scope: !618)
!629 = !DILocation(line: 599, column: 15, scope: !618)
!630 = !DILocation(line: 599, column: 24, scope: !618)
!631 = !DILocation(line: 599, column: 23, scope: !618)
!632 = !DILocation(line: 599, column: 36, scope: !618)
!633 = !DILocation(line: 599, column: 44, scope: !618)
!634 = !DILocation(line: 599, column: 43, scope: !618)
!635 = !DILocation(line: 599, column: 33, scope: !618)
!636 = !DILocation(line: 599, column: 12, scope: !618)
!637 = !DILocation(line: 600, column: 6, scope: !638)
!638 = distinct !DILexicalBlock(scope: !618, file: !64, line: 600, column: 6)
!639 = !DILocation(line: 600, column: 15, scope: !638)
!640 = !DILocation(line: 600, column: 6, scope: !618)
!641 = !DILocation(line: 602, column: 11, scope: !642)
!642 = distinct !DILexicalBlock(scope: !638, file: !64, line: 601, column: 3)
!643 = !DILocation(line: 602, column: 20, scope: !642)
!644 = !DILocation(line: 602, column: 4, scope: !642)
!645 = !DILocation(line: 606, column: 4, scope: !646)
!646 = distinct !DILexicalBlock(scope: !638, file: !64, line: 605, column: 3)
!647 = !DILocation(line: 610, column: 1, scope: !597)
!648 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !64, file: !64, line: 629, type: !649, scopeLine: 630, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!649 = !DISubroutineType(types: !650)
!650 = !{!6, !6, !25, !6}
!651 = !DILocalVariable(name: "factor1", arg: 1, scope: !648, file: !64, line: 629, type: !6)
!652 = !DILocation(line: 629, column: 33, scope: !648)
!653 = !DILocalVariable(name: "factor2", arg: 2, scope: !648, file: !64, line: 629, type: !25)
!654 = !DILocation(line: 629, column: 46, scope: !648)
!655 = !DILocalVariable(name: "denominator", arg: 3, scope: !648, file: !64, line: 629, type: !6)
!656 = !DILocation(line: 629, column: 59, scope: !648)
!657 = !DILocalVariable(name: "s32Result", scope: !648, file: !64, line: 631, type: !16)
!658 = !DILocation(line: 631, column: 6, scope: !648)
!659 = !DILocalVariable(name: "s32Temp1", scope: !648, file: !64, line: 631, type: !16)
!660 = !DILocation(line: 631, column: 21, scope: !648)
!661 = !DILocation(line: 632, column: 14, scope: !648)
!662 = !DILocation(line: 632, column: 24, scope: !648)
!663 = !DILocation(line: 632, column: 22, scope: !648)
!664 = !DILocation(line: 632, column: 12, scope: !648)
!665 = !DILocation(line: 633, column: 5, scope: !666)
!666 = distinct !DILexicalBlock(scope: !648, file: !64, line: 633, column: 5)
!667 = !DILocation(line: 633, column: 17, scope: !666)
!668 = !DILocation(line: 633, column: 5, scope: !648)
!669 = !DILocation(line: 635, column: 6, scope: !670)
!670 = distinct !DILexicalBlock(scope: !671, file: !64, line: 635, column: 6)
!671 = distinct !DILexicalBlock(scope: !666, file: !64, line: 634, column: 2)
!672 = !DILocation(line: 635, column: 16, scope: !670)
!673 = !DILocation(line: 635, column: 6, scope: !671)
!674 = !DILocation(line: 637, column: 4, scope: !675)
!675 = distinct !DILexicalBlock(scope: !670, file: !64, line: 636, column: 3)
!676 = !DILocation(line: 641, column: 4, scope: !677)
!677 = distinct !DILexicalBlock(scope: !670, file: !64, line: 640, column: 3)
!678 = !DILocation(line: 646, column: 14, scope: !679)
!679 = distinct !DILexicalBlock(scope: !666, file: !64, line: 645, column: 2)
!680 = !DILocation(line: 646, column: 27, scope: !679)
!681 = !DILocation(line: 646, column: 37, scope: !679)
!682 = !DILocation(line: 646, column: 36, scope: !679)
!683 = !DILocation(line: 646, column: 50, scope: !679)
!684 = !DILocation(line: 646, column: 49, scope: !679)
!685 = !DILocation(line: 646, column: 24, scope: !679)
!686 = !DILocation(line: 646, column: 12, scope: !679)
!687 = !DILocation(line: 647, column: 14, scope: !679)
!688 = !DILocation(line: 647, column: 23, scope: !679)
!689 = !DILocation(line: 647, column: 12, scope: !679)
!690 = !DILocation(line: 648, column: 16, scope: !679)
!691 = !DILocation(line: 648, column: 25, scope: !679)
!692 = !DILocation(line: 648, column: 24, scope: !679)
!693 = !DILocation(line: 648, column: 41, scope: !679)
!694 = !DILocation(line: 648, column: 51, scope: !679)
!695 = !DILocation(line: 648, column: 50, scope: !679)
!696 = !DILocation(line: 648, column: 38, scope: !679)
!697 = !DILocation(line: 648, column: 13, scope: !679)
!698 = !DILocation(line: 649, column: 6, scope: !699)
!699 = distinct !DILexicalBlock(scope: !679, file: !64, line: 649, column: 6)
!700 = !DILocation(line: 649, column: 16, scope: !699)
!701 = !DILocation(line: 649, column: 6, scope: !679)
!702 = !DILocation(line: 651, column: 7, scope: !703)
!703 = distinct !DILexicalBlock(scope: !704, file: !64, line: 651, column: 7)
!704 = distinct !DILexicalBlock(scope: !699, file: !64, line: 650, column: 3)
!705 = !DILocation(line: 651, column: 17, scope: !703)
!706 = !DILocation(line: 651, column: 7, scope: !704)
!707 = !DILocation(line: 653, column: 17, scope: !708)
!708 = distinct !DILexicalBlock(scope: !703, file: !64, line: 652, column: 4)
!709 = !DILocation(line: 653, column: 12, scope: !708)
!710 = !DILocation(line: 653, column: 5, scope: !708)
!711 = !DILocation(line: 658, column: 5, scope: !712)
!712 = distinct !DILexicalBlock(scope: !703, file: !64, line: 657, column: 4)
!713 = !DILocation(line: 663, column: 4, scope: !714)
!714 = distinct !DILexicalBlock(scope: !699, file: !64, line: 662, column: 3)
!715 = !DILocation(line: 667, column: 1, scope: !648)
!716 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !64, file: !64, line: 685, type: !717, scopeLine: 686, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!717 = !DISubroutineType(types: !718)
!718 = !{!6, !25, !6, !25}
!719 = !DILocalVariable(name: "factor1", arg: 1, scope: !716, file: !64, line: 685, type: !25)
!720 = !DILocation(line: 685, column: 33, scope: !716)
!721 = !DILocalVariable(name: "factor2", arg: 2, scope: !716, file: !64, line: 685, type: !6)
!722 = !DILocation(line: 685, column: 46, scope: !716)
!723 = !DILocalVariable(name: "denominator", arg: 3, scope: !716, file: !64, line: 685, type: !25)
!724 = !DILocation(line: 685, column: 59, scope: !716)
!725 = !DILocalVariable(name: "s32Result", scope: !716, file: !64, line: 687, type: !16)
!726 = !DILocation(line: 687, column: 6, scope: !716)
!727 = !DILocalVariable(name: "s32Temp1", scope: !716, file: !64, line: 687, type: !16)
!728 = !DILocation(line: 687, column: 21, scope: !716)
!729 = !DILocation(line: 688, column: 14, scope: !716)
!730 = !DILocation(line: 688, column: 24, scope: !716)
!731 = !DILocation(line: 688, column: 22, scope: !716)
!732 = !DILocation(line: 688, column: 12, scope: !716)
!733 = !DILocation(line: 689, column: 5, scope: !734)
!734 = distinct !DILexicalBlock(scope: !716, file: !64, line: 689, column: 5)
!735 = !DILocation(line: 689, column: 16, scope: !734)
!736 = !DILocation(line: 689, column: 5, scope: !716)
!737 = !DILocation(line: 691, column: 6, scope: !738)
!738 = distinct !DILexicalBlock(scope: !739, file: !64, line: 691, column: 6)
!739 = distinct !DILexicalBlock(scope: !734, file: !64, line: 690, column: 2)
!740 = !DILocation(line: 691, column: 16, scope: !738)
!741 = !DILocation(line: 691, column: 6, scope: !739)
!742 = !DILocation(line: 693, column: 4, scope: !743)
!743 = distinct !DILexicalBlock(scope: !738, file: !64, line: 692, column: 3)
!744 = !DILocation(line: 697, column: 4, scope: !745)
!745 = distinct !DILexicalBlock(scope: !738, file: !64, line: 696, column: 3)
!746 = !DILocation(line: 702, column: 14, scope: !747)
!747 = distinct !DILexicalBlock(scope: !734, file: !64, line: 701, column: 2)
!748 = !DILocation(line: 702, column: 28, scope: !747)
!749 = !DILocation(line: 702, column: 38, scope: !747)
!750 = !DILocation(line: 702, column: 37, scope: !747)
!751 = !DILocation(line: 702, column: 53, scope: !747)
!752 = !DILocation(line: 702, column: 51, scope: !747)
!753 = !DILocation(line: 702, column: 24, scope: !747)
!754 = !DILocation(line: 702, column: 66, scope: !747)
!755 = !DILocation(line: 702, column: 12, scope: !747)
!756 = !DILocation(line: 703, column: 16, scope: !747)
!757 = !DILocation(line: 703, column: 25, scope: !747)
!758 = !DILocation(line: 703, column: 24, scope: !747)
!759 = !DILocation(line: 703, column: 41, scope: !747)
!760 = !DILocation(line: 703, column: 51, scope: !747)
!761 = !DILocation(line: 703, column: 50, scope: !747)
!762 = !DILocation(line: 703, column: 38, scope: !747)
!763 = !DILocation(line: 703, column: 13, scope: !747)
!764 = !DILocation(line: 704, column: 6, scope: !765)
!765 = distinct !DILexicalBlock(scope: !747, file: !64, line: 704, column: 6)
!766 = !DILocation(line: 704, column: 16, scope: !765)
!767 = !DILocation(line: 704, column: 6, scope: !747)
!768 = !DILocation(line: 706, column: 7, scope: !769)
!769 = distinct !DILexicalBlock(scope: !770, file: !64, line: 706, column: 7)
!770 = distinct !DILexicalBlock(scope: !765, file: !64, line: 705, column: 3)
!771 = !DILocation(line: 706, column: 17, scope: !769)
!772 = !DILocation(line: 706, column: 7, scope: !770)
!773 = !DILocation(line: 708, column: 17, scope: !774)
!774 = distinct !DILexicalBlock(scope: !769, file: !64, line: 707, column: 4)
!775 = !DILocation(line: 708, column: 12, scope: !774)
!776 = !DILocation(line: 708, column: 5, scope: !774)
!777 = !DILocation(line: 712, column: 5, scope: !778)
!778 = distinct !DILexicalBlock(scope: !769, file: !64, line: 711, column: 4)
!779 = !DILocation(line: 717, column: 4, scope: !780)
!780 = distinct !DILexicalBlock(scope: !765, file: !64, line: 716, column: 3)
!781 = !DILocation(line: 720, column: 1, scope: !716)
!782 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !64, file: !64, line: 739, type: !783, scopeLine: 740, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!783 = !DISubroutineType(types: !784)
!784 = !{!25, !6, !25, !6}
!785 = !DILocalVariable(name: "factor1", arg: 1, scope: !782, file: !64, line: 739, type: !6)
!786 = !DILocation(line: 739, column: 33, scope: !782)
!787 = !DILocalVariable(name: "factor2", arg: 2, scope: !782, file: !64, line: 739, type: !25)
!788 = !DILocation(line: 739, column: 46, scope: !782)
!789 = !DILocalVariable(name: "denominator", arg: 3, scope: !782, file: !64, line: 739, type: !6)
!790 = !DILocation(line: 739, column: 59, scope: !782)
!791 = !DILocalVariable(name: "u32Result", scope: !782, file: !64, line: 741, type: !460)
!792 = !DILocation(line: 741, column: 6, scope: !782)
!793 = !DILocalVariable(name: "u32Temp1", scope: !782, file: !64, line: 741, type: !460)
!794 = !DILocation(line: 741, column: 21, scope: !782)
!795 = !DILocalVariable(name: "s32Result", scope: !782, file: !64, line: 742, type: !16)
!796 = !DILocation(line: 742, column: 6, scope: !782)
!797 = !DILocalVariable(name: "s32Temp1", scope: !782, file: !64, line: 742, type: !16)
!798 = !DILocation(line: 742, column: 21, scope: !782)
!799 = !DILocation(line: 743, column: 14, scope: !782)
!800 = !DILocation(line: 743, column: 24, scope: !782)
!801 = !DILocation(line: 743, column: 22, scope: !782)
!802 = !DILocation(line: 743, column: 12, scope: !782)
!803 = !DILocation(line: 745, column: 5, scope: !804)
!804 = distinct !DILexicalBlock(scope: !782, file: !64, line: 745, column: 5)
!805 = !DILocation(line: 745, column: 17, scope: !804)
!806 = !DILocation(line: 745, column: 5, scope: !782)
!807 = !DILocation(line: 747, column: 6, scope: !808)
!808 = distinct !DILexicalBlock(scope: !809, file: !64, line: 747, column: 6)
!809 = distinct !DILexicalBlock(scope: !804, file: !64, line: 746, column: 2)
!810 = !DILocation(line: 747, column: 16, scope: !808)
!811 = !DILocation(line: 747, column: 6, scope: !809)
!812 = !DILocation(line: 749, column: 4, scope: !813)
!813 = distinct !DILexicalBlock(scope: !808, file: !64, line: 748, column: 3)
!814 = !DILocation(line: 753, column: 4, scope: !815)
!815 = distinct !DILexicalBlock(scope: !808, file: !64, line: 752, column: 3)
!816 = !DILocation(line: 758, column: 15, scope: !817)
!817 = distinct !DILexicalBlock(scope: !804, file: !64, line: 757, column: 2)
!818 = !DILocation(line: 758, column: 29, scope: !817)
!819 = !DILocation(line: 758, column: 39, scope: !817)
!820 = !DILocation(line: 758, column: 38, scope: !817)
!821 = !DILocation(line: 758, column: 54, scope: !817)
!822 = !DILocation(line: 758, column: 52, scope: !817)
!823 = !DILocation(line: 758, column: 25, scope: !817)
!824 = !DILocation(line: 758, column: 68, scope: !817)
!825 = !DILocation(line: 758, column: 12, scope: !817)
!826 = !DILocation(line: 759, column: 16, scope: !817)
!827 = !DILocation(line: 759, column: 25, scope: !817)
!828 = !DILocation(line: 759, column: 24, scope: !817)
!829 = !DILocation(line: 759, column: 41, scope: !817)
!830 = !DILocation(line: 759, column: 51, scope: !817)
!831 = !DILocation(line: 759, column: 50, scope: !817)
!832 = !DILocation(line: 759, column: 38, scope: !817)
!833 = !DILocation(line: 759, column: 13, scope: !817)
!834 = !DILocation(line: 760, column: 6, scope: !835)
!835 = distinct !DILexicalBlock(scope: !817, file: !64, line: 760, column: 6)
!836 = !DILocation(line: 760, column: 16, scope: !835)
!837 = !DILocation(line: 760, column: 6, scope: !817)
!838 = !DILocation(line: 762, column: 7, scope: !839)
!839 = distinct !DILexicalBlock(scope: !840, file: !64, line: 762, column: 7)
!840 = distinct !DILexicalBlock(scope: !835, file: !64, line: 761, column: 3)
!841 = !DILocation(line: 762, column: 17, scope: !839)
!842 = !DILocation(line: 762, column: 7, scope: !840)
!843 = !DILocation(line: 764, column: 17, scope: !844)
!844 = distinct !DILexicalBlock(scope: !839, file: !64, line: 763, column: 4)
!845 = !DILocation(line: 764, column: 12, scope: !844)
!846 = !DILocation(line: 764, column: 5, scope: !844)
!847 = !DILocation(line: 768, column: 5, scope: !848)
!848 = distinct !DILexicalBlock(scope: !839, file: !64, line: 767, column: 4)
!849 = !DILocation(line: 773, column: 4, scope: !850)
!850 = distinct !DILexicalBlock(scope: !835, file: !64, line: 772, column: 3)
!851 = !DILocation(line: 776, column: 1, scope: !782)
!852 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !64, file: !64, line: 795, type: !853, scopeLine: 796, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!853 = !DISubroutineType(types: !854)
!854 = !{!25, !6, !25, !25}
!855 = !DILocalVariable(name: "factor1", arg: 1, scope: !852, file: !64, line: 795, type: !6)
!856 = !DILocation(line: 795, column: 33, scope: !852)
!857 = !DILocalVariable(name: "factor2", arg: 2, scope: !852, file: !64, line: 795, type: !25)
!858 = !DILocation(line: 795, column: 46, scope: !852)
!859 = !DILocalVariable(name: "denominator", arg: 3, scope: !852, file: !64, line: 795, type: !25)
!860 = !DILocation(line: 795, column: 59, scope: !852)
!861 = !DILocalVariable(name: "s32Result", scope: !852, file: !64, line: 797, type: !16)
!862 = !DILocation(line: 797, column: 6, scope: !852)
!863 = !DILocalVariable(name: "s32Temp1", scope: !852, file: !64, line: 797, type: !16)
!864 = !DILocation(line: 797, column: 21, scope: !852)
!865 = !DILocation(line: 798, column: 14, scope: !852)
!866 = !DILocation(line: 798, column: 24, scope: !852)
!867 = !DILocation(line: 798, column: 22, scope: !852)
!868 = !DILocation(line: 798, column: 12, scope: !852)
!869 = !DILocation(line: 800, column: 5, scope: !870)
!870 = distinct !DILexicalBlock(scope: !852, file: !64, line: 800, column: 5)
!871 = !DILocation(line: 800, column: 17, scope: !870)
!872 = !DILocation(line: 800, column: 5, scope: !852)
!873 = !DILocation(line: 802, column: 6, scope: !874)
!874 = distinct !DILexicalBlock(scope: !875, file: !64, line: 802, column: 6)
!875 = distinct !DILexicalBlock(scope: !870, file: !64, line: 801, column: 2)
!876 = !DILocation(line: 802, column: 16, scope: !874)
!877 = !DILocation(line: 802, column: 6, scope: !875)
!878 = !DILocation(line: 804, column: 4, scope: !879)
!879 = distinct !DILexicalBlock(scope: !874, file: !64, line: 803, column: 3)
!880 = !DILocation(line: 808, column: 4, scope: !881)
!881 = distinct !DILexicalBlock(scope: !874, file: !64, line: 807, column: 3)
!882 = !DILocation(line: 813, column: 15, scope: !883)
!883 = distinct !DILexicalBlock(scope: !870, file: !64, line: 812, column: 2)
!884 = !DILocation(line: 813, column: 29, scope: !883)
!885 = !DILocation(line: 813, column: 39, scope: !883)
!886 = !DILocation(line: 813, column: 38, scope: !883)
!887 = !DILocation(line: 813, column: 54, scope: !883)
!888 = !DILocation(line: 813, column: 52, scope: !883)
!889 = !DILocation(line: 813, column: 25, scope: !883)
!890 = !DILocation(line: 813, column: 68, scope: !883)
!891 = !DILocation(line: 813, column: 12, scope: !883)
!892 = !DILocation(line: 814, column: 16, scope: !883)
!893 = !DILocation(line: 814, column: 25, scope: !883)
!894 = !DILocation(line: 814, column: 24, scope: !883)
!895 = !DILocation(line: 814, column: 41, scope: !883)
!896 = !DILocation(line: 814, column: 51, scope: !883)
!897 = !DILocation(line: 814, column: 50, scope: !883)
!898 = !DILocation(line: 814, column: 38, scope: !883)
!899 = !DILocation(line: 814, column: 13, scope: !883)
!900 = !DILocation(line: 815, column: 6, scope: !901)
!901 = distinct !DILexicalBlock(scope: !883, file: !64, line: 815, column: 6)
!902 = !DILocation(line: 815, column: 16, scope: !901)
!903 = !DILocation(line: 815, column: 6, scope: !883)
!904 = !DILocation(line: 817, column: 7, scope: !905)
!905 = distinct !DILexicalBlock(scope: !906, file: !64, line: 817, column: 7)
!906 = distinct !DILexicalBlock(scope: !901, file: !64, line: 816, column: 3)
!907 = !DILocation(line: 817, column: 17, scope: !905)
!908 = !DILocation(line: 817, column: 7, scope: !906)
!909 = !DILocation(line: 819, column: 17, scope: !910)
!910 = distinct !DILexicalBlock(scope: !905, file: !64, line: 818, column: 4)
!911 = !DILocation(line: 819, column: 12, scope: !910)
!912 = !DILocation(line: 819, column: 5, scope: !910)
!913 = !DILocation(line: 823, column: 5, scope: !914)
!914 = distinct !DILexicalBlock(scope: !905, file: !64, line: 822, column: 4)
!915 = !DILocation(line: 828, column: 4, scope: !916)
!916 = distinct !DILexicalBlock(scope: !901, file: !64, line: 827, column: 3)
!917 = !DILocation(line: 832, column: 1, scope: !852)
!918 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !64, file: !64, line: 850, type: !919, scopeLine: 851, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!919 = !DISubroutineType(types: !920)
!920 = !{!25, !25, !25, !25}
!921 = !DILocalVariable(name: "factor1", arg: 1, scope: !918, file: !64, line: 850, type: !25)
!922 = !DILocation(line: 850, column: 33, scope: !918)
!923 = !DILocalVariable(name: "factor2", arg: 2, scope: !918, file: !64, line: 850, type: !25)
!924 = !DILocation(line: 850, column: 46, scope: !918)
!925 = !DILocalVariable(name: "denominator", arg: 3, scope: !918, file: !64, line: 850, type: !25)
!926 = !DILocation(line: 850, column: 59, scope: !918)
!927 = !DILocalVariable(name: "u32Temp1", scope: !918, file: !64, line: 852, type: !460)
!928 = !DILocation(line: 852, column: 6, scope: !918)
!929 = !DILocalVariable(name: "u16TempDenom", scope: !918, file: !64, line: 853, type: !25)
!930 = !DILocation(line: 853, column: 6, scope: !918)
!931 = !DILocation(line: 855, column: 5, scope: !932)
!932 = distinct !DILexicalBlock(scope: !918, file: !64, line: 855, column: 5)
!933 = !DILocation(line: 855, column: 17, scope: !932)
!934 = !DILocation(line: 855, column: 5, scope: !918)
!935 = !DILocation(line: 857, column: 3, scope: !936)
!936 = distinct !DILexicalBlock(scope: !932, file: !64, line: 856, column: 2)
!937 = !DILocation(line: 861, column: 14, scope: !938)
!938 = distinct !DILexicalBlock(scope: !932, file: !64, line: 860, column: 2)
!939 = !DILocation(line: 861, column: 24, scope: !938)
!940 = !DILocation(line: 861, column: 22, scope: !938)
!941 = !DILocation(line: 861, column: 12, scope: !938)
!942 = !DILocation(line: 862, column: 18, scope: !938)
!943 = !DILocation(line: 862, column: 30, scope: !938)
!944 = !DILocation(line: 862, column: 16, scope: !938)
!945 = !DILocation(line: 863, column: 14, scope: !938)
!946 = !DILocation(line: 863, column: 25, scope: !938)
!947 = !DILocation(line: 863, column: 23, scope: !938)
!948 = !DILocation(line: 863, column: 12, scope: !938)
!949 = !DILocation(line: 864, column: 14, scope: !938)
!950 = !DILocation(line: 864, column: 25, scope: !938)
!951 = !DILocation(line: 864, column: 23, scope: !938)
!952 = !DILocation(line: 864, column: 12, scope: !938)
!953 = !DILocation(line: 865, column: 6, scope: !954)
!954 = distinct !DILexicalBlock(scope: !938, file: !64, line: 865, column: 6)
!955 = !DILocation(line: 865, column: 15, scope: !954)
!956 = !DILocation(line: 865, column: 6, scope: !938)
!957 = !DILocation(line: 867, column: 12, scope: !958)
!958 = distinct !DILexicalBlock(scope: !954, file: !64, line: 866, column: 3)
!959 = !DILocation(line: 867, column: 21, scope: !958)
!960 = !DILocation(line: 867, column: 11, scope: !958)
!961 = !DILocation(line: 867, column: 4, scope: !958)
!962 = !DILocation(line: 872, column: 4, scope: !963)
!963 = distinct !DILexicalBlock(scope: !954, file: !64, line: 871, column: 3)
!964 = !DILocation(line: 877, column: 1, scope: !918)
!965 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !64, file: !64, line: 894, type: !966, scopeLine: 895, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!966 = !DISubroutineType(types: !967)
!967 = !{!25, !25, !25, !460}
!968 = !DILocalVariable(name: "factor1", arg: 1, scope: !965, file: !64, line: 894, type: !25)
!969 = !DILocation(line: 894, column: 33, scope: !965)
!970 = !DILocalVariable(name: "factor2", arg: 2, scope: !965, file: !64, line: 894, type: !25)
!971 = !DILocation(line: 894, column: 46, scope: !965)
!972 = !DILocalVariable(name: "denominator", arg: 3, scope: !965, file: !64, line: 894, type: !460)
!973 = !DILocation(line: 894, column: 59, scope: !965)
!974 = !DILocalVariable(name: "u32Temp1", scope: !965, file: !64, line: 896, type: !460)
!975 = !DILocation(line: 896, column: 6, scope: !965)
!976 = !DILocation(line: 897, column: 5, scope: !977)
!977 = distinct !DILexicalBlock(scope: !965, file: !64, line: 897, column: 5)
!978 = !DILocation(line: 897, column: 17, scope: !977)
!979 = !DILocation(line: 897, column: 5, scope: !965)
!980 = !DILocation(line: 899, column: 3, scope: !981)
!981 = distinct !DILexicalBlock(scope: !977, file: !64, line: 898, column: 2)
!982 = !DILocation(line: 903, column: 15, scope: !983)
!983 = distinct !DILexicalBlock(scope: !977, file: !64, line: 902, column: 2)
!984 = !DILocation(line: 903, column: 25, scope: !983)
!985 = !DILocation(line: 903, column: 23, scope: !983)
!986 = !DILocation(line: 903, column: 36, scope: !983)
!987 = !DILocation(line: 903, column: 34, scope: !983)
!988 = !DILocation(line: 903, column: 12, scope: !983)
!989 = !DILocation(line: 904, column: 8, scope: !990)
!990 = distinct !DILexicalBlock(scope: !983, file: !64, line: 904, column: 6)
!991 = !DILocation(line: 904, column: 18, scope: !990)
!992 = !DILocation(line: 904, column: 16, scope: !990)
!993 = !DILocation(line: 904, column: 28, scope: !990)
!994 = !DILocation(line: 904, column: 40, scope: !990)
!995 = !DILocation(line: 904, column: 39, scope: !990)
!996 = !DILocation(line: 904, column: 26, scope: !990)
!997 = !DILocation(line: 904, column: 53, scope: !990)
!998 = !DILocation(line: 904, column: 64, scope: !990)
!999 = !DILocation(line: 904, column: 50, scope: !990)
!1000 = !DILocation(line: 904, column: 6, scope: !983)
!1001 = !DILocation(line: 906, column: 12, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !990, file: !64, line: 905, column: 3)
!1003 = !DILocation(line: 907, column: 3, scope: !1002)
!1004 = !DILocation(line: 908, column: 6, scope: !1005)
!1005 = distinct !DILexicalBlock(scope: !983, file: !64, line: 908, column: 6)
!1006 = !DILocation(line: 908, column: 15, scope: !1005)
!1007 = !DILocation(line: 908, column: 6, scope: !983)
!1008 = !DILocation(line: 910, column: 12, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !1005, file: !64, line: 909, column: 3)
!1010 = !DILocation(line: 910, column: 21, scope: !1009)
!1011 = !DILocation(line: 910, column: 11, scope: !1009)
!1012 = !DILocation(line: 910, column: 4, scope: !1009)
!1013 = !DILocation(line: 914, column: 4, scope: !1014)
!1014 = distinct !DILexicalBlock(scope: !1005, file: !64, line: 913, column: 3)
!1015 = !DILocation(line: 917, column: 1, scope: !965)
!1016 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !64, file: !64, line: 934, type: !1017, scopeLine: 935, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1017 = !DISubroutineType(types: !1018)
!1018 = !{!460, !460, !25}
!1019 = !DILocalVariable(name: "x_value", arg: 1, scope: !1016, file: !64, line: 934, type: !460)
!1020 = !DILocation(line: 934, column: 25, scope: !1016)
!1021 = !DILocalVariable(name: "y_value", arg: 2, scope: !1016, file: !64, line: 934, type: !25)
!1022 = !DILocation(line: 934, column: 38, scope: !1016)
!1023 = !DILocalVariable(name: "u32Temp1", scope: !1016, file: !64, line: 936, type: !460)
!1024 = !DILocation(line: 936, column: 6, scope: !1016)
!1025 = !DILocation(line: 937, column: 5, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1016, file: !64, line: 937, column: 5)
!1027 = !DILocation(line: 937, column: 13, scope: !1026)
!1028 = !DILocation(line: 937, column: 5, scope: !1016)
!1029 = !DILocation(line: 939, column: 3, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !1026, file: !64, line: 938, column: 2)
!1031 = !DILocation(line: 943, column: 15, scope: !1032)
!1032 = distinct !DILexicalBlock(scope: !1026, file: !64, line: 942, column: 2)
!1033 = !DILocation(line: 943, column: 26, scope: !1032)
!1034 = !DILocation(line: 943, column: 34, scope: !1032)
!1035 = !DILocation(line: 943, column: 33, scope: !1032)
!1036 = !DILocation(line: 943, column: 45, scope: !1032)
!1037 = !DILocation(line: 943, column: 43, scope: !1032)
!1038 = !DILocation(line: 943, column: 23, scope: !1032)
!1039 = !DILocation(line: 943, column: 54, scope: !1032)
!1040 = !DILocation(line: 943, column: 12, scope: !1032)
!1041 = !DILocation(line: 944, column: 15, scope: !1032)
!1042 = !DILocation(line: 944, column: 23, scope: !1032)
!1043 = !DILocation(line: 944, column: 22, scope: !1032)
!1044 = !DILocation(line: 944, column: 35, scope: !1032)
!1045 = !DILocation(line: 944, column: 44, scope: !1032)
!1046 = !DILocation(line: 944, column: 43, scope: !1032)
!1047 = !DILocation(line: 944, column: 32, scope: !1032)
!1048 = !DILocation(line: 944, column: 12, scope: !1032)
!1049 = !DILocation(line: 945, column: 10, scope: !1032)
!1050 = !DILocation(line: 945, column: 3, scope: !1032)
!1051 = !DILocation(line: 947, column: 1, scope: !1016)
!1052 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !64, file: !64, line: 965, type: !1053, scopeLine: 966, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1053 = !DISubroutineType(types: !1054)
!1054 = !{!6, !6, !6, !6}
!1055 = !DILocalVariable(name: "fak1", arg: 1, scope: !1052, file: !64, line: 965, type: !6)
!1056 = !DILocation(line: 965, column: 33, scope: !1052)
!1057 = !DILocalVariable(name: "fak2", arg: 2, scope: !1052, file: !64, line: 965, type: !6)
!1058 = !DILocation(line: 965, column: 43, scope: !1052)
!1059 = !DILocalVariable(name: "div", arg: 3, scope: !1052, file: !64, line: 965, type: !6)
!1060 = !DILocation(line: 965, column: 53, scope: !1052)
!1061 = !DILocalVariable(name: "s32Temp1", scope: !1052, file: !64, line: 967, type: !16)
!1062 = !DILocation(line: 967, column: 6, scope: !1052)
!1063 = !DILocalVariable(name: "s32Temp2", scope: !1052, file: !64, line: 967, type: !16)
!1064 = !DILocation(line: 967, column: 20, scope: !1052)
!1065 = !DILocalVariable(name: "s32Temp3", scope: !1052, file: !64, line: 967, type: !16)
!1066 = !DILocation(line: 967, column: 34, scope: !1052)
!1067 = !DILocation(line: 968, column: 13, scope: !1052)
!1068 = !DILocation(line: 968, column: 20, scope: !1052)
!1069 = !DILocation(line: 968, column: 18, scope: !1052)
!1070 = !DILocation(line: 968, column: 11, scope: !1052)
!1071 = !DILocation(line: 969, column: 5, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1052, file: !64, line: 969, column: 5)
!1073 = !DILocation(line: 969, column: 9, scope: !1072)
!1074 = !DILocation(line: 969, column: 5, scope: !1052)
!1075 = !DILocation(line: 971, column: 6, scope: !1076)
!1076 = distinct !DILexicalBlock(scope: !1077, file: !64, line: 971, column: 6)
!1077 = distinct !DILexicalBlock(scope: !1072, file: !64, line: 970, column: 2)
!1078 = !DILocation(line: 971, column: 15, scope: !1076)
!1079 = !DILocation(line: 971, column: 6, scope: !1077)
!1080 = !DILocation(line: 973, column: 4, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1076, file: !64, line: 972, column: 3)
!1082 = !DILocation(line: 977, column: 4, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1076, file: !64, line: 976, column: 3)
!1084 = !DILocation(line: 982, column: 15, scope: !1085)
!1085 = distinct !DILexicalBlock(scope: !1072, file: !64, line: 981, column: 2)
!1086 = !DILocation(line: 982, column: 28, scope: !1085)
!1087 = !DILocation(line: 982, column: 39, scope: !1085)
!1088 = !DILocation(line: 982, column: 37, scope: !1085)
!1089 = !DILocation(line: 982, column: 46, scope: !1085)
!1090 = !DILocation(line: 982, column: 44, scope: !1085)
!1091 = !DILocation(line: 982, column: 24, scope: !1085)
!1092 = !DILocation(line: 982, column: 52, scope: !1085)
!1093 = !DILocation(line: 982, column: 12, scope: !1085)
!1094 = !DILocation(line: 983, column: 15, scope: !1085)
!1095 = !DILocation(line: 983, column: 24, scope: !1085)
!1096 = !DILocation(line: 983, column: 23, scope: !1085)
!1097 = !DILocation(line: 983, column: 32, scope: !1085)
!1098 = !DILocation(line: 983, column: 41, scope: !1085)
!1099 = !DILocation(line: 983, column: 40, scope: !1085)
!1100 = !DILocation(line: 983, column: 29, scope: !1085)
!1101 = !DILocation(line: 983, column: 12, scope: !1085)
!1102 = !DILocation(line: 984, column: 6, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1085, file: !64, line: 984, column: 6)
!1104 = !DILocation(line: 984, column: 15, scope: !1103)
!1105 = !DILocation(line: 984, column: 6, scope: !1085)
!1106 = !DILocation(line: 986, column: 7, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1108, file: !64, line: 986, column: 7)
!1108 = distinct !DILexicalBlock(scope: !1103, file: !64, line: 985, column: 3)
!1109 = !DILocation(line: 986, column: 16, scope: !1107)
!1110 = !DILocation(line: 986, column: 7, scope: !1108)
!1111 = !DILocation(line: 988, column: 17, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1107, file: !64, line: 987, column: 4)
!1113 = !DILocation(line: 988, column: 12, scope: !1112)
!1114 = !DILocation(line: 988, column: 5, scope: !1112)
!1115 = !DILocation(line: 992, column: 5, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1107, file: !64, line: 991, column: 4)
!1117 = !DILocation(line: 997, column: 4, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1103, file: !64, line: 996, column: 3)
!1119 = !DILocation(line: 1000, column: 1, scope: !1052)
!1120 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !64, file: !64, line: 1018, type: !1121, scopeLine: 1019, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!6, !6, !6, !25}
!1123 = !DILocalVariable(name: "data1", arg: 1, scope: !1120, file: !64, line: 1018, type: !6)
!1124 = !DILocation(line: 1018, column: 33, scope: !1120)
!1125 = !DILocalVariable(name: "data2", arg: 2, scope: !1120, file: !64, line: 1018, type: !6)
!1126 = !DILocation(line: 1018, column: 43, scope: !1120)
!1127 = !DILocalVariable(name: "denominator", arg: 3, scope: !1120, file: !64, line: 1018, type: !25)
!1128 = !DILocation(line: 1018, column: 53, scope: !1120)
!1129 = !DILocalVariable(name: "s32Result", scope: !1120, file: !64, line: 1020, type: !16)
!1130 = !DILocation(line: 1020, column: 6, scope: !1120)
!1131 = !DILocalVariable(name: "s32Temp1", scope: !1120, file: !64, line: 1020, type: !16)
!1132 = !DILocation(line: 1020, column: 21, scope: !1120)
!1133 = !DILocation(line: 1021, column: 14, scope: !1120)
!1134 = !DILocation(line: 1021, column: 22, scope: !1120)
!1135 = !DILocation(line: 1021, column: 20, scope: !1120)
!1136 = !DILocation(line: 1021, column: 12, scope: !1120)
!1137 = !DILocation(line: 1023, column: 5, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1120, file: !64, line: 1023, column: 5)
!1139 = !DILocation(line: 1023, column: 17, scope: !1138)
!1140 = !DILocation(line: 1023, column: 5, scope: !1120)
!1141 = !DILocation(line: 1025, column: 6, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1143, file: !64, line: 1025, column: 6)
!1143 = distinct !DILexicalBlock(scope: !1138, file: !64, line: 1024, column: 2)
!1144 = !DILocation(line: 1025, column: 16, scope: !1142)
!1145 = !DILocation(line: 1025, column: 6, scope: !1143)
!1146 = !DILocation(line: 1027, column: 4, scope: !1147)
!1147 = distinct !DILexicalBlock(scope: !1142, file: !64, line: 1026, column: 3)
!1148 = !DILocation(line: 1029, column: 11, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1142, file: !64, line: 1029, column: 11)
!1150 = !DILocation(line: 1029, column: 21, scope: !1149)
!1151 = !DILocation(line: 1029, column: 11, scope: !1142)
!1152 = !DILocation(line: 1031, column: 4, scope: !1153)
!1153 = distinct !DILexicalBlock(scope: !1149, file: !64, line: 1030, column: 3)
!1154 = !DILocation(line: 1035, column: 4, scope: !1155)
!1155 = distinct !DILexicalBlock(scope: !1149, file: !64, line: 1034, column: 3)
!1156 = !DILocation(line: 1040, column: 15, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !1138, file: !64, line: 1039, column: 2)
!1158 = !DILocation(line: 1040, column: 28, scope: !1157)
!1159 = !DILocation(line: 1040, column: 38, scope: !1157)
!1160 = !DILocation(line: 1040, column: 37, scope: !1157)
!1161 = !DILocation(line: 1040, column: 51, scope: !1157)
!1162 = !DILocation(line: 1040, column: 50, scope: !1157)
!1163 = !DILocation(line: 1040, column: 25, scope: !1157)
!1164 = !DILocation(line: 1040, column: 64, scope: !1157)
!1165 = !DILocation(line: 1040, column: 12, scope: !1157)
!1166 = !DILocation(line: 1041, column: 16, scope: !1157)
!1167 = !DILocation(line: 1041, column: 25, scope: !1157)
!1168 = !DILocation(line: 1041, column: 24, scope: !1157)
!1169 = !DILocation(line: 1041, column: 41, scope: !1157)
!1170 = !DILocation(line: 1041, column: 51, scope: !1157)
!1171 = !DILocation(line: 1041, column: 50, scope: !1157)
!1172 = !DILocation(line: 1041, column: 38, scope: !1157)
!1173 = !DILocation(line: 1041, column: 13, scope: !1157)
!1174 = !DILocation(line: 1042, column: 6, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !1157, file: !64, line: 1042, column: 6)
!1176 = !DILocation(line: 1042, column: 16, scope: !1175)
!1177 = !DILocation(line: 1042, column: 6, scope: !1157)
!1178 = !DILocation(line: 1044, column: 7, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !1180, file: !64, line: 1044, column: 7)
!1180 = distinct !DILexicalBlock(scope: !1175, file: !64, line: 1043, column: 3)
!1181 = !DILocation(line: 1044, column: 17, scope: !1179)
!1182 = !DILocation(line: 1044, column: 7, scope: !1180)
!1183 = !DILocation(line: 1046, column: 17, scope: !1184)
!1184 = distinct !DILexicalBlock(scope: !1179, file: !64, line: 1045, column: 4)
!1185 = !DILocation(line: 1046, column: 12, scope: !1184)
!1186 = !DILocation(line: 1046, column: 5, scope: !1184)
!1187 = !DILocation(line: 1050, column: 5, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1179, file: !64, line: 1049, column: 4)
!1189 = !DILocation(line: 1055, column: 4, scope: !1190)
!1190 = distinct !DILexicalBlock(scope: !1175, file: !64, line: 1054, column: 3)
!1191 = !DILocation(line: 1059, column: 1, scope: !1120)
!1192 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !64, file: !64, line: 1076, type: !1193, scopeLine: 1077, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1193 = !DISubroutineType(types: !1194)
!1194 = !{!460, !460, !16}
!1195 = !DILocalVariable(name: "numerator", arg: 1, scope: !1192, file: !64, line: 1076, type: !460)
!1196 = !DILocation(line: 1076, column: 25, scope: !1192)
!1197 = !DILocalVariable(name: "denominator", arg: 2, scope: !1192, file: !64, line: 1076, type: !16)
!1198 = !DILocation(line: 1076, column: 40, scope: !1192)
!1199 = !DILocalVariable(name: "u32Temp1", scope: !1192, file: !64, line: 1078, type: !460)
!1200 = !DILocation(line: 1078, column: 6, scope: !1192)
!1201 = !DILocation(line: 1079, column: 5, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1192, file: !64, line: 1079, column: 5)
!1203 = !DILocation(line: 1079, column: 17, scope: !1202)
!1204 = !DILocation(line: 1079, column: 5, scope: !1192)
!1205 = !DILocation(line: 1081, column: 3, scope: !1206)
!1206 = distinct !DILexicalBlock(scope: !1202, file: !64, line: 1080, column: 2)
!1207 = !DILocation(line: 1085, column: 6, scope: !1208)
!1208 = distinct !DILexicalBlock(scope: !1209, file: !64, line: 1085, column: 6)
!1209 = distinct !DILexicalBlock(scope: !1202, file: !64, line: 1084, column: 2)
!1210 = !DILocation(line: 1085, column: 18, scope: !1208)
!1211 = !DILocation(line: 1085, column: 6, scope: !1209)
!1212 = !DILocation(line: 1087, column: 4, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1208, file: !64, line: 1086, column: 3)
!1214 = !DILocation(line: 1091, column: 16, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1208, file: !64, line: 1090, column: 3)
!1216 = !DILocation(line: 1091, column: 30, scope: !1215)
!1217 = !DILocation(line: 1091, column: 40, scope: !1215)
!1218 = !DILocation(line: 1091, column: 39, scope: !1215)
!1219 = !DILocation(line: 1091, column: 55, scope: !1215)
!1220 = !DILocation(line: 1091, column: 53, scope: !1215)
!1221 = !DILocation(line: 1091, column: 26, scope: !1215)
!1222 = !DILocation(line: 1091, column: 68, scope: !1215)
!1223 = !DILocation(line: 1091, column: 13, scope: !1215)
!1224 = !DILocation(line: 1092, column: 16, scope: !1215)
!1225 = !DILocation(line: 1092, column: 25, scope: !1215)
!1226 = !DILocation(line: 1092, column: 24, scope: !1215)
!1227 = !DILocation(line: 1092, column: 41, scope: !1215)
!1228 = !DILocation(line: 1092, column: 51, scope: !1215)
!1229 = !DILocation(line: 1092, column: 50, scope: !1215)
!1230 = !DILocation(line: 1092, column: 38, scope: !1215)
!1231 = !DILocation(line: 1092, column: 13, scope: !1215)
!1232 = !DILocation(line: 1093, column: 11, scope: !1215)
!1233 = !DILocation(line: 1093, column: 4, scope: !1215)
!1234 = !DILocation(line: 1096, column: 1, scope: !1192)
!1235 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !64, file: !64, line: 1113, type: !1236, scopeLine: 1114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1236 = !DISubroutineType(types: !1237)
!1237 = !{!460, !16, !460}
!1238 = !DILocalVariable(name: "numerator", arg: 1, scope: !1235, file: !64, line: 1113, type: !16)
!1239 = !DILocation(line: 1113, column: 25, scope: !1235)
!1240 = !DILocalVariable(name: "denominator", arg: 2, scope: !1235, file: !64, line: 1113, type: !460)
!1241 = !DILocation(line: 1113, column: 40, scope: !1235)
!1242 = !DILocalVariable(name: "s32Temp1", scope: !1235, file: !64, line: 1115, type: !16)
!1243 = !DILocation(line: 1115, column: 6, scope: !1235)
!1244 = !DILocation(line: 1116, column: 5, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1235, file: !64, line: 1116, column: 5)
!1246 = !DILocation(line: 1116, column: 17, scope: !1245)
!1247 = !DILocation(line: 1116, column: 5, scope: !1235)
!1248 = !DILocation(line: 1118, column: 6, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1250, file: !64, line: 1118, column: 6)
!1250 = distinct !DILexicalBlock(scope: !1245, file: !64, line: 1117, column: 2)
!1251 = !DILocation(line: 1118, column: 16, scope: !1249)
!1252 = !DILocation(line: 1118, column: 6, scope: !1250)
!1253 = !DILocation(line: 1120, column: 4, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1249, file: !64, line: 1119, column: 3)
!1255 = !DILocation(line: 1124, column: 4, scope: !1256)
!1256 = distinct !DILexicalBlock(scope: !1249, file: !64, line: 1123, column: 3)
!1257 = !DILocation(line: 1129, column: 6, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1259, file: !64, line: 1129, column: 6)
!1259 = distinct !DILexicalBlock(scope: !1245, file: !64, line: 1128, column: 2)
!1260 = !DILocation(line: 1129, column: 16, scope: !1258)
!1261 = !DILocation(line: 1129, column: 6, scope: !1259)
!1262 = !DILocation(line: 1131, column: 17, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1258, file: !64, line: 1130, column: 3)
!1264 = !DILocation(line: 1131, column: 31, scope: !1263)
!1265 = !DILocation(line: 1131, column: 41, scope: !1263)
!1266 = !DILocation(line: 1131, column: 40, scope: !1263)
!1267 = !DILocation(line: 1131, column: 56, scope: !1263)
!1268 = !DILocation(line: 1131, column: 54, scope: !1263)
!1269 = !DILocation(line: 1131, column: 27, scope: !1263)
!1270 = !DILocation(line: 1131, column: 69, scope: !1263)
!1271 = !DILocation(line: 1131, column: 13, scope: !1263)
!1272 = !DILocation(line: 1132, column: 13, scope: !1263)
!1273 = !DILocation(line: 1132, column: 23, scope: !1263)
!1274 = !DILocation(line: 1132, column: 22, scope: !1263)
!1275 = !DILocation(line: 1132, column: 39, scope: !1263)
!1276 = !DILocation(line: 1132, column: 48, scope: !1263)
!1277 = !DILocation(line: 1132, column: 47, scope: !1263)
!1278 = !DILocation(line: 1132, column: 36, scope: !1263)
!1279 = !DILocation(line: 1132, column: 4, scope: !1263)
!1280 = !DILocation(line: 1136, column: 4, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1258, file: !64, line: 1135, column: 3)
!1282 = !DILocation(line: 1139, column: 1, scope: !1235)
!1283 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !64, file: !64, line: 1156, type: !1284, scopeLine: 1157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1284 = !DISubroutineType(types: !1285)
!1285 = !{!460, !16, !16}
!1286 = !DILocalVariable(name: "numerator", arg: 1, scope: !1283, file: !64, line: 1156, type: !16)
!1287 = !DILocation(line: 1156, column: 25, scope: !1283)
!1288 = !DILocalVariable(name: "denominator", arg: 2, scope: !1283, file: !64, line: 1156, type: !16)
!1289 = !DILocation(line: 1156, column: 40, scope: !1283)
!1290 = !DILocalVariable(name: "u32Temp1", scope: !1283, file: !64, line: 1158, type: !460)
!1291 = !DILocation(line: 1158, column: 6, scope: !1283)
!1292 = !DILocalVariable(name: "u32Temp2", scope: !1283, file: !64, line: 1158, type: !460)
!1293 = !DILocation(line: 1158, column: 20, scope: !1283)
!1294 = !DILocation(line: 1159, column: 5, scope: !1295)
!1295 = distinct !DILexicalBlock(scope: !1283, file: !64, line: 1159, column: 5)
!1296 = !DILocation(line: 1159, column: 17, scope: !1295)
!1297 = !DILocation(line: 1159, column: 5, scope: !1283)
!1298 = !DILocation(line: 1161, column: 6, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1300, file: !64, line: 1161, column: 6)
!1300 = distinct !DILexicalBlock(scope: !1295, file: !64, line: 1160, column: 2)
!1301 = !DILocation(line: 1161, column: 16, scope: !1299)
!1302 = !DILocation(line: 1161, column: 6, scope: !1300)
!1303 = !DILocation(line: 1163, column: 4, scope: !1304)
!1304 = distinct !DILexicalBlock(scope: !1299, file: !64, line: 1162, column: 3)
!1305 = !DILocation(line: 1167, column: 4, scope: !1306)
!1306 = distinct !DILexicalBlock(scope: !1299, file: !64, line: 1166, column: 3)
!1307 = !DILocation(line: 1172, column: 6, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1309, file: !64, line: 1172, column: 6)
!1309 = distinct !DILexicalBlock(scope: !1295, file: !64, line: 1171, column: 2)
!1310 = !DILocation(line: 1172, column: 16, scope: !1308)
!1311 = !DILocation(line: 1172, column: 6, scope: !1309)
!1312 = !DILocation(line: 1174, column: 7, scope: !1313)
!1313 = distinct !DILexicalBlock(scope: !1314, file: !64, line: 1174, column: 7)
!1314 = distinct !DILexicalBlock(scope: !1308, file: !64, line: 1173, column: 3)
!1315 = !DILocation(line: 1174, column: 17, scope: !1313)
!1316 = !DILocation(line: 1174, column: 7, scope: !1314)
!1317 = !DILocation(line: 1176, column: 5, scope: !1318)
!1318 = distinct !DILexicalBlock(scope: !1313, file: !64, line: 1175, column: 4)
!1319 = !DILocation(line: 1180, column: 8, scope: !1320)
!1320 = distinct !DILexicalBlock(scope: !1321, file: !64, line: 1180, column: 8)
!1321 = distinct !DILexicalBlock(scope: !1313, file: !64, line: 1179, column: 4)
!1322 = !DILocation(line: 1180, column: 20, scope: !1320)
!1323 = !DILocation(line: 1180, column: 8, scope: !1321)
!1324 = !DILocation(line: 1182, column: 6, scope: !1325)
!1325 = distinct !DILexicalBlock(scope: !1320, file: !64, line: 1181, column: 5)
!1326 = !DILocation(line: 1186, column: 18, scope: !1327)
!1327 = distinct !DILexicalBlock(scope: !1320, file: !64, line: 1185, column: 5)
!1328 = !DILocation(line: 1186, column: 32, scope: !1327)
!1329 = !DILocation(line: 1186, column: 42, scope: !1327)
!1330 = !DILocation(line: 1186, column: 41, scope: !1327)
!1331 = !DILocation(line: 1186, column: 57, scope: !1327)
!1332 = !DILocation(line: 1186, column: 55, scope: !1327)
!1333 = !DILocation(line: 1186, column: 28, scope: !1327)
!1334 = !DILocation(line: 1186, column: 71, scope: !1327)
!1335 = !DILocation(line: 1186, column: 15, scope: !1327)
!1336 = !DILocation(line: 1187, column: 18, scope: !1327)
!1337 = !DILocation(line: 1187, column: 29, scope: !1327)
!1338 = !DILocation(line: 1187, column: 27, scope: !1327)
!1339 = !DILocation(line: 1187, column: 45, scope: !1327)
!1340 = !DILocation(line: 1187, column: 57, scope: !1327)
!1341 = !DILocation(line: 1187, column: 55, scope: !1327)
!1342 = !DILocation(line: 1187, column: 42, scope: !1327)
!1343 = !DILocation(line: 1187, column: 15, scope: !1327)
!1344 = !DILocation(line: 1188, column: 13, scope: !1327)
!1345 = !DILocation(line: 1188, column: 6, scope: !1327)
!1346 = !DILocation(line: 1194, column: 7, scope: !1347)
!1347 = distinct !DILexicalBlock(scope: !1348, file: !64, line: 1194, column: 7)
!1348 = distinct !DILexicalBlock(scope: !1308, file: !64, line: 1193, column: 3)
!1349 = !DILocation(line: 1194, column: 19, scope: !1347)
!1350 = !DILocation(line: 1194, column: 7, scope: !1348)
!1351 = !DILocation(line: 1196, column: 5, scope: !1352)
!1352 = distinct !DILexicalBlock(scope: !1347, file: !64, line: 1195, column: 4)
!1353 = !DILocation(line: 1200, column: 18, scope: !1354)
!1354 = distinct !DILexicalBlock(scope: !1347, file: !64, line: 1199, column: 4)
!1355 = !DILocation(line: 1200, column: 17, scope: !1354)
!1356 = !DILocation(line: 1200, column: 15, scope: !1354)
!1357 = !DILocation(line: 1201, column: 20, scope: !1354)
!1358 = !DILocation(line: 1201, column: 19, scope: !1354)
!1359 = !DILocation(line: 1201, column: 17, scope: !1354)
!1360 = !DILocation(line: 1202, column: 17, scope: !1354)
!1361 = !DILocation(line: 1202, column: 31, scope: !1354)
!1362 = !DILocation(line: 1202, column: 41, scope: !1354)
!1363 = !DILocation(line: 1202, column: 40, scope: !1354)
!1364 = !DILocation(line: 1202, column: 56, scope: !1354)
!1365 = !DILocation(line: 1202, column: 54, scope: !1354)
!1366 = !DILocation(line: 1202, column: 27, scope: !1354)
!1367 = !DILocation(line: 1202, column: 70, scope: !1354)
!1368 = !DILocation(line: 1202, column: 14, scope: !1354)
!1369 = !DILocation(line: 1203, column: 17, scope: !1354)
!1370 = !DILocation(line: 1203, column: 28, scope: !1354)
!1371 = !DILocation(line: 1203, column: 26, scope: !1354)
!1372 = !DILocation(line: 1203, column: 44, scope: !1354)
!1373 = !DILocation(line: 1203, column: 56, scope: !1354)
!1374 = !DILocation(line: 1203, column: 54, scope: !1354)
!1375 = !DILocation(line: 1203, column: 41, scope: !1354)
!1376 = !DILocation(line: 1203, column: 14, scope: !1354)
!1377 = !DILocation(line: 1204, column: 12, scope: !1354)
!1378 = !DILocation(line: 1204, column: 5, scope: !1354)
!1379 = !DILocation(line: 1209, column: 1, scope: !1283)
!1380 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !64, file: !64, line: 1226, type: !1381, scopeLine: 1227, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1381 = !DISubroutineType(types: !1382)
!1382 = !{!460, !460, !460}
!1383 = !DILocalVariable(name: "numerator", arg: 1, scope: !1380, file: !64, line: 1226, type: !460)
!1384 = !DILocation(line: 1226, column: 25, scope: !1380)
!1385 = !DILocalVariable(name: "denominator", arg: 2, scope: !1380, file: !64, line: 1226, type: !460)
!1386 = !DILocation(line: 1226, column: 40, scope: !1380)
!1387 = !DILocalVariable(name: "u32Temp1", scope: !1380, file: !64, line: 1229, type: !460)
!1388 = !DILocation(line: 1229, column: 6, scope: !1380)
!1389 = !DILocalVariable(name: "u32Temp2", scope: !1380, file: !64, line: 1229, type: !460)
!1390 = !DILocation(line: 1229, column: 20, scope: !1380)
!1391 = !DILocalVariable(name: "u32Temp3", scope: !1380, file: !64, line: 1229, type: !460)
!1392 = !DILocation(line: 1229, column: 34, scope: !1380)
!1393 = !DILocalVariable(name: "numerator_old", scope: !1380, file: !64, line: 1229, type: !460)
!1394 = !DILocation(line: 1229, column: 48, scope: !1380)
!1395 = !DILocation(line: 1230, column: 5, scope: !1396)
!1396 = distinct !DILexicalBlock(scope: !1380, file: !64, line: 1230, column: 5)
!1397 = !DILocation(line: 1230, column: 16, scope: !1396)
!1398 = !DILocation(line: 1230, column: 5, scope: !1380)
!1399 = !DILocation(line: 1232, column: 3, scope: !1400)
!1400 = distinct !DILexicalBlock(scope: !1396, file: !64, line: 1231, column: 2)
!1401 = !DILocation(line: 1236, column: 14, scope: !1402)
!1402 = distinct !DILexicalBlock(scope: !1396, file: !64, line: 1235, column: 2)
!1403 = !DILocation(line: 1236, column: 26, scope: !1402)
!1404 = !DILocation(line: 1236, column: 41, scope: !1402)
!1405 = !DILocation(line: 1236, column: 51, scope: !1402)
!1406 = !DILocation(line: 1236, column: 50, scope: !1402)
!1407 = !DILocation(line: 1236, column: 38, scope: !1402)
!1408 = !DILocation(line: 1236, column: 24, scope: !1402)
!1409 = !DILocation(line: 1236, column: 12, scope: !1402)
!1410 = !DILocation(line: 1237, column: 7, scope: !1411)
!1411 = distinct !DILexicalBlock(scope: !1402, file: !64, line: 1237, column: 6)
!1412 = !DILocation(line: 1237, column: 16, scope: !1411)
!1413 = !DILocation(line: 1237, column: 24, scope: !1411)
!1414 = !DILocation(line: 1237, column: 6, scope: !1402)
!1415 = !DILocation(line: 1239, column: 16, scope: !1416)
!1416 = distinct !DILexicalBlock(scope: !1411, file: !64, line: 1238, column: 3)
!1417 = !DILocation(line: 1239, column: 27, scope: !1416)
!1418 = !DILocation(line: 1239, column: 13, scope: !1416)
!1419 = !DILocation(line: 1240, column: 3, scope: !1416)
!1420 = !DILocation(line: 1243, column: 16, scope: !1421)
!1421 = distinct !DILexicalBlock(scope: !1411, file: !64, line: 1242, column: 3)
!1422 = !DILocation(line: 1243, column: 27, scope: !1421)
!1423 = !DILocation(line: 1243, column: 32, scope: !1421)
!1424 = !DILocation(line: 1243, column: 13, scope: !1421)
!1425 = !DILocation(line: 1246, column: 6, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1402, file: !64, line: 1246, column: 6)
!1427 = !DILocation(line: 1246, column: 17, scope: !1426)
!1428 = !DILocation(line: 1246, column: 15, scope: !1426)
!1429 = !DILocation(line: 1246, column: 6, scope: !1402)
!1430 = !DILocation(line: 1248, column: 12, scope: !1431)
!1431 = distinct !DILexicalBlock(scope: !1426, file: !64, line: 1247, column: 3)
!1432 = !DILocation(line: 1248, column: 22, scope: !1431)
!1433 = !DILocation(line: 1248, column: 21, scope: !1431)
!1434 = !DILocation(line: 1248, column: 4, scope: !1431)
!1435 = !DILocation(line: 1252, column: 13, scope: !1436)
!1436 = distinct !DILexicalBlock(scope: !1426, file: !64, line: 1251, column: 3)
!1437 = !DILocation(line: 1252, column: 23, scope: !1436)
!1438 = !DILocation(line: 1252, column: 22, scope: !1436)
!1439 = !DILocation(line: 1252, column: 36, scope: !1436)
!1440 = !DILocation(line: 1252, column: 4, scope: !1436)
!1441 = !DILocation(line: 1257, column: 1, scope: !1380)
!1442 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !64, file: !64, line: 1274, type: !1443, scopeLine: 1275, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1443 = !DISubroutineType(types: !1444)
!1444 = !{!16, !460, !16}
!1445 = !DILocalVariable(name: "numerator", arg: 1, scope: !1442, file: !64, line: 1274, type: !460)
!1446 = !DILocation(line: 1274, column: 25, scope: !1442)
!1447 = !DILocalVariable(name: "denominator", arg: 2, scope: !1442, file: !64, line: 1274, type: !16)
!1448 = !DILocation(line: 1274, column: 40, scope: !1442)
!1449 = !DILocalVariable(name: "u32Temp1", scope: !1442, file: !64, line: 1276, type: !460)
!1450 = !DILocation(line: 1276, column: 6, scope: !1442)
!1451 = !DILocalVariable(name: "u32Temp2", scope: !1442, file: !64, line: 1276, type: !460)
!1452 = !DILocation(line: 1276, column: 20, scope: !1442)
!1453 = !DILocation(line: 1277, column: 5, scope: !1454)
!1454 = distinct !DILexicalBlock(scope: !1442, file: !64, line: 1277, column: 5)
!1455 = !DILocation(line: 1277, column: 17, scope: !1454)
!1456 = !DILocation(line: 1277, column: 5, scope: !1442)
!1457 = !DILocation(line: 1279, column: 6, scope: !1458)
!1458 = distinct !DILexicalBlock(scope: !1459, file: !64, line: 1279, column: 6)
!1459 = distinct !DILexicalBlock(scope: !1454, file: !64, line: 1278, column: 2)
!1460 = !DILocation(line: 1279, column: 18, scope: !1458)
!1461 = !DILocation(line: 1279, column: 6, scope: !1459)
!1462 = !DILocation(line: 1281, column: 4, scope: !1463)
!1463 = distinct !DILexicalBlock(scope: !1458, file: !64, line: 1280, column: 3)
!1464 = !DILocation(line: 1285, column: 19, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1458, file: !64, line: 1284, column: 3)
!1466 = !DILocation(line: 1285, column: 18, scope: !1465)
!1467 = !DILocation(line: 1285, column: 16, scope: !1465)
!1468 = !DILocation(line: 1286, column: 16, scope: !1465)
!1469 = !DILocation(line: 1286, column: 30, scope: !1465)
!1470 = !DILocation(line: 1286, column: 40, scope: !1465)
!1471 = !DILocation(line: 1286, column: 39, scope: !1465)
!1472 = !DILocation(line: 1286, column: 55, scope: !1465)
!1473 = !DILocation(line: 1286, column: 53, scope: !1465)
!1474 = !DILocation(line: 1286, column: 26, scope: !1465)
!1475 = !DILocation(line: 1286, column: 69, scope: !1465)
!1476 = !DILocation(line: 1286, column: 13, scope: !1465)
!1477 = !DILocation(line: 1287, column: 16, scope: !1465)
!1478 = !DILocation(line: 1287, column: 25, scope: !1465)
!1479 = !DILocation(line: 1287, column: 24, scope: !1465)
!1480 = !DILocation(line: 1287, column: 41, scope: !1465)
!1481 = !DILocation(line: 1287, column: 51, scope: !1465)
!1482 = !DILocation(line: 1287, column: 50, scope: !1465)
!1483 = !DILocation(line: 1287, column: 38, scope: !1465)
!1484 = !DILocation(line: 1287, column: 13, scope: !1465)
!1485 = !DILocation(line: 1288, column: 7, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1465, file: !64, line: 1288, column: 7)
!1487 = !DILocation(line: 1288, column: 16, scope: !1486)
!1488 = !DILocation(line: 1288, column: 7, scope: !1465)
!1489 = !DILocation(line: 1290, column: 13, scope: !1490)
!1490 = distinct !DILexicalBlock(scope: !1486, file: !64, line: 1289, column: 4)
!1491 = !DILocation(line: 1290, column: 12, scope: !1490)
!1492 = !DILocation(line: 1290, column: 5, scope: !1490)
!1493 = !DILocation(line: 1294, column: 5, scope: !1494)
!1494 = distinct !DILexicalBlock(scope: !1486, file: !64, line: 1293, column: 4)
!1495 = !DILocation(line: 1300, column: 15, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1454, file: !64, line: 1299, column: 2)
!1497 = !DILocation(line: 1300, column: 29, scope: !1496)
!1498 = !DILocation(line: 1300, column: 39, scope: !1496)
!1499 = !DILocation(line: 1300, column: 38, scope: !1496)
!1500 = !DILocation(line: 1300, column: 54, scope: !1496)
!1501 = !DILocation(line: 1300, column: 52, scope: !1496)
!1502 = !DILocation(line: 1300, column: 25, scope: !1496)
!1503 = !DILocation(line: 1300, column: 68, scope: !1496)
!1504 = !DILocation(line: 1300, column: 12, scope: !1496)
!1505 = !DILocation(line: 1301, column: 15, scope: !1496)
!1506 = !DILocation(line: 1301, column: 24, scope: !1496)
!1507 = !DILocation(line: 1301, column: 23, scope: !1496)
!1508 = !DILocation(line: 1301, column: 40, scope: !1496)
!1509 = !DILocation(line: 1301, column: 50, scope: !1496)
!1510 = !DILocation(line: 1301, column: 49, scope: !1496)
!1511 = !DILocation(line: 1301, column: 37, scope: !1496)
!1512 = !DILocation(line: 1301, column: 12, scope: !1496)
!1513 = !DILocation(line: 1302, column: 6, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1496, file: !64, line: 1302, column: 6)
!1515 = !DILocation(line: 1302, column: 15, scope: !1514)
!1516 = !DILocation(line: 1302, column: 6, scope: !1496)
!1517 = !DILocation(line: 1304, column: 11, scope: !1518)
!1518 = distinct !DILexicalBlock(scope: !1514, file: !64, line: 1303, column: 3)
!1519 = !DILocation(line: 1304, column: 4, scope: !1518)
!1520 = !DILocation(line: 1308, column: 4, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1514, file: !64, line: 1307, column: 3)
!1522 = !DILocation(line: 1311, column: 1, scope: !1442)
!1523 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !64, file: !64, line: 1329, type: !1524, scopeLine: 1330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1524 = !DISubroutineType(types: !1525)
!1525 = !{!16, !16, !460}
!1526 = !DILocalVariable(name: "numerator", arg: 1, scope: !1523, file: !64, line: 1329, type: !16)
!1527 = !DILocation(line: 1329, column: 25, scope: !1523)
!1528 = !DILocalVariable(name: "denominator", arg: 2, scope: !1523, file: !64, line: 1329, type: !460)
!1529 = !DILocation(line: 1329, column: 40, scope: !1523)
!1530 = !DILocalVariable(name: "s32Temp1", scope: !1523, file: !64, line: 1331, type: !16)
!1531 = !DILocation(line: 1331, column: 6, scope: !1523)
!1532 = !DILocalVariable(name: "s32Temp2", scope: !1523, file: !64, line: 1331, type: !16)
!1533 = !DILocation(line: 1331, column: 20, scope: !1523)
!1534 = !DILocalVariable(name: "u32Temp0", scope: !1523, file: !64, line: 1332, type: !460)
!1535 = !DILocation(line: 1332, column: 6, scope: !1523)
!1536 = !DILocalVariable(name: "u32Temp1", scope: !1523, file: !64, line: 1332, type: !460)
!1537 = !DILocation(line: 1332, column: 20, scope: !1523)
!1538 = !DILocalVariable(name: "u32Temp2", scope: !1523, file: !64, line: 1332, type: !460)
!1539 = !DILocation(line: 1332, column: 34, scope: !1523)
!1540 = !DILocation(line: 1333, column: 5, scope: !1541)
!1541 = distinct !DILexicalBlock(scope: !1523, file: !64, line: 1333, column: 5)
!1542 = !DILocation(line: 1333, column: 17, scope: !1541)
!1543 = !DILocation(line: 1333, column: 5, scope: !1523)
!1544 = !DILocation(line: 1335, column: 6, scope: !1545)
!1545 = distinct !DILexicalBlock(scope: !1546, file: !64, line: 1335, column: 6)
!1546 = distinct !DILexicalBlock(scope: !1541, file: !64, line: 1334, column: 2)
!1547 = !DILocation(line: 1335, column: 16, scope: !1545)
!1548 = !DILocation(line: 1335, column: 6, scope: !1546)
!1549 = !DILocation(line: 1337, column: 4, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1545, file: !64, line: 1336, column: 3)
!1551 = !DILocation(line: 1341, column: 4, scope: !1552)
!1552 = distinct !DILexicalBlock(scope: !1545, file: !64, line: 1340, column: 3)
!1553 = !DILocation(line: 1346, column: 6, scope: !1554)
!1554 = distinct !DILexicalBlock(scope: !1555, file: !64, line: 1346, column: 6)
!1555 = distinct !DILexicalBlock(scope: !1541, file: !64, line: 1345, column: 2)
!1556 = !DILocation(line: 1346, column: 16, scope: !1554)
!1557 = !DILocation(line: 1346, column: 6, scope: !1555)
!1558 = !DILocation(line: 1348, column: 16, scope: !1559)
!1559 = distinct !DILexicalBlock(scope: !1554, file: !64, line: 1347, column: 3)
!1560 = !DILocation(line: 1348, column: 15, scope: !1559)
!1561 = !DILocation(line: 1348, column: 13, scope: !1559)
!1562 = !DILocation(line: 1349, column: 16, scope: !1559)
!1563 = !DILocation(line: 1349, column: 25, scope: !1559)
!1564 = !DILocation(line: 1349, column: 24, scope: !1559)
!1565 = !DILocation(line: 1349, column: 13, scope: !1559)
!1566 = !DILocation(line: 1350, column: 15, scope: !1559)
!1567 = !DILocation(line: 1350, column: 28, scope: !1559)
!1568 = !DILocation(line: 1350, column: 37, scope: !1559)
!1569 = !DILocation(line: 1350, column: 36, scope: !1559)
!1570 = !DILocation(line: 1350, column: 52, scope: !1559)
!1571 = !DILocation(line: 1350, column: 50, scope: !1559)
!1572 = !DILocation(line: 1350, column: 24, scope: !1559)
!1573 = !DILocation(line: 1350, column: 13, scope: !1559)
!1574 = !DILocation(line: 1352, column: 8, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1559, file: !64, line: 1352, column: 7)
!1576 = !DILocation(line: 1352, column: 20, scope: !1575)
!1577 = !DILocation(line: 1352, column: 27, scope: !1575)
!1578 = !DILocation(line: 1352, column: 7, scope: !1559)
!1579 = !DILocation(line: 1354, column: 20, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1575, file: !64, line: 1353, column: 4)
!1581 = !DILocation(line: 1354, column: 32, scope: !1580)
!1582 = !DILocation(line: 1354, column: 17, scope: !1580)
!1583 = !DILocation(line: 1355, column: 4, scope: !1580)
!1584 = !DILocation(line: 1358, column: 20, scope: !1585)
!1585 = distinct !DILexicalBlock(scope: !1575, file: !64, line: 1357, column: 4)
!1586 = !DILocation(line: 1358, column: 32, scope: !1585)
!1587 = !DILocation(line: 1358, column: 38, scope: !1585)
!1588 = !DILocation(line: 1358, column: 17, scope: !1585)
!1589 = !DILocation(line: 1362, column: 7, scope: !1590)
!1590 = distinct !DILexicalBlock(scope: !1559, file: !64, line: 1362, column: 7)
!1591 = !DILocation(line: 1362, column: 18, scope: !1590)
!1592 = !DILocation(line: 1362, column: 16, scope: !1590)
!1593 = !DILocation(line: 1362, column: 7, scope: !1559)
!1594 = !DILocation(line: 1364, column: 14, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1590, file: !64, line: 1363, column: 4)
!1596 = !DILocation(line: 1364, column: 13, scope: !1595)
!1597 = !DILocation(line: 1364, column: 23, scope: !1595)
!1598 = !DILocation(line: 1364, column: 5, scope: !1595)
!1599 = !DILocation(line: 1368, column: 14, scope: !1600)
!1600 = distinct !DILexicalBlock(scope: !1590, file: !64, line: 1367, column: 4)
!1601 = !DILocation(line: 1368, column: 23, scope: !1600)
!1602 = !DILocation(line: 1368, column: 12, scope: !1600)
!1603 = !DILocation(line: 1368, column: 27, scope: !1600)
!1604 = !DILocation(line: 1368, column: 5, scope: !1600)
!1605 = !DILocation(line: 1375, column: 16, scope: !1606)
!1606 = distinct !DILexicalBlock(scope: !1554, file: !64, line: 1374, column: 3)
!1607 = !DILocation(line: 1375, column: 30, scope: !1606)
!1608 = !DILocation(line: 1375, column: 40, scope: !1606)
!1609 = !DILocation(line: 1375, column: 39, scope: !1606)
!1610 = !DILocation(line: 1375, column: 55, scope: !1606)
!1611 = !DILocation(line: 1375, column: 53, scope: !1606)
!1612 = !DILocation(line: 1375, column: 26, scope: !1606)
!1613 = !DILocation(line: 1375, column: 69, scope: !1606)
!1614 = !DILocation(line: 1375, column: 13, scope: !1606)
!1615 = !DILocation(line: 1376, column: 16, scope: !1606)
!1616 = !DILocation(line: 1376, column: 26, scope: !1606)
!1617 = !DILocation(line: 1376, column: 25, scope: !1606)
!1618 = !DILocation(line: 1376, column: 42, scope: !1606)
!1619 = !DILocation(line: 1376, column: 51, scope: !1606)
!1620 = !DILocation(line: 1376, column: 50, scope: !1606)
!1621 = !DILocation(line: 1376, column: 39, scope: !1606)
!1622 = !DILocation(line: 1376, column: 13, scope: !1606)
!1623 = !DILocation(line: 1377, column: 11, scope: !1606)
!1624 = !DILocation(line: 1377, column: 4, scope: !1606)
!1625 = !DILocation(line: 1380, column: 1, scope: !1523)
!1626 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !64, file: !64, line: 1397, type: !1627, scopeLine: 1398, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1627 = !DISubroutineType(types: !1628)
!1628 = !{!16, !16, !16}
!1629 = !DILocalVariable(name: "numerator", arg: 1, scope: !1626, file: !64, line: 1397, type: !16)
!1630 = !DILocation(line: 1397, column: 25, scope: !1626)
!1631 = !DILocalVariable(name: "denominator", arg: 2, scope: !1626, file: !64, line: 1397, type: !16)
!1632 = !DILocation(line: 1397, column: 40, scope: !1626)
!1633 = !DILocalVariable(name: "s32Temp1", scope: !1626, file: !64, line: 1399, type: !16)
!1634 = !DILocation(line: 1399, column: 6, scope: !1626)
!1635 = !DILocalVariable(name: "s32Temp2", scope: !1626, file: !64, line: 1399, type: !16)
!1636 = !DILocation(line: 1399, column: 20, scope: !1626)
!1637 = !DILocalVariable(name: "denominator_prime", scope: !1626, file: !64, line: 1400, type: !460)
!1638 = !DILocation(line: 1400, column: 6, scope: !1626)
!1639 = !DILocalVariable(name: "u32Temp1", scope: !1626, file: !64, line: 1400, type: !460)
!1640 = !DILocation(line: 1400, column: 29, scope: !1626)
!1641 = !DILocalVariable(name: "u32Temp2", scope: !1626, file: !64, line: 1400, type: !460)
!1642 = !DILocation(line: 1400, column: 43, scope: !1626)
!1643 = !DILocalVariable(name: "u32numerator", scope: !1626, file: !64, line: 1401, type: !460)
!1644 = !DILocation(line: 1401, column: 6, scope: !1626)
!1645 = !DILocalVariable(name: "u32denominator", scope: !1626, file: !64, line: 1401, type: !460)
!1646 = !DILocation(line: 1401, column: 23, scope: !1626)
!1647 = !DILocation(line: 1402, column: 5, scope: !1648)
!1648 = distinct !DILexicalBlock(scope: !1626, file: !64, line: 1402, column: 5)
!1649 = !DILocation(line: 1402, column: 15, scope: !1648)
!1650 = !DILocation(line: 1402, column: 5, scope: !1626)
!1651 = !DILocation(line: 1404, column: 6, scope: !1652)
!1652 = distinct !DILexicalBlock(scope: !1653, file: !64, line: 1404, column: 6)
!1653 = distinct !DILexicalBlock(scope: !1648, file: !64, line: 1403, column: 2)
!1654 = !DILocation(line: 1404, column: 18, scope: !1652)
!1655 = !DILocation(line: 1404, column: 6, scope: !1653)
!1656 = !DILocation(line: 1406, column: 7, scope: !1657)
!1657 = distinct !DILexicalBlock(scope: !1658, file: !64, line: 1406, column: 7)
!1658 = distinct !DILexicalBlock(scope: !1652, file: !64, line: 1405, column: 3)
!1659 = !DILocation(line: 1406, column: 19, scope: !1657)
!1660 = !DILocation(line: 1406, column: 7, scope: !1658)
!1661 = !DILocation(line: 1408, column: 5, scope: !1662)
!1662 = distinct !DILexicalBlock(scope: !1657, file: !64, line: 1407, column: 4)
!1663 = !DILocation(line: 1412, column: 21, scope: !1664)
!1664 = distinct !DILexicalBlock(scope: !1657, file: !64, line: 1411, column: 4)
!1665 = !DILocation(line: 1412, column: 20, scope: !1664)
!1666 = !DILocation(line: 1412, column: 18, scope: !1664)
!1667 = !DILocation(line: 1413, column: 23, scope: !1664)
!1668 = !DILocation(line: 1413, column: 22, scope: !1664)
!1669 = !DILocation(line: 1413, column: 20, scope: !1664)
!1670 = !DILocation(line: 1414, column: 16, scope: !1664)
!1671 = !DILocation(line: 1414, column: 33, scope: !1664)
!1672 = !DILocation(line: 1414, column: 46, scope: !1664)
!1673 = !DILocation(line: 1414, column: 45, scope: !1664)
!1674 = !DILocation(line: 1414, column: 64, scope: !1664)
!1675 = !DILocation(line: 1414, column: 62, scope: !1664)
!1676 = !DILocation(line: 1414, column: 29, scope: !1664)
!1677 = !DILocation(line: 1414, column: 81, scope: !1664)
!1678 = !DILocation(line: 1414, column: 14, scope: !1664)
!1679 = !DILocation(line: 1415, column: 17, scope: !1664)
!1680 = !DILocation(line: 1415, column: 30, scope: !1664)
!1681 = !DILocation(line: 1415, column: 29, scope: !1664)
!1682 = !DILocation(line: 1415, column: 49, scope: !1664)
!1683 = !DILocation(line: 1415, column: 58, scope: !1664)
!1684 = !DILocation(line: 1415, column: 57, scope: !1664)
!1685 = !DILocation(line: 1415, column: 46, scope: !1664)
!1686 = !DILocation(line: 1415, column: 14, scope: !1664)
!1687 = !DILocation(line: 1416, column: 8, scope: !1688)
!1688 = distinct !DILexicalBlock(scope: !1664, file: !64, line: 1416, column: 8)
!1689 = !DILocation(line: 1416, column: 17, scope: !1688)
!1690 = !DILocation(line: 1416, column: 8, scope: !1664)
!1691 = !DILocation(line: 1418, column: 13, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1688, file: !64, line: 1417, column: 5)
!1693 = !DILocation(line: 1418, column: 6, scope: !1692)
!1694 = !DILocation(line: 1422, column: 6, scope: !1695)
!1695 = distinct !DILexicalBlock(scope: !1688, file: !64, line: 1421, column: 5)
!1696 = !DILocation(line: 1428, column: 20, scope: !1697)
!1697 = distinct !DILexicalBlock(scope: !1652, file: !64, line: 1427, column: 3)
!1698 = !DILocation(line: 1428, column: 19, scope: !1697)
!1699 = !DILocation(line: 1428, column: 29, scope: !1697)
!1700 = !DILocation(line: 1428, column: 17, scope: !1697)
!1701 = !DILocation(line: 1429, column: 16, scope: !1697)
!1702 = !DILocation(line: 1429, column: 33, scope: !1697)
!1703 = !DILocation(line: 1429, column: 46, scope: !1697)
!1704 = !DILocation(line: 1429, column: 45, scope: !1697)
!1705 = !DILocation(line: 1429, column: 61, scope: !1697)
!1706 = !DILocation(line: 1429, column: 59, scope: !1697)
!1707 = !DILocation(line: 1429, column: 29, scope: !1697)
!1708 = !DILocation(line: 1429, column: 75, scope: !1697)
!1709 = !DILocation(line: 1429, column: 13, scope: !1697)
!1710 = !DILocation(line: 1430, column: 16, scope: !1697)
!1711 = !DILocation(line: 1430, column: 29, scope: !1697)
!1712 = !DILocation(line: 1430, column: 28, scope: !1697)
!1713 = !DILocation(line: 1430, column: 45, scope: !1697)
!1714 = !DILocation(line: 1430, column: 54, scope: !1697)
!1715 = !DILocation(line: 1430, column: 53, scope: !1697)
!1716 = !DILocation(line: 1430, column: 42, scope: !1697)
!1717 = !DILocation(line: 1430, column: 13, scope: !1697)
!1718 = !DILocation(line: 1431, column: 13, scope: !1697)
!1719 = !DILocation(line: 1431, column: 12, scope: !1697)
!1720 = !DILocation(line: 1431, column: 22, scope: !1697)
!1721 = !DILocation(line: 1431, column: 4, scope: !1697)
!1722 = !DILocation(line: 1436, column: 6, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1724, file: !64, line: 1436, column: 6)
!1724 = distinct !DILexicalBlock(scope: !1648, file: !64, line: 1435, column: 2)
!1725 = !DILocation(line: 1436, column: 18, scope: !1723)
!1726 = !DILocation(line: 1436, column: 6, scope: !1724)
!1727 = !DILocation(line: 1438, column: 7, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1729, file: !64, line: 1438, column: 7)
!1729 = distinct !DILexicalBlock(scope: !1723, file: !64, line: 1437, column: 3)
!1730 = !DILocation(line: 1438, column: 19, scope: !1728)
!1731 = !DILocation(line: 1438, column: 7, scope: !1729)
!1732 = !DILocation(line: 1440, column: 5, scope: !1733)
!1733 = distinct !DILexicalBlock(scope: !1728, file: !64, line: 1439, column: 4)
!1734 = !DILocation(line: 1444, column: 23, scope: !1735)
!1735 = distinct !DILexicalBlock(scope: !1728, file: !64, line: 1443, column: 4)
!1736 = !DILocation(line: 1444, column: 22, scope: !1735)
!1737 = !DILocation(line: 1444, column: 35, scope: !1735)
!1738 = !DILocation(line: 1444, column: 20, scope: !1735)
!1739 = !DILocation(line: 1445, column: 17, scope: !1735)
!1740 = !DILocation(line: 1445, column: 31, scope: !1735)
!1741 = !DILocation(line: 1445, column: 41, scope: !1735)
!1742 = !DILocation(line: 1445, column: 40, scope: !1735)
!1743 = !DILocation(line: 1445, column: 59, scope: !1735)
!1744 = !DILocation(line: 1445, column: 57, scope: !1735)
!1745 = !DILocation(line: 1445, column: 27, scope: !1735)
!1746 = !DILocation(line: 1445, column: 76, scope: !1735)
!1747 = !DILocation(line: 1445, column: 14, scope: !1735)
!1748 = !DILocation(line: 1446, column: 17, scope: !1735)
!1749 = !DILocation(line: 1446, column: 27, scope: !1735)
!1750 = !DILocation(line: 1446, column: 26, scope: !1735)
!1751 = !DILocation(line: 1446, column: 46, scope: !1735)
!1752 = !DILocation(line: 1446, column: 55, scope: !1735)
!1753 = !DILocation(line: 1446, column: 54, scope: !1735)
!1754 = !DILocation(line: 1446, column: 43, scope: !1735)
!1755 = !DILocation(line: 1446, column: 14, scope: !1735)
!1756 = !DILocation(line: 1447, column: 14, scope: !1735)
!1757 = !DILocation(line: 1447, column: 13, scope: !1735)
!1758 = !DILocation(line: 1447, column: 23, scope: !1735)
!1759 = !DILocation(line: 1447, column: 5, scope: !1735)
!1760 = !DILocation(line: 1452, column: 16, scope: !1761)
!1761 = distinct !DILexicalBlock(scope: !1723, file: !64, line: 1451, column: 3)
!1762 = !DILocation(line: 1452, column: 30, scope: !1761)
!1763 = !DILocation(line: 1452, column: 40, scope: !1761)
!1764 = !DILocation(line: 1452, column: 39, scope: !1761)
!1765 = !DILocation(line: 1452, column: 55, scope: !1761)
!1766 = !DILocation(line: 1452, column: 53, scope: !1761)
!1767 = !DILocation(line: 1452, column: 26, scope: !1761)
!1768 = !DILocation(line: 1452, column: 69, scope: !1761)
!1769 = !DILocation(line: 1452, column: 13, scope: !1761)
!1770 = !DILocation(line: 1453, column: 16, scope: !1761)
!1771 = !DILocation(line: 1453, column: 26, scope: !1761)
!1772 = !DILocation(line: 1453, column: 25, scope: !1761)
!1773 = !DILocation(line: 1453, column: 42, scope: !1761)
!1774 = !DILocation(line: 1453, column: 51, scope: !1761)
!1775 = !DILocation(line: 1453, column: 50, scope: !1761)
!1776 = !DILocation(line: 1453, column: 39, scope: !1761)
!1777 = !DILocation(line: 1453, column: 13, scope: !1761)
!1778 = !DILocation(line: 1454, column: 11, scope: !1761)
!1779 = !DILocation(line: 1454, column: 4, scope: !1761)
!1780 = !DILocation(line: 1457, column: 1, scope: !1626)
!1781 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !64, file: !64, line: 1475, type: !1782, scopeLine: 1476, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1782 = !DISubroutineType(types: !1783)
!1783 = !{!6, !16, !460}
!1784 = !DILocalVariable(name: "numerator", arg: 1, scope: !1781, file: !64, line: 1475, type: !16)
!1785 = !DILocation(line: 1475, column: 25, scope: !1781)
!1786 = !DILocalVariable(name: "denominator", arg: 2, scope: !1781, file: !64, line: 1475, type: !460)
!1787 = !DILocation(line: 1475, column: 40, scope: !1781)
!1788 = !DILocalVariable(name: "numerator_prime", scope: !1781, file: !64, line: 1478, type: !460)
!1789 = !DILocation(line: 1478, column: 6, scope: !1781)
!1790 = !DILocalVariable(name: "u32Temp1", scope: !1781, file: !64, line: 1478, type: !460)
!1791 = !DILocation(line: 1478, column: 27, scope: !1781)
!1792 = !DILocalVariable(name: "u32Temp2", scope: !1781, file: !64, line: 1478, type: !460)
!1793 = !DILocation(line: 1478, column: 41, scope: !1781)
!1794 = !DILocalVariable(name: "u32Temp3", scope: !1781, file: !64, line: 1478, type: !460)
!1795 = !DILocation(line: 1478, column: 55, scope: !1781)
!1796 = !DILocalVariable(name: "s32Temp1", scope: !1781, file: !64, line: 1479, type: !16)
!1797 = !DILocation(line: 1479, column: 6, scope: !1781)
!1798 = !DILocalVariable(name: "s32Temp2", scope: !1781, file: !64, line: 1479, type: !16)
!1799 = !DILocation(line: 1479, column: 20, scope: !1781)
!1800 = !DILocalVariable(name: "s32Temp3", scope: !1781, file: !64, line: 1479, type: !16)
!1801 = !DILocation(line: 1479, column: 34, scope: !1781)
!1802 = !DILocation(line: 1480, column: 5, scope: !1803)
!1803 = distinct !DILexicalBlock(scope: !1781, file: !64, line: 1480, column: 5)
!1804 = !DILocation(line: 1480, column: 17, scope: !1803)
!1805 = !DILocation(line: 1480, column: 5, scope: !1781)
!1806 = !DILocation(line: 1482, column: 6, scope: !1807)
!1807 = distinct !DILexicalBlock(scope: !1808, file: !64, line: 1482, column: 6)
!1808 = distinct !DILexicalBlock(scope: !1803, file: !64, line: 1481, column: 2)
!1809 = !DILocation(line: 1482, column: 15, scope: !1807)
!1810 = !DILocation(line: 1482, column: 6, scope: !1808)
!1811 = !DILocation(line: 1484, column: 4, scope: !1812)
!1812 = distinct !DILexicalBlock(scope: !1807, file: !64, line: 1483, column: 3)
!1813 = !DILocation(line: 1488, column: 4, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1807, file: !64, line: 1487, column: 3)
!1815 = !DILocation(line: 1493, column: 6, scope: !1816)
!1816 = distinct !DILexicalBlock(scope: !1817, file: !64, line: 1493, column: 6)
!1817 = distinct !DILexicalBlock(scope: !1803, file: !64, line: 1492, column: 2)
!1818 = !DILocation(line: 1493, column: 16, scope: !1816)
!1819 = !DILocation(line: 1493, column: 6, scope: !1817)
!1820 = !DILocation(line: 1495, column: 23, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1816, file: !64, line: 1494, column: 3)
!1822 = !DILocation(line: 1495, column: 22, scope: !1821)
!1823 = !DILocation(line: 1495, column: 20, scope: !1821)
!1824 = !DILocation(line: 1496, column: 16, scope: !1821)
!1825 = !DILocation(line: 1496, column: 32, scope: !1821)
!1826 = !DILocation(line: 1496, column: 31, scope: !1821)
!1827 = !DILocation(line: 1496, column: 13, scope: !1821)
!1828 = !DILocation(line: 1497, column: 15, scope: !1821)
!1829 = !DILocation(line: 1497, column: 34, scope: !1821)
!1830 = !DILocation(line: 1497, column: 45, scope: !1821)
!1831 = !DILocation(line: 1497, column: 43, scope: !1821)
!1832 = !DILocation(line: 1497, column: 31, scope: !1821)
!1833 = !DILocation(line: 1497, column: 13, scope: !1821)
!1834 = !DILocation(line: 1499, column: 8, scope: !1835)
!1835 = distinct !DILexicalBlock(scope: !1821, file: !64, line: 1499, column: 7)
!1836 = !DILocation(line: 1499, column: 20, scope: !1835)
!1837 = !DILocation(line: 1499, column: 27, scope: !1835)
!1838 = !DILocation(line: 1499, column: 7, scope: !1821)
!1839 = !DILocation(line: 1501, column: 19, scope: !1840)
!1840 = distinct !DILexicalBlock(scope: !1835, file: !64, line: 1500, column: 4)
!1841 = !DILocation(line: 1501, column: 31, scope: !1840)
!1842 = !DILocation(line: 1501, column: 17, scope: !1840)
!1843 = !DILocation(line: 1502, column: 4, scope: !1840)
!1844 = !DILocation(line: 1505, column: 20, scope: !1845)
!1845 = distinct !DILexicalBlock(scope: !1835, file: !64, line: 1504, column: 4)
!1846 = !DILocation(line: 1505, column: 32, scope: !1845)
!1847 = !DILocation(line: 1505, column: 38, scope: !1845)
!1848 = !DILocation(line: 1505, column: 17, scope: !1845)
!1849 = !DILocation(line: 1508, column: 7, scope: !1850)
!1850 = distinct !DILexicalBlock(scope: !1821, file: !64, line: 1508, column: 7)
!1851 = !DILocation(line: 1508, column: 18, scope: !1850)
!1852 = !DILocation(line: 1508, column: 16, scope: !1850)
!1853 = !DILocation(line: 1508, column: 7, scope: !1821)
!1854 = !DILocation(line: 1510, column: 18, scope: !1855)
!1855 = distinct !DILexicalBlock(scope: !1850, file: !64, line: 1509, column: 4)
!1856 = !DILocation(line: 1510, column: 16, scope: !1855)
!1857 = !DILocation(line: 1510, column: 28, scope: !1855)
!1858 = !DILocation(line: 1510, column: 14, scope: !1855)
!1859 = !DILocation(line: 1511, column: 4, scope: !1855)
!1860 = !DILocation(line: 1514, column: 18, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1850, file: !64, line: 1513, column: 4)
!1862 = !DILocation(line: 1514, column: 26, scope: !1861)
!1863 = !DILocation(line: 1514, column: 16, scope: !1861)
!1864 = !DILocation(line: 1514, column: 30, scope: !1861)
!1865 = !DILocation(line: 1514, column: 14, scope: !1861)
!1866 = !DILocation(line: 1516, column: 8, scope: !1867)
!1867 = distinct !DILexicalBlock(scope: !1821, file: !64, line: 1516, column: 7)
!1868 = !DILocation(line: 1516, column: 18, scope: !1867)
!1869 = !DILocation(line: 1516, column: 7, scope: !1821)
!1870 = !DILocation(line: 1518, column: 18, scope: !1871)
!1871 = distinct !DILexicalBlock(scope: !1867, file: !64, line: 1517, column: 4)
!1872 = !DILocation(line: 1518, column: 12, scope: !1871)
!1873 = !DILocation(line: 1518, column: 5, scope: !1871)
!1874 = !DILocation(line: 1522, column: 5, scope: !1875)
!1875 = distinct !DILexicalBlock(scope: !1867, file: !64, line: 1521, column: 4)
!1876 = !DILocation(line: 1527, column: 16, scope: !1877)
!1877 = distinct !DILexicalBlock(scope: !1816, file: !64, line: 1526, column: 3)
!1878 = !DILocation(line: 1527, column: 26, scope: !1877)
!1879 = !DILocation(line: 1527, column: 25, scope: !1877)
!1880 = !DILocation(line: 1527, column: 41, scope: !1877)
!1881 = !DILocation(line: 1527, column: 39, scope: !1877)
!1882 = !DILocation(line: 1527, column: 13, scope: !1877)
!1883 = !DILocation(line: 1528, column: 16, scope: !1877)
!1884 = !DILocation(line: 1528, column: 30, scope: !1877)
!1885 = !DILocation(line: 1528, column: 40, scope: !1877)
!1886 = !DILocation(line: 1528, column: 39, scope: !1877)
!1887 = !DILocation(line: 1528, column: 55, scope: !1877)
!1888 = !DILocation(line: 1528, column: 53, scope: !1877)
!1889 = !DILocation(line: 1528, column: 26, scope: !1877)
!1890 = !DILocation(line: 1528, column: 68, scope: !1877)
!1891 = !DILocation(line: 1528, column: 13, scope: !1877)
!1892 = !DILocation(line: 1529, column: 16, scope: !1877)
!1893 = !DILocation(line: 1529, column: 25, scope: !1877)
!1894 = !DILocation(line: 1529, column: 24, scope: !1877)
!1895 = !DILocation(line: 1529, column: 41, scope: !1877)
!1896 = !DILocation(line: 1529, column: 51, scope: !1877)
!1897 = !DILocation(line: 1529, column: 50, scope: !1877)
!1898 = !DILocation(line: 1529, column: 38, scope: !1877)
!1899 = !DILocation(line: 1529, column: 13, scope: !1877)
!1900 = !DILocation(line: 1530, column: 7, scope: !1901)
!1901 = distinct !DILexicalBlock(scope: !1877, file: !64, line: 1530, column: 7)
!1902 = !DILocation(line: 1530, column: 16, scope: !1901)
!1903 = !DILocation(line: 1530, column: 7, scope: !1877)
!1904 = !DILocation(line: 1532, column: 17, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1901, file: !64, line: 1531, column: 4)
!1906 = !DILocation(line: 1532, column: 12, scope: !1905)
!1907 = !DILocation(line: 1532, column: 5, scope: !1905)
!1908 = !DILocation(line: 1536, column: 5, scope: !1909)
!1909 = distinct !DILexicalBlock(scope: !1901, file: !64, line: 1535, column: 4)
!1910 = !DILocation(line: 1540, column: 1, scope: !1781)
!1911 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1912, file: !1912, line: 12, type: !1913, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !34, retainedNodes: !1916)
!1912 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1913 = !DISubroutineType(types: !1914)
!1914 = !{null, !1915}
!1915 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1916 = !{!1917}
!1917 = !DILocalVariable(name: "z", arg: 1, scope: !1911, file: !1912, line: 12, type: !1915)
!1918 = !DILocation(line: 0, scope: !1911)
!1919 = !DILocation(line: 13, column: 9, scope: !1920)
!1920 = distinct !DILexicalBlock(scope: !1911, file: !1912, line: 13, column: 7)
!1921 = !DILocation(line: 13, column: 7, scope: !1911)
!1922 = !DILocation(line: 14, column: 5, scope: !1920)
!1923 = !DILocation(line: 15, column: 1, scope: !1911)
