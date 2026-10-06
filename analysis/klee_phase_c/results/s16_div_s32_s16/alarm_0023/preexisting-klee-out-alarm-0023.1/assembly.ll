; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0023/build/s16_div_s32_s16_alarm_0023.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [65 x i8] c"KLEE-ALARM-0023: division by zero. assert (s32)denominator != 0;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0023.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  %numerator = alloca i32, align 4
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i16* %result, metadata !50, metadata !DIExpression()), !dbg !51
  %0 = bitcast i32* %numerator to i8*, !dbg !52
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !53
  %1 = bitcast i16* %denominator to i8*, !dbg !54
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  %2 = load i32, i32* %numerator, align 4, !dbg !56
  %3 = load i16, i16* %denominator, align 2, !dbg !57
  %call = call signext i16 @s16_div_s32_s16(i32 %2, i16 signext %3), !dbg !58
  store i16 %call, i16* %result, align 2, !dbg !59
  %4 = load i16, i16* %result, align 2, !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_s16(i16 signext %numerator, i16 signext %denominator) #0 !dbg !62 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !70, metadata !DIExpression()), !dbg !72
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
  br i1 %cmp6, label %if.then8, label %if.else13, !dbg !211

if.then8:                                         ; preds = %if.else5
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !212
  %conv9 = sext i16 %4 to i64, !dbg !215
  %call = call i32 @klee_alarm_divisor_nonzero(i64 %conv9), !dbg !216
  %tobool = icmp ne i32 %call, 0, !dbg !216
  br i1 %tobool, label %if.end, label %if.then10, !dbg !217

if.then10:                                        ; preds = %if.then8
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 278, i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !218
  unreachable, !dbg !218

if.end:                                           ; preds = %if.then8
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !220
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !221
  %conv11 = sext i16 %6 to i32, !dbg !221
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !222
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !222
  %div = sdiv i32 %5, %conv11, !dbg !222, !klee.check.div !101
  %conv12 = sext i32 %div to i64, !dbg !223
  store volatile i64 %conv12, i64* @klee_alarm_sink_s64, align 8, !dbg !224
  store i16 0, i16* %retval, align 2, !dbg !225
  br label %return, !dbg !225

if.else13:                                        ; preds = %if.else5
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !226
  %conv14 = sext i16 %7 to i32, !dbg !226
  %cmp15 = icmp ne i32 %conv14, -1, !dbg !229
  br i1 %cmp15, label %if.then17, label %if.else34, !dbg !230

if.then17:                                        ; preds = %if.else13
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !231
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !233
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !234
  %conv18 = sext i16 %10 to i32, !dbg !234
  %int_cast_to_i641 = zext i32 %conv18 to i64, !dbg !235
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !235
  %div19 = sdiv i32 %9, %conv18, !dbg !235, !klee.check.div !101
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !236
  %conv20 = sext i16 %11 to i32, !dbg !236
  %mul = mul nsw i32 %div19, %conv20, !dbg !237
  %sub = sub nsw i32 %8, %mul, !dbg !238
  %shl = shl i32 %sub, 1, !dbg !239
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !240
  %12 = load i32, i32* %s32Temp2, align 4, !dbg !241
  %13 = load i16, i16* %denominator.addr, align 2, !dbg !242
  %conv21 = sext i16 %13 to i32, !dbg !242
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !243
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !243
  %div22 = sdiv i32 %12, %conv21, !dbg !243, !klee.check.div !101
  store i32 %div22, i32* %s32Temp1, align 4, !dbg !244
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !245
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !246
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !247
  %conv23 = sext i16 %16 to i32, !dbg !247
  %int_cast_to_i643 = zext i32 %conv23 to i64, !dbg !248
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !248
  %div24 = sdiv i32 %15, %conv23, !dbg !248, !klee.check.div !101
  %add = add nsw i32 %14, %div24, !dbg !249
  store i32 %add, i32* %s32Temp1, align 4, !dbg !250
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !251
  %cmp25 = icmp slt i32 %17, 32767, !dbg !253
  br i1 %cmp25, label %if.then27, label %if.else33, !dbg !254

if.then27:                                        ; preds = %if.then17
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !255
  %cmp28 = icmp sgt i32 %18, -32768, !dbg !258
  br i1 %cmp28, label %if.then30, label %if.else32, !dbg !259

if.then30:                                        ; preds = %if.then27
  %19 = load i32, i32* %s32Temp1, align 4, !dbg !260
  %conv31 = trunc i32 %19 to i16, !dbg !262
  store i16 %conv31, i16* %retval, align 2, !dbg !263
  br label %return, !dbg !263

if.else32:                                        ; preds = %if.then27
  store i16 -32768, i16* %retval, align 2, !dbg !264
  br label %return, !dbg !264

if.else33:                                        ; preds = %if.then17
  store i16 32767, i16* %retval, align 2, !dbg !266
  br label %return, !dbg !266

if.else34:                                        ; preds = %if.else13
  store i16 32767, i16* %retval, align 2, !dbg !268
  br label %return, !dbg !268

return:                                           ; preds = %if.else34, %if.else33, %if.else32, %if.then30, %if.end, %if.else, %if.then4
  %20 = load i16, i16* %retval, align 2, !dbg !270
  ret i16 %20, !dbg !270
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !271 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !274, metadata !DIExpression()), !dbg !275
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !276
  %cmp = icmp ne i64 %0, 0, !dbg !277
  %conv = zext i1 %cmp to i32, !dbg !277
  ret i32 %conv, !dbg !278
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !279 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !282, metadata !DIExpression()), !dbg !283
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !284, metadata !DIExpression()), !dbg !285
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !286, metadata !DIExpression()), !dbg !287
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !288, metadata !DIExpression()), !dbg !289
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !290, metadata !DIExpression()), !dbg !291
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !292
  %conv = zext i16 %0 to i32, !dbg !292
  %and = and i32 %conv, 65535, !dbg !293
  %conv1 = trunc i32 %and to i16, !dbg !292
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !294
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !295
  %conv2 = sext i16 %1 to i32, !dbg !295
  %shl = shl i32 %conv2, 16, !dbg !296
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !297
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !298
  %conv3 = zext i16 %2 to i32, !dbg !298
  %cmp = icmp eq i32 %conv3, 0, !dbg !300
  br i1 %cmp, label %if.then, label %if.else9, !dbg !301

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !302
  %conv5 = sext i16 %3 to i32, !dbg !302
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !305
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !306

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !307
  br label %return, !dbg !307

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !309
  br label %return, !dbg !309

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !311
  %conv10 = sext i16 %4 to i32, !dbg !311
  %shl11 = shl i32 %conv10, 16, !dbg !313
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !314
  %conv12 = sext i16 %5 to i32, !dbg !314
  %shl13 = shl i32 %conv12, 16, !dbg !315
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !316
  %conv14 = zext i16 %6 to i32, !dbg !316
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !317
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !317
  %div = sdiv i32 %shl13, %conv14, !dbg !317, !klee.check.div !101
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !318
  %conv15 = zext i16 %7 to i32, !dbg !318
  %mul = mul nsw i32 %div, %conv15, !dbg !319
  %sub = sub nsw i32 %shl11, %mul, !dbg !320
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !321
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !322
  %shl16 = shl i32 %8, 1, !dbg !323
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !324
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !325
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !326
  %conv17 = zext i16 %10 to i32, !dbg !326
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !327
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !327
  %div18 = sdiv i32 %9, %conv17, !dbg !327, !klee.check.div !101
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !328
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !329
  %conv19 = sext i16 %11 to i32, !dbg !329
  %shl20 = shl i32 %conv19, 16, !dbg !330
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !331
  %conv21 = zext i16 %12 to i32, !dbg !331
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !332
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !332
  %div22 = sdiv i32 %shl20, %conv21, !dbg !332, !klee.check.div !101
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !333
  %add = add nsw i32 %div22, %13, !dbg !334
  store i32 %add, i32* %s32Temp1, align 4, !dbg !335
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !336
  %cmp23 = icmp slt i32 %14, 32767, !dbg !338
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !339

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !340
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !343
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !344

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !345
  %conv29 = trunc i32 %16 to i16, !dbg !347
  store i16 %conv29, i16* %retval, align 2, !dbg !348
  br label %return, !dbg !348

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !349
  br label %return, !dbg !349

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !351
  br label %return, !dbg !351

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !353
  ret i16 %17, !dbg !353
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !354 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !355, metadata !DIExpression()), !dbg !356
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !357, metadata !DIExpression()), !dbg !358
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !359, metadata !DIExpression()), !dbg !360
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !361, metadata !DIExpression()), !dbg !362
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !363
  %conv = zext i16 %0 to i32, !dbg !363
  %and = and i32 %conv, 65535, !dbg !364
  %conv1 = trunc i32 %and to i16, !dbg !363
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !365
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !366
  %conv2 = zext i16 %1 to i32, !dbg !366
  %cmp = icmp eq i32 %conv2, 0, !dbg !368
  br i1 %cmp, label %if.then, label %if.else8, !dbg !369

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !370
  %conv4 = sext i16 %2 to i32, !dbg !370
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !373
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !374

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !375
  br label %return, !dbg !375

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !377
  br label %return, !dbg !377

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !379
  %conv9 = sext i16 %3 to i32, !dbg !379
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !381
  %conv10 = sext i16 %4 to i32, !dbg !381
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !382
  %conv11 = zext i16 %5 to i32, !dbg !382
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !383
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !383
  %div = sdiv i32 %conv10, %conv11, !dbg !383, !klee.check.div !101
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !384
  %conv12 = zext i16 %6 to i32, !dbg !384
  %mul = mul nsw i32 %div, %conv12, !dbg !385
  %sub = sub nsw i32 %conv9, %mul, !dbg !386
  %shl = shl i32 %sub, 1, !dbg !387
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !388
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !389
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !390
  %conv13 = zext i16 %8 to i32, !dbg !390
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !391
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !391
  %div14 = sdiv i32 %7, %conv13, !dbg !391, !klee.check.div !101
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !392
  %conv15 = sext i16 %9 to i32, !dbg !392
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !393
  %conv16 = zext i16 %10 to i32, !dbg !393
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !394
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !394
  %div17 = sdiv i32 %conv15, %conv16, !dbg !394, !klee.check.div !101
  %add = add nsw i32 %div14, %div17, !dbg !395
  store i32 %add, i32* %s32Temp1, align 4, !dbg !396
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !397
  %conv18 = trunc i32 %11 to i16, !dbg !397
  store i16 %conv18, i16* %retval, align 2, !dbg !398
  br label %return, !dbg !398

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !399
  ret i16 %12, !dbg !399
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !400 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !403, metadata !DIExpression()), !dbg !404
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !405, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !407, metadata !DIExpression()), !dbg !412
  store i32 0, i32* %u32Temp1, align 4, !dbg !412
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !413, metadata !DIExpression()), !dbg !414
  store i32 0, i32* %u32Temp2, align 4, !dbg !414
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !415, metadata !DIExpression()), !dbg !416
  store i32 0, i32* %u32Temp3, align 4, !dbg !416
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !417
  %conv = zext i16 %0 to i32, !dbg !417
  %cmp = icmp eq i32 %conv, 0, !dbg !419
  br i1 %cmp, label %if.then, label %if.else, !dbg !420

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !421
  br label %return, !dbg !421

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !423
  %conv2 = zext i16 %1 to i32, !dbg !423
  %shl = shl i32 %conv2, 16, !dbg !425
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !426
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !427
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !428
  %conv3 = zext i16 %3 to i32, !dbg !428
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !429
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !429
  %div = udiv i32 %2, %conv3, !dbg !429, !klee.check.div !101
  store i32 %div, i32* %u32Temp2, align 4, !dbg !430
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !431
  %add = add i32 %4, 128, !dbg !432
  %shr = lshr i32 %add, 8, !dbg !433
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !434
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !435
  %cmp4 = icmp ult i32 %5, 255, !dbg !437
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !438

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !439
  %conv7 = trunc i32 %6 to i8, !dbg !441
  store i8 %conv7, i8* %retval, align 1, !dbg !442
  br label %return, !dbg !442

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !443
  br label %return, !dbg !443

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !445
  ret i8 %7, !dbg !445
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !446 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !449, metadata !DIExpression()), !dbg !450
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !451, metadata !DIExpression()), !dbg !452
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !453, metadata !DIExpression()), !dbg !454
  store i32 0, i32* %s32Temp1, align 4, !dbg !454
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !455
  %conv = zext i16 %0 to i32, !dbg !455
  %and = and i32 %conv, 65535, !dbg !456
  %conv1 = trunc i32 %and to i16, !dbg !455
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !457
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !458
  %conv2 = zext i16 %1 to i32, !dbg !458
  %and3 = and i32 %conv2, 65535, !dbg !460
  %cmp = icmp eq i32 %and3, 0, !dbg !461
  br i1 %cmp, label %if.then, label %if.else8, !dbg !462

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !463
  %cmp5 = icmp sge i32 %2, 0, !dbg !466
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !467

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !468
  br label %return, !dbg !468

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !470
  br label %return, !dbg !470

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !472
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !474
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !475
  %conv9 = zext i16 %5 to i32, !dbg !475
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !476
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !476
  %div = sdiv i32 %4, %conv9, !dbg !476, !klee.check.div !101
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !477
  %conv10 = zext i16 %6 to i32, !dbg !477
  %mul = mul nsw i32 %div, %conv10, !dbg !478
  %sub = sub nsw i32 %3, %mul, !dbg !479
  %shl = shl i32 %sub, 1, !dbg !480
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !481
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !482
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !483
  %conv11 = zext i16 %8 to i32, !dbg !483
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !484
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !484
  %div12 = sdiv i32 %7, %conv11, !dbg !484, !klee.check.div !101
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !485
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !486
  %conv13 = zext i16 %10 to i32, !dbg !486
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !487
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !487
  %div14 = sdiv i32 %9, %conv13, !dbg !487, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !488
  store i32 %add, i32* %s32Temp1, align 4, !dbg !489
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !490
  %cmp15 = icmp slt i32 %11, 65535, !dbg !492
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !493

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !494
  %cmp18 = icmp sgt i32 %12, 0, !dbg !497
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !498

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !499
  %conv21 = trunc i32 %13 to i16, !dbg !501
  store i16 %conv21, i16* %retval, align 2, !dbg !502
  br label %return, !dbg !502

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !503
  br label %return, !dbg !503

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !505
  br label %return, !dbg !505

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !507
  ret i16 %14, !dbg !507
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !508 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !511, metadata !DIExpression()), !dbg !512
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !513, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !515, metadata !DIExpression()), !dbg !516
  store i32 0, i32* %u32Temp, align 4, !dbg !516
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !517
  %conv = zext i16 %0 to i32, !dbg !517
  %cmp = icmp eq i32 %conv, 0, !dbg !519
  br i1 %cmp, label %if.then, label %if.else, !dbg !520

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !521
  br label %return, !dbg !521

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !523
  %conv2 = zext i16 %1 to i32, !dbg !523
  %shl = shl i32 %conv2, 16, !dbg !525
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !526
  %conv3 = zext i16 %2 to i32, !dbg !526
  %shr = ashr i32 %conv3, 1, !dbg !527
  %add = add nsw i32 %shl, %shr, !dbg !528
  store i32 %add, i32* %u32Temp, align 4, !dbg !529
  %3 = load i32, i32* %u32Temp, align 4, !dbg !530
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !531
  %conv4 = zext i16 %4 to i32, !dbg !531
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !532
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !532
  %div = udiv i32 %3, %conv4, !dbg !532, !klee.check.div !101
  store i32 %div, i32* %u32Temp, align 4, !dbg !533
  %5 = load i32, i32* %u32Temp, align 4, !dbg !534
  %cmp5 = icmp ult i32 %5, 65535, !dbg !536
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !537

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !538
  %and = and i32 %6, 65535, !dbg !540
  %conv8 = trunc i32 %and to i16, !dbg !538
  store i16 %conv8, i16* %retval, align 2, !dbg !541
  br label %return, !dbg !541

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !542
  br label %return, !dbg !542

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !544
  ret i16 %7, !dbg !544
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !545 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !548, metadata !DIExpression()), !dbg !549
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !550, metadata !DIExpression()), !dbg !551
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !552, metadata !DIExpression()), !dbg !553
  store i32 0, i32* %u32Temp1, align 4, !dbg !553
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !554, metadata !DIExpression()), !dbg !555
  store i32 0, i32* %u32Temp2, align 4, !dbg !555
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !556
  %conv = zext i16 %0 to i32, !dbg !556
  %and = and i32 %conv, 65535, !dbg !557
  %conv1 = trunc i32 %and to i16, !dbg !556
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !558
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !559
  %conv2 = zext i16 %1 to i32, !dbg !559
  %cmp = icmp eq i32 %conv2, 0, !dbg !561
  br i1 %cmp, label %if.then, label %if.else, !dbg !562

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !563
  br label %return, !dbg !563

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !565
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !567
  %conv4 = zext i16 %3 to i32, !dbg !567
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !568
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !568
  %div = udiv i32 %2, %conv4, !dbg !568, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !569
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !570
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !571
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !572
  %conv5 = zext i16 %6 to i32, !dbg !572
  %mul = mul i32 %5, %conv5, !dbg !573
  %sub = sub i32 %4, %mul, !dbg !574
  %shl = shl i32 %sub, 1, !dbg !575
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !576
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !577
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !578
  %conv6 = zext i16 %8 to i32, !dbg !578
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !579
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !579
  %div7 = udiv i32 %7, %conv6, !dbg !579, !klee.check.div !101
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !580
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !581
  %conv8 = zext i16 %10 to i32, !dbg !581
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !582
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !582
  %div9 = udiv i32 %9, %conv8, !dbg !582, !klee.check.div !101
  %add = add i32 %div7, %div9, !dbg !583
  store i32 %add, i32* %u32Temp2, align 4, !dbg !584
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !585
  %cmp10 = icmp ult i32 %11, 65535, !dbg !587
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !588

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !589
  %and13 = and i32 %12, 65535, !dbg !591
  %conv14 = trunc i32 %and13 to i16, !dbg !589
  store i16 %conv14, i16* %retval, align 2, !dbg !592
  br label %return, !dbg !592

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !593
  br label %return, !dbg !593

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !595
  ret i16 %13, !dbg !595
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !596 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !599, metadata !DIExpression()), !dbg !600
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !601, metadata !DIExpression()), !dbg !602
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !603, metadata !DIExpression()), !dbg !604
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !605, metadata !DIExpression()), !dbg !606
  store i32 0, i32* %s32Result, align 4, !dbg !606
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !607, metadata !DIExpression()), !dbg !608
  store i32 0, i32* %s32Temp1, align 4, !dbg !608
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !609
  %conv = sext i16 %0 to i32, !dbg !609
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !610
  %conv1 = zext i16 %1 to i32, !dbg !610
  %mul = mul nsw i32 %conv, %conv1, !dbg !611
  store i32 %mul, i32* %s32Result, align 4, !dbg !612
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !613
  %conv2 = sext i16 %2 to i32, !dbg !613
  %cmp = icmp eq i32 %conv2, 0, !dbg !615
  br i1 %cmp, label %if.then, label %if.else7, !dbg !616

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !617
  %cmp4 = icmp slt i32 %3, 0, !dbg !620
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !621

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !622
  br label %return, !dbg !622

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !624
  br label %return, !dbg !624

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !626
  %5 = load i32, i32* %s32Result, align 4, !dbg !628
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !629
  %conv8 = sext i16 %6 to i32, !dbg !629
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !630
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !630
  %div = sdiv i32 %5, %conv8, !dbg !630, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !631
  %conv9 = sext i16 %7 to i32, !dbg !631
  %mul10 = mul nsw i32 %div, %conv9, !dbg !632
  %sub = sub nsw i32 %4, %mul10, !dbg !633
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !634
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !635
  %shl = shl i32 %8, 1, !dbg !636
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !637
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !638
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !639
  %conv11 = sext i16 %10 to i32, !dbg !639
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !640
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !640
  %div12 = sdiv i32 %9, %conv11, !dbg !640, !klee.check.div !101
  %11 = load i32, i32* %s32Result, align 4, !dbg !641
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !642
  %conv13 = sext i16 %12 to i32, !dbg !642
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !643
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !643
  %div14 = sdiv i32 %11, %conv13, !dbg !643, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !644
  store i32 %add, i32* %s32Result, align 4, !dbg !645
  %13 = load i32, i32* %s32Result, align 4, !dbg !646
  %cmp15 = icmp slt i32 %13, 32767, !dbg !648
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !649

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !650
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !653
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !654

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !655
  %conv21 = trunc i32 %15 to i16, !dbg !657
  store i16 %conv21, i16* %retval, align 2, !dbg !658
  br label %return, !dbg !658

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !659
  br label %return, !dbg !659

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !661
  br label %return, !dbg !661

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !663
  ret i16 %16, !dbg !663
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !664 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !667, metadata !DIExpression()), !dbg !668
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !669, metadata !DIExpression()), !dbg !670
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !671, metadata !DIExpression()), !dbg !672
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !673, metadata !DIExpression()), !dbg !674
  store i32 0, i32* %s32Result, align 4, !dbg !674
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !675, metadata !DIExpression()), !dbg !676
  store i32 0, i32* %s32Temp1, align 4, !dbg !676
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !677
  %conv = zext i16 %0 to i32, !dbg !677
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !678
  %conv1 = sext i16 %1 to i32, !dbg !678
  %mul = mul nsw i32 %conv, %conv1, !dbg !679
  store i32 %mul, i32* %s32Result, align 4, !dbg !680
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !681
  %conv2 = zext i16 %2 to i32, !dbg !681
  %cmp = icmp eq i32 %conv2, 0, !dbg !683
  br i1 %cmp, label %if.then, label %if.else7, !dbg !684

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !685
  %cmp4 = icmp slt i32 %3, 0, !dbg !688
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !689

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !690
  br label %return, !dbg !690

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !692
  br label %return, !dbg !692

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !694
  %5 = load i32, i32* %s32Result, align 4, !dbg !696
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !697
  %conv8 = zext i16 %6 to i32, !dbg !697
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !698
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !698
  %div = sdiv i32 %5, %conv8, !dbg !698, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !699
  %conv9 = zext i16 %7 to i32, !dbg !699
  %mul10 = mul nsw i32 %div, %conv9, !dbg !700
  %sub = sub nsw i32 %4, %mul10, !dbg !701
  %shl = shl i32 %sub, 1, !dbg !702
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !703
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !704
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !705
  %conv11 = zext i16 %9 to i32, !dbg !705
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !706
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !706
  %div12 = sdiv i32 %8, %conv11, !dbg !706, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !707
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !708
  %conv13 = zext i16 %11 to i32, !dbg !708
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !709
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !709
  %div14 = sdiv i32 %10, %conv13, !dbg !709, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !710
  store i32 %add, i32* %s32Result, align 4, !dbg !711
  %12 = load i32, i32* %s32Result, align 4, !dbg !712
  %cmp15 = icmp slt i32 %12, 32767, !dbg !714
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !715

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !716
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !719
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !720

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !721
  %conv21 = trunc i32 %14 to i16, !dbg !723
  store i16 %conv21, i16* %retval, align 2, !dbg !724
  br label %return, !dbg !724

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !725
  br label %return, !dbg !725

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !727
  br label %return, !dbg !727

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !729
  ret i16 %15, !dbg !729
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !730 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !733, metadata !DIExpression()), !dbg !734
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !735, metadata !DIExpression()), !dbg !736
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !737, metadata !DIExpression()), !dbg !738
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !739, metadata !DIExpression()), !dbg !740
  store i32 0, i32* %u32Result, align 4, !dbg !740
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !741, metadata !DIExpression()), !dbg !742
  store i32 0, i32* %u32Temp1, align 4, !dbg !742
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !743, metadata !DIExpression()), !dbg !744
  store i32 0, i32* %s32Result, align 4, !dbg !744
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !745, metadata !DIExpression()), !dbg !746
  store i32 0, i32* %s32Temp1, align 4, !dbg !746
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !747
  %conv = sext i16 %0 to i32, !dbg !747
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !748
  %conv1 = zext i16 %1 to i32, !dbg !748
  %mul = mul nsw i32 %conv, %conv1, !dbg !749
  store i32 %mul, i32* %s32Result, align 4, !dbg !750
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !751
  %conv2 = sext i16 %2 to i32, !dbg !751
  %cmp = icmp eq i32 %conv2, 0, !dbg !753
  br i1 %cmp, label %if.then, label %if.else7, !dbg !754

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !755
  %cmp4 = icmp sge i32 %3, 0, !dbg !758
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !759

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !760
  br label %return, !dbg !760

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !762
  br label %return, !dbg !762

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !764
  %5 = load i32, i32* %s32Result, align 4, !dbg !766
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !767
  %conv8 = sext i16 %6 to i32, !dbg !767
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !768
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !768
  %div = sdiv i32 %5, %conv8, !dbg !768, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !769
  %conv9 = sext i16 %7 to i32, !dbg !769
  %mul10 = mul nsw i32 %div, %conv9, !dbg !770
  %sub = sub nsw i32 %4, %mul10, !dbg !771
  %shl = shl i32 %sub, 1, !dbg !772
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !773
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !774
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !775
  %conv11 = sext i16 %9 to i32, !dbg !775
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !776
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !776
  %div12 = sdiv i32 %8, %conv11, !dbg !776, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !777
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !778
  %conv13 = sext i16 %11 to i32, !dbg !778
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !779
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !779
  %div14 = sdiv i32 %10, %conv13, !dbg !779, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !780
  store i32 %add, i32* %s32Result, align 4, !dbg !781
  %12 = load i32, i32* %s32Result, align 4, !dbg !782
  %cmp15 = icmp slt i32 %12, 65535, !dbg !784
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !785

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !786
  %cmp18 = icmp sgt i32 %13, 0, !dbg !789
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !790

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !791
  %conv21 = trunc i32 %14 to i16, !dbg !793
  store i16 %conv21, i16* %retval, align 2, !dbg !794
  br label %return, !dbg !794

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !795
  br label %return, !dbg !795

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !797
  br label %return, !dbg !797

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !799
  ret i16 %15, !dbg !799
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !800 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !803, metadata !DIExpression()), !dbg !804
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !805, metadata !DIExpression()), !dbg !806
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !807, metadata !DIExpression()), !dbg !808
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !809, metadata !DIExpression()), !dbg !810
  store i32 0, i32* %s32Result, align 4, !dbg !810
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !811, metadata !DIExpression()), !dbg !812
  store i32 0, i32* %s32Temp1, align 4, !dbg !812
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !813
  %conv = sext i16 %0 to i32, !dbg !813
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !814
  %conv1 = zext i16 %1 to i32, !dbg !814
  %mul = mul nsw i32 %conv, %conv1, !dbg !815
  store i32 %mul, i32* %s32Result, align 4, !dbg !816
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !817
  %conv2 = zext i16 %2 to i32, !dbg !817
  %cmp = icmp eq i32 %conv2, 0, !dbg !819
  br i1 %cmp, label %if.then, label %if.else7, !dbg !820

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !821
  %cmp4 = icmp sge i32 %3, 0, !dbg !824
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !825

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !826
  br label %return, !dbg !826

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !828
  br label %return, !dbg !828

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !830
  %5 = load i32, i32* %s32Result, align 4, !dbg !832
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !833
  %conv8 = zext i16 %6 to i32, !dbg !833
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !834
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !834
  %div = sdiv i32 %5, %conv8, !dbg !834, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !835
  %conv9 = zext i16 %7 to i32, !dbg !835
  %mul10 = mul nsw i32 %div, %conv9, !dbg !836
  %sub = sub nsw i32 %4, %mul10, !dbg !837
  %shl = shl i32 %sub, 1, !dbg !838
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !839
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !840
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !841
  %conv11 = zext i16 %9 to i32, !dbg !841
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !842
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !842
  %div12 = sdiv i32 %8, %conv11, !dbg !842, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !843
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !844
  %conv13 = zext i16 %11 to i32, !dbg !844
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !845
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !845
  %div14 = sdiv i32 %10, %conv13, !dbg !845, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !846
  store i32 %add, i32* %s32Result, align 4, !dbg !847
  %12 = load i32, i32* %s32Result, align 4, !dbg !848
  %cmp15 = icmp slt i32 %12, 65535, !dbg !850
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !851

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !852
  %cmp18 = icmp sgt i32 %13, 0, !dbg !855
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !856

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !857
  %conv21 = trunc i32 %14 to i16, !dbg !859
  store i16 %conv21, i16* %retval, align 2, !dbg !860
  br label %return, !dbg !860

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !861
  br label %return, !dbg !861

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !863
  br label %return, !dbg !863

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !865
  ret i16 %15, !dbg !865
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !866 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !869, metadata !DIExpression()), !dbg !870
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !871, metadata !DIExpression()), !dbg !872
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !873, metadata !DIExpression()), !dbg !874
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !875, metadata !DIExpression()), !dbg !876
  store i32 0, i32* %u32Temp1, align 4, !dbg !876
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !877, metadata !DIExpression()), !dbg !878
  store i16 0, i16* %u16TempDenom, align 2, !dbg !878
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !879
  %conv = zext i16 %0 to i32, !dbg !879
  %cmp = icmp eq i32 %conv, 0, !dbg !881
  br i1 %cmp, label %if.then, label %if.else, !dbg !882

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !883
  br label %return, !dbg !883

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !885
  %conv2 = zext i16 %1 to i32, !dbg !885
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !887
  %conv3 = zext i16 %2 to i32, !dbg !887
  %mul = mul nsw i32 %conv2, %conv3, !dbg !888
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !889
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !890
  %conv4 = zext i16 %3 to i32, !dbg !890
  %shr = ashr i32 %conv4, 1, !dbg !891
  %conv5 = trunc i32 %shr to i16, !dbg !890
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !892
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !893
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !894
  %conv6 = zext i16 %5 to i32, !dbg !894
  %add = add i32 %4, %conv6, !dbg !895
  store i32 %add, i32* %u32Temp1, align 4, !dbg !896
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !897
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !898
  %conv7 = zext i16 %7 to i32, !dbg !898
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !899
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !899
  %div = udiv i32 %6, %conv7, !dbg !899, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !900
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !901
  %cmp8 = icmp ult i32 %8, 65535, !dbg !903
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !904

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !905
  %and = and i32 %9, 65535, !dbg !907
  %conv11 = trunc i32 %and to i16, !dbg !908
  store i16 %conv11, i16* %retval, align 2, !dbg !909
  br label %return, !dbg !909

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !910
  br label %return, !dbg !910

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !912
  ret i16 %10, !dbg !912
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !913 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !916, metadata !DIExpression()), !dbg !917
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !918, metadata !DIExpression()), !dbg !919
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !920, metadata !DIExpression()), !dbg !921
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !922, metadata !DIExpression()), !dbg !923
  store i32 0, i32* %u32Temp1, align 4, !dbg !923
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !924
  %cmp = icmp eq i32 %0, 0, !dbg !926
  br i1 %cmp, label %if.then, label %if.else, !dbg !927

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !928
  br label %return, !dbg !928

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !930
  %conv = zext i16 %1 to i32, !dbg !930
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !932
  %conv1 = zext i16 %2 to i32, !dbg !932
  %mul = mul nsw i32 %conv, %conv1, !dbg !933
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !934
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !935
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !935
  %div = udiv i32 %mul, %3, !dbg !935, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !936
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !937
  %conv2 = zext i16 %4 to i32, !dbg !937
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !939
  %conv3 = zext i16 %5 to i32, !dbg !939
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !940
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !941
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !942
  %mul5 = mul i32 %6, %7, !dbg !943
  %sub = sub i32 %mul4, %mul5, !dbg !944
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !945
  %div6 = udiv i32 %8, 2, !dbg !946
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !947
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !948

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !949
  %inc = add i32 %9, 1, !dbg !949
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !949
  br label %if.end, !dbg !951

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !952
  %cmp10 = icmp ult i32 %10, 65535, !dbg !954
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !955

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !956
  %and = and i32 %11, 65535, !dbg !958
  %conv13 = trunc i32 %and to i16, !dbg !959
  store i16 %conv13, i16* %retval, align 2, !dbg !960
  br label %return, !dbg !960

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !961
  br label %return, !dbg !961

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !963
  ret i16 %12, !dbg !963
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !964 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !967, metadata !DIExpression()), !dbg !968
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !969, metadata !DIExpression()), !dbg !970
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !971, metadata !DIExpression()), !dbg !972
  store i32 0, i32* %u32Temp1, align 4, !dbg !972
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !973
  %conv = zext i16 %0 to i32, !dbg !973
  %cmp = icmp eq i32 %conv, 0, !dbg !975
  br i1 %cmp, label %if.then, label %if.else, !dbg !976

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !977
  br label %return, !dbg !977

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !979
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !981
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !982
  %conv2 = zext i16 %3 to i32, !dbg !982
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !983
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !983
  %div = udiv i32 %2, %conv2, !dbg !983, !klee.check.div !101
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !984
  %conv3 = zext i16 %4 to i32, !dbg !984
  %mul = mul i32 %div, %conv3, !dbg !985
  %sub = sub i32 %1, %mul, !dbg !986
  %shl = shl i32 %sub, 1, !dbg !987
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !988
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !989
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !990
  %conv4 = zext i16 %6 to i32, !dbg !990
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !991
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !991
  %div5 = udiv i32 %5, %conv4, !dbg !991, !klee.check.div !101
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !992
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !993
  %conv6 = zext i16 %8 to i32, !dbg !993
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !994
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !994
  %div7 = udiv i32 %7, %conv6, !dbg !994, !klee.check.div !101
  %add = add i32 %div5, %div7, !dbg !995
  store i32 %add, i32* %u32Temp1, align 4, !dbg !996
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !997
  store i32 %9, i32* %retval, align 4, !dbg !998
  br label %return, !dbg !998

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !999
  ret i32 %10, !dbg !999
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1000 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1003, metadata !DIExpression()), !dbg !1004
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1005, metadata !DIExpression()), !dbg !1006
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1007, metadata !DIExpression()), !dbg !1008
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1009, metadata !DIExpression()), !dbg !1010
  store i32 0, i32* %s32Temp1, align 4, !dbg !1010
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1011, metadata !DIExpression()), !dbg !1012
  store i32 0, i32* %s32Temp2, align 4, !dbg !1012
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1013, metadata !DIExpression()), !dbg !1014
  store i32 0, i32* %s32Temp3, align 4, !dbg !1014
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1015
  %conv = sext i16 %0 to i32, !dbg !1015
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1016
  %conv1 = sext i16 %1 to i32, !dbg !1016
  %mul = mul nsw i32 %conv, %conv1, !dbg !1017
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1018
  %2 = load i16, i16* %div.addr, align 2, !dbg !1019
  %conv2 = sext i16 %2 to i32, !dbg !1019
  %cmp = icmp eq i32 %conv2, 0, !dbg !1021
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1022

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1023
  %cmp4 = icmp slt i32 %3, 0, !dbg !1026
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1027

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1028
  br label %return, !dbg !1028

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1030
  br label %return, !dbg !1030

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1032
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1034
  %6 = load i16, i16* %div.addr, align 2, !dbg !1035
  %conv8 = sext i16 %6 to i32, !dbg !1035
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1036
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1036
  %div9 = sdiv i32 %5, %conv8, !dbg !1036, !klee.check.div !101
  %7 = load i16, i16* %div.addr, align 2, !dbg !1037
  %conv10 = sext i16 %7 to i32, !dbg !1037
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1038
  %sub = sub nsw i32 %4, %mul11, !dbg !1039
  %shl = shl i32 %sub, 1, !dbg !1040
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1041
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1042
  %9 = load i16, i16* %div.addr, align 2, !dbg !1043
  %conv12 = sext i16 %9 to i32, !dbg !1043
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1044
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1044
  %div13 = sdiv i32 %8, %conv12, !dbg !1044, !klee.check.div !101
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1045
  %11 = load i16, i16* %div.addr, align 2, !dbg !1046
  %conv14 = sext i16 %11 to i32, !dbg !1046
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1047
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1047
  %div15 = sdiv i32 %10, %conv14, !dbg !1047, !klee.check.div !101
  %add = add nsw i32 %div13, %div15, !dbg !1048
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1049
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1050
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1052
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1053

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1054
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1057
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1058

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1059
  %conv22 = trunc i32 %14 to i16, !dbg !1061
  store i16 %conv22, i16* %retval, align 2, !dbg !1062
  br label %return, !dbg !1062

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1063
  br label %return, !dbg !1063

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1065
  br label %return, !dbg !1065

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1067
  ret i16 %15, !dbg !1067
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1068 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1071, metadata !DIExpression()), !dbg !1072
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1073, metadata !DIExpression()), !dbg !1074
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1075, metadata !DIExpression()), !dbg !1076
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1077, metadata !DIExpression()), !dbg !1078
  store i32 0, i32* %s32Result, align 4, !dbg !1078
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1079, metadata !DIExpression()), !dbg !1080
  store i32 0, i32* %s32Temp1, align 4, !dbg !1080
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1081
  %conv = sext i16 %0 to i32, !dbg !1081
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1082
  %conv1 = sext i16 %1 to i32, !dbg !1082
  %mul = mul nsw i32 %conv, %conv1, !dbg !1083
  store i32 %mul, i32* %s32Result, align 4, !dbg !1084
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1085
  %conv2 = zext i16 %2 to i32, !dbg !1085
  %cmp = icmp eq i32 %conv2, 0, !dbg !1087
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1088

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1089
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1092
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1093

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1094
  br label %return, !dbg !1094

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1096
  %cmp7 = icmp eq i32 %4, 0, !dbg !1098
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1099

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1100
  br label %return, !dbg !1100

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1102
  br label %return, !dbg !1102

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1104
  %6 = load i32, i32* %s32Result, align 4, !dbg !1106
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1107
  %conv12 = zext i16 %7 to i32, !dbg !1107
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1108
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1108
  %div = sdiv i32 %6, %conv12, !dbg !1108, !klee.check.div !101
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1109
  %conv13 = zext i16 %8 to i32, !dbg !1109
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1110
  %sub = sub nsw i32 %5, %mul14, !dbg !1111
  %shl = shl i32 %sub, 1, !dbg !1112
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1113
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1114
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1115
  %conv15 = zext i16 %10 to i32, !dbg !1115
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1116
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1116
  %div16 = sdiv i32 %9, %conv15, !dbg !1116, !klee.check.div !101
  %11 = load i32, i32* %s32Result, align 4, !dbg !1117
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1118
  %conv17 = zext i16 %12 to i32, !dbg !1118
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1119
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1119
  %div18 = sdiv i32 %11, %conv17, !dbg !1119, !klee.check.div !101
  %add = add nsw i32 %div16, %div18, !dbg !1120
  store i32 %add, i32* %s32Result, align 4, !dbg !1121
  %13 = load i32, i32* %s32Result, align 4, !dbg !1122
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1124
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1125

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1126
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1129
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1130

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1131
  %conv25 = trunc i32 %15 to i16, !dbg !1133
  store i16 %conv25, i16* %retval, align 2, !dbg !1134
  br label %return, !dbg !1134

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1135
  br label %return, !dbg !1135

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1137
  br label %return, !dbg !1137

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1139
  ret i16 %16, !dbg !1139
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1140 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1143, metadata !DIExpression()), !dbg !1144
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1145, metadata !DIExpression()), !dbg !1146
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1147, metadata !DIExpression()), !dbg !1148
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1149
  %cmp = icmp eq i32 %0, 0, !dbg !1151
  br i1 %cmp, label %if.then, label %if.else, !dbg !1152

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1153
  br label %return, !dbg !1153

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1155
  %cmp1 = icmp sle i32 %1, 0, !dbg !1158
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1159

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1160
  br label %return, !dbg !1160

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1162
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1164
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1165
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1166
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1166
  %div = udiv i32 %3, %4, !dbg !1166, !klee.check.div !101
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1167
  %mul = mul i32 %div, %5, !dbg !1168
  %sub = sub i32 %2, %mul, !dbg !1169
  %shl = shl i32 %sub, 1, !dbg !1170
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1171
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1172
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1173
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1174
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1174
  %div4 = udiv i32 %6, %7, !dbg !1174, !klee.check.div !101
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1175
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1176
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1177
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1177
  %div5 = udiv i32 %8, %9, !dbg !1177, !klee.check.div !101
  %add = add i32 %div4, %div5, !dbg !1178
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1179
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1180
  store i32 %10, i32* %retval, align 4, !dbg !1181
  br label %return, !dbg !1181

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1182
  ret i32 %11, !dbg !1182
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1183 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1186, metadata !DIExpression()), !dbg !1187
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1188, metadata !DIExpression()), !dbg !1189
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1190, metadata !DIExpression()), !dbg !1191
  store i32 0, i32* %s32Temp1, align 4, !dbg !1191
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1192
  %cmp = icmp eq i32 %0, 0, !dbg !1194
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1195

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1196
  %cmp1 = icmp sge i32 %1, 0, !dbg !1199
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1200

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1201
  br label %return, !dbg !1201

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1203
  br label %return, !dbg !1203

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1205
  %cmp4 = icmp sge i32 %2, 0, !dbg !1208
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1209

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1210
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1212
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1213
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1214
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1214
  %div = udiv i32 %4, %5, !dbg !1214, !klee.check.div !101
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1215
  %mul = mul i32 %div, %6, !dbg !1216
  %sub = sub i32 %3, %mul, !dbg !1217
  %shl = shl i32 %sub, 1, !dbg !1218
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1219
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1220
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1221
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1222
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1222
  %div6 = udiv i32 %7, %8, !dbg !1222, !klee.check.div !101
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1223
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1224
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1225
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1225
  %div7 = udiv i32 %9, %10, !dbg !1225, !klee.check.div !101
  %add = add i32 %div6, %div7, !dbg !1226
  store i32 %add, i32* %retval, align 4, !dbg !1227
  br label %return, !dbg !1227

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1228
  br label %return, !dbg !1228

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1230
  ret i32 %11, !dbg !1230
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1231 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1234, metadata !DIExpression()), !dbg !1235
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1236, metadata !DIExpression()), !dbg !1237
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1238, metadata !DIExpression()), !dbg !1239
  store i32 0, i32* %u32Temp1, align 4, !dbg !1239
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1240, metadata !DIExpression()), !dbg !1241
  store i32 0, i32* %u32Temp2, align 4, !dbg !1241
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1242
  %cmp = icmp eq i32 %0, 0, !dbg !1244
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1245

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1246
  %cmp1 = icmp slt i32 %1, 0, !dbg !1249
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1250

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1251
  br label %return, !dbg !1251

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1253
  br label %return, !dbg !1253

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1255
  %cmp4 = icmp sge i32 %2, 0, !dbg !1258
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1259

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1260
  %cmp6 = icmp eq i32 %3, 0, !dbg !1263
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1264

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1265
  br label %return, !dbg !1265

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1267
  %cmp9 = icmp sle i32 %4, 0, !dbg !1270
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1271

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1272
  br label %return, !dbg !1272

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1274
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1276
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1277
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1278
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1278
  %div = sdiv i32 %6, %7, !dbg !1278, !klee.check.div !101
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1279
  %mul = mul nsw i32 %div, %8, !dbg !1280
  %sub = sub nsw i32 %5, %mul, !dbg !1281
  %shl = shl i32 %sub, 1, !dbg !1282
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1283
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1284
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1285
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1286
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1286
  %div12 = udiv i32 %9, %10, !dbg !1286, !klee.check.div !101
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1287
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1288
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1289
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1289
  %div13 = sdiv i32 %11, %12, !dbg !1289, !klee.check.div !101
  %add = add i32 %div12, %div13, !dbg !1290
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1291
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1292
  store i32 %13, i32* %retval, align 4, !dbg !1293
  br label %return, !dbg !1293

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1294
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1297
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1298

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1299
  br label %return, !dbg !1299

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1301
  %sub18 = sub nsw i32 0, %15, !dbg !1303
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1304
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1305
  %sub19 = sub nsw i32 0, %16, !dbg !1306
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1307
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1308
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1309
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1310
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1311
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1311
  %div20 = sdiv i32 %18, %19, !dbg !1311, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1312
  %mul21 = mul nsw i32 %div20, %20, !dbg !1313
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1314
  %shl23 = shl i32 %sub22, 1, !dbg !1315
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1316
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1317
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1318
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1319
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1319
  %div24 = udiv i32 %21, %22, !dbg !1319, !klee.check.div !101
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1320
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1321
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1322
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1322
  %div25 = sdiv i32 %23, %24, !dbg !1322, !klee.check.div !101
  %add26 = add i32 %div24, %div25, !dbg !1323
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1324
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1325
  store i32 %25, i32* %retval, align 4, !dbg !1326
  br label %return, !dbg !1326

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1327
  ret i32 %26, !dbg !1327
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1328 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1331, metadata !DIExpression()), !dbg !1332
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1333, metadata !DIExpression()), !dbg !1334
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1335, metadata !DIExpression()), !dbg !1336
  store i32 0, i32* %u32Temp1, align 4, !dbg !1336
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1337, metadata !DIExpression()), !dbg !1338
  store i32 0, i32* %u32Temp2, align 4, !dbg !1338
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1339, metadata !DIExpression()), !dbg !1340
  store i32 0, i32* %u32Temp3, align 4, !dbg !1340
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1341, metadata !DIExpression()), !dbg !1342
  store i32 0, i32* %numerator_old, align 4, !dbg !1342
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1343
  %cmp = icmp eq i32 %0, 0, !dbg !1345
  br i1 %cmp, label %if.then, label %if.else, !dbg !1346

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1347
  br label %return, !dbg !1347

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1349
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1351
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1352
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1353
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1354
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1354
  %div = udiv i32 %3, %4, !dbg !1354, !klee.check.div !101
  %mul = mul i32 %2, %div, !dbg !1355
  %sub = sub i32 %1, %mul, !dbg !1356
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1357
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1358
  %and = and i32 %5, 1, !dbg !1360
  %cmp1 = icmp eq i32 %and, 0, !dbg !1361
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1362

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1363
  %shr = lshr i32 %6, 1, !dbg !1365
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1366
  br label %if.end, !dbg !1367

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1368
  %shr4 = lshr i32 %7, 1, !dbg !1370
  %add = add i32 %shr4, 1, !dbg !1371
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1372
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1373
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1375
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1376
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1377

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1378
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1380
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1381
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1381
  %div7 = udiv i32 %10, %11, !dbg !1381, !klee.check.div !101
  store i32 %div7, i32* %retval, align 4, !dbg !1382
  br label %return, !dbg !1382

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1383
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1385
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1386
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1386
  %div9 = udiv i32 %12, %13, !dbg !1386, !klee.check.div !101
  %add10 = add i32 %div9, 1, !dbg !1387
  store i32 %add10, i32* %retval, align 4, !dbg !1388
  br label %return, !dbg !1388

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1389
  ret i32 %14, !dbg !1389
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1390 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1393, metadata !DIExpression()), !dbg !1394
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1395, metadata !DIExpression()), !dbg !1396
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1397, metadata !DIExpression()), !dbg !1398
  store i32 0, i32* %u32Temp1, align 4, !dbg !1398
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1399, metadata !DIExpression()), !dbg !1400
  store i32 0, i32* %u32Temp2, align 4, !dbg !1400
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1401
  %cmp = icmp sle i32 %0, 0, !dbg !1403
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1404

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1405
  %cmp1 = icmp sge i32 %1, 0, !dbg !1408
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1409

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1410
  br label %return, !dbg !1410

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1412
  %sub = sub nsw i32 0, %2, !dbg !1414
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1415
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1416
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1417
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1418
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1419
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1419
  %div = udiv i32 %4, %5, !dbg !1419, !klee.check.div !101
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1420
  %mul = mul i32 %div, %6, !dbg !1421
  %sub3 = sub i32 %3, %mul, !dbg !1422
  %shl = shl i32 %sub3, 1, !dbg !1423
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1424
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1425
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1426
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1427
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1427
  %div4 = udiv i32 %7, %8, !dbg !1427, !klee.check.div !101
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1428
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1429
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1430
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1430
  %div5 = udiv i32 %9, %10, !dbg !1430, !klee.check.div !101
  %add = add i32 %div4, %div5, !dbg !1431
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1432
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1433
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1435
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1436

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1437
  %sub8 = sub i32 0, %12, !dbg !1439
  store i32 %sub8, i32* %retval, align 4, !dbg !1440
  br label %return, !dbg !1440

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1441
  br label %return, !dbg !1441

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1443
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1445
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1446
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1447
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1447
  %div11 = udiv i32 %14, %15, !dbg !1447, !klee.check.div !101
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1448
  %mul12 = mul i32 %div11, %16, !dbg !1449
  %sub13 = sub i32 %13, %mul12, !dbg !1450
  %shl14 = shl i32 %sub13, 1, !dbg !1451
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1452
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1453
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1454
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1455
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1455
  %div15 = udiv i32 %17, %18, !dbg !1455, !klee.check.div !101
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1456
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1457
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1458
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1458
  %div16 = udiv i32 %19, %20, !dbg !1458, !klee.check.div !101
  %add17 = add i32 %div15, %div16, !dbg !1459
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1460
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1461
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1463
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1464

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1465
  store i32 %22, i32* %retval, align 4, !dbg !1467
  br label %return, !dbg !1467

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1468
  br label %return, !dbg !1468

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1470
  ret i32 %23, !dbg !1470
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1471 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1474, metadata !DIExpression()), !dbg !1475
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1476, metadata !DIExpression()), !dbg !1477
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1478, metadata !DIExpression()), !dbg !1479
  store i32 0, i32* %s32Temp1, align 4, !dbg !1479
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1480, metadata !DIExpression()), !dbg !1481
  store i32 0, i32* %s32Temp2, align 4, !dbg !1481
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1482, metadata !DIExpression()), !dbg !1483
  store i32 0, i32* %u32Temp0, align 4, !dbg !1483
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1484, metadata !DIExpression()), !dbg !1485
  store i32 0, i32* %u32Temp1, align 4, !dbg !1485
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1486, metadata !DIExpression()), !dbg !1487
  store i32 0, i32* %u32Temp2, align 4, !dbg !1487
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1488
  %cmp = icmp eq i32 %0, 0, !dbg !1490
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1491

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1492
  %cmp1 = icmp slt i32 %1, 0, !dbg !1495
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1496

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1497
  br label %return, !dbg !1497

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1499
  br label %return, !dbg !1499

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1501
  %cmp4 = icmp sle i32 %2, 0, !dbg !1504
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1505

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1506
  %sub = sub nsw i32 0, %3, !dbg !1508
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1509
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1510
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1511
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1512
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1512
  %div = udiv i32 %4, %5, !dbg !1512, !klee.check.div !101
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1513
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1514
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1515
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1516
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1517
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1517
  %div6 = udiv i32 %7, %8, !dbg !1517, !klee.check.div !101
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1518
  %mul = mul i32 %div6, %9, !dbg !1519
  %sub7 = sub i32 %6, %mul, !dbg !1520
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1521
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1522
  %and = and i32 %10, 1, !dbg !1524
  %cmp8 = icmp eq i32 %and, 0, !dbg !1525
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1526

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1527
  %shr = lshr i32 %11, 1, !dbg !1529
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1530
  br label %if.end, !dbg !1531

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1532
  %shr11 = lshr i32 %12, 1, !dbg !1534
  %add = add i32 %shr11, 1, !dbg !1535
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1536
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1537
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1539
  %cmp12 = icmp ult i32 %13, %14, !dbg !1540
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1541

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1542
  %neg = xor i32 %15, -1, !dbg !1544
  %add14 = add i32 %neg, 1, !dbg !1545
  store i32 %add14, i32* %retval, align 4, !dbg !1546
  br label %return, !dbg !1546

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1547
  %add16 = add i32 %16, 1, !dbg !1549
  %neg17 = xor i32 %add16, -1, !dbg !1550
  %add18 = add i32 %neg17, 1, !dbg !1551
  store i32 %add18, i32* %retval, align 4, !dbg !1552
  br label %return, !dbg !1552

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1553
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1555
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1556
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1557
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1557
  %div20 = udiv i32 %18, %19, !dbg !1557, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1558
  %mul21 = mul i32 %div20, %20, !dbg !1559
  %sub22 = sub i32 %17, %mul21, !dbg !1560
  %shl = shl i32 %sub22, 1, !dbg !1561
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1562
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1563
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1564
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1565
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1565
  %div23 = udiv i32 %21, %22, !dbg !1565, !klee.check.div !101
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1566
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1567
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1568
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1568
  %div24 = udiv i32 %23, %24, !dbg !1568, !klee.check.div !101
  %add25 = add i32 %div23, %div24, !dbg !1569
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1570
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1571
  store i32 %25, i32* %retval, align 4, !dbg !1572
  br label %return, !dbg !1572

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1573
  ret i32 %26, !dbg !1573
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1574 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1577, metadata !DIExpression()), !dbg !1578
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1579, metadata !DIExpression()), !dbg !1580
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1581, metadata !DIExpression()), !dbg !1582
  store i32 0, i32* %s32Temp1, align 4, !dbg !1582
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1583, metadata !DIExpression()), !dbg !1584
  store i32 0, i32* %s32Temp2, align 4, !dbg !1584
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1585, metadata !DIExpression()), !dbg !1586
  store i32 0, i32* %denominator_prime, align 4, !dbg !1586
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1587, metadata !DIExpression()), !dbg !1588
  store i32 0, i32* %u32Temp1, align 4, !dbg !1588
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1589, metadata !DIExpression()), !dbg !1590
  store i32 0, i32* %u32Temp2, align 4, !dbg !1590
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1591, metadata !DIExpression()), !dbg !1592
  store i32 0, i32* %u32numerator, align 4, !dbg !1592
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1593, metadata !DIExpression()), !dbg !1594
  store i32 0, i32* %u32denominator, align 4, !dbg !1594
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1595
  %cmp = icmp slt i32 %0, 0, !dbg !1597
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1598

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1599
  %cmp1 = icmp sle i32 %1, 0, !dbg !1602
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1603

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1604
  %cmp3 = icmp sge i32 %2, 0, !dbg !1607
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1608

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1609
  br label %return, !dbg !1609

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1611
  %sub = sub nsw i32 0, %3, !dbg !1613
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1614
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1615
  %sub5 = sub nsw i32 0, %4, !dbg !1616
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1617
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1618
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1619
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1620
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1621
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1621
  %div = udiv i32 %6, %7, !dbg !1621, !klee.check.div !101
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1622
  %mul = mul i32 %div, %8, !dbg !1623
  %sub6 = sub i32 %5, %mul, !dbg !1624
  %shl = shl i32 %sub6, 1, !dbg !1625
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1626
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1627
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1628
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1629
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1629
  %div7 = udiv i32 %9, %10, !dbg !1629, !klee.check.div !101
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1630
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1631
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1632
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1632
  %div8 = udiv i32 %11, %12, !dbg !1632, !klee.check.div !101
  %add = add i32 %div7, %div8, !dbg !1633
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1634
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1635
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1637
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1638

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1639
  store i32 %14, i32* %retval, align 4, !dbg !1641
  br label %return, !dbg !1641

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1642
  br label %return, !dbg !1642

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1644
  %neg = xor i32 %15, -1, !dbg !1646
  %add13 = add nsw i32 %neg, 1, !dbg !1647
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1648
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1649
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1650
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1651
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1652
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1652
  %div14 = udiv i32 %17, %18, !dbg !1652, !klee.check.div !101
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1653
  %mul15 = mul i32 %div14, %19, !dbg !1654
  %sub16 = sub i32 %16, %mul15, !dbg !1655
  %shl17 = shl i32 %sub16, 1, !dbg !1656
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1657
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1658
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1659
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1660
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1660
  %div18 = udiv i32 %20, %21, !dbg !1660, !klee.check.div !101
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1661
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1662
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1663
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1663
  %div19 = sdiv i32 %22, %23, !dbg !1663, !klee.check.div !101
  %add20 = add i32 %div18, %div19, !dbg !1664
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1665
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1666
  %neg21 = xor i32 %24, -1, !dbg !1667
  %add22 = add nsw i32 %neg21, 1, !dbg !1668
  store i32 %add22, i32* %retval, align 4, !dbg !1669
  br label %return, !dbg !1669

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1670
  %cmp24 = icmp sle i32 %25, 0, !dbg !1673
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1674

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1675
  %cmp26 = icmp sge i32 %26, 0, !dbg !1678
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1679

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1680
  br label %return, !dbg !1680

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1682
  %neg29 = xor i32 %27, -1, !dbg !1684
  %add30 = add nsw i32 %neg29, 1, !dbg !1685
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1686
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1687
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1688
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1689
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1690
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1690
  %div31 = udiv i32 %29, %30, !dbg !1690, !klee.check.div !101
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1691
  %mul32 = mul i32 %div31, %31, !dbg !1692
  %sub33 = sub i32 %28, %mul32, !dbg !1693
  %shl34 = shl i32 %sub33, 1, !dbg !1694
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1695
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1696
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1697
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1698
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1698
  %div35 = udiv i32 %32, %33, !dbg !1698, !klee.check.div !101
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1699
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1700
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1701
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1701
  %div36 = udiv i32 %34, %35, !dbg !1701, !klee.check.div !101
  %add37 = add i32 %div35, %div36, !dbg !1702
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1703
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1704
  %neg38 = xor i32 %36, -1, !dbg !1705
  %add39 = add nsw i32 %neg38, 1, !dbg !1706
  store i32 %add39, i32* %retval, align 4, !dbg !1707
  br label %return, !dbg !1707

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1708
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1710
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1711
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1712
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1712
  %div41 = sdiv i32 %38, %39, !dbg !1712, !klee.check.div !101
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1713
  %mul42 = mul nsw i32 %div41, %40, !dbg !1714
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1715
  %shl44 = shl i32 %sub43, 1, !dbg !1716
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1717
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1718
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1719
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1720
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1720
  %div45 = sdiv i32 %41, %42, !dbg !1720, !klee.check.div !101
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1721
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1722
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1723
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1723
  %div46 = udiv i32 %43, %44, !dbg !1723, !klee.check.div !101
  %add47 = add i32 %div45, %div46, !dbg !1724
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1725
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1726
  store i32 %45, i32* %retval, align 4, !dbg !1727
  br label %return, !dbg !1727

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1728
  ret i32 %46, !dbg !1728
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1729 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1732, metadata !DIExpression()), !dbg !1733
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1734, metadata !DIExpression()), !dbg !1735
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1736, metadata !DIExpression()), !dbg !1737
  store i32 0, i32* %numerator_prime, align 4, !dbg !1737
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1738, metadata !DIExpression()), !dbg !1739
  store i32 0, i32* %u32Temp1, align 4, !dbg !1739
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1740, metadata !DIExpression()), !dbg !1741
  store i32 0, i32* %u32Temp2, align 4, !dbg !1741
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1742, metadata !DIExpression()), !dbg !1743
  store i32 0, i32* %u32Temp3, align 4, !dbg !1743
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1744, metadata !DIExpression()), !dbg !1745
  store i32 0, i32* %s32Temp1, align 4, !dbg !1745
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1746, metadata !DIExpression()), !dbg !1747
  store i32 0, i32* %s32Temp2, align 4, !dbg !1747
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1748, metadata !DIExpression()), !dbg !1749
  store i32 0, i32* %s32Temp3, align 4, !dbg !1749
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1750
  %cmp = icmp eq i32 %0, 0, !dbg !1752
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1753

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1754
  %cmp1 = icmp slt i32 %1, 0, !dbg !1757
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1758

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1759
  br label %return, !dbg !1759

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1761
  br label %return, !dbg !1761

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1763
  %cmp4 = icmp slt i32 %2, 0, !dbg !1766
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1767

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1768
  %sub = sub nsw i32 0, %3, !dbg !1770
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1771
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1772
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1773
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1774
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1774
  %div = udiv i32 %4, %5, !dbg !1774, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1775
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1776
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1777
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1778
  %mul = mul i32 %7, %8, !dbg !1779
  %sub6 = sub i32 %6, %mul, !dbg !1780
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1781
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1782
  %and = and i32 %9, 1, !dbg !1784
  %cmp7 = icmp eq i32 %and, 0, !dbg !1785
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1786

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1787
  %shr = lshr i32 %10, 1, !dbg !1789
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1790
  br label %if.end, !dbg !1791

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1792
  %shr10 = lshr i32 %11, 1, !dbg !1794
  %add = add i32 %shr10, 1, !dbg !1795
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1796
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1797
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1799
  %cmp11 = icmp ult i32 %12, %13, !dbg !1800
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1801

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1802
  %neg = xor i32 %14, -1, !dbg !1804
  %add13 = add i32 %neg, 1, !dbg !1805
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1806
  br label %if.end18, !dbg !1807

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1808
  %add15 = add i32 %15, 1, !dbg !1810
  %neg16 = xor i32 %add15, -1, !dbg !1811
  %add17 = add i32 %neg16, 1, !dbg !1812
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1813
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1814
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1816
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1817

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1818
  %conv = trunc i32 %17 to i16, !dbg !1820
  store i16 %conv, i16* %retval, align 2, !dbg !1821
  br label %return, !dbg !1821

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1822
  br label %return, !dbg !1822

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1824
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1826
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1827
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1827
  %div23 = udiv i32 %18, %19, !dbg !1827, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1828
  %mul24 = mul i32 %div23, %20, !dbg !1829
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1830
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1831
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1832
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1833
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1834
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1834
  %div25 = udiv i32 %22, %23, !dbg !1834, !klee.check.div !101
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1835
  %mul26 = mul i32 %div25, %24, !dbg !1836
  %sub27 = sub i32 %21, %mul26, !dbg !1837
  %shl = shl i32 %sub27, 1, !dbg !1838
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1839
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1840
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1841
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1842
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1842
  %div28 = udiv i32 %25, %26, !dbg !1842, !klee.check.div !101
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1843
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1844
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1845
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1845
  %div29 = udiv i32 %27, %28, !dbg !1845, !klee.check.div !101
  %add30 = add i32 %div28, %div29, !dbg !1846
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1847
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1848
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1850
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1851

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1852
  %conv34 = trunc i32 %30 to i16, !dbg !1854
  store i16 %conv34, i16* %retval, align 2, !dbg !1855
  br label %return, !dbg !1855

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1856
  br label %return, !dbg !1856

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1858
  ret i16 %31, !dbg !1858
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1859 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1865, metadata !DIExpression()), !dbg !1866
  %2 = icmp eq i64 %0, 0, !dbg !1867
  br i1 %2, label %3, label %4, !dbg !1869

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1870
  unreachable, !dbg !1870

4:                                                ; preds = %1
  ret void, !dbg !1871
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

!llvm.dbg.cu = !{!28, !2, !30}
!llvm.ident = !{!32, !32, !33}
!llvm.module.flags = !{!34, !35, !36, !37, !38}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !26, line: 21, type: !27, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !25, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0023/div_Ccode_alarm_0023.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0023")
!4 = !{}
!5 = !{!6, !13, !16, !21}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0023")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !9, line: 25, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !11, line: 39, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!12 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !9, line: 27, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 44, baseType: !15)
!15 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !7, line: 6, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !18, line: 24, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !11, line: 38, baseType: !20)
!20 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !7, line: 8, baseType: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !18, line: 25, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 40, baseType: !24)
!24 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!25 = !{!0}
!26 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0023")
!27 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!28 = distinct !DICompileUnit(language: DW_LANG_C99, file: !29, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!29 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0023/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0023")
!30 = distinct !DICompileUnit(language: DW_LANG_C89, file: !31, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!31 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!32 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!33 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!34 = !{i32 7, !"Dwarf Version", i32 4}
!35 = !{i32 2, !"Debug Info Version", i32 3}
!36 = !{i32 1, !"wchar_size", i32 4}
!37 = !{i32 7, !"uwtable", i32 1}
!38 = !{i32 7, !"frame-pointer", i32 2}
!39 = distinct !DISubprogram(name: "main", scope: !40, file: !40, line: 7, type: !41, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !4)
!40 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0023")
!41 = !DISubroutineType(types: !42)
!42 = !{!43}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DILocalVariable(name: "numerator", scope: !39, file: !40, line: 9, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !43)
!47 = !DILocation(line: 9, column: 13, scope: !39)
!48 = !DILocalVariable(name: "denominator", scope: !39, file: !40, line: 10, type: !8)
!49 = !DILocation(line: 10, column: 13, scope: !39)
!50 = !DILocalVariable(name: "result", scope: !39, file: !40, line: 11, type: !8)
!51 = !DILocation(line: 11, column: 13, scope: !39)
!52 = !DILocation(line: 13, column: 24, scope: !39)
!53 = !DILocation(line: 13, column: 5, scope: !39)
!54 = !DILocation(line: 14, column: 24, scope: !39)
!55 = !DILocation(line: 14, column: 5, scope: !39)
!56 = !DILocation(line: 16, column: 30, scope: !39)
!57 = !DILocation(line: 16, column: 41, scope: !39)
!58 = !DILocation(line: 16, column: 14, scope: !39)
!59 = !DILocation(line: 16, column: 12, scope: !39)
!60 = !DILocation(line: 18, column: 11, scope: !39)
!61 = !DILocation(line: 19, column: 5, scope: !39)
!62 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !63, file: !63, line: 170, type: !64, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_s16/alarm_0023")
!64 = !DISubroutineType(types: !65)
!65 = !{!6, !6, !6}
!66 = !DILocalVariable(name: "numerator", arg: 1, scope: !62, file: !63, line: 170, type: !6)
!67 = !DILocation(line: 170, column: 31, scope: !62)
!68 = !DILocalVariable(name: "denominator", arg: 2, scope: !62, file: !63, line: 170, type: !6)
!69 = !DILocation(line: 170, column: 47, scope: !62)
!70 = !DILocalVariable(name: "s32Temp1", scope: !62, file: !63, line: 172, type: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !45)
!72 = !DILocation(line: 172, column: 6, scope: !62)
!73 = !DILocalVariable(name: "s32Temp2", scope: !62, file: !63, line: 172, type: !71)
!74 = !DILocation(line: 172, column: 15, scope: !62)
!75 = !DILocation(line: 173, column: 13, scope: !62)
!76 = !DILocation(line: 173, column: 22, scope: !62)
!77 = !DILocation(line: 173, column: 11, scope: !62)
!78 = !DILocation(line: 175, column: 6, scope: !79)
!79 = distinct !DILexicalBlock(scope: !62, file: !63, line: 175, column: 6)
!80 = !DILocation(line: 175, column: 18, scope: !79)
!81 = !DILocation(line: 175, column: 6, scope: !62)
!82 = !DILocation(line: 177, column: 7, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !63, line: 177, column: 7)
!84 = distinct !DILexicalBlock(scope: !79, file: !63, line: 176, column: 2)
!85 = !DILocation(line: 177, column: 17, scope: !83)
!86 = !DILocation(line: 177, column: 7, scope: !84)
!87 = !DILocation(line: 179, column: 4, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !63, line: 178, column: 3)
!89 = !DILocation(line: 183, column: 4, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !63, line: 182, column: 3)
!91 = !DILocation(line: 188, column: 7, scope: !92)
!92 = distinct !DILexicalBlock(scope: !93, file: !63, line: 188, column: 7)
!93 = distinct !DILexicalBlock(scope: !79, file: !63, line: 187, column: 2)
!94 = !DILocation(line: 188, column: 16, scope: !92)
!95 = !DILocation(line: 188, column: 7, scope: !93)
!96 = !DILocation(line: 190, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !63, line: 189, column: 3)
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
!119 = distinct !DILexicalBlock(scope: !97, file: !63, line: 193, column: 7)
!120 = !DILocation(line: 193, column: 16, scope: !119)
!121 = !DILocation(line: 193, column: 7, scope: !97)
!122 = !DILocation(line: 195, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !124, file: !63, line: 195, column: 8)
!124 = distinct !DILexicalBlock(scope: !119, file: !63, line: 194, column: 4)
!125 = !DILocation(line: 195, column: 17, scope: !123)
!126 = !DILocation(line: 195, column: 8, scope: !124)
!127 = !DILocation(line: 197, column: 18, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !63, line: 196, column: 5)
!129 = !DILocation(line: 197, column: 13, scope: !128)
!130 = !DILocation(line: 197, column: 6, scope: !128)
!131 = !DILocation(line: 201, column: 6, scope: !132)
!132 = distinct !DILexicalBlock(scope: !123, file: !63, line: 200, column: 5)
!133 = !DILocation(line: 206, column: 5, scope: !134)
!134 = distinct !DILexicalBlock(scope: !119, file: !63, line: 205, column: 4)
!135 = !DILocation(line: 211, column: 7, scope: !136)
!136 = distinct !DILexicalBlock(scope: !137, file: !63, line: 211, column: 7)
!137 = distinct !DILexicalBlock(scope: !92, file: !63, line: 210, column: 3)
!138 = !DILocation(line: 211, column: 19, scope: !136)
!139 = !DILocation(line: 211, column: 7, scope: !137)
!140 = !DILocation(line: 213, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !63, line: 212, column: 4)
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
!162 = distinct !DILexicalBlock(scope: !141, file: !63, line: 216, column: 8)
!163 = !DILocation(line: 216, column: 17, scope: !162)
!164 = !DILocation(line: 216, column: 8, scope: !141)
!165 = !DILocation(line: 218, column: 9, scope: !166)
!166 = distinct !DILexicalBlock(scope: !167, file: !63, line: 218, column: 9)
!167 = distinct !DILexicalBlock(scope: !162, file: !63, line: 217, column: 5)
!168 = !DILocation(line: 218, column: 18, scope: !166)
!169 = !DILocation(line: 218, column: 9, scope: !167)
!170 = !DILocation(line: 220, column: 19, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !63, line: 219, column: 6)
!172 = !DILocation(line: 220, column: 14, scope: !171)
!173 = !DILocation(line: 220, column: 7, scope: !171)
!174 = !DILocation(line: 224, column: 7, scope: !175)
!175 = distinct !DILexicalBlock(scope: !166, file: !63, line: 223, column: 6)
!176 = !DILocation(line: 229, column: 6, scope: !177)
!177 = distinct !DILexicalBlock(scope: !162, file: !63, line: 228, column: 5)
!178 = !DILocation(line: 234, column: 5, scope: !179)
!179 = distinct !DILexicalBlock(scope: !136, file: !63, line: 233, column: 4)
!180 = !DILocation(line: 238, column: 1, scope: !62)
!181 = distinct !DISubprogram(name: "s16_div_s32_s16", scope: !63, file: !63, line: 255, type: !182, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!182 = !DISubroutineType(types: !183)
!183 = !{!6, !71, !6}
!184 = !DILocalVariable(name: "numerator", arg: 1, scope: !181, file: !63, line: 255, type: !71)
!185 = !DILocation(line: 255, column: 25, scope: !181)
!186 = !DILocalVariable(name: "denominator", arg: 2, scope: !181, file: !63, line: 255, type: !6)
!187 = !DILocation(line: 255, column: 41, scope: !181)
!188 = !DILocalVariable(name: "s32Temp1", scope: !181, file: !63, line: 257, type: !71)
!189 = !DILocation(line: 257, column: 6, scope: !181)
!190 = !DILocalVariable(name: "s32Temp2", scope: !181, file: !63, line: 257, type: !71)
!191 = !DILocation(line: 257, column: 17, scope: !181)
!192 = !DILocation(line: 258, column: 13, scope: !181)
!193 = !DILocation(line: 258, column: 11, scope: !181)
!194 = !DILocation(line: 259, column: 5, scope: !195)
!195 = distinct !DILexicalBlock(scope: !181, file: !63, line: 259, column: 5)
!196 = !DILocation(line: 259, column: 17, scope: !195)
!197 = !DILocation(line: 259, column: 5, scope: !181)
!198 = !DILocation(line: 261, column: 7, scope: !199)
!199 = distinct !DILexicalBlock(scope: !200, file: !63, line: 261, column: 7)
!200 = distinct !DILexicalBlock(scope: !195, file: !63, line: 260, column: 2)
!201 = !DILocation(line: 261, column: 17, scope: !199)
!202 = !DILocation(line: 261, column: 7, scope: !200)
!203 = !DILocation(line: 263, column: 4, scope: !204)
!204 = distinct !DILexicalBlock(scope: !199, file: !63, line: 262, column: 3)
!205 = !DILocation(line: 267, column: 4, scope: !206)
!206 = distinct !DILexicalBlock(scope: !199, file: !63, line: 266, column: 3)
!207 = !DILocation(line: 272, column: 6, scope: !208)
!208 = distinct !DILexicalBlock(scope: !209, file: !63, line: 272, column: 6)
!209 = distinct !DILexicalBlock(scope: !195, file: !63, line: 271, column: 2)
!210 = !DILocation(line: 272, column: 16, scope: !208)
!211 = !DILocation(line: 272, column: 6, scope: !209)
!212 = !DILocation(line: 275, column: 47, scope: !213)
!213 = distinct !DILexicalBlock(scope: !214, file: !63, line: 275, column: 8)
!214 = distinct !DILexicalBlock(scope: !208, file: !63, line: 273, column: 3)
!215 = !DILocation(line: 275, column: 37, scope: !213)
!216 = !DILocation(line: 275, column: 10, scope: !213)
!217 = !DILocation(line: 275, column: 8, scope: !214)
!218 = !DILocation(line: 276, column: 8, scope: !219)
!219 = distinct !DILexicalBlock(scope: !213, file: !63, line: 275, column: 63)
!220 = !DILocation(line: 283, column: 36, scope: !214)
!221 = !DILocation(line: 283, column: 47, scope: !214)
!222 = !DILocation(line: 283, column: 45, scope: !214)
!223 = !DILocation(line: 283, column: 26, scope: !214)
!224 = !DILocation(line: 283, column: 24, scope: !214)
!225 = !DILocation(line: 284, column: 4, scope: !214)
!226 = !DILocation(line: 305, column: 7, scope: !227)
!227 = distinct !DILexicalBlock(scope: !228, file: !63, line: 305, column: 7)
!228 = distinct !DILexicalBlock(scope: !208, file: !63, line: 304, column: 3)
!229 = !DILocation(line: 305, column: 19, scope: !227)
!230 = !DILocation(line: 305, column: 7, scope: !228)
!231 = !DILocation(line: 307, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !227, file: !63, line: 306, column: 4)
!233 = !DILocation(line: 307, column: 29, scope: !232)
!234 = !DILocation(line: 307, column: 38, scope: !232)
!235 = !DILocation(line: 307, column: 37, scope: !232)
!236 = !DILocation(line: 307, column: 53, scope: !232)
!237 = !DILocation(line: 307, column: 51, scope: !232)
!238 = !DILocation(line: 307, column: 26, scope: !232)
!239 = !DILocation(line: 307, column: 66, scope: !232)
!240 = !DILocation(line: 307, column: 14, scope: !232)
!241 = !DILocation(line: 308, column: 16, scope: !232)
!242 = !DILocation(line: 308, column: 25, scope: !232)
!243 = !DILocation(line: 308, column: 24, scope: !232)
!244 = !DILocation(line: 308, column: 14, scope: !232)
!245 = !DILocation(line: 309, column: 16, scope: !232)
!246 = !DILocation(line: 309, column: 28, scope: !232)
!247 = !DILocation(line: 309, column: 39, scope: !232)
!248 = !DILocation(line: 309, column: 38, scope: !232)
!249 = !DILocation(line: 309, column: 25, scope: !232)
!250 = !DILocation(line: 309, column: 14, scope: !232)
!251 = !DILocation(line: 310, column: 8, scope: !252)
!252 = distinct !DILexicalBlock(scope: !232, file: !63, line: 310, column: 8)
!253 = !DILocation(line: 310, column: 17, scope: !252)
!254 = !DILocation(line: 310, column: 8, scope: !232)
!255 = !DILocation(line: 312, column: 9, scope: !256)
!256 = distinct !DILexicalBlock(scope: !257, file: !63, line: 312, column: 9)
!257 = distinct !DILexicalBlock(scope: !252, file: !63, line: 311, column: 5)
!258 = !DILocation(line: 312, column: 18, scope: !256)
!259 = !DILocation(line: 312, column: 9, scope: !257)
!260 = !DILocation(line: 314, column: 19, scope: !261)
!261 = distinct !DILexicalBlock(scope: !256, file: !63, line: 313, column: 6)
!262 = !DILocation(line: 314, column: 14, scope: !261)
!263 = !DILocation(line: 314, column: 7, scope: !261)
!264 = !DILocation(line: 318, column: 7, scope: !265)
!265 = distinct !DILexicalBlock(scope: !256, file: !63, line: 317, column: 6)
!266 = !DILocation(line: 323, column: 6, scope: !267)
!267 = distinct !DILexicalBlock(scope: !252, file: !63, line: 322, column: 5)
!268 = !DILocation(line: 329, column: 5, scope: !269)
!269 = distinct !DILexicalBlock(scope: !227, file: !63, line: 328, column: 4)
!270 = !DILocation(line: 335, column: 1, scope: !181)
!271 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !26, file: !26, line: 24, type: !272, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!272 = !DISubroutineType(types: !273)
!273 = !{!43, !13}
!274 = !DILocalVariable(name: "denominator", arg: 1, scope: !271, file: !26, line: 24, type: !13)
!275 = !DILocation(line: 24, column: 40, scope: !271)
!276 = !DILocation(line: 26, column: 12, scope: !271)
!277 = !DILocation(line: 26, column: 24, scope: !271)
!278 = !DILocation(line: 26, column: 5, scope: !271)
!279 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !63, file: !63, line: 353, type: !280, scopeLine: 354, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!280 = !DISubroutineType(types: !281)
!281 = !{!6, !6, !21}
!282 = !DILocalVariable(name: "numerator", arg: 1, scope: !279, file: !63, line: 353, type: !6)
!283 = !DILocation(line: 353, column: 31, scope: !279)
!284 = !DILocalVariable(name: "denominator", arg: 2, scope: !279, file: !63, line: 353, type: !21)
!285 = !DILocation(line: 353, column: 47, scope: !279)
!286 = !DILocalVariable(name: "u16Temp1", scope: !279, file: !63, line: 355, type: !21)
!287 = !DILocation(line: 355, column: 6, scope: !279)
!288 = !DILocalVariable(name: "s32Temp1", scope: !279, file: !63, line: 356, type: !71)
!289 = !DILocation(line: 356, column: 6, scope: !279)
!290 = !DILocalVariable(name: "s32Temp2", scope: !279, file: !63, line: 356, type: !71)
!291 = !DILocation(line: 356, column: 15, scope: !279)
!292 = !DILocation(line: 357, column: 13, scope: !279)
!293 = !DILocation(line: 357, column: 25, scope: !279)
!294 = !DILocation(line: 357, column: 11, scope: !279)
!295 = !DILocation(line: 358, column: 13, scope: !279)
!296 = !DILocation(line: 358, column: 22, scope: !279)
!297 = !DILocation(line: 358, column: 11, scope: !279)
!298 = !DILocation(line: 359, column: 5, scope: !299)
!299 = distinct !DILexicalBlock(scope: !279, file: !63, line: 359, column: 5)
!300 = !DILocation(line: 359, column: 14, scope: !299)
!301 = !DILocation(line: 359, column: 5, scope: !279)
!302 = !DILocation(line: 361, column: 7, scope: !303)
!303 = distinct !DILexicalBlock(scope: !304, file: !63, line: 361, column: 7)
!304 = distinct !DILexicalBlock(scope: !299, file: !63, line: 360, column: 2)
!305 = !DILocation(line: 361, column: 17, scope: !303)
!306 = !DILocation(line: 361, column: 7, scope: !304)
!307 = !DILocation(line: 363, column: 4, scope: !308)
!308 = distinct !DILexicalBlock(scope: !303, file: !63, line: 362, column: 3)
!309 = !DILocation(line: 367, column: 4, scope: !310)
!310 = distinct !DILexicalBlock(scope: !303, file: !63, line: 366, column: 3)
!311 = !DILocation(line: 372, column: 15, scope: !312)
!312 = distinct !DILexicalBlock(scope: !299, file: !63, line: 371, column: 2)
!313 = !DILocation(line: 372, column: 24, scope: !312)
!314 = !DILocation(line: 372, column: 32, scope: !312)
!315 = !DILocation(line: 372, column: 41, scope: !312)
!316 = !DILocation(line: 372, column: 47, scope: !312)
!317 = !DILocation(line: 372, column: 46, scope: !312)
!318 = !DILocation(line: 372, column: 57, scope: !312)
!319 = !DILocation(line: 372, column: 56, scope: !312)
!320 = !DILocation(line: 372, column: 29, scope: !312)
!321 = !DILocation(line: 372, column: 12, scope: !312)
!322 = !DILocation(line: 373, column: 14, scope: !312)
!323 = !DILocation(line: 373, column: 22, scope: !312)
!324 = !DILocation(line: 373, column: 12, scope: !312)
!325 = !DILocation(line: 374, column: 14, scope: !312)
!326 = !DILocation(line: 374, column: 23, scope: !312)
!327 = !DILocation(line: 374, column: 22, scope: !312)
!328 = !DILocation(line: 374, column: 12, scope: !312)
!329 = !DILocation(line: 375, column: 16, scope: !312)
!330 = !DILocation(line: 375, column: 25, scope: !312)
!331 = !DILocation(line: 375, column: 31, scope: !312)
!332 = !DILocation(line: 375, column: 30, scope: !312)
!333 = !DILocation(line: 375, column: 43, scope: !312)
!334 = !DILocation(line: 375, column: 41, scope: !312)
!335 = !DILocation(line: 375, column: 12, scope: !312)
!336 = !DILocation(line: 376, column: 6, scope: !337)
!337 = distinct !DILexicalBlock(scope: !312, file: !63, line: 376, column: 6)
!338 = !DILocation(line: 376, column: 15, scope: !337)
!339 = !DILocation(line: 376, column: 6, scope: !312)
!340 = !DILocation(line: 378, column: 7, scope: !341)
!341 = distinct !DILexicalBlock(scope: !342, file: !63, line: 378, column: 7)
!342 = distinct !DILexicalBlock(scope: !337, file: !63, line: 377, column: 3)
!343 = !DILocation(line: 378, column: 16, scope: !341)
!344 = !DILocation(line: 378, column: 7, scope: !342)
!345 = !DILocation(line: 380, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !341, file: !63, line: 379, column: 4)
!347 = !DILocation(line: 380, column: 12, scope: !346)
!348 = !DILocation(line: 380, column: 5, scope: !346)
!349 = !DILocation(line: 384, column: 5, scope: !350)
!350 = distinct !DILexicalBlock(scope: !341, file: !63, line: 383, column: 4)
!351 = !DILocation(line: 389, column: 4, scope: !352)
!352 = distinct !DILexicalBlock(scope: !337, file: !63, line: 388, column: 3)
!353 = !DILocation(line: 392, column: 1, scope: !279)
!354 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !63, file: !63, line: 409, type: !280, scopeLine: 410, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!355 = !DILocalVariable(name: "numerator", arg: 1, scope: !354, file: !63, line: 409, type: !6)
!356 = !DILocation(line: 409, column: 30, scope: !354)
!357 = !DILocalVariable(name: "denominator", arg: 2, scope: !354, file: !63, line: 409, type: !21)
!358 = !DILocation(line: 409, column: 45, scope: !354)
!359 = !DILocalVariable(name: "u16Temp1", scope: !354, file: !63, line: 411, type: !21)
!360 = !DILocation(line: 411, column: 6, scope: !354)
!361 = !DILocalVariable(name: "s32Temp1", scope: !354, file: !63, line: 412, type: !71)
!362 = !DILocation(line: 412, column: 6, scope: !354)
!363 = !DILocation(line: 413, column: 13, scope: !354)
!364 = !DILocation(line: 413, column: 25, scope: !354)
!365 = !DILocation(line: 413, column: 11, scope: !354)
!366 = !DILocation(line: 414, column: 5, scope: !367)
!367 = distinct !DILexicalBlock(scope: !354, file: !63, line: 414, column: 5)
!368 = !DILocation(line: 414, column: 13, scope: !367)
!369 = !DILocation(line: 414, column: 5, scope: !354)
!370 = !DILocation(line: 416, column: 6, scope: !371)
!371 = distinct !DILexicalBlock(scope: !372, file: !63, line: 416, column: 6)
!372 = distinct !DILexicalBlock(scope: !367, file: !63, line: 415, column: 2)
!373 = !DILocation(line: 416, column: 15, scope: !371)
!374 = !DILocation(line: 416, column: 6, scope: !372)
!375 = !DILocation(line: 418, column: 4, scope: !376)
!376 = distinct !DILexicalBlock(scope: !371, file: !63, line: 417, column: 3)
!377 = !DILocation(line: 422, column: 4, scope: !378)
!378 = distinct !DILexicalBlock(scope: !371, file: !63, line: 421, column: 3)
!379 = !DILocation(line: 428, column: 15, scope: !380)
!380 = distinct !DILexicalBlock(scope: !367, file: !63, line: 427, column: 2)
!381 = !DILocation(line: 428, column: 27, scope: !380)
!382 = !DILocation(line: 428, column: 37, scope: !380)
!383 = !DILocation(line: 428, column: 36, scope: !380)
!384 = !DILocation(line: 428, column: 49, scope: !380)
!385 = !DILocation(line: 428, column: 47, scope: !380)
!386 = !DILocation(line: 428, column: 25, scope: !380)
!387 = !DILocation(line: 428, column: 59, scope: !380)
!388 = !DILocation(line: 428, column: 12, scope: !380)
!389 = !DILocation(line: 429, column: 15, scope: !380)
!390 = !DILocation(line: 429, column: 24, scope: !380)
!391 = !DILocation(line: 429, column: 23, scope: !380)
!392 = !DILocation(line: 429, column: 37, scope: !380)
!393 = !DILocation(line: 429, column: 47, scope: !380)
!394 = !DILocation(line: 429, column: 46, scope: !380)
!395 = !DILocation(line: 429, column: 34, scope: !380)
!396 = !DILocation(line: 429, column: 12, scope: !380)
!397 = !DILocation(line: 430, column: 10, scope: !380)
!398 = !DILocation(line: 430, column: 3, scope: !380)
!399 = !DILocation(line: 432, column: 1, scope: !354)
!400 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !63, file: !63, line: 450, type: !401, scopeLine: 451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!401 = !DISubroutineType(types: !402)
!402 = !{!16, !21, !21}
!403 = !DILocalVariable(name: "numerator", arg: 1, scope: !400, file: !63, line: 450, type: !21)
!404 = !DILocation(line: 450, column: 28, scope: !400)
!405 = !DILocalVariable(name: "denominator", arg: 2, scope: !400, file: !63, line: 450, type: !21)
!406 = !DILocation(line: 450, column: 43, scope: !400)
!407 = !DILocalVariable(name: "u32Temp1", scope: !400, file: !63, line: 452, type: !408)
!408 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !409)
!409 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !18, line: 26, baseType: !410)
!410 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !411)
!411 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!412 = !DILocation(line: 452, column: 6, scope: !400)
!413 = !DILocalVariable(name: "u32Temp2", scope: !400, file: !63, line: 452, type: !408)
!414 = !DILocation(line: 452, column: 20, scope: !400)
!415 = !DILocalVariable(name: "u32Temp3", scope: !400, file: !63, line: 452, type: !408)
!416 = !DILocation(line: 452, column: 33, scope: !400)
!417 = !DILocation(line: 453, column: 5, scope: !418)
!418 = distinct !DILexicalBlock(scope: !400, file: !63, line: 453, column: 5)
!419 = !DILocation(line: 453, column: 16, scope: !418)
!420 = !DILocation(line: 453, column: 5, scope: !400)
!421 = !DILocation(line: 455, column: 3, scope: !422)
!422 = distinct !DILexicalBlock(scope: !418, file: !63, line: 454, column: 2)
!423 = !DILocation(line: 459, column: 15, scope: !424)
!424 = distinct !DILexicalBlock(scope: !418, file: !63, line: 458, column: 2)
!425 = !DILocation(line: 459, column: 24, scope: !424)
!426 = !DILocation(line: 459, column: 12, scope: !424)
!427 = !DILocation(line: 460, column: 14, scope: !424)
!428 = !DILocation(line: 460, column: 25, scope: !424)
!429 = !DILocation(line: 460, column: 23, scope: !424)
!430 = !DILocation(line: 460, column: 12, scope: !424)
!431 = !DILocation(line: 461, column: 15, scope: !424)
!432 = !DILocation(line: 461, column: 24, scope: !424)
!433 = !DILocation(line: 461, column: 32, scope: !424)
!434 = !DILocation(line: 461, column: 12, scope: !424)
!435 = !DILocation(line: 462, column: 6, scope: !436)
!436 = distinct !DILexicalBlock(scope: !424, file: !63, line: 462, column: 6)
!437 = !DILocation(line: 462, column: 15, scope: !436)
!438 = !DILocation(line: 462, column: 6, scope: !424)
!439 = !DILocation(line: 464, column: 15, scope: !440)
!440 = distinct !DILexicalBlock(scope: !436, file: !63, line: 463, column: 3)
!441 = !DILocation(line: 464, column: 11, scope: !440)
!442 = !DILocation(line: 464, column: 4, scope: !440)
!443 = !DILocation(line: 468, column: 4, scope: !444)
!444 = distinct !DILexicalBlock(scope: !436, file: !63, line: 467, column: 3)
!445 = !DILocation(line: 471, column: 1, scope: !400)
!446 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !63, file: !63, line: 488, type: !447, scopeLine: 489, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!447 = !DISubroutineType(types: !448)
!448 = !{!21, !71, !21}
!449 = !DILocalVariable(name: "x_value", arg: 1, scope: !446, file: !63, line: 488, type: !71)
!450 = !DILocation(line: 488, column: 25, scope: !446)
!451 = !DILocalVariable(name: "y_value", arg: 2, scope: !446, file: !63, line: 488, type: !21)
!452 = !DILocation(line: 488, column: 38, scope: !446)
!453 = !DILocalVariable(name: "s32Temp1", scope: !446, file: !63, line: 490, type: !71)
!454 = !DILocation(line: 490, column: 6, scope: !446)
!455 = !DILocation(line: 491, column: 12, scope: !446)
!456 = !DILocation(line: 491, column: 20, scope: !446)
!457 = !DILocation(line: 491, column: 10, scope: !446)
!458 = !DILocation(line: 492, column: 6, scope: !459)
!459 = distinct !DILexicalBlock(scope: !446, file: !63, line: 492, column: 5)
!460 = !DILocation(line: 492, column: 14, scope: !459)
!461 = !DILocation(line: 492, column: 24, scope: !459)
!462 = !DILocation(line: 492, column: 5, scope: !446)
!463 = !DILocation(line: 494, column: 6, scope: !464)
!464 = distinct !DILexicalBlock(scope: !465, file: !63, line: 494, column: 6)
!465 = distinct !DILexicalBlock(scope: !459, file: !63, line: 493, column: 2)
!466 = !DILocation(line: 494, column: 14, scope: !464)
!467 = !DILocation(line: 494, column: 6, scope: !465)
!468 = !DILocation(line: 496, column: 4, scope: !469)
!469 = distinct !DILexicalBlock(scope: !464, file: !63, line: 495, column: 3)
!470 = !DILocation(line: 500, column: 4, scope: !471)
!471 = distinct !DILexicalBlock(scope: !464, file: !63, line: 499, column: 3)
!472 = !DILocation(line: 505, column: 15, scope: !473)
!473 = distinct !DILexicalBlock(scope: !459, file: !63, line: 504, column: 2)
!474 = !DILocation(line: 505, column: 27, scope: !473)
!475 = !DILocation(line: 505, column: 35, scope: !473)
!476 = !DILocation(line: 505, column: 34, scope: !473)
!477 = !DILocation(line: 505, column: 46, scope: !473)
!478 = !DILocation(line: 505, column: 44, scope: !473)
!479 = !DILocation(line: 505, column: 23, scope: !473)
!480 = !DILocation(line: 505, column: 56, scope: !473)
!481 = !DILocation(line: 505, column: 12, scope: !473)
!482 = !DILocation(line: 506, column: 15, scope: !473)
!483 = !DILocation(line: 506, column: 24, scope: !473)
!484 = !DILocation(line: 506, column: 23, scope: !473)
!485 = !DILocation(line: 506, column: 36, scope: !473)
!486 = !DILocation(line: 506, column: 44, scope: !473)
!487 = !DILocation(line: 506, column: 43, scope: !473)
!488 = !DILocation(line: 506, column: 33, scope: !473)
!489 = !DILocation(line: 506, column: 12, scope: !473)
!490 = !DILocation(line: 507, column: 6, scope: !491)
!491 = distinct !DILexicalBlock(scope: !473, file: !63, line: 507, column: 6)
!492 = !DILocation(line: 507, column: 15, scope: !491)
!493 = !DILocation(line: 507, column: 6, scope: !473)
!494 = !DILocation(line: 509, column: 7, scope: !495)
!495 = distinct !DILexicalBlock(scope: !496, file: !63, line: 509, column: 7)
!496 = distinct !DILexicalBlock(scope: !491, file: !63, line: 508, column: 3)
!497 = !DILocation(line: 509, column: 16, scope: !495)
!498 = !DILocation(line: 509, column: 7, scope: !496)
!499 = !DILocation(line: 511, column: 17, scope: !500)
!500 = distinct !DILexicalBlock(scope: !495, file: !63, line: 510, column: 4)
!501 = !DILocation(line: 511, column: 12, scope: !500)
!502 = !DILocation(line: 511, column: 5, scope: !500)
!503 = !DILocation(line: 515, column: 5, scope: !504)
!504 = distinct !DILexicalBlock(scope: !495, file: !63, line: 514, column: 4)
!505 = !DILocation(line: 520, column: 4, scope: !506)
!506 = distinct !DILexicalBlock(scope: !491, file: !63, line: 519, column: 3)
!507 = !DILocation(line: 523, column: 1, scope: !446)
!508 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !63, file: !63, line: 541, type: !509, scopeLine: 542, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!509 = !DISubroutineType(types: !510)
!510 = !{!21, !21, !21}
!511 = !DILocalVariable(name: "numerator", arg: 1, scope: !508, file: !63, line: 541, type: !21)
!512 = !DILocation(line: 541, column: 31, scope: !508)
!513 = !DILocalVariable(name: "denominator", arg: 2, scope: !508, file: !63, line: 541, type: !21)
!514 = !DILocation(line: 541, column: 46, scope: !508)
!515 = !DILocalVariable(name: "u32Temp", scope: !508, file: !63, line: 543, type: !408)
!516 = !DILocation(line: 543, column: 6, scope: !508)
!517 = !DILocation(line: 544, column: 5, scope: !518)
!518 = distinct !DILexicalBlock(scope: !508, file: !63, line: 544, column: 5)
!519 = !DILocation(line: 544, column: 17, scope: !518)
!520 = !DILocation(line: 544, column: 5, scope: !508)
!521 = !DILocation(line: 546, column: 3, scope: !522)
!522 = distinct !DILexicalBlock(scope: !518, file: !63, line: 545, column: 2)
!523 = !DILocation(line: 550, column: 14, scope: !524)
!524 = distinct !DILexicalBlock(scope: !518, file: !63, line: 549, column: 2)
!525 = !DILocation(line: 550, column: 23, scope: !524)
!526 = !DILocation(line: 550, column: 32, scope: !524)
!527 = !DILocation(line: 550, column: 44, scope: !524)
!528 = !DILocation(line: 550, column: 29, scope: !524)
!529 = !DILocation(line: 550, column: 11, scope: !524)
!530 = !DILocation(line: 551, column: 13, scope: !524)
!531 = !DILocation(line: 551, column: 21, scope: !524)
!532 = !DILocation(line: 551, column: 20, scope: !524)
!533 = !DILocation(line: 551, column: 11, scope: !524)
!534 = !DILocation(line: 552, column: 6, scope: !535)
!535 = distinct !DILexicalBlock(scope: !524, file: !63, line: 552, column: 6)
!536 = !DILocation(line: 552, column: 14, scope: !535)
!537 = !DILocation(line: 552, column: 6, scope: !524)
!538 = !DILocation(line: 554, column: 11, scope: !539)
!539 = distinct !DILexicalBlock(scope: !535, file: !63, line: 553, column: 3)
!540 = !DILocation(line: 554, column: 19, scope: !539)
!541 = !DILocation(line: 554, column: 4, scope: !539)
!542 = !DILocation(line: 558, column: 4, scope: !543)
!543 = distinct !DILexicalBlock(scope: !535, file: !63, line: 557, column: 3)
!544 = !DILocation(line: 562, column: 1, scope: !508)
!545 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !63, file: !63, line: 579, type: !546, scopeLine: 580, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!546 = !DISubroutineType(types: !547)
!547 = !{!21, !408, !21}
!548 = !DILocalVariable(name: "x_value", arg: 1, scope: !545, file: !63, line: 579, type: !408)
!549 = !DILocation(line: 579, column: 25, scope: !545)
!550 = !DILocalVariable(name: "y_value", arg: 2, scope: !545, file: !63, line: 579, type: !21)
!551 = !DILocation(line: 579, column: 38, scope: !545)
!552 = !DILocalVariable(name: "u32Temp1", scope: !545, file: !63, line: 581, type: !408)
!553 = !DILocation(line: 581, column: 6, scope: !545)
!554 = !DILocalVariable(name: "u32Temp2", scope: !545, file: !63, line: 581, type: !408)
!555 = !DILocation(line: 581, column: 17, scope: !545)
!556 = !DILocation(line: 582, column: 12, scope: !545)
!557 = !DILocation(line: 582, column: 20, scope: !545)
!558 = !DILocation(line: 582, column: 10, scope: !545)
!559 = !DILocation(line: 583, column: 5, scope: !560)
!560 = distinct !DILexicalBlock(scope: !545, file: !63, line: 583, column: 5)
!561 = !DILocation(line: 583, column: 13, scope: !560)
!562 = !DILocation(line: 583, column: 5, scope: !545)
!563 = !DILocation(line: 585, column: 3, scope: !564)
!564 = distinct !DILexicalBlock(scope: !560, file: !63, line: 584, column: 2)
!565 = !DILocation(line: 589, column: 14, scope: !566)
!566 = distinct !DILexicalBlock(scope: !560, file: !63, line: 588, column: 2)
!567 = !DILocation(line: 589, column: 22, scope: !566)
!568 = !DILocation(line: 589, column: 21, scope: !566)
!569 = !DILocation(line: 589, column: 12, scope: !566)
!570 = !DILocation(line: 590, column: 14, scope: !566)
!571 = !DILocation(line: 590, column: 25, scope: !566)
!572 = !DILocation(line: 590, column: 36, scope: !566)
!573 = !DILocation(line: 590, column: 34, scope: !566)
!574 = !DILocation(line: 590, column: 22, scope: !566)
!575 = !DILocation(line: 590, column: 45, scope: !566)
!576 = !DILocation(line: 590, column: 12, scope: !566)
!577 = !DILocation(line: 591, column: 15, scope: !566)
!578 = !DILocation(line: 591, column: 24, scope: !566)
!579 = !DILocation(line: 591, column: 23, scope: !566)
!580 = !DILocation(line: 591, column: 36, scope: !566)
!581 = !DILocation(line: 591, column: 44, scope: !566)
!582 = !DILocation(line: 591, column: 43, scope: !566)
!583 = !DILocation(line: 591, column: 33, scope: !566)
!584 = !DILocation(line: 591, column: 12, scope: !566)
!585 = !DILocation(line: 592, column: 6, scope: !586)
!586 = distinct !DILexicalBlock(scope: !566, file: !63, line: 592, column: 6)
!587 = !DILocation(line: 592, column: 15, scope: !586)
!588 = !DILocation(line: 592, column: 6, scope: !566)
!589 = !DILocation(line: 594, column: 11, scope: !590)
!590 = distinct !DILexicalBlock(scope: !586, file: !63, line: 593, column: 3)
!591 = !DILocation(line: 594, column: 20, scope: !590)
!592 = !DILocation(line: 594, column: 4, scope: !590)
!593 = !DILocation(line: 598, column: 4, scope: !594)
!594 = distinct !DILexicalBlock(scope: !586, file: !63, line: 597, column: 3)
!595 = !DILocation(line: 602, column: 1, scope: !545)
!596 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !63, file: !63, line: 621, type: !597, scopeLine: 622, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!597 = !DISubroutineType(types: !598)
!598 = !{!6, !6, !21, !6}
!599 = !DILocalVariable(name: "factor1", arg: 1, scope: !596, file: !63, line: 621, type: !6)
!600 = !DILocation(line: 621, column: 33, scope: !596)
!601 = !DILocalVariable(name: "factor2", arg: 2, scope: !596, file: !63, line: 621, type: !21)
!602 = !DILocation(line: 621, column: 46, scope: !596)
!603 = !DILocalVariable(name: "denominator", arg: 3, scope: !596, file: !63, line: 621, type: !6)
!604 = !DILocation(line: 621, column: 59, scope: !596)
!605 = !DILocalVariable(name: "s32Result", scope: !596, file: !63, line: 623, type: !71)
!606 = !DILocation(line: 623, column: 6, scope: !596)
!607 = !DILocalVariable(name: "s32Temp1", scope: !596, file: !63, line: 623, type: !71)
!608 = !DILocation(line: 623, column: 21, scope: !596)
!609 = !DILocation(line: 624, column: 14, scope: !596)
!610 = !DILocation(line: 624, column: 24, scope: !596)
!611 = !DILocation(line: 624, column: 22, scope: !596)
!612 = !DILocation(line: 624, column: 12, scope: !596)
!613 = !DILocation(line: 625, column: 5, scope: !614)
!614 = distinct !DILexicalBlock(scope: !596, file: !63, line: 625, column: 5)
!615 = !DILocation(line: 625, column: 17, scope: !614)
!616 = !DILocation(line: 625, column: 5, scope: !596)
!617 = !DILocation(line: 627, column: 6, scope: !618)
!618 = distinct !DILexicalBlock(scope: !619, file: !63, line: 627, column: 6)
!619 = distinct !DILexicalBlock(scope: !614, file: !63, line: 626, column: 2)
!620 = !DILocation(line: 627, column: 16, scope: !618)
!621 = !DILocation(line: 627, column: 6, scope: !619)
!622 = !DILocation(line: 629, column: 4, scope: !623)
!623 = distinct !DILexicalBlock(scope: !618, file: !63, line: 628, column: 3)
!624 = !DILocation(line: 633, column: 4, scope: !625)
!625 = distinct !DILexicalBlock(scope: !618, file: !63, line: 632, column: 3)
!626 = !DILocation(line: 638, column: 14, scope: !627)
!627 = distinct !DILexicalBlock(scope: !614, file: !63, line: 637, column: 2)
!628 = !DILocation(line: 638, column: 27, scope: !627)
!629 = !DILocation(line: 638, column: 37, scope: !627)
!630 = !DILocation(line: 638, column: 36, scope: !627)
!631 = !DILocation(line: 638, column: 50, scope: !627)
!632 = !DILocation(line: 638, column: 49, scope: !627)
!633 = !DILocation(line: 638, column: 24, scope: !627)
!634 = !DILocation(line: 638, column: 12, scope: !627)
!635 = !DILocation(line: 639, column: 14, scope: !627)
!636 = !DILocation(line: 639, column: 23, scope: !627)
!637 = !DILocation(line: 639, column: 12, scope: !627)
!638 = !DILocation(line: 640, column: 16, scope: !627)
!639 = !DILocation(line: 640, column: 25, scope: !627)
!640 = !DILocation(line: 640, column: 24, scope: !627)
!641 = !DILocation(line: 640, column: 41, scope: !627)
!642 = !DILocation(line: 640, column: 51, scope: !627)
!643 = !DILocation(line: 640, column: 50, scope: !627)
!644 = !DILocation(line: 640, column: 38, scope: !627)
!645 = !DILocation(line: 640, column: 13, scope: !627)
!646 = !DILocation(line: 641, column: 6, scope: !647)
!647 = distinct !DILexicalBlock(scope: !627, file: !63, line: 641, column: 6)
!648 = !DILocation(line: 641, column: 16, scope: !647)
!649 = !DILocation(line: 641, column: 6, scope: !627)
!650 = !DILocation(line: 643, column: 7, scope: !651)
!651 = distinct !DILexicalBlock(scope: !652, file: !63, line: 643, column: 7)
!652 = distinct !DILexicalBlock(scope: !647, file: !63, line: 642, column: 3)
!653 = !DILocation(line: 643, column: 17, scope: !651)
!654 = !DILocation(line: 643, column: 7, scope: !652)
!655 = !DILocation(line: 645, column: 17, scope: !656)
!656 = distinct !DILexicalBlock(scope: !651, file: !63, line: 644, column: 4)
!657 = !DILocation(line: 645, column: 12, scope: !656)
!658 = !DILocation(line: 645, column: 5, scope: !656)
!659 = !DILocation(line: 650, column: 5, scope: !660)
!660 = distinct !DILexicalBlock(scope: !651, file: !63, line: 649, column: 4)
!661 = !DILocation(line: 655, column: 4, scope: !662)
!662 = distinct !DILexicalBlock(scope: !647, file: !63, line: 654, column: 3)
!663 = !DILocation(line: 659, column: 1, scope: !596)
!664 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !63, file: !63, line: 677, type: !665, scopeLine: 678, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!665 = !DISubroutineType(types: !666)
!666 = !{!6, !21, !6, !21}
!667 = !DILocalVariable(name: "factor1", arg: 1, scope: !664, file: !63, line: 677, type: !21)
!668 = !DILocation(line: 677, column: 33, scope: !664)
!669 = !DILocalVariable(name: "factor2", arg: 2, scope: !664, file: !63, line: 677, type: !6)
!670 = !DILocation(line: 677, column: 46, scope: !664)
!671 = !DILocalVariable(name: "denominator", arg: 3, scope: !664, file: !63, line: 677, type: !21)
!672 = !DILocation(line: 677, column: 59, scope: !664)
!673 = !DILocalVariable(name: "s32Result", scope: !664, file: !63, line: 679, type: !71)
!674 = !DILocation(line: 679, column: 6, scope: !664)
!675 = !DILocalVariable(name: "s32Temp1", scope: !664, file: !63, line: 679, type: !71)
!676 = !DILocation(line: 679, column: 21, scope: !664)
!677 = !DILocation(line: 680, column: 14, scope: !664)
!678 = !DILocation(line: 680, column: 24, scope: !664)
!679 = !DILocation(line: 680, column: 22, scope: !664)
!680 = !DILocation(line: 680, column: 12, scope: !664)
!681 = !DILocation(line: 681, column: 5, scope: !682)
!682 = distinct !DILexicalBlock(scope: !664, file: !63, line: 681, column: 5)
!683 = !DILocation(line: 681, column: 16, scope: !682)
!684 = !DILocation(line: 681, column: 5, scope: !664)
!685 = !DILocation(line: 683, column: 6, scope: !686)
!686 = distinct !DILexicalBlock(scope: !687, file: !63, line: 683, column: 6)
!687 = distinct !DILexicalBlock(scope: !682, file: !63, line: 682, column: 2)
!688 = !DILocation(line: 683, column: 16, scope: !686)
!689 = !DILocation(line: 683, column: 6, scope: !687)
!690 = !DILocation(line: 685, column: 4, scope: !691)
!691 = distinct !DILexicalBlock(scope: !686, file: !63, line: 684, column: 3)
!692 = !DILocation(line: 689, column: 4, scope: !693)
!693 = distinct !DILexicalBlock(scope: !686, file: !63, line: 688, column: 3)
!694 = !DILocation(line: 694, column: 14, scope: !695)
!695 = distinct !DILexicalBlock(scope: !682, file: !63, line: 693, column: 2)
!696 = !DILocation(line: 694, column: 28, scope: !695)
!697 = !DILocation(line: 694, column: 38, scope: !695)
!698 = !DILocation(line: 694, column: 37, scope: !695)
!699 = !DILocation(line: 694, column: 53, scope: !695)
!700 = !DILocation(line: 694, column: 51, scope: !695)
!701 = !DILocation(line: 694, column: 24, scope: !695)
!702 = !DILocation(line: 694, column: 66, scope: !695)
!703 = !DILocation(line: 694, column: 12, scope: !695)
!704 = !DILocation(line: 695, column: 16, scope: !695)
!705 = !DILocation(line: 695, column: 25, scope: !695)
!706 = !DILocation(line: 695, column: 24, scope: !695)
!707 = !DILocation(line: 695, column: 41, scope: !695)
!708 = !DILocation(line: 695, column: 51, scope: !695)
!709 = !DILocation(line: 695, column: 50, scope: !695)
!710 = !DILocation(line: 695, column: 38, scope: !695)
!711 = !DILocation(line: 695, column: 13, scope: !695)
!712 = !DILocation(line: 696, column: 6, scope: !713)
!713 = distinct !DILexicalBlock(scope: !695, file: !63, line: 696, column: 6)
!714 = !DILocation(line: 696, column: 16, scope: !713)
!715 = !DILocation(line: 696, column: 6, scope: !695)
!716 = !DILocation(line: 698, column: 7, scope: !717)
!717 = distinct !DILexicalBlock(scope: !718, file: !63, line: 698, column: 7)
!718 = distinct !DILexicalBlock(scope: !713, file: !63, line: 697, column: 3)
!719 = !DILocation(line: 698, column: 17, scope: !717)
!720 = !DILocation(line: 698, column: 7, scope: !718)
!721 = !DILocation(line: 700, column: 17, scope: !722)
!722 = distinct !DILexicalBlock(scope: !717, file: !63, line: 699, column: 4)
!723 = !DILocation(line: 700, column: 12, scope: !722)
!724 = !DILocation(line: 700, column: 5, scope: !722)
!725 = !DILocation(line: 704, column: 5, scope: !726)
!726 = distinct !DILexicalBlock(scope: !717, file: !63, line: 703, column: 4)
!727 = !DILocation(line: 709, column: 4, scope: !728)
!728 = distinct !DILexicalBlock(scope: !713, file: !63, line: 708, column: 3)
!729 = !DILocation(line: 712, column: 1, scope: !664)
!730 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !63, file: !63, line: 731, type: !731, scopeLine: 732, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!731 = !DISubroutineType(types: !732)
!732 = !{!21, !6, !21, !6}
!733 = !DILocalVariable(name: "factor1", arg: 1, scope: !730, file: !63, line: 731, type: !6)
!734 = !DILocation(line: 731, column: 33, scope: !730)
!735 = !DILocalVariable(name: "factor2", arg: 2, scope: !730, file: !63, line: 731, type: !21)
!736 = !DILocation(line: 731, column: 46, scope: !730)
!737 = !DILocalVariable(name: "denominator", arg: 3, scope: !730, file: !63, line: 731, type: !6)
!738 = !DILocation(line: 731, column: 59, scope: !730)
!739 = !DILocalVariable(name: "u32Result", scope: !730, file: !63, line: 733, type: !408)
!740 = !DILocation(line: 733, column: 6, scope: !730)
!741 = !DILocalVariable(name: "u32Temp1", scope: !730, file: !63, line: 733, type: !408)
!742 = !DILocation(line: 733, column: 21, scope: !730)
!743 = !DILocalVariable(name: "s32Result", scope: !730, file: !63, line: 734, type: !71)
!744 = !DILocation(line: 734, column: 6, scope: !730)
!745 = !DILocalVariable(name: "s32Temp1", scope: !730, file: !63, line: 734, type: !71)
!746 = !DILocation(line: 734, column: 21, scope: !730)
!747 = !DILocation(line: 735, column: 14, scope: !730)
!748 = !DILocation(line: 735, column: 24, scope: !730)
!749 = !DILocation(line: 735, column: 22, scope: !730)
!750 = !DILocation(line: 735, column: 12, scope: !730)
!751 = !DILocation(line: 737, column: 5, scope: !752)
!752 = distinct !DILexicalBlock(scope: !730, file: !63, line: 737, column: 5)
!753 = !DILocation(line: 737, column: 17, scope: !752)
!754 = !DILocation(line: 737, column: 5, scope: !730)
!755 = !DILocation(line: 739, column: 6, scope: !756)
!756 = distinct !DILexicalBlock(scope: !757, file: !63, line: 739, column: 6)
!757 = distinct !DILexicalBlock(scope: !752, file: !63, line: 738, column: 2)
!758 = !DILocation(line: 739, column: 16, scope: !756)
!759 = !DILocation(line: 739, column: 6, scope: !757)
!760 = !DILocation(line: 741, column: 4, scope: !761)
!761 = distinct !DILexicalBlock(scope: !756, file: !63, line: 740, column: 3)
!762 = !DILocation(line: 745, column: 4, scope: !763)
!763 = distinct !DILexicalBlock(scope: !756, file: !63, line: 744, column: 3)
!764 = !DILocation(line: 750, column: 15, scope: !765)
!765 = distinct !DILexicalBlock(scope: !752, file: !63, line: 749, column: 2)
!766 = !DILocation(line: 750, column: 29, scope: !765)
!767 = !DILocation(line: 750, column: 39, scope: !765)
!768 = !DILocation(line: 750, column: 38, scope: !765)
!769 = !DILocation(line: 750, column: 54, scope: !765)
!770 = !DILocation(line: 750, column: 52, scope: !765)
!771 = !DILocation(line: 750, column: 25, scope: !765)
!772 = !DILocation(line: 750, column: 68, scope: !765)
!773 = !DILocation(line: 750, column: 12, scope: !765)
!774 = !DILocation(line: 751, column: 16, scope: !765)
!775 = !DILocation(line: 751, column: 25, scope: !765)
!776 = !DILocation(line: 751, column: 24, scope: !765)
!777 = !DILocation(line: 751, column: 41, scope: !765)
!778 = !DILocation(line: 751, column: 51, scope: !765)
!779 = !DILocation(line: 751, column: 50, scope: !765)
!780 = !DILocation(line: 751, column: 38, scope: !765)
!781 = !DILocation(line: 751, column: 13, scope: !765)
!782 = !DILocation(line: 752, column: 6, scope: !783)
!783 = distinct !DILexicalBlock(scope: !765, file: !63, line: 752, column: 6)
!784 = !DILocation(line: 752, column: 16, scope: !783)
!785 = !DILocation(line: 752, column: 6, scope: !765)
!786 = !DILocation(line: 754, column: 7, scope: !787)
!787 = distinct !DILexicalBlock(scope: !788, file: !63, line: 754, column: 7)
!788 = distinct !DILexicalBlock(scope: !783, file: !63, line: 753, column: 3)
!789 = !DILocation(line: 754, column: 17, scope: !787)
!790 = !DILocation(line: 754, column: 7, scope: !788)
!791 = !DILocation(line: 756, column: 17, scope: !792)
!792 = distinct !DILexicalBlock(scope: !787, file: !63, line: 755, column: 4)
!793 = !DILocation(line: 756, column: 12, scope: !792)
!794 = !DILocation(line: 756, column: 5, scope: !792)
!795 = !DILocation(line: 760, column: 5, scope: !796)
!796 = distinct !DILexicalBlock(scope: !787, file: !63, line: 759, column: 4)
!797 = !DILocation(line: 765, column: 4, scope: !798)
!798 = distinct !DILexicalBlock(scope: !783, file: !63, line: 764, column: 3)
!799 = !DILocation(line: 768, column: 1, scope: !730)
!800 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !63, file: !63, line: 787, type: !801, scopeLine: 788, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!801 = !DISubroutineType(types: !802)
!802 = !{!21, !6, !21, !21}
!803 = !DILocalVariable(name: "factor1", arg: 1, scope: !800, file: !63, line: 787, type: !6)
!804 = !DILocation(line: 787, column: 33, scope: !800)
!805 = !DILocalVariable(name: "factor2", arg: 2, scope: !800, file: !63, line: 787, type: !21)
!806 = !DILocation(line: 787, column: 46, scope: !800)
!807 = !DILocalVariable(name: "denominator", arg: 3, scope: !800, file: !63, line: 787, type: !21)
!808 = !DILocation(line: 787, column: 59, scope: !800)
!809 = !DILocalVariable(name: "s32Result", scope: !800, file: !63, line: 789, type: !71)
!810 = !DILocation(line: 789, column: 6, scope: !800)
!811 = !DILocalVariable(name: "s32Temp1", scope: !800, file: !63, line: 789, type: !71)
!812 = !DILocation(line: 789, column: 21, scope: !800)
!813 = !DILocation(line: 790, column: 14, scope: !800)
!814 = !DILocation(line: 790, column: 24, scope: !800)
!815 = !DILocation(line: 790, column: 22, scope: !800)
!816 = !DILocation(line: 790, column: 12, scope: !800)
!817 = !DILocation(line: 792, column: 5, scope: !818)
!818 = distinct !DILexicalBlock(scope: !800, file: !63, line: 792, column: 5)
!819 = !DILocation(line: 792, column: 17, scope: !818)
!820 = !DILocation(line: 792, column: 5, scope: !800)
!821 = !DILocation(line: 794, column: 6, scope: !822)
!822 = distinct !DILexicalBlock(scope: !823, file: !63, line: 794, column: 6)
!823 = distinct !DILexicalBlock(scope: !818, file: !63, line: 793, column: 2)
!824 = !DILocation(line: 794, column: 16, scope: !822)
!825 = !DILocation(line: 794, column: 6, scope: !823)
!826 = !DILocation(line: 796, column: 4, scope: !827)
!827 = distinct !DILexicalBlock(scope: !822, file: !63, line: 795, column: 3)
!828 = !DILocation(line: 800, column: 4, scope: !829)
!829 = distinct !DILexicalBlock(scope: !822, file: !63, line: 799, column: 3)
!830 = !DILocation(line: 805, column: 15, scope: !831)
!831 = distinct !DILexicalBlock(scope: !818, file: !63, line: 804, column: 2)
!832 = !DILocation(line: 805, column: 29, scope: !831)
!833 = !DILocation(line: 805, column: 39, scope: !831)
!834 = !DILocation(line: 805, column: 38, scope: !831)
!835 = !DILocation(line: 805, column: 54, scope: !831)
!836 = !DILocation(line: 805, column: 52, scope: !831)
!837 = !DILocation(line: 805, column: 25, scope: !831)
!838 = !DILocation(line: 805, column: 68, scope: !831)
!839 = !DILocation(line: 805, column: 12, scope: !831)
!840 = !DILocation(line: 806, column: 16, scope: !831)
!841 = !DILocation(line: 806, column: 25, scope: !831)
!842 = !DILocation(line: 806, column: 24, scope: !831)
!843 = !DILocation(line: 806, column: 41, scope: !831)
!844 = !DILocation(line: 806, column: 51, scope: !831)
!845 = !DILocation(line: 806, column: 50, scope: !831)
!846 = !DILocation(line: 806, column: 38, scope: !831)
!847 = !DILocation(line: 806, column: 13, scope: !831)
!848 = !DILocation(line: 807, column: 6, scope: !849)
!849 = distinct !DILexicalBlock(scope: !831, file: !63, line: 807, column: 6)
!850 = !DILocation(line: 807, column: 16, scope: !849)
!851 = !DILocation(line: 807, column: 6, scope: !831)
!852 = !DILocation(line: 809, column: 7, scope: !853)
!853 = distinct !DILexicalBlock(scope: !854, file: !63, line: 809, column: 7)
!854 = distinct !DILexicalBlock(scope: !849, file: !63, line: 808, column: 3)
!855 = !DILocation(line: 809, column: 17, scope: !853)
!856 = !DILocation(line: 809, column: 7, scope: !854)
!857 = !DILocation(line: 811, column: 17, scope: !858)
!858 = distinct !DILexicalBlock(scope: !853, file: !63, line: 810, column: 4)
!859 = !DILocation(line: 811, column: 12, scope: !858)
!860 = !DILocation(line: 811, column: 5, scope: !858)
!861 = !DILocation(line: 815, column: 5, scope: !862)
!862 = distinct !DILexicalBlock(scope: !853, file: !63, line: 814, column: 4)
!863 = !DILocation(line: 820, column: 4, scope: !864)
!864 = distinct !DILexicalBlock(scope: !849, file: !63, line: 819, column: 3)
!865 = !DILocation(line: 824, column: 1, scope: !800)
!866 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !63, file: !63, line: 842, type: !867, scopeLine: 843, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!867 = !DISubroutineType(types: !868)
!868 = !{!21, !21, !21, !21}
!869 = !DILocalVariable(name: "factor1", arg: 1, scope: !866, file: !63, line: 842, type: !21)
!870 = !DILocation(line: 842, column: 33, scope: !866)
!871 = !DILocalVariable(name: "factor2", arg: 2, scope: !866, file: !63, line: 842, type: !21)
!872 = !DILocation(line: 842, column: 46, scope: !866)
!873 = !DILocalVariable(name: "denominator", arg: 3, scope: !866, file: !63, line: 842, type: !21)
!874 = !DILocation(line: 842, column: 59, scope: !866)
!875 = !DILocalVariable(name: "u32Temp1", scope: !866, file: !63, line: 844, type: !408)
!876 = !DILocation(line: 844, column: 6, scope: !866)
!877 = !DILocalVariable(name: "u16TempDenom", scope: !866, file: !63, line: 845, type: !21)
!878 = !DILocation(line: 845, column: 6, scope: !866)
!879 = !DILocation(line: 847, column: 5, scope: !880)
!880 = distinct !DILexicalBlock(scope: !866, file: !63, line: 847, column: 5)
!881 = !DILocation(line: 847, column: 17, scope: !880)
!882 = !DILocation(line: 847, column: 5, scope: !866)
!883 = !DILocation(line: 849, column: 3, scope: !884)
!884 = distinct !DILexicalBlock(scope: !880, file: !63, line: 848, column: 2)
!885 = !DILocation(line: 853, column: 14, scope: !886)
!886 = distinct !DILexicalBlock(scope: !880, file: !63, line: 852, column: 2)
!887 = !DILocation(line: 853, column: 24, scope: !886)
!888 = !DILocation(line: 853, column: 22, scope: !886)
!889 = !DILocation(line: 853, column: 12, scope: !886)
!890 = !DILocation(line: 854, column: 18, scope: !886)
!891 = !DILocation(line: 854, column: 30, scope: !886)
!892 = !DILocation(line: 854, column: 16, scope: !886)
!893 = !DILocation(line: 855, column: 14, scope: !886)
!894 = !DILocation(line: 855, column: 25, scope: !886)
!895 = !DILocation(line: 855, column: 23, scope: !886)
!896 = !DILocation(line: 855, column: 12, scope: !886)
!897 = !DILocation(line: 856, column: 14, scope: !886)
!898 = !DILocation(line: 856, column: 25, scope: !886)
!899 = !DILocation(line: 856, column: 23, scope: !886)
!900 = !DILocation(line: 856, column: 12, scope: !886)
!901 = !DILocation(line: 857, column: 6, scope: !902)
!902 = distinct !DILexicalBlock(scope: !886, file: !63, line: 857, column: 6)
!903 = !DILocation(line: 857, column: 15, scope: !902)
!904 = !DILocation(line: 857, column: 6, scope: !886)
!905 = !DILocation(line: 859, column: 12, scope: !906)
!906 = distinct !DILexicalBlock(scope: !902, file: !63, line: 858, column: 3)
!907 = !DILocation(line: 859, column: 21, scope: !906)
!908 = !DILocation(line: 859, column: 11, scope: !906)
!909 = !DILocation(line: 859, column: 4, scope: !906)
!910 = !DILocation(line: 864, column: 4, scope: !911)
!911 = distinct !DILexicalBlock(scope: !902, file: !63, line: 863, column: 3)
!912 = !DILocation(line: 869, column: 1, scope: !866)
!913 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !63, file: !63, line: 886, type: !914, scopeLine: 887, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!914 = !DISubroutineType(types: !915)
!915 = !{!21, !21, !21, !408}
!916 = !DILocalVariable(name: "factor1", arg: 1, scope: !913, file: !63, line: 886, type: !21)
!917 = !DILocation(line: 886, column: 33, scope: !913)
!918 = !DILocalVariable(name: "factor2", arg: 2, scope: !913, file: !63, line: 886, type: !21)
!919 = !DILocation(line: 886, column: 46, scope: !913)
!920 = !DILocalVariable(name: "denominator", arg: 3, scope: !913, file: !63, line: 886, type: !408)
!921 = !DILocation(line: 886, column: 59, scope: !913)
!922 = !DILocalVariable(name: "u32Temp1", scope: !913, file: !63, line: 888, type: !408)
!923 = !DILocation(line: 888, column: 6, scope: !913)
!924 = !DILocation(line: 889, column: 5, scope: !925)
!925 = distinct !DILexicalBlock(scope: !913, file: !63, line: 889, column: 5)
!926 = !DILocation(line: 889, column: 17, scope: !925)
!927 = !DILocation(line: 889, column: 5, scope: !913)
!928 = !DILocation(line: 891, column: 3, scope: !929)
!929 = distinct !DILexicalBlock(scope: !925, file: !63, line: 890, column: 2)
!930 = !DILocation(line: 895, column: 15, scope: !931)
!931 = distinct !DILexicalBlock(scope: !925, file: !63, line: 894, column: 2)
!932 = !DILocation(line: 895, column: 25, scope: !931)
!933 = !DILocation(line: 895, column: 23, scope: !931)
!934 = !DILocation(line: 895, column: 36, scope: !931)
!935 = !DILocation(line: 895, column: 34, scope: !931)
!936 = !DILocation(line: 895, column: 12, scope: !931)
!937 = !DILocation(line: 896, column: 8, scope: !938)
!938 = distinct !DILexicalBlock(scope: !931, file: !63, line: 896, column: 6)
!939 = !DILocation(line: 896, column: 18, scope: !938)
!940 = !DILocation(line: 896, column: 16, scope: !938)
!941 = !DILocation(line: 896, column: 28, scope: !938)
!942 = !DILocation(line: 896, column: 40, scope: !938)
!943 = !DILocation(line: 896, column: 39, scope: !938)
!944 = !DILocation(line: 896, column: 26, scope: !938)
!945 = !DILocation(line: 896, column: 53, scope: !938)
!946 = !DILocation(line: 896, column: 64, scope: !938)
!947 = !DILocation(line: 896, column: 50, scope: !938)
!948 = !DILocation(line: 896, column: 6, scope: !931)
!949 = !DILocation(line: 898, column: 12, scope: !950)
!950 = distinct !DILexicalBlock(scope: !938, file: !63, line: 897, column: 3)
!951 = !DILocation(line: 899, column: 3, scope: !950)
!952 = !DILocation(line: 900, column: 6, scope: !953)
!953 = distinct !DILexicalBlock(scope: !931, file: !63, line: 900, column: 6)
!954 = !DILocation(line: 900, column: 15, scope: !953)
!955 = !DILocation(line: 900, column: 6, scope: !931)
!956 = !DILocation(line: 902, column: 12, scope: !957)
!957 = distinct !DILexicalBlock(scope: !953, file: !63, line: 901, column: 3)
!958 = !DILocation(line: 902, column: 21, scope: !957)
!959 = !DILocation(line: 902, column: 11, scope: !957)
!960 = !DILocation(line: 902, column: 4, scope: !957)
!961 = !DILocation(line: 906, column: 4, scope: !962)
!962 = distinct !DILexicalBlock(scope: !953, file: !63, line: 905, column: 3)
!963 = !DILocation(line: 909, column: 1, scope: !913)
!964 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !63, file: !63, line: 926, type: !965, scopeLine: 927, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!965 = !DISubroutineType(types: !966)
!966 = !{!408, !408, !21}
!967 = !DILocalVariable(name: "x_value", arg: 1, scope: !964, file: !63, line: 926, type: !408)
!968 = !DILocation(line: 926, column: 25, scope: !964)
!969 = !DILocalVariable(name: "y_value", arg: 2, scope: !964, file: !63, line: 926, type: !21)
!970 = !DILocation(line: 926, column: 38, scope: !964)
!971 = !DILocalVariable(name: "u32Temp1", scope: !964, file: !63, line: 928, type: !408)
!972 = !DILocation(line: 928, column: 6, scope: !964)
!973 = !DILocation(line: 929, column: 5, scope: !974)
!974 = distinct !DILexicalBlock(scope: !964, file: !63, line: 929, column: 5)
!975 = !DILocation(line: 929, column: 13, scope: !974)
!976 = !DILocation(line: 929, column: 5, scope: !964)
!977 = !DILocation(line: 931, column: 3, scope: !978)
!978 = distinct !DILexicalBlock(scope: !974, file: !63, line: 930, column: 2)
!979 = !DILocation(line: 935, column: 15, scope: !980)
!980 = distinct !DILexicalBlock(scope: !974, file: !63, line: 934, column: 2)
!981 = !DILocation(line: 935, column: 26, scope: !980)
!982 = !DILocation(line: 935, column: 34, scope: !980)
!983 = !DILocation(line: 935, column: 33, scope: !980)
!984 = !DILocation(line: 935, column: 45, scope: !980)
!985 = !DILocation(line: 935, column: 43, scope: !980)
!986 = !DILocation(line: 935, column: 23, scope: !980)
!987 = !DILocation(line: 935, column: 54, scope: !980)
!988 = !DILocation(line: 935, column: 12, scope: !980)
!989 = !DILocation(line: 936, column: 15, scope: !980)
!990 = !DILocation(line: 936, column: 23, scope: !980)
!991 = !DILocation(line: 936, column: 22, scope: !980)
!992 = !DILocation(line: 936, column: 35, scope: !980)
!993 = !DILocation(line: 936, column: 44, scope: !980)
!994 = !DILocation(line: 936, column: 43, scope: !980)
!995 = !DILocation(line: 936, column: 32, scope: !980)
!996 = !DILocation(line: 936, column: 12, scope: !980)
!997 = !DILocation(line: 937, column: 10, scope: !980)
!998 = !DILocation(line: 937, column: 3, scope: !980)
!999 = !DILocation(line: 939, column: 1, scope: !964)
!1000 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !63, file: !63, line: 957, type: !1001, scopeLine: 958, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1001 = !DISubroutineType(types: !1002)
!1002 = !{!6, !6, !6, !6}
!1003 = !DILocalVariable(name: "fak1", arg: 1, scope: !1000, file: !63, line: 957, type: !6)
!1004 = !DILocation(line: 957, column: 33, scope: !1000)
!1005 = !DILocalVariable(name: "fak2", arg: 2, scope: !1000, file: !63, line: 957, type: !6)
!1006 = !DILocation(line: 957, column: 43, scope: !1000)
!1007 = !DILocalVariable(name: "div", arg: 3, scope: !1000, file: !63, line: 957, type: !6)
!1008 = !DILocation(line: 957, column: 53, scope: !1000)
!1009 = !DILocalVariable(name: "s32Temp1", scope: !1000, file: !63, line: 959, type: !71)
!1010 = !DILocation(line: 959, column: 6, scope: !1000)
!1011 = !DILocalVariable(name: "s32Temp2", scope: !1000, file: !63, line: 959, type: !71)
!1012 = !DILocation(line: 959, column: 20, scope: !1000)
!1013 = !DILocalVariable(name: "s32Temp3", scope: !1000, file: !63, line: 959, type: !71)
!1014 = !DILocation(line: 959, column: 34, scope: !1000)
!1015 = !DILocation(line: 960, column: 13, scope: !1000)
!1016 = !DILocation(line: 960, column: 20, scope: !1000)
!1017 = !DILocation(line: 960, column: 18, scope: !1000)
!1018 = !DILocation(line: 960, column: 11, scope: !1000)
!1019 = !DILocation(line: 961, column: 5, scope: !1020)
!1020 = distinct !DILexicalBlock(scope: !1000, file: !63, line: 961, column: 5)
!1021 = !DILocation(line: 961, column: 9, scope: !1020)
!1022 = !DILocation(line: 961, column: 5, scope: !1000)
!1023 = !DILocation(line: 963, column: 6, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1025, file: !63, line: 963, column: 6)
!1025 = distinct !DILexicalBlock(scope: !1020, file: !63, line: 962, column: 2)
!1026 = !DILocation(line: 963, column: 15, scope: !1024)
!1027 = !DILocation(line: 963, column: 6, scope: !1025)
!1028 = !DILocation(line: 965, column: 4, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1024, file: !63, line: 964, column: 3)
!1030 = !DILocation(line: 969, column: 4, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !1024, file: !63, line: 968, column: 3)
!1032 = !DILocation(line: 974, column: 15, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1020, file: !63, line: 973, column: 2)
!1034 = !DILocation(line: 974, column: 28, scope: !1033)
!1035 = !DILocation(line: 974, column: 39, scope: !1033)
!1036 = !DILocation(line: 974, column: 37, scope: !1033)
!1037 = !DILocation(line: 974, column: 46, scope: !1033)
!1038 = !DILocation(line: 974, column: 44, scope: !1033)
!1039 = !DILocation(line: 974, column: 24, scope: !1033)
!1040 = !DILocation(line: 974, column: 52, scope: !1033)
!1041 = !DILocation(line: 974, column: 12, scope: !1033)
!1042 = !DILocation(line: 975, column: 15, scope: !1033)
!1043 = !DILocation(line: 975, column: 24, scope: !1033)
!1044 = !DILocation(line: 975, column: 23, scope: !1033)
!1045 = !DILocation(line: 975, column: 32, scope: !1033)
!1046 = !DILocation(line: 975, column: 41, scope: !1033)
!1047 = !DILocation(line: 975, column: 40, scope: !1033)
!1048 = !DILocation(line: 975, column: 29, scope: !1033)
!1049 = !DILocation(line: 975, column: 12, scope: !1033)
!1050 = !DILocation(line: 976, column: 6, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1033, file: !63, line: 976, column: 6)
!1052 = !DILocation(line: 976, column: 15, scope: !1051)
!1053 = !DILocation(line: 976, column: 6, scope: !1033)
!1054 = !DILocation(line: 978, column: 7, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !1056, file: !63, line: 978, column: 7)
!1056 = distinct !DILexicalBlock(scope: !1051, file: !63, line: 977, column: 3)
!1057 = !DILocation(line: 978, column: 16, scope: !1055)
!1058 = !DILocation(line: 978, column: 7, scope: !1056)
!1059 = !DILocation(line: 980, column: 17, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !1055, file: !63, line: 979, column: 4)
!1061 = !DILocation(line: 980, column: 12, scope: !1060)
!1062 = !DILocation(line: 980, column: 5, scope: !1060)
!1063 = !DILocation(line: 984, column: 5, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1055, file: !63, line: 983, column: 4)
!1065 = !DILocation(line: 989, column: 4, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1051, file: !63, line: 988, column: 3)
!1067 = !DILocation(line: 992, column: 1, scope: !1000)
!1068 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !63, file: !63, line: 1010, type: !1069, scopeLine: 1011, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1069 = !DISubroutineType(types: !1070)
!1070 = !{!6, !6, !6, !21}
!1071 = !DILocalVariable(name: "data1", arg: 1, scope: !1068, file: !63, line: 1010, type: !6)
!1072 = !DILocation(line: 1010, column: 33, scope: !1068)
!1073 = !DILocalVariable(name: "data2", arg: 2, scope: !1068, file: !63, line: 1010, type: !6)
!1074 = !DILocation(line: 1010, column: 43, scope: !1068)
!1075 = !DILocalVariable(name: "denominator", arg: 3, scope: !1068, file: !63, line: 1010, type: !21)
!1076 = !DILocation(line: 1010, column: 53, scope: !1068)
!1077 = !DILocalVariable(name: "s32Result", scope: !1068, file: !63, line: 1012, type: !71)
!1078 = !DILocation(line: 1012, column: 6, scope: !1068)
!1079 = !DILocalVariable(name: "s32Temp1", scope: !1068, file: !63, line: 1012, type: !71)
!1080 = !DILocation(line: 1012, column: 21, scope: !1068)
!1081 = !DILocation(line: 1013, column: 14, scope: !1068)
!1082 = !DILocation(line: 1013, column: 22, scope: !1068)
!1083 = !DILocation(line: 1013, column: 20, scope: !1068)
!1084 = !DILocation(line: 1013, column: 12, scope: !1068)
!1085 = !DILocation(line: 1015, column: 5, scope: !1086)
!1086 = distinct !DILexicalBlock(scope: !1068, file: !63, line: 1015, column: 5)
!1087 = !DILocation(line: 1015, column: 17, scope: !1086)
!1088 = !DILocation(line: 1015, column: 5, scope: !1068)
!1089 = !DILocation(line: 1017, column: 6, scope: !1090)
!1090 = distinct !DILexicalBlock(scope: !1091, file: !63, line: 1017, column: 6)
!1091 = distinct !DILexicalBlock(scope: !1086, file: !63, line: 1016, column: 2)
!1092 = !DILocation(line: 1017, column: 16, scope: !1090)
!1093 = !DILocation(line: 1017, column: 6, scope: !1091)
!1094 = !DILocation(line: 1019, column: 4, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1090, file: !63, line: 1018, column: 3)
!1096 = !DILocation(line: 1021, column: 11, scope: !1097)
!1097 = distinct !DILexicalBlock(scope: !1090, file: !63, line: 1021, column: 11)
!1098 = !DILocation(line: 1021, column: 21, scope: !1097)
!1099 = !DILocation(line: 1021, column: 11, scope: !1090)
!1100 = !DILocation(line: 1023, column: 4, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1097, file: !63, line: 1022, column: 3)
!1102 = !DILocation(line: 1027, column: 4, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1097, file: !63, line: 1026, column: 3)
!1104 = !DILocation(line: 1032, column: 15, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1086, file: !63, line: 1031, column: 2)
!1106 = !DILocation(line: 1032, column: 28, scope: !1105)
!1107 = !DILocation(line: 1032, column: 38, scope: !1105)
!1108 = !DILocation(line: 1032, column: 37, scope: !1105)
!1109 = !DILocation(line: 1032, column: 51, scope: !1105)
!1110 = !DILocation(line: 1032, column: 50, scope: !1105)
!1111 = !DILocation(line: 1032, column: 25, scope: !1105)
!1112 = !DILocation(line: 1032, column: 64, scope: !1105)
!1113 = !DILocation(line: 1032, column: 12, scope: !1105)
!1114 = !DILocation(line: 1033, column: 16, scope: !1105)
!1115 = !DILocation(line: 1033, column: 25, scope: !1105)
!1116 = !DILocation(line: 1033, column: 24, scope: !1105)
!1117 = !DILocation(line: 1033, column: 41, scope: !1105)
!1118 = !DILocation(line: 1033, column: 51, scope: !1105)
!1119 = !DILocation(line: 1033, column: 50, scope: !1105)
!1120 = !DILocation(line: 1033, column: 38, scope: !1105)
!1121 = !DILocation(line: 1033, column: 13, scope: !1105)
!1122 = !DILocation(line: 1034, column: 6, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1105, file: !63, line: 1034, column: 6)
!1124 = !DILocation(line: 1034, column: 16, scope: !1123)
!1125 = !DILocation(line: 1034, column: 6, scope: !1105)
!1126 = !DILocation(line: 1036, column: 7, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1128, file: !63, line: 1036, column: 7)
!1128 = distinct !DILexicalBlock(scope: !1123, file: !63, line: 1035, column: 3)
!1129 = !DILocation(line: 1036, column: 17, scope: !1127)
!1130 = !DILocation(line: 1036, column: 7, scope: !1128)
!1131 = !DILocation(line: 1038, column: 17, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1127, file: !63, line: 1037, column: 4)
!1133 = !DILocation(line: 1038, column: 12, scope: !1132)
!1134 = !DILocation(line: 1038, column: 5, scope: !1132)
!1135 = !DILocation(line: 1042, column: 5, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1127, file: !63, line: 1041, column: 4)
!1137 = !DILocation(line: 1047, column: 4, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1123, file: !63, line: 1046, column: 3)
!1139 = !DILocation(line: 1051, column: 1, scope: !1068)
!1140 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !63, file: !63, line: 1068, type: !1141, scopeLine: 1069, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1141 = !DISubroutineType(types: !1142)
!1142 = !{!408, !408, !71}
!1143 = !DILocalVariable(name: "numerator", arg: 1, scope: !1140, file: !63, line: 1068, type: !408)
!1144 = !DILocation(line: 1068, column: 25, scope: !1140)
!1145 = !DILocalVariable(name: "denominator", arg: 2, scope: !1140, file: !63, line: 1068, type: !71)
!1146 = !DILocation(line: 1068, column: 40, scope: !1140)
!1147 = !DILocalVariable(name: "u32Temp1", scope: !1140, file: !63, line: 1070, type: !408)
!1148 = !DILocation(line: 1070, column: 6, scope: !1140)
!1149 = !DILocation(line: 1071, column: 5, scope: !1150)
!1150 = distinct !DILexicalBlock(scope: !1140, file: !63, line: 1071, column: 5)
!1151 = !DILocation(line: 1071, column: 17, scope: !1150)
!1152 = !DILocation(line: 1071, column: 5, scope: !1140)
!1153 = !DILocation(line: 1073, column: 3, scope: !1154)
!1154 = distinct !DILexicalBlock(scope: !1150, file: !63, line: 1072, column: 2)
!1155 = !DILocation(line: 1077, column: 6, scope: !1156)
!1156 = distinct !DILexicalBlock(scope: !1157, file: !63, line: 1077, column: 6)
!1157 = distinct !DILexicalBlock(scope: !1150, file: !63, line: 1076, column: 2)
!1158 = !DILocation(line: 1077, column: 18, scope: !1156)
!1159 = !DILocation(line: 1077, column: 6, scope: !1157)
!1160 = !DILocation(line: 1079, column: 4, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1156, file: !63, line: 1078, column: 3)
!1162 = !DILocation(line: 1083, column: 16, scope: !1163)
!1163 = distinct !DILexicalBlock(scope: !1156, file: !63, line: 1082, column: 3)
!1164 = !DILocation(line: 1083, column: 30, scope: !1163)
!1165 = !DILocation(line: 1083, column: 40, scope: !1163)
!1166 = !DILocation(line: 1083, column: 39, scope: !1163)
!1167 = !DILocation(line: 1083, column: 55, scope: !1163)
!1168 = !DILocation(line: 1083, column: 53, scope: !1163)
!1169 = !DILocation(line: 1083, column: 26, scope: !1163)
!1170 = !DILocation(line: 1083, column: 68, scope: !1163)
!1171 = !DILocation(line: 1083, column: 13, scope: !1163)
!1172 = !DILocation(line: 1084, column: 16, scope: !1163)
!1173 = !DILocation(line: 1084, column: 25, scope: !1163)
!1174 = !DILocation(line: 1084, column: 24, scope: !1163)
!1175 = !DILocation(line: 1084, column: 41, scope: !1163)
!1176 = !DILocation(line: 1084, column: 51, scope: !1163)
!1177 = !DILocation(line: 1084, column: 50, scope: !1163)
!1178 = !DILocation(line: 1084, column: 38, scope: !1163)
!1179 = !DILocation(line: 1084, column: 13, scope: !1163)
!1180 = !DILocation(line: 1085, column: 11, scope: !1163)
!1181 = !DILocation(line: 1085, column: 4, scope: !1163)
!1182 = !DILocation(line: 1088, column: 1, scope: !1140)
!1183 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !63, file: !63, line: 1105, type: !1184, scopeLine: 1106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1184 = !DISubroutineType(types: !1185)
!1185 = !{!408, !71, !408}
!1186 = !DILocalVariable(name: "numerator", arg: 1, scope: !1183, file: !63, line: 1105, type: !71)
!1187 = !DILocation(line: 1105, column: 25, scope: !1183)
!1188 = !DILocalVariable(name: "denominator", arg: 2, scope: !1183, file: !63, line: 1105, type: !408)
!1189 = !DILocation(line: 1105, column: 40, scope: !1183)
!1190 = !DILocalVariable(name: "s32Temp1", scope: !1183, file: !63, line: 1107, type: !71)
!1191 = !DILocation(line: 1107, column: 6, scope: !1183)
!1192 = !DILocation(line: 1108, column: 5, scope: !1193)
!1193 = distinct !DILexicalBlock(scope: !1183, file: !63, line: 1108, column: 5)
!1194 = !DILocation(line: 1108, column: 17, scope: !1193)
!1195 = !DILocation(line: 1108, column: 5, scope: !1183)
!1196 = !DILocation(line: 1110, column: 6, scope: !1197)
!1197 = distinct !DILexicalBlock(scope: !1198, file: !63, line: 1110, column: 6)
!1198 = distinct !DILexicalBlock(scope: !1193, file: !63, line: 1109, column: 2)
!1199 = !DILocation(line: 1110, column: 16, scope: !1197)
!1200 = !DILocation(line: 1110, column: 6, scope: !1198)
!1201 = !DILocation(line: 1112, column: 4, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1197, file: !63, line: 1111, column: 3)
!1203 = !DILocation(line: 1116, column: 4, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1197, file: !63, line: 1115, column: 3)
!1205 = !DILocation(line: 1121, column: 6, scope: !1206)
!1206 = distinct !DILexicalBlock(scope: !1207, file: !63, line: 1121, column: 6)
!1207 = distinct !DILexicalBlock(scope: !1193, file: !63, line: 1120, column: 2)
!1208 = !DILocation(line: 1121, column: 16, scope: !1206)
!1209 = !DILocation(line: 1121, column: 6, scope: !1207)
!1210 = !DILocation(line: 1123, column: 17, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1206, file: !63, line: 1122, column: 3)
!1212 = !DILocation(line: 1123, column: 31, scope: !1211)
!1213 = !DILocation(line: 1123, column: 41, scope: !1211)
!1214 = !DILocation(line: 1123, column: 40, scope: !1211)
!1215 = !DILocation(line: 1123, column: 56, scope: !1211)
!1216 = !DILocation(line: 1123, column: 54, scope: !1211)
!1217 = !DILocation(line: 1123, column: 27, scope: !1211)
!1218 = !DILocation(line: 1123, column: 69, scope: !1211)
!1219 = !DILocation(line: 1123, column: 13, scope: !1211)
!1220 = !DILocation(line: 1124, column: 13, scope: !1211)
!1221 = !DILocation(line: 1124, column: 23, scope: !1211)
!1222 = !DILocation(line: 1124, column: 22, scope: !1211)
!1223 = !DILocation(line: 1124, column: 39, scope: !1211)
!1224 = !DILocation(line: 1124, column: 48, scope: !1211)
!1225 = !DILocation(line: 1124, column: 47, scope: !1211)
!1226 = !DILocation(line: 1124, column: 36, scope: !1211)
!1227 = !DILocation(line: 1124, column: 4, scope: !1211)
!1228 = !DILocation(line: 1128, column: 4, scope: !1229)
!1229 = distinct !DILexicalBlock(scope: !1206, file: !63, line: 1127, column: 3)
!1230 = !DILocation(line: 1131, column: 1, scope: !1183)
!1231 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !63, file: !63, line: 1148, type: !1232, scopeLine: 1149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1232 = !DISubroutineType(types: !1233)
!1233 = !{!408, !71, !71}
!1234 = !DILocalVariable(name: "numerator", arg: 1, scope: !1231, file: !63, line: 1148, type: !71)
!1235 = !DILocation(line: 1148, column: 25, scope: !1231)
!1236 = !DILocalVariable(name: "denominator", arg: 2, scope: !1231, file: !63, line: 1148, type: !71)
!1237 = !DILocation(line: 1148, column: 40, scope: !1231)
!1238 = !DILocalVariable(name: "u32Temp1", scope: !1231, file: !63, line: 1150, type: !408)
!1239 = !DILocation(line: 1150, column: 6, scope: !1231)
!1240 = !DILocalVariable(name: "u32Temp2", scope: !1231, file: !63, line: 1150, type: !408)
!1241 = !DILocation(line: 1150, column: 20, scope: !1231)
!1242 = !DILocation(line: 1151, column: 5, scope: !1243)
!1243 = distinct !DILexicalBlock(scope: !1231, file: !63, line: 1151, column: 5)
!1244 = !DILocation(line: 1151, column: 17, scope: !1243)
!1245 = !DILocation(line: 1151, column: 5, scope: !1231)
!1246 = !DILocation(line: 1153, column: 6, scope: !1247)
!1247 = distinct !DILexicalBlock(scope: !1248, file: !63, line: 1153, column: 6)
!1248 = distinct !DILexicalBlock(scope: !1243, file: !63, line: 1152, column: 2)
!1249 = !DILocation(line: 1153, column: 16, scope: !1247)
!1250 = !DILocation(line: 1153, column: 6, scope: !1248)
!1251 = !DILocation(line: 1155, column: 4, scope: !1252)
!1252 = distinct !DILexicalBlock(scope: !1247, file: !63, line: 1154, column: 3)
!1253 = !DILocation(line: 1159, column: 4, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1247, file: !63, line: 1158, column: 3)
!1255 = !DILocation(line: 1164, column: 6, scope: !1256)
!1256 = distinct !DILexicalBlock(scope: !1257, file: !63, line: 1164, column: 6)
!1257 = distinct !DILexicalBlock(scope: !1243, file: !63, line: 1163, column: 2)
!1258 = !DILocation(line: 1164, column: 16, scope: !1256)
!1259 = !DILocation(line: 1164, column: 6, scope: !1257)
!1260 = !DILocation(line: 1166, column: 7, scope: !1261)
!1261 = distinct !DILexicalBlock(scope: !1262, file: !63, line: 1166, column: 7)
!1262 = distinct !DILexicalBlock(scope: !1256, file: !63, line: 1165, column: 3)
!1263 = !DILocation(line: 1166, column: 17, scope: !1261)
!1264 = !DILocation(line: 1166, column: 7, scope: !1262)
!1265 = !DILocation(line: 1168, column: 5, scope: !1266)
!1266 = distinct !DILexicalBlock(scope: !1261, file: !63, line: 1167, column: 4)
!1267 = !DILocation(line: 1172, column: 8, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1269, file: !63, line: 1172, column: 8)
!1269 = distinct !DILexicalBlock(scope: !1261, file: !63, line: 1171, column: 4)
!1270 = !DILocation(line: 1172, column: 20, scope: !1268)
!1271 = !DILocation(line: 1172, column: 8, scope: !1269)
!1272 = !DILocation(line: 1174, column: 6, scope: !1273)
!1273 = distinct !DILexicalBlock(scope: !1268, file: !63, line: 1173, column: 5)
!1274 = !DILocation(line: 1178, column: 18, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1268, file: !63, line: 1177, column: 5)
!1276 = !DILocation(line: 1178, column: 32, scope: !1275)
!1277 = !DILocation(line: 1178, column: 42, scope: !1275)
!1278 = !DILocation(line: 1178, column: 41, scope: !1275)
!1279 = !DILocation(line: 1178, column: 57, scope: !1275)
!1280 = !DILocation(line: 1178, column: 55, scope: !1275)
!1281 = !DILocation(line: 1178, column: 28, scope: !1275)
!1282 = !DILocation(line: 1178, column: 71, scope: !1275)
!1283 = !DILocation(line: 1178, column: 15, scope: !1275)
!1284 = !DILocation(line: 1179, column: 18, scope: !1275)
!1285 = !DILocation(line: 1179, column: 29, scope: !1275)
!1286 = !DILocation(line: 1179, column: 27, scope: !1275)
!1287 = !DILocation(line: 1179, column: 45, scope: !1275)
!1288 = !DILocation(line: 1179, column: 57, scope: !1275)
!1289 = !DILocation(line: 1179, column: 55, scope: !1275)
!1290 = !DILocation(line: 1179, column: 42, scope: !1275)
!1291 = !DILocation(line: 1179, column: 15, scope: !1275)
!1292 = !DILocation(line: 1180, column: 13, scope: !1275)
!1293 = !DILocation(line: 1180, column: 6, scope: !1275)
!1294 = !DILocation(line: 1186, column: 7, scope: !1295)
!1295 = distinct !DILexicalBlock(scope: !1296, file: !63, line: 1186, column: 7)
!1296 = distinct !DILexicalBlock(scope: !1256, file: !63, line: 1185, column: 3)
!1297 = !DILocation(line: 1186, column: 19, scope: !1295)
!1298 = !DILocation(line: 1186, column: 7, scope: !1296)
!1299 = !DILocation(line: 1188, column: 5, scope: !1300)
!1300 = distinct !DILexicalBlock(scope: !1295, file: !63, line: 1187, column: 4)
!1301 = !DILocation(line: 1192, column: 18, scope: !1302)
!1302 = distinct !DILexicalBlock(scope: !1295, file: !63, line: 1191, column: 4)
!1303 = !DILocation(line: 1192, column: 17, scope: !1302)
!1304 = !DILocation(line: 1192, column: 15, scope: !1302)
!1305 = !DILocation(line: 1193, column: 20, scope: !1302)
!1306 = !DILocation(line: 1193, column: 19, scope: !1302)
!1307 = !DILocation(line: 1193, column: 17, scope: !1302)
!1308 = !DILocation(line: 1194, column: 17, scope: !1302)
!1309 = !DILocation(line: 1194, column: 31, scope: !1302)
!1310 = !DILocation(line: 1194, column: 41, scope: !1302)
!1311 = !DILocation(line: 1194, column: 40, scope: !1302)
!1312 = !DILocation(line: 1194, column: 56, scope: !1302)
!1313 = !DILocation(line: 1194, column: 54, scope: !1302)
!1314 = !DILocation(line: 1194, column: 27, scope: !1302)
!1315 = !DILocation(line: 1194, column: 70, scope: !1302)
!1316 = !DILocation(line: 1194, column: 14, scope: !1302)
!1317 = !DILocation(line: 1195, column: 17, scope: !1302)
!1318 = !DILocation(line: 1195, column: 28, scope: !1302)
!1319 = !DILocation(line: 1195, column: 26, scope: !1302)
!1320 = !DILocation(line: 1195, column: 44, scope: !1302)
!1321 = !DILocation(line: 1195, column: 56, scope: !1302)
!1322 = !DILocation(line: 1195, column: 54, scope: !1302)
!1323 = !DILocation(line: 1195, column: 41, scope: !1302)
!1324 = !DILocation(line: 1195, column: 14, scope: !1302)
!1325 = !DILocation(line: 1196, column: 12, scope: !1302)
!1326 = !DILocation(line: 1196, column: 5, scope: !1302)
!1327 = !DILocation(line: 1201, column: 1, scope: !1231)
!1328 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !63, file: !63, line: 1218, type: !1329, scopeLine: 1219, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1329 = !DISubroutineType(types: !1330)
!1330 = !{!408, !408, !408}
!1331 = !DILocalVariable(name: "numerator", arg: 1, scope: !1328, file: !63, line: 1218, type: !408)
!1332 = !DILocation(line: 1218, column: 25, scope: !1328)
!1333 = !DILocalVariable(name: "denominator", arg: 2, scope: !1328, file: !63, line: 1218, type: !408)
!1334 = !DILocation(line: 1218, column: 40, scope: !1328)
!1335 = !DILocalVariable(name: "u32Temp1", scope: !1328, file: !63, line: 1221, type: !408)
!1336 = !DILocation(line: 1221, column: 6, scope: !1328)
!1337 = !DILocalVariable(name: "u32Temp2", scope: !1328, file: !63, line: 1221, type: !408)
!1338 = !DILocation(line: 1221, column: 20, scope: !1328)
!1339 = !DILocalVariable(name: "u32Temp3", scope: !1328, file: !63, line: 1221, type: !408)
!1340 = !DILocation(line: 1221, column: 34, scope: !1328)
!1341 = !DILocalVariable(name: "numerator_old", scope: !1328, file: !63, line: 1221, type: !408)
!1342 = !DILocation(line: 1221, column: 48, scope: !1328)
!1343 = !DILocation(line: 1222, column: 5, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1328, file: !63, line: 1222, column: 5)
!1345 = !DILocation(line: 1222, column: 16, scope: !1344)
!1346 = !DILocation(line: 1222, column: 5, scope: !1328)
!1347 = !DILocation(line: 1224, column: 3, scope: !1348)
!1348 = distinct !DILexicalBlock(scope: !1344, file: !63, line: 1223, column: 2)
!1349 = !DILocation(line: 1228, column: 14, scope: !1350)
!1350 = distinct !DILexicalBlock(scope: !1344, file: !63, line: 1227, column: 2)
!1351 = !DILocation(line: 1228, column: 26, scope: !1350)
!1352 = !DILocation(line: 1228, column: 41, scope: !1350)
!1353 = !DILocation(line: 1228, column: 51, scope: !1350)
!1354 = !DILocation(line: 1228, column: 50, scope: !1350)
!1355 = !DILocation(line: 1228, column: 38, scope: !1350)
!1356 = !DILocation(line: 1228, column: 24, scope: !1350)
!1357 = !DILocation(line: 1228, column: 12, scope: !1350)
!1358 = !DILocation(line: 1229, column: 7, scope: !1359)
!1359 = distinct !DILexicalBlock(scope: !1350, file: !63, line: 1229, column: 6)
!1360 = !DILocation(line: 1229, column: 16, scope: !1359)
!1361 = !DILocation(line: 1229, column: 24, scope: !1359)
!1362 = !DILocation(line: 1229, column: 6, scope: !1350)
!1363 = !DILocation(line: 1231, column: 16, scope: !1364)
!1364 = distinct !DILexicalBlock(scope: !1359, file: !63, line: 1230, column: 3)
!1365 = !DILocation(line: 1231, column: 27, scope: !1364)
!1366 = !DILocation(line: 1231, column: 13, scope: !1364)
!1367 = !DILocation(line: 1232, column: 3, scope: !1364)
!1368 = !DILocation(line: 1235, column: 16, scope: !1369)
!1369 = distinct !DILexicalBlock(scope: !1359, file: !63, line: 1234, column: 3)
!1370 = !DILocation(line: 1235, column: 27, scope: !1369)
!1371 = !DILocation(line: 1235, column: 32, scope: !1369)
!1372 = !DILocation(line: 1235, column: 13, scope: !1369)
!1373 = !DILocation(line: 1238, column: 6, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1350, file: !63, line: 1238, column: 6)
!1375 = !DILocation(line: 1238, column: 17, scope: !1374)
!1376 = !DILocation(line: 1238, column: 15, scope: !1374)
!1377 = !DILocation(line: 1238, column: 6, scope: !1350)
!1378 = !DILocation(line: 1240, column: 12, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1374, file: !63, line: 1239, column: 3)
!1380 = !DILocation(line: 1240, column: 22, scope: !1379)
!1381 = !DILocation(line: 1240, column: 21, scope: !1379)
!1382 = !DILocation(line: 1240, column: 4, scope: !1379)
!1383 = !DILocation(line: 1244, column: 13, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !1374, file: !63, line: 1243, column: 3)
!1385 = !DILocation(line: 1244, column: 23, scope: !1384)
!1386 = !DILocation(line: 1244, column: 22, scope: !1384)
!1387 = !DILocation(line: 1244, column: 36, scope: !1384)
!1388 = !DILocation(line: 1244, column: 4, scope: !1384)
!1389 = !DILocation(line: 1249, column: 1, scope: !1328)
!1390 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !63, file: !63, line: 1266, type: !1391, scopeLine: 1267, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1391 = !DISubroutineType(types: !1392)
!1392 = !{!71, !408, !71}
!1393 = !DILocalVariable(name: "numerator", arg: 1, scope: !1390, file: !63, line: 1266, type: !408)
!1394 = !DILocation(line: 1266, column: 25, scope: !1390)
!1395 = !DILocalVariable(name: "denominator", arg: 2, scope: !1390, file: !63, line: 1266, type: !71)
!1396 = !DILocation(line: 1266, column: 40, scope: !1390)
!1397 = !DILocalVariable(name: "u32Temp1", scope: !1390, file: !63, line: 1268, type: !408)
!1398 = !DILocation(line: 1268, column: 6, scope: !1390)
!1399 = !DILocalVariable(name: "u32Temp2", scope: !1390, file: !63, line: 1268, type: !408)
!1400 = !DILocation(line: 1268, column: 20, scope: !1390)
!1401 = !DILocation(line: 1269, column: 5, scope: !1402)
!1402 = distinct !DILexicalBlock(scope: !1390, file: !63, line: 1269, column: 5)
!1403 = !DILocation(line: 1269, column: 17, scope: !1402)
!1404 = !DILocation(line: 1269, column: 5, scope: !1390)
!1405 = !DILocation(line: 1271, column: 6, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1407, file: !63, line: 1271, column: 6)
!1407 = distinct !DILexicalBlock(scope: !1402, file: !63, line: 1270, column: 2)
!1408 = !DILocation(line: 1271, column: 18, scope: !1406)
!1409 = !DILocation(line: 1271, column: 6, scope: !1407)
!1410 = !DILocation(line: 1273, column: 4, scope: !1411)
!1411 = distinct !DILexicalBlock(scope: !1406, file: !63, line: 1272, column: 3)
!1412 = !DILocation(line: 1277, column: 19, scope: !1413)
!1413 = distinct !DILexicalBlock(scope: !1406, file: !63, line: 1276, column: 3)
!1414 = !DILocation(line: 1277, column: 18, scope: !1413)
!1415 = !DILocation(line: 1277, column: 16, scope: !1413)
!1416 = !DILocation(line: 1278, column: 16, scope: !1413)
!1417 = !DILocation(line: 1278, column: 30, scope: !1413)
!1418 = !DILocation(line: 1278, column: 40, scope: !1413)
!1419 = !DILocation(line: 1278, column: 39, scope: !1413)
!1420 = !DILocation(line: 1278, column: 55, scope: !1413)
!1421 = !DILocation(line: 1278, column: 53, scope: !1413)
!1422 = !DILocation(line: 1278, column: 26, scope: !1413)
!1423 = !DILocation(line: 1278, column: 69, scope: !1413)
!1424 = !DILocation(line: 1278, column: 13, scope: !1413)
!1425 = !DILocation(line: 1279, column: 16, scope: !1413)
!1426 = !DILocation(line: 1279, column: 25, scope: !1413)
!1427 = !DILocation(line: 1279, column: 24, scope: !1413)
!1428 = !DILocation(line: 1279, column: 41, scope: !1413)
!1429 = !DILocation(line: 1279, column: 51, scope: !1413)
!1430 = !DILocation(line: 1279, column: 50, scope: !1413)
!1431 = !DILocation(line: 1279, column: 38, scope: !1413)
!1432 = !DILocation(line: 1279, column: 13, scope: !1413)
!1433 = !DILocation(line: 1280, column: 7, scope: !1434)
!1434 = distinct !DILexicalBlock(scope: !1413, file: !63, line: 1280, column: 7)
!1435 = !DILocation(line: 1280, column: 16, scope: !1434)
!1436 = !DILocation(line: 1280, column: 7, scope: !1413)
!1437 = !DILocation(line: 1282, column: 13, scope: !1438)
!1438 = distinct !DILexicalBlock(scope: !1434, file: !63, line: 1281, column: 4)
!1439 = !DILocation(line: 1282, column: 12, scope: !1438)
!1440 = !DILocation(line: 1282, column: 5, scope: !1438)
!1441 = !DILocation(line: 1286, column: 5, scope: !1442)
!1442 = distinct !DILexicalBlock(scope: !1434, file: !63, line: 1285, column: 4)
!1443 = !DILocation(line: 1292, column: 15, scope: !1444)
!1444 = distinct !DILexicalBlock(scope: !1402, file: !63, line: 1291, column: 2)
!1445 = !DILocation(line: 1292, column: 29, scope: !1444)
!1446 = !DILocation(line: 1292, column: 39, scope: !1444)
!1447 = !DILocation(line: 1292, column: 38, scope: !1444)
!1448 = !DILocation(line: 1292, column: 54, scope: !1444)
!1449 = !DILocation(line: 1292, column: 52, scope: !1444)
!1450 = !DILocation(line: 1292, column: 25, scope: !1444)
!1451 = !DILocation(line: 1292, column: 68, scope: !1444)
!1452 = !DILocation(line: 1292, column: 12, scope: !1444)
!1453 = !DILocation(line: 1293, column: 15, scope: !1444)
!1454 = !DILocation(line: 1293, column: 24, scope: !1444)
!1455 = !DILocation(line: 1293, column: 23, scope: !1444)
!1456 = !DILocation(line: 1293, column: 40, scope: !1444)
!1457 = !DILocation(line: 1293, column: 50, scope: !1444)
!1458 = !DILocation(line: 1293, column: 49, scope: !1444)
!1459 = !DILocation(line: 1293, column: 37, scope: !1444)
!1460 = !DILocation(line: 1293, column: 12, scope: !1444)
!1461 = !DILocation(line: 1294, column: 6, scope: !1462)
!1462 = distinct !DILexicalBlock(scope: !1444, file: !63, line: 1294, column: 6)
!1463 = !DILocation(line: 1294, column: 15, scope: !1462)
!1464 = !DILocation(line: 1294, column: 6, scope: !1444)
!1465 = !DILocation(line: 1296, column: 11, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1462, file: !63, line: 1295, column: 3)
!1467 = !DILocation(line: 1296, column: 4, scope: !1466)
!1468 = !DILocation(line: 1300, column: 4, scope: !1469)
!1469 = distinct !DILexicalBlock(scope: !1462, file: !63, line: 1299, column: 3)
!1470 = !DILocation(line: 1303, column: 1, scope: !1390)
!1471 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !63, file: !63, line: 1321, type: !1472, scopeLine: 1322, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1472 = !DISubroutineType(types: !1473)
!1473 = !{!71, !71, !408}
!1474 = !DILocalVariable(name: "numerator", arg: 1, scope: !1471, file: !63, line: 1321, type: !71)
!1475 = !DILocation(line: 1321, column: 25, scope: !1471)
!1476 = !DILocalVariable(name: "denominator", arg: 2, scope: !1471, file: !63, line: 1321, type: !408)
!1477 = !DILocation(line: 1321, column: 40, scope: !1471)
!1478 = !DILocalVariable(name: "s32Temp1", scope: !1471, file: !63, line: 1323, type: !71)
!1479 = !DILocation(line: 1323, column: 6, scope: !1471)
!1480 = !DILocalVariable(name: "s32Temp2", scope: !1471, file: !63, line: 1323, type: !71)
!1481 = !DILocation(line: 1323, column: 20, scope: !1471)
!1482 = !DILocalVariable(name: "u32Temp0", scope: !1471, file: !63, line: 1324, type: !408)
!1483 = !DILocation(line: 1324, column: 6, scope: !1471)
!1484 = !DILocalVariable(name: "u32Temp1", scope: !1471, file: !63, line: 1324, type: !408)
!1485 = !DILocation(line: 1324, column: 20, scope: !1471)
!1486 = !DILocalVariable(name: "u32Temp2", scope: !1471, file: !63, line: 1324, type: !408)
!1487 = !DILocation(line: 1324, column: 34, scope: !1471)
!1488 = !DILocation(line: 1325, column: 5, scope: !1489)
!1489 = distinct !DILexicalBlock(scope: !1471, file: !63, line: 1325, column: 5)
!1490 = !DILocation(line: 1325, column: 17, scope: !1489)
!1491 = !DILocation(line: 1325, column: 5, scope: !1471)
!1492 = !DILocation(line: 1327, column: 6, scope: !1493)
!1493 = distinct !DILexicalBlock(scope: !1494, file: !63, line: 1327, column: 6)
!1494 = distinct !DILexicalBlock(scope: !1489, file: !63, line: 1326, column: 2)
!1495 = !DILocation(line: 1327, column: 16, scope: !1493)
!1496 = !DILocation(line: 1327, column: 6, scope: !1494)
!1497 = !DILocation(line: 1329, column: 4, scope: !1498)
!1498 = distinct !DILexicalBlock(scope: !1493, file: !63, line: 1328, column: 3)
!1499 = !DILocation(line: 1333, column: 4, scope: !1500)
!1500 = distinct !DILexicalBlock(scope: !1493, file: !63, line: 1332, column: 3)
!1501 = !DILocation(line: 1338, column: 6, scope: !1502)
!1502 = distinct !DILexicalBlock(scope: !1503, file: !63, line: 1338, column: 6)
!1503 = distinct !DILexicalBlock(scope: !1489, file: !63, line: 1337, column: 2)
!1504 = !DILocation(line: 1338, column: 16, scope: !1502)
!1505 = !DILocation(line: 1338, column: 6, scope: !1503)
!1506 = !DILocation(line: 1340, column: 16, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1502, file: !63, line: 1339, column: 3)
!1508 = !DILocation(line: 1340, column: 15, scope: !1507)
!1509 = !DILocation(line: 1340, column: 13, scope: !1507)
!1510 = !DILocation(line: 1341, column: 16, scope: !1507)
!1511 = !DILocation(line: 1341, column: 25, scope: !1507)
!1512 = !DILocation(line: 1341, column: 24, scope: !1507)
!1513 = !DILocation(line: 1341, column: 13, scope: !1507)
!1514 = !DILocation(line: 1342, column: 15, scope: !1507)
!1515 = !DILocation(line: 1342, column: 28, scope: !1507)
!1516 = !DILocation(line: 1342, column: 37, scope: !1507)
!1517 = !DILocation(line: 1342, column: 36, scope: !1507)
!1518 = !DILocation(line: 1342, column: 52, scope: !1507)
!1519 = !DILocation(line: 1342, column: 50, scope: !1507)
!1520 = !DILocation(line: 1342, column: 24, scope: !1507)
!1521 = !DILocation(line: 1342, column: 13, scope: !1507)
!1522 = !DILocation(line: 1344, column: 8, scope: !1523)
!1523 = distinct !DILexicalBlock(scope: !1507, file: !63, line: 1344, column: 7)
!1524 = !DILocation(line: 1344, column: 20, scope: !1523)
!1525 = !DILocation(line: 1344, column: 27, scope: !1523)
!1526 = !DILocation(line: 1344, column: 7, scope: !1507)
!1527 = !DILocation(line: 1346, column: 20, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1523, file: !63, line: 1345, column: 4)
!1529 = !DILocation(line: 1346, column: 32, scope: !1528)
!1530 = !DILocation(line: 1346, column: 17, scope: !1528)
!1531 = !DILocation(line: 1347, column: 4, scope: !1528)
!1532 = !DILocation(line: 1350, column: 20, scope: !1533)
!1533 = distinct !DILexicalBlock(scope: !1523, file: !63, line: 1349, column: 4)
!1534 = !DILocation(line: 1350, column: 32, scope: !1533)
!1535 = !DILocation(line: 1350, column: 38, scope: !1533)
!1536 = !DILocation(line: 1350, column: 17, scope: !1533)
!1537 = !DILocation(line: 1354, column: 7, scope: !1538)
!1538 = distinct !DILexicalBlock(scope: !1507, file: !63, line: 1354, column: 7)
!1539 = !DILocation(line: 1354, column: 18, scope: !1538)
!1540 = !DILocation(line: 1354, column: 16, scope: !1538)
!1541 = !DILocation(line: 1354, column: 7, scope: !1507)
!1542 = !DILocation(line: 1356, column: 14, scope: !1543)
!1543 = distinct !DILexicalBlock(scope: !1538, file: !63, line: 1355, column: 4)
!1544 = !DILocation(line: 1356, column: 13, scope: !1543)
!1545 = !DILocation(line: 1356, column: 23, scope: !1543)
!1546 = !DILocation(line: 1356, column: 5, scope: !1543)
!1547 = !DILocation(line: 1360, column: 14, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1538, file: !63, line: 1359, column: 4)
!1549 = !DILocation(line: 1360, column: 23, scope: !1548)
!1550 = !DILocation(line: 1360, column: 12, scope: !1548)
!1551 = !DILocation(line: 1360, column: 27, scope: !1548)
!1552 = !DILocation(line: 1360, column: 5, scope: !1548)
!1553 = !DILocation(line: 1367, column: 16, scope: !1554)
!1554 = distinct !DILexicalBlock(scope: !1502, file: !63, line: 1366, column: 3)
!1555 = !DILocation(line: 1367, column: 30, scope: !1554)
!1556 = !DILocation(line: 1367, column: 40, scope: !1554)
!1557 = !DILocation(line: 1367, column: 39, scope: !1554)
!1558 = !DILocation(line: 1367, column: 55, scope: !1554)
!1559 = !DILocation(line: 1367, column: 53, scope: !1554)
!1560 = !DILocation(line: 1367, column: 26, scope: !1554)
!1561 = !DILocation(line: 1367, column: 69, scope: !1554)
!1562 = !DILocation(line: 1367, column: 13, scope: !1554)
!1563 = !DILocation(line: 1368, column: 16, scope: !1554)
!1564 = !DILocation(line: 1368, column: 26, scope: !1554)
!1565 = !DILocation(line: 1368, column: 25, scope: !1554)
!1566 = !DILocation(line: 1368, column: 42, scope: !1554)
!1567 = !DILocation(line: 1368, column: 51, scope: !1554)
!1568 = !DILocation(line: 1368, column: 50, scope: !1554)
!1569 = !DILocation(line: 1368, column: 39, scope: !1554)
!1570 = !DILocation(line: 1368, column: 13, scope: !1554)
!1571 = !DILocation(line: 1369, column: 11, scope: !1554)
!1572 = !DILocation(line: 1369, column: 4, scope: !1554)
!1573 = !DILocation(line: 1372, column: 1, scope: !1471)
!1574 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !63, file: !63, line: 1389, type: !1575, scopeLine: 1390, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1575 = !DISubroutineType(types: !1576)
!1576 = !{!71, !71, !71}
!1577 = !DILocalVariable(name: "numerator", arg: 1, scope: !1574, file: !63, line: 1389, type: !71)
!1578 = !DILocation(line: 1389, column: 25, scope: !1574)
!1579 = !DILocalVariable(name: "denominator", arg: 2, scope: !1574, file: !63, line: 1389, type: !71)
!1580 = !DILocation(line: 1389, column: 40, scope: !1574)
!1581 = !DILocalVariable(name: "s32Temp1", scope: !1574, file: !63, line: 1391, type: !71)
!1582 = !DILocation(line: 1391, column: 6, scope: !1574)
!1583 = !DILocalVariable(name: "s32Temp2", scope: !1574, file: !63, line: 1391, type: !71)
!1584 = !DILocation(line: 1391, column: 20, scope: !1574)
!1585 = !DILocalVariable(name: "denominator_prime", scope: !1574, file: !63, line: 1392, type: !408)
!1586 = !DILocation(line: 1392, column: 6, scope: !1574)
!1587 = !DILocalVariable(name: "u32Temp1", scope: !1574, file: !63, line: 1392, type: !408)
!1588 = !DILocation(line: 1392, column: 29, scope: !1574)
!1589 = !DILocalVariable(name: "u32Temp2", scope: !1574, file: !63, line: 1392, type: !408)
!1590 = !DILocation(line: 1392, column: 43, scope: !1574)
!1591 = !DILocalVariable(name: "u32numerator", scope: !1574, file: !63, line: 1393, type: !408)
!1592 = !DILocation(line: 1393, column: 6, scope: !1574)
!1593 = !DILocalVariable(name: "u32denominator", scope: !1574, file: !63, line: 1393, type: !408)
!1594 = !DILocation(line: 1393, column: 23, scope: !1574)
!1595 = !DILocation(line: 1394, column: 5, scope: !1596)
!1596 = distinct !DILexicalBlock(scope: !1574, file: !63, line: 1394, column: 5)
!1597 = !DILocation(line: 1394, column: 15, scope: !1596)
!1598 = !DILocation(line: 1394, column: 5, scope: !1574)
!1599 = !DILocation(line: 1396, column: 6, scope: !1600)
!1600 = distinct !DILexicalBlock(scope: !1601, file: !63, line: 1396, column: 6)
!1601 = distinct !DILexicalBlock(scope: !1596, file: !63, line: 1395, column: 2)
!1602 = !DILocation(line: 1396, column: 18, scope: !1600)
!1603 = !DILocation(line: 1396, column: 6, scope: !1601)
!1604 = !DILocation(line: 1398, column: 7, scope: !1605)
!1605 = distinct !DILexicalBlock(scope: !1606, file: !63, line: 1398, column: 7)
!1606 = distinct !DILexicalBlock(scope: !1600, file: !63, line: 1397, column: 3)
!1607 = !DILocation(line: 1398, column: 19, scope: !1605)
!1608 = !DILocation(line: 1398, column: 7, scope: !1606)
!1609 = !DILocation(line: 1400, column: 5, scope: !1610)
!1610 = distinct !DILexicalBlock(scope: !1605, file: !63, line: 1399, column: 4)
!1611 = !DILocation(line: 1404, column: 21, scope: !1612)
!1612 = distinct !DILexicalBlock(scope: !1605, file: !63, line: 1403, column: 4)
!1613 = !DILocation(line: 1404, column: 20, scope: !1612)
!1614 = !DILocation(line: 1404, column: 18, scope: !1612)
!1615 = !DILocation(line: 1405, column: 23, scope: !1612)
!1616 = !DILocation(line: 1405, column: 22, scope: !1612)
!1617 = !DILocation(line: 1405, column: 20, scope: !1612)
!1618 = !DILocation(line: 1406, column: 16, scope: !1612)
!1619 = !DILocation(line: 1406, column: 33, scope: !1612)
!1620 = !DILocation(line: 1406, column: 46, scope: !1612)
!1621 = !DILocation(line: 1406, column: 45, scope: !1612)
!1622 = !DILocation(line: 1406, column: 64, scope: !1612)
!1623 = !DILocation(line: 1406, column: 62, scope: !1612)
!1624 = !DILocation(line: 1406, column: 29, scope: !1612)
!1625 = !DILocation(line: 1406, column: 81, scope: !1612)
!1626 = !DILocation(line: 1406, column: 14, scope: !1612)
!1627 = !DILocation(line: 1407, column: 17, scope: !1612)
!1628 = !DILocation(line: 1407, column: 30, scope: !1612)
!1629 = !DILocation(line: 1407, column: 29, scope: !1612)
!1630 = !DILocation(line: 1407, column: 49, scope: !1612)
!1631 = !DILocation(line: 1407, column: 58, scope: !1612)
!1632 = !DILocation(line: 1407, column: 57, scope: !1612)
!1633 = !DILocation(line: 1407, column: 46, scope: !1612)
!1634 = !DILocation(line: 1407, column: 14, scope: !1612)
!1635 = !DILocation(line: 1408, column: 8, scope: !1636)
!1636 = distinct !DILexicalBlock(scope: !1612, file: !63, line: 1408, column: 8)
!1637 = !DILocation(line: 1408, column: 17, scope: !1636)
!1638 = !DILocation(line: 1408, column: 8, scope: !1612)
!1639 = !DILocation(line: 1410, column: 13, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1636, file: !63, line: 1409, column: 5)
!1641 = !DILocation(line: 1410, column: 6, scope: !1640)
!1642 = !DILocation(line: 1414, column: 6, scope: !1643)
!1643 = distinct !DILexicalBlock(scope: !1636, file: !63, line: 1413, column: 5)
!1644 = !DILocation(line: 1420, column: 20, scope: !1645)
!1645 = distinct !DILexicalBlock(scope: !1600, file: !63, line: 1419, column: 3)
!1646 = !DILocation(line: 1420, column: 19, scope: !1645)
!1647 = !DILocation(line: 1420, column: 29, scope: !1645)
!1648 = !DILocation(line: 1420, column: 17, scope: !1645)
!1649 = !DILocation(line: 1421, column: 16, scope: !1645)
!1650 = !DILocation(line: 1421, column: 33, scope: !1645)
!1651 = !DILocation(line: 1421, column: 46, scope: !1645)
!1652 = !DILocation(line: 1421, column: 45, scope: !1645)
!1653 = !DILocation(line: 1421, column: 61, scope: !1645)
!1654 = !DILocation(line: 1421, column: 59, scope: !1645)
!1655 = !DILocation(line: 1421, column: 29, scope: !1645)
!1656 = !DILocation(line: 1421, column: 75, scope: !1645)
!1657 = !DILocation(line: 1421, column: 13, scope: !1645)
!1658 = !DILocation(line: 1422, column: 16, scope: !1645)
!1659 = !DILocation(line: 1422, column: 29, scope: !1645)
!1660 = !DILocation(line: 1422, column: 28, scope: !1645)
!1661 = !DILocation(line: 1422, column: 45, scope: !1645)
!1662 = !DILocation(line: 1422, column: 54, scope: !1645)
!1663 = !DILocation(line: 1422, column: 53, scope: !1645)
!1664 = !DILocation(line: 1422, column: 42, scope: !1645)
!1665 = !DILocation(line: 1422, column: 13, scope: !1645)
!1666 = !DILocation(line: 1423, column: 13, scope: !1645)
!1667 = !DILocation(line: 1423, column: 12, scope: !1645)
!1668 = !DILocation(line: 1423, column: 22, scope: !1645)
!1669 = !DILocation(line: 1423, column: 4, scope: !1645)
!1670 = !DILocation(line: 1428, column: 6, scope: !1671)
!1671 = distinct !DILexicalBlock(scope: !1672, file: !63, line: 1428, column: 6)
!1672 = distinct !DILexicalBlock(scope: !1596, file: !63, line: 1427, column: 2)
!1673 = !DILocation(line: 1428, column: 18, scope: !1671)
!1674 = !DILocation(line: 1428, column: 6, scope: !1672)
!1675 = !DILocation(line: 1430, column: 7, scope: !1676)
!1676 = distinct !DILexicalBlock(scope: !1677, file: !63, line: 1430, column: 7)
!1677 = distinct !DILexicalBlock(scope: !1671, file: !63, line: 1429, column: 3)
!1678 = !DILocation(line: 1430, column: 19, scope: !1676)
!1679 = !DILocation(line: 1430, column: 7, scope: !1677)
!1680 = !DILocation(line: 1432, column: 5, scope: !1681)
!1681 = distinct !DILexicalBlock(scope: !1676, file: !63, line: 1431, column: 4)
!1682 = !DILocation(line: 1436, column: 23, scope: !1683)
!1683 = distinct !DILexicalBlock(scope: !1676, file: !63, line: 1435, column: 4)
!1684 = !DILocation(line: 1436, column: 22, scope: !1683)
!1685 = !DILocation(line: 1436, column: 35, scope: !1683)
!1686 = !DILocation(line: 1436, column: 20, scope: !1683)
!1687 = !DILocation(line: 1437, column: 17, scope: !1683)
!1688 = !DILocation(line: 1437, column: 31, scope: !1683)
!1689 = !DILocation(line: 1437, column: 41, scope: !1683)
!1690 = !DILocation(line: 1437, column: 40, scope: !1683)
!1691 = !DILocation(line: 1437, column: 59, scope: !1683)
!1692 = !DILocation(line: 1437, column: 57, scope: !1683)
!1693 = !DILocation(line: 1437, column: 27, scope: !1683)
!1694 = !DILocation(line: 1437, column: 76, scope: !1683)
!1695 = !DILocation(line: 1437, column: 14, scope: !1683)
!1696 = !DILocation(line: 1438, column: 17, scope: !1683)
!1697 = !DILocation(line: 1438, column: 27, scope: !1683)
!1698 = !DILocation(line: 1438, column: 26, scope: !1683)
!1699 = !DILocation(line: 1438, column: 46, scope: !1683)
!1700 = !DILocation(line: 1438, column: 55, scope: !1683)
!1701 = !DILocation(line: 1438, column: 54, scope: !1683)
!1702 = !DILocation(line: 1438, column: 43, scope: !1683)
!1703 = !DILocation(line: 1438, column: 14, scope: !1683)
!1704 = !DILocation(line: 1439, column: 14, scope: !1683)
!1705 = !DILocation(line: 1439, column: 13, scope: !1683)
!1706 = !DILocation(line: 1439, column: 23, scope: !1683)
!1707 = !DILocation(line: 1439, column: 5, scope: !1683)
!1708 = !DILocation(line: 1444, column: 16, scope: !1709)
!1709 = distinct !DILexicalBlock(scope: !1671, file: !63, line: 1443, column: 3)
!1710 = !DILocation(line: 1444, column: 30, scope: !1709)
!1711 = !DILocation(line: 1444, column: 40, scope: !1709)
!1712 = !DILocation(line: 1444, column: 39, scope: !1709)
!1713 = !DILocation(line: 1444, column: 55, scope: !1709)
!1714 = !DILocation(line: 1444, column: 53, scope: !1709)
!1715 = !DILocation(line: 1444, column: 26, scope: !1709)
!1716 = !DILocation(line: 1444, column: 69, scope: !1709)
!1717 = !DILocation(line: 1444, column: 13, scope: !1709)
!1718 = !DILocation(line: 1445, column: 16, scope: !1709)
!1719 = !DILocation(line: 1445, column: 26, scope: !1709)
!1720 = !DILocation(line: 1445, column: 25, scope: !1709)
!1721 = !DILocation(line: 1445, column: 42, scope: !1709)
!1722 = !DILocation(line: 1445, column: 51, scope: !1709)
!1723 = !DILocation(line: 1445, column: 50, scope: !1709)
!1724 = !DILocation(line: 1445, column: 39, scope: !1709)
!1725 = !DILocation(line: 1445, column: 13, scope: !1709)
!1726 = !DILocation(line: 1446, column: 11, scope: !1709)
!1727 = !DILocation(line: 1446, column: 4, scope: !1709)
!1728 = !DILocation(line: 1449, column: 1, scope: !1574)
!1729 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !63, file: !63, line: 1467, type: !1730, scopeLine: 1468, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1730 = !DISubroutineType(types: !1731)
!1731 = !{!6, !71, !408}
!1732 = !DILocalVariable(name: "numerator", arg: 1, scope: !1729, file: !63, line: 1467, type: !71)
!1733 = !DILocation(line: 1467, column: 25, scope: !1729)
!1734 = !DILocalVariable(name: "denominator", arg: 2, scope: !1729, file: !63, line: 1467, type: !408)
!1735 = !DILocation(line: 1467, column: 40, scope: !1729)
!1736 = !DILocalVariable(name: "numerator_prime", scope: !1729, file: !63, line: 1470, type: !408)
!1737 = !DILocation(line: 1470, column: 6, scope: !1729)
!1738 = !DILocalVariable(name: "u32Temp1", scope: !1729, file: !63, line: 1470, type: !408)
!1739 = !DILocation(line: 1470, column: 27, scope: !1729)
!1740 = !DILocalVariable(name: "u32Temp2", scope: !1729, file: !63, line: 1470, type: !408)
!1741 = !DILocation(line: 1470, column: 41, scope: !1729)
!1742 = !DILocalVariable(name: "u32Temp3", scope: !1729, file: !63, line: 1470, type: !408)
!1743 = !DILocation(line: 1470, column: 55, scope: !1729)
!1744 = !DILocalVariable(name: "s32Temp1", scope: !1729, file: !63, line: 1471, type: !71)
!1745 = !DILocation(line: 1471, column: 6, scope: !1729)
!1746 = !DILocalVariable(name: "s32Temp2", scope: !1729, file: !63, line: 1471, type: !71)
!1747 = !DILocation(line: 1471, column: 20, scope: !1729)
!1748 = !DILocalVariable(name: "s32Temp3", scope: !1729, file: !63, line: 1471, type: !71)
!1749 = !DILocation(line: 1471, column: 34, scope: !1729)
!1750 = !DILocation(line: 1472, column: 5, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1729, file: !63, line: 1472, column: 5)
!1752 = !DILocation(line: 1472, column: 17, scope: !1751)
!1753 = !DILocation(line: 1472, column: 5, scope: !1729)
!1754 = !DILocation(line: 1474, column: 6, scope: !1755)
!1755 = distinct !DILexicalBlock(scope: !1756, file: !63, line: 1474, column: 6)
!1756 = distinct !DILexicalBlock(scope: !1751, file: !63, line: 1473, column: 2)
!1757 = !DILocation(line: 1474, column: 15, scope: !1755)
!1758 = !DILocation(line: 1474, column: 6, scope: !1756)
!1759 = !DILocation(line: 1476, column: 4, scope: !1760)
!1760 = distinct !DILexicalBlock(scope: !1755, file: !63, line: 1475, column: 3)
!1761 = !DILocation(line: 1480, column: 4, scope: !1762)
!1762 = distinct !DILexicalBlock(scope: !1755, file: !63, line: 1479, column: 3)
!1763 = !DILocation(line: 1485, column: 6, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1765, file: !63, line: 1485, column: 6)
!1765 = distinct !DILexicalBlock(scope: !1751, file: !63, line: 1484, column: 2)
!1766 = !DILocation(line: 1485, column: 16, scope: !1764)
!1767 = !DILocation(line: 1485, column: 6, scope: !1765)
!1768 = !DILocation(line: 1487, column: 23, scope: !1769)
!1769 = distinct !DILexicalBlock(scope: !1764, file: !63, line: 1486, column: 3)
!1770 = !DILocation(line: 1487, column: 22, scope: !1769)
!1771 = !DILocation(line: 1487, column: 20, scope: !1769)
!1772 = !DILocation(line: 1488, column: 16, scope: !1769)
!1773 = !DILocation(line: 1488, column: 32, scope: !1769)
!1774 = !DILocation(line: 1488, column: 31, scope: !1769)
!1775 = !DILocation(line: 1488, column: 13, scope: !1769)
!1776 = !DILocation(line: 1489, column: 15, scope: !1769)
!1777 = !DILocation(line: 1489, column: 34, scope: !1769)
!1778 = !DILocation(line: 1489, column: 45, scope: !1769)
!1779 = !DILocation(line: 1489, column: 43, scope: !1769)
!1780 = !DILocation(line: 1489, column: 31, scope: !1769)
!1781 = !DILocation(line: 1489, column: 13, scope: !1769)
!1782 = !DILocation(line: 1491, column: 8, scope: !1783)
!1783 = distinct !DILexicalBlock(scope: !1769, file: !63, line: 1491, column: 7)
!1784 = !DILocation(line: 1491, column: 20, scope: !1783)
!1785 = !DILocation(line: 1491, column: 27, scope: !1783)
!1786 = !DILocation(line: 1491, column: 7, scope: !1769)
!1787 = !DILocation(line: 1493, column: 19, scope: !1788)
!1788 = distinct !DILexicalBlock(scope: !1783, file: !63, line: 1492, column: 4)
!1789 = !DILocation(line: 1493, column: 31, scope: !1788)
!1790 = !DILocation(line: 1493, column: 17, scope: !1788)
!1791 = !DILocation(line: 1494, column: 4, scope: !1788)
!1792 = !DILocation(line: 1497, column: 20, scope: !1793)
!1793 = distinct !DILexicalBlock(scope: !1783, file: !63, line: 1496, column: 4)
!1794 = !DILocation(line: 1497, column: 32, scope: !1793)
!1795 = !DILocation(line: 1497, column: 38, scope: !1793)
!1796 = !DILocation(line: 1497, column: 17, scope: !1793)
!1797 = !DILocation(line: 1500, column: 7, scope: !1798)
!1798 = distinct !DILexicalBlock(scope: !1769, file: !63, line: 1500, column: 7)
!1799 = !DILocation(line: 1500, column: 18, scope: !1798)
!1800 = !DILocation(line: 1500, column: 16, scope: !1798)
!1801 = !DILocation(line: 1500, column: 7, scope: !1769)
!1802 = !DILocation(line: 1502, column: 18, scope: !1803)
!1803 = distinct !DILexicalBlock(scope: !1798, file: !63, line: 1501, column: 4)
!1804 = !DILocation(line: 1502, column: 16, scope: !1803)
!1805 = !DILocation(line: 1502, column: 28, scope: !1803)
!1806 = !DILocation(line: 1502, column: 14, scope: !1803)
!1807 = !DILocation(line: 1503, column: 4, scope: !1803)
!1808 = !DILocation(line: 1506, column: 18, scope: !1809)
!1809 = distinct !DILexicalBlock(scope: !1798, file: !63, line: 1505, column: 4)
!1810 = !DILocation(line: 1506, column: 26, scope: !1809)
!1811 = !DILocation(line: 1506, column: 16, scope: !1809)
!1812 = !DILocation(line: 1506, column: 30, scope: !1809)
!1813 = !DILocation(line: 1506, column: 14, scope: !1809)
!1814 = !DILocation(line: 1508, column: 8, scope: !1815)
!1815 = distinct !DILexicalBlock(scope: !1769, file: !63, line: 1508, column: 7)
!1816 = !DILocation(line: 1508, column: 18, scope: !1815)
!1817 = !DILocation(line: 1508, column: 7, scope: !1769)
!1818 = !DILocation(line: 1510, column: 18, scope: !1819)
!1819 = distinct !DILexicalBlock(scope: !1815, file: !63, line: 1509, column: 4)
!1820 = !DILocation(line: 1510, column: 12, scope: !1819)
!1821 = !DILocation(line: 1510, column: 5, scope: !1819)
!1822 = !DILocation(line: 1514, column: 5, scope: !1823)
!1823 = distinct !DILexicalBlock(scope: !1815, file: !63, line: 1513, column: 4)
!1824 = !DILocation(line: 1519, column: 16, scope: !1825)
!1825 = distinct !DILexicalBlock(scope: !1764, file: !63, line: 1518, column: 3)
!1826 = !DILocation(line: 1519, column: 26, scope: !1825)
!1827 = !DILocation(line: 1519, column: 25, scope: !1825)
!1828 = !DILocation(line: 1519, column: 41, scope: !1825)
!1829 = !DILocation(line: 1519, column: 39, scope: !1825)
!1830 = !DILocation(line: 1519, column: 13, scope: !1825)
!1831 = !DILocation(line: 1520, column: 16, scope: !1825)
!1832 = !DILocation(line: 1520, column: 30, scope: !1825)
!1833 = !DILocation(line: 1520, column: 40, scope: !1825)
!1834 = !DILocation(line: 1520, column: 39, scope: !1825)
!1835 = !DILocation(line: 1520, column: 55, scope: !1825)
!1836 = !DILocation(line: 1520, column: 53, scope: !1825)
!1837 = !DILocation(line: 1520, column: 26, scope: !1825)
!1838 = !DILocation(line: 1520, column: 68, scope: !1825)
!1839 = !DILocation(line: 1520, column: 13, scope: !1825)
!1840 = !DILocation(line: 1521, column: 16, scope: !1825)
!1841 = !DILocation(line: 1521, column: 25, scope: !1825)
!1842 = !DILocation(line: 1521, column: 24, scope: !1825)
!1843 = !DILocation(line: 1521, column: 41, scope: !1825)
!1844 = !DILocation(line: 1521, column: 51, scope: !1825)
!1845 = !DILocation(line: 1521, column: 50, scope: !1825)
!1846 = !DILocation(line: 1521, column: 38, scope: !1825)
!1847 = !DILocation(line: 1521, column: 13, scope: !1825)
!1848 = !DILocation(line: 1522, column: 7, scope: !1849)
!1849 = distinct !DILexicalBlock(scope: !1825, file: !63, line: 1522, column: 7)
!1850 = !DILocation(line: 1522, column: 16, scope: !1849)
!1851 = !DILocation(line: 1522, column: 7, scope: !1825)
!1852 = !DILocation(line: 1524, column: 17, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !1849, file: !63, line: 1523, column: 4)
!1854 = !DILocation(line: 1524, column: 12, scope: !1853)
!1855 = !DILocation(line: 1524, column: 5, scope: !1853)
!1856 = !DILocation(line: 1528, column: 5, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1849, file: !63, line: 1527, column: 4)
!1858 = !DILocation(line: 1532, column: 1, scope: !1729)
!1859 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1860, file: !1860, line: 12, type: !1861, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !30, retainedNodes: !1864)
!1860 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1861 = !DISubroutineType(types: !1862)
!1862 = !{null, !1863}
!1863 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1864 = !{!1865}
!1865 = !DILocalVariable(name: "z", arg: 1, scope: !1859, file: !1860, line: 12, type: !1863)
!1866 = !DILocation(line: 0, scope: !1859)
!1867 = !DILocation(line: 13, column: 9, scope: !1868)
!1868 = distinct !DILexicalBlock(scope: !1859, file: !1860, line: 13, column: 7)
!1869 = !DILocation(line: 13, column: 7, scope: !1859)
!1870 = !DILocation(line: 14, column: 5, scope: !1868)
!1871 = !DILocation(line: 15, column: 1, scope: !1859)
