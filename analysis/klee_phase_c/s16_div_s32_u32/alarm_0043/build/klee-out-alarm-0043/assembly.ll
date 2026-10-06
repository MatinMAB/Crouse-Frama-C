; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_u32/alarm_0043/build/s16_div_s32_u32_alarm_0043.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [67 x i8] c"KLEE-ALARM-0043: signed overflow. assert -numerator <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0043.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  %numerator = alloca i32, align 4
  %denominator = alloca i32, align 4
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %denominator, metadata !48, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i16* %result, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = bitcast i32* %numerator to i8*, !dbg !55
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !56
  %1 = bitcast i32* %denominator to i8*, !dbg !57
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  %2 = load i32, i32* %numerator, align 4, !dbg !59
  %3 = load i32, i32* %denominator, align 4, !dbg !60
  %call = call signext i16 @s16_div_s32_u32(i32 %2, i32 %3), !dbg !61
  store i16 %call, i16* %result, align 2, !dbg !62
  %4 = load i16, i16* %result, align 2, !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_s16(i16 signext %numerator, i16 signext %denominator) #0 !dbg !65 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !73, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = load i16, i16* %numerator.addr, align 2, !dbg !78
  %conv = sext i16 %0 to i32, !dbg !78
  %shl = shl i32 %conv, 16, !dbg !79
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !80
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !81
  %conv1 = sext i16 %1 to i32, !dbg !81
  %cmp = icmp eq i32 %conv1, 0, !dbg !83
  br i1 %cmp, label %if.then, label %if.else7, !dbg !84

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !85
  %conv3 = sext i16 %2 to i32, !dbg !85
  %cmp4 = icmp slt i32 %conv3, 0, !dbg !88
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !89

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !90
  br label %return, !dbg !90

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !92
  br label %return, !dbg !92

if.else7:                                         ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !94
  %cmp8 = icmp ne i32 %3, -2147483648, !dbg !97
  br i1 %cmp8, label %if.then10, label %if.else29, !dbg !98

if.then10:                                        ; preds = %if.else7
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !99
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !101
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !102
  %conv11 = sext i16 %6 to i32, !dbg !102
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !103
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !103
  %div = sdiv i32 %5, %conv11, !dbg !103, !klee.check.div !104
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !105
  %conv12 = sext i16 %7 to i32, !dbg !105
  %mul = mul nsw i32 %div, %conv12, !dbg !106
  %sub = sub nsw i32 %4, %mul, !dbg !107
  %shl13 = shl i32 %sub, 1, !dbg !108
  store i32 %shl13, i32* %s32Temp2, align 4, !dbg !109
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !110
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !111
  %conv14 = sext i16 %9 to i32, !dbg !111
  %int_cast_to_i641 = zext i32 %conv14 to i64, !dbg !112
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !112
  %div15 = sdiv i32 %8, %conv14, !dbg !112, !klee.check.div !104
  store i32 %div15, i32* %s32Temp1, align 4, !dbg !113
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !114
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !115
  %conv16 = sext i16 %11 to i32, !dbg !115
  %shl17 = shl i32 %conv16, 16, !dbg !116
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !117
  %conv18 = sext i16 %12 to i32, !dbg !117
  %int_cast_to_i642 = zext i32 %conv18 to i64, !dbg !118
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !118
  %div19 = sdiv i32 %shl17, %conv18, !dbg !118, !klee.check.div !104
  %add = add nsw i32 %10, %div19, !dbg !119
  store i32 %add, i32* %s32Temp1, align 4, !dbg !120
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !121
  %cmp20 = icmp slt i32 %13, 32767, !dbg !123
  br i1 %cmp20, label %if.then22, label %if.else28, !dbg !124

if.then22:                                        ; preds = %if.then10
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !125
  %cmp23 = icmp sgt i32 %14, -32768, !dbg !128
  br i1 %cmp23, label %if.then25, label %if.else27, !dbg !129

if.then25:                                        ; preds = %if.then22
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !130
  %conv26 = trunc i32 %15 to i16, !dbg !132
  store i16 %conv26, i16* %retval, align 2, !dbg !133
  br label %return, !dbg !133

if.else27:                                        ; preds = %if.then22
  store i16 -32768, i16* %retval, align 2, !dbg !134
  br label %return, !dbg !134

if.else28:                                        ; preds = %if.then10
  store i16 32767, i16* %retval, align 2, !dbg !136
  br label %return, !dbg !136

if.else29:                                        ; preds = %if.else7
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !138
  %conv30 = sext i16 %16 to i32, !dbg !138
  %cmp31 = icmp ne i32 %conv30, -1, !dbg !141
  br i1 %cmp31, label %if.then33, label %if.else56, !dbg !142

if.then33:                                        ; preds = %if.else29
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !143
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !145
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !146
  %conv34 = sext i16 %19 to i32, !dbg !146
  %int_cast_to_i643 = zext i32 %conv34 to i64, !dbg !147
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !147
  %div35 = sdiv i32 %18, %conv34, !dbg !147, !klee.check.div !104
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !148
  %conv36 = sext i16 %20 to i32, !dbg !148
  %mul37 = mul nsw i32 %div35, %conv36, !dbg !149
  %sub38 = sub nsw i32 %17, %mul37, !dbg !150
  %shl39 = shl i32 %sub38, 1, !dbg !151
  store i32 %shl39, i32* %s32Temp2, align 4, !dbg !152
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !153
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !154
  %conv40 = sext i16 %22 to i32, !dbg !154
  %int_cast_to_i644 = zext i32 %conv40 to i64, !dbg !155
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !155
  %div41 = sdiv i32 %21, %conv40, !dbg !155, !klee.check.div !104
  store i32 %div41, i32* %s32Temp1, align 4, !dbg !156
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !157
  %24 = load i16, i16* %numerator.addr, align 2, !dbg !158
  %conv42 = sext i16 %24 to i32, !dbg !158
  %shl43 = shl i32 %conv42, 16, !dbg !159
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !160
  %conv44 = sext i16 %25 to i32, !dbg !160
  %int_cast_to_i645 = zext i32 %conv44 to i64, !dbg !161
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !161
  %div45 = sdiv i32 %shl43, %conv44, !dbg !161, !klee.check.div !104
  %add46 = add nsw i32 %23, %div45, !dbg !162
  store i32 %add46, i32* %s32Temp1, align 4, !dbg !163
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !164
  %cmp47 = icmp slt i32 %26, 32767, !dbg !166
  br i1 %cmp47, label %if.then49, label %if.else55, !dbg !167

if.then49:                                        ; preds = %if.then33
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !168
  %cmp50 = icmp sgt i32 %27, -32768, !dbg !171
  br i1 %cmp50, label %if.then52, label %if.else54, !dbg !172

if.then52:                                        ; preds = %if.then49
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !173
  %conv53 = trunc i32 %28 to i16, !dbg !175
  store i16 %conv53, i16* %retval, align 2, !dbg !176
  br label %return, !dbg !176

if.else54:                                        ; preds = %if.then49
  store i16 -32768, i16* %retval, align 2, !dbg !177
  br label %return, !dbg !177

if.else55:                                        ; preds = %if.then33
  store i16 32767, i16* %retval, align 2, !dbg !179
  br label %return, !dbg !179

if.else56:                                        ; preds = %if.else29
  store i16 32767, i16* %retval, align 2, !dbg !181
  br label %return, !dbg !181

return:                                           ; preds = %if.else56, %if.else55, %if.else54, %if.then52, %if.else28, %if.else27, %if.then25, %if.else, %if.then6
  %29 = load i16, i16* %retval, align 2, !dbg !183
  ret i16 %29, !dbg !183
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_s16(i32 %numerator, i16 signext %denominator) #0 !dbg !184 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !187, metadata !DIExpression()), !dbg !188
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !189, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !191, metadata !DIExpression()), !dbg !192
  store i32 0, i32* %s32Temp1, align 4, !dbg !192
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !193, metadata !DIExpression()), !dbg !194
  store i32 0, i32* %s32Temp2, align 4, !dbg !194
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !195
  store i32 %0, i32* %s32Temp1, align 4, !dbg !196
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !197
  %conv = sext i16 %1 to i32, !dbg !197
  %cmp = icmp eq i32 %conv, 0, !dbg !199
  br i1 %cmp, label %if.then, label %if.else5, !dbg !200

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !201
  %cmp2 = icmp slt i32 %2, 0, !dbg !204
  br i1 %cmp2, label %if.then4, label %if.else, !dbg !205

if.then4:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !206
  br label %return, !dbg !206

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !208
  br label %return, !dbg !208

if.else5:                                         ; preds = %entry
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !210
  %cmp6 = icmp ne i32 %3, -2147483648, !dbg !213
  br i1 %cmp6, label %if.then8, label %if.else24, !dbg !214

if.then8:                                         ; preds = %if.else5
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !215
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !217
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !218
  %conv9 = sext i16 %6 to i32, !dbg !218
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !219
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !219
  %div = sdiv i32 %5, %conv9, !dbg !219, !klee.check.div !104
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !220
  %conv10 = sext i16 %7 to i32, !dbg !220
  %mul = mul nsw i32 %div, %conv10, !dbg !221
  %sub = sub nsw i32 %4, %mul, !dbg !222
  %shl = shl i32 %sub, 1, !dbg !223
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !224
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !225
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !226
  %conv11 = sext i16 %9 to i32, !dbg !226
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !227
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !227
  %div12 = sdiv i32 %8, %conv11, !dbg !227, !klee.check.div !104
  store i32 %div12, i32* %s32Temp1, align 4, !dbg !228
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !229
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !230
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !231
  %conv13 = sext i16 %12 to i32, !dbg !231
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !232
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !232
  %div14 = sdiv i32 %11, %conv13, !dbg !232, !klee.check.div !104
  %add = add nsw i32 %10, %div14, !dbg !233
  store i32 %add, i32* %s32Temp1, align 4, !dbg !234
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !235
  %cmp15 = icmp slt i32 %13, 32767, !dbg !237
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !238

if.then17:                                        ; preds = %if.then8
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !239
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !242
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !243

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !244
  %conv21 = trunc i32 %15 to i16, !dbg !246
  store i16 %conv21, i16* %retval, align 2, !dbg !247
  br label %return, !dbg !247

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !248
  br label %return, !dbg !248

if.else23:                                        ; preds = %if.then8
  store i16 32767, i16* %retval, align 2, !dbg !250
  br label %return, !dbg !250

if.else24:                                        ; preds = %if.else5
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !252
  %conv25 = sext i16 %16 to i32, !dbg !252
  %cmp26 = icmp ne i32 %conv25, -1, !dbg !255
  br i1 %cmp26, label %if.then28, label %if.else49, !dbg !256

if.then28:                                        ; preds = %if.else24
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !257
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !259
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !260
  %conv29 = sext i16 %19 to i32, !dbg !260
  %int_cast_to_i643 = zext i32 %conv29 to i64, !dbg !261
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !261
  %div30 = sdiv i32 %18, %conv29, !dbg !261, !klee.check.div !104
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !262
  %conv31 = sext i16 %20 to i32, !dbg !262
  %mul32 = mul nsw i32 %div30, %conv31, !dbg !263
  %sub33 = sub nsw i32 %17, %mul32, !dbg !264
  %shl34 = shl i32 %sub33, 1, !dbg !265
  store i32 %shl34, i32* %s32Temp2, align 4, !dbg !266
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !267
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !268
  %conv35 = sext i16 %22 to i32, !dbg !268
  %int_cast_to_i644 = zext i32 %conv35 to i64, !dbg !269
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !269
  %div36 = sdiv i32 %21, %conv35, !dbg !269, !klee.check.div !104
  store i32 %div36, i32* %s32Temp1, align 4, !dbg !270
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !271
  %24 = load i32, i32* %numerator.addr, align 4, !dbg !272
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !273
  %conv37 = sext i16 %25 to i32, !dbg !273
  %int_cast_to_i645 = zext i32 %conv37 to i64, !dbg !274
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !274
  %div38 = sdiv i32 %24, %conv37, !dbg !274, !klee.check.div !104
  %add39 = add nsw i32 %23, %div38, !dbg !275
  store i32 %add39, i32* %s32Temp1, align 4, !dbg !276
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !277
  %cmp40 = icmp slt i32 %26, 32767, !dbg !279
  br i1 %cmp40, label %if.then42, label %if.else48, !dbg !280

if.then42:                                        ; preds = %if.then28
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !281
  %cmp43 = icmp sgt i32 %27, -32768, !dbg !284
  br i1 %cmp43, label %if.then45, label %if.else47, !dbg !285

if.then45:                                        ; preds = %if.then42
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !286
  %conv46 = trunc i32 %28 to i16, !dbg !288
  store i16 %conv46, i16* %retval, align 2, !dbg !289
  br label %return, !dbg !289

if.else47:                                        ; preds = %if.then42
  store i16 -32768, i16* %retval, align 2, !dbg !290
  br label %return, !dbg !290

if.else48:                                        ; preds = %if.then28
  store i16 32767, i16* %retval, align 2, !dbg !292
  br label %return, !dbg !292

if.else49:                                        ; preds = %if.else24
  store i16 32767, i16* %retval, align 2, !dbg !294
  br label %return, !dbg !294

return:                                           ; preds = %if.else49, %if.else48, %if.else47, %if.then45, %if.else23, %if.else22, %if.then20, %if.else, %if.then4
  %29 = load i16, i16* %retval, align 2, !dbg !296
  ret i16 %29, !dbg !296
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !297 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !300, metadata !DIExpression()), !dbg !301
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !302, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !304, metadata !DIExpression()), !dbg !305
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !306, metadata !DIExpression()), !dbg !307
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !308, metadata !DIExpression()), !dbg !309
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !310
  %conv = zext i16 %0 to i32, !dbg !310
  %and = and i32 %conv, 65535, !dbg !311
  %conv1 = trunc i32 %and to i16, !dbg !310
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !312
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !313
  %conv2 = sext i16 %1 to i32, !dbg !313
  %shl = shl i32 %conv2, 16, !dbg !314
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !315
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !316
  %conv3 = zext i16 %2 to i32, !dbg !316
  %cmp = icmp eq i32 %conv3, 0, !dbg !318
  br i1 %cmp, label %if.then, label %if.else9, !dbg !319

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !320
  %conv5 = sext i16 %3 to i32, !dbg !320
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !323
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !324

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !325
  br label %return, !dbg !325

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !327
  br label %return, !dbg !327

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !329
  %conv10 = sext i16 %4 to i32, !dbg !329
  %shl11 = shl i32 %conv10, 16, !dbg !331
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !332
  %conv12 = sext i16 %5 to i32, !dbg !332
  %shl13 = shl i32 %conv12, 16, !dbg !333
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !334
  %conv14 = zext i16 %6 to i32, !dbg !334
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !335
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !335
  %div = sdiv i32 %shl13, %conv14, !dbg !335, !klee.check.div !104
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !336
  %conv15 = zext i16 %7 to i32, !dbg !336
  %mul = mul nsw i32 %div, %conv15, !dbg !337
  %sub = sub nsw i32 %shl11, %mul, !dbg !338
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !339
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !340
  %shl16 = shl i32 %8, 1, !dbg !341
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !342
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !343
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !344
  %conv17 = zext i16 %10 to i32, !dbg !344
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !345
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !345
  %div18 = sdiv i32 %9, %conv17, !dbg !345, !klee.check.div !104
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !346
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !347
  %conv19 = sext i16 %11 to i32, !dbg !347
  %shl20 = shl i32 %conv19, 16, !dbg !348
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !349
  %conv21 = zext i16 %12 to i32, !dbg !349
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !350
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !350
  %div22 = sdiv i32 %shl20, %conv21, !dbg !350, !klee.check.div !104
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !351
  %add = add nsw i32 %div22, %13, !dbg !352
  store i32 %add, i32* %s32Temp1, align 4, !dbg !353
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !354
  %cmp23 = icmp slt i32 %14, 32767, !dbg !356
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !357

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !358
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !361
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !362

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !363
  %conv29 = trunc i32 %16 to i16, !dbg !365
  store i16 %conv29, i16* %retval, align 2, !dbg !366
  br label %return, !dbg !366

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !367
  br label %return, !dbg !367

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !369
  br label %return, !dbg !369

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !371
  ret i16 %17, !dbg !371
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !372 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !373, metadata !DIExpression()), !dbg !374
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !375, metadata !DIExpression()), !dbg !376
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !377, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !379, metadata !DIExpression()), !dbg !380
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !381
  %conv = zext i16 %0 to i32, !dbg !381
  %and = and i32 %conv, 65535, !dbg !382
  %conv1 = trunc i32 %and to i16, !dbg !381
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !383
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !384
  %conv2 = zext i16 %1 to i32, !dbg !384
  %cmp = icmp eq i32 %conv2, 0, !dbg !386
  br i1 %cmp, label %if.then, label %if.else8, !dbg !387

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !388
  %conv4 = sext i16 %2 to i32, !dbg !388
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !391
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !392

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !393
  br label %return, !dbg !393

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !395
  br label %return, !dbg !395

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !397
  %conv9 = sext i16 %3 to i32, !dbg !397
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !399
  %conv10 = sext i16 %4 to i32, !dbg !399
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !400
  %conv11 = zext i16 %5 to i32, !dbg !400
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !401
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !401
  %div = sdiv i32 %conv10, %conv11, !dbg !401, !klee.check.div !104
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !402
  %conv12 = zext i16 %6 to i32, !dbg !402
  %mul = mul nsw i32 %div, %conv12, !dbg !403
  %sub = sub nsw i32 %conv9, %mul, !dbg !404
  %shl = shl i32 %sub, 1, !dbg !405
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !406
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !407
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !408
  %conv13 = zext i16 %8 to i32, !dbg !408
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !409
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !409
  %div14 = sdiv i32 %7, %conv13, !dbg !409, !klee.check.div !104
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !410
  %conv15 = sext i16 %9 to i32, !dbg !410
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !411
  %conv16 = zext i16 %10 to i32, !dbg !411
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !412
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !412
  %div17 = sdiv i32 %conv15, %conv16, !dbg !412, !klee.check.div !104
  %add = add nsw i32 %div14, %div17, !dbg !413
  store i32 %add, i32* %s32Temp1, align 4, !dbg !414
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !415
  %conv18 = trunc i32 %11 to i16, !dbg !415
  store i16 %conv18, i16* %retval, align 2, !dbg !416
  br label %return, !dbg !416

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !417
  ret i16 %12, !dbg !417
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !418 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !421, metadata !DIExpression()), !dbg !422
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !423, metadata !DIExpression()), !dbg !424
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !425, metadata !DIExpression()), !dbg !427
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
  %div = udiv i32 %2, %conv3, !dbg !444, !klee.check.div !104
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
  %div = sdiv i32 %4, %conv9, !dbg !491, !klee.check.div !104
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
  %div12 = sdiv i32 %7, %conv11, !dbg !499, !klee.check.div !104
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !500
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !501
  %conv13 = zext i16 %10 to i32, !dbg !501
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !502
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !502
  %div14 = sdiv i32 %9, %conv13, !dbg !502, !klee.check.div !104
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
  %div = udiv i32 %3, %conv4, !dbg !547, !klee.check.div !104
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
  %div = udiv i32 %2, %conv4, !dbg !583, !klee.check.div !104
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
  %div7 = udiv i32 %7, %conv6, !dbg !594, !klee.check.div !104
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !595
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !596
  %conv8 = zext i16 %10 to i32, !dbg !596
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !597
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !597
  %div9 = udiv i32 %9, %conv8, !dbg !597, !klee.check.div !104
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
  %div = sdiv i32 %5, %conv8, !dbg !645, !klee.check.div !104
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
  %div12 = sdiv i32 %9, %conv11, !dbg !655, !klee.check.div !104
  %11 = load i32, i32* %s32Result, align 4, !dbg !656
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !657
  %conv13 = sext i16 %12 to i32, !dbg !657
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !658
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !658
  %div14 = sdiv i32 %11, %conv13, !dbg !658, !klee.check.div !104
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
  %div = sdiv i32 %5, %conv8, !dbg !713, !klee.check.div !104
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
  %div12 = sdiv i32 %8, %conv11, !dbg !721, !klee.check.div !104
  %10 = load i32, i32* %s32Result, align 4, !dbg !722
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !723
  %conv13 = zext i16 %11 to i32, !dbg !723
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !724
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !724
  %div14 = sdiv i32 %10, %conv13, !dbg !724, !klee.check.div !104
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
  %div = sdiv i32 %5, %conv8, !dbg !783, !klee.check.div !104
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
  %div12 = sdiv i32 %8, %conv11, !dbg !791, !klee.check.div !104
  %10 = load i32, i32* %s32Result, align 4, !dbg !792
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !793
  %conv13 = sext i16 %11 to i32, !dbg !793
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !794
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !794
  %div14 = sdiv i32 %10, %conv13, !dbg !794, !klee.check.div !104
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
  %div = sdiv i32 %5, %conv8, !dbg !849, !klee.check.div !104
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
  %div12 = sdiv i32 %8, %conv11, !dbg !857, !klee.check.div !104
  %10 = load i32, i32* %s32Result, align 4, !dbg !858
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !859
  %conv13 = zext i16 %11 to i32, !dbg !859
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !860
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !860
  %div14 = sdiv i32 %10, %conv13, !dbg !860, !klee.check.div !104
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
  %div = udiv i32 %6, %conv7, !dbg !914, !klee.check.div !104
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
  %div = udiv i32 %mul, %3, !dbg !950, !klee.check.div !104
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
  %div = udiv i32 %2, %conv2, !dbg !998, !klee.check.div !104
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
  %div5 = udiv i32 %5, %conv4, !dbg !1006, !klee.check.div !104
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1007
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1008
  %conv6 = zext i16 %8 to i32, !dbg !1008
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1009
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1009
  %div7 = udiv i32 %7, %conv6, !dbg !1009, !klee.check.div !104
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
  %div9 = sdiv i32 %5, %conv8, !dbg !1051, !klee.check.div !104
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
  %div13 = sdiv i32 %8, %conv12, !dbg !1059, !klee.check.div !104
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1060
  %11 = load i16, i16* %div.addr, align 2, !dbg !1061
  %conv14 = sext i16 %11 to i32, !dbg !1061
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1062
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1062
  %div15 = sdiv i32 %10, %conv14, !dbg !1062, !klee.check.div !104
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
  %div = sdiv i32 %6, %conv12, !dbg !1123, !klee.check.div !104
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
  %div16 = sdiv i32 %9, %conv15, !dbg !1131, !klee.check.div !104
  %11 = load i32, i32* %s32Result, align 4, !dbg !1132
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1133
  %conv17 = zext i16 %12 to i32, !dbg !1133
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1134
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1134
  %div18 = sdiv i32 %11, %conv17, !dbg !1134, !klee.check.div !104
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
  %div = udiv i32 %3, %4, !dbg !1181, !klee.check.div !104
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1182
  %mul = mul i32 %div, %5, !dbg !1183
  %sub = sub i32 %2, %mul, !dbg !1184
  %shl = shl i32 %sub, 1, !dbg !1185
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1186
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1187
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1188
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1189
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1189
  %div4 = udiv i32 %6, %7, !dbg !1189, !klee.check.div !104
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1190
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1191
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1192
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1192
  %div5 = udiv i32 %8, %9, !dbg !1192, !klee.check.div !104
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
  %div = udiv i32 %4, %5, !dbg !1229, !klee.check.div !104
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1230
  %mul = mul i32 %div, %6, !dbg !1231
  %sub = sub i32 %3, %mul, !dbg !1232
  %shl = shl i32 %sub, 1, !dbg !1233
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1234
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1235
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1236
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1237
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1237
  %div6 = udiv i32 %7, %8, !dbg !1237, !klee.check.div !104
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1238
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1239
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1240
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1240
  %div7 = udiv i32 %9, %10, !dbg !1240, !klee.check.div !104
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
  %div = sdiv i32 %6, %7, !dbg !1293, !klee.check.div !104
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1294
  %mul = mul nsw i32 %div, %8, !dbg !1295
  %sub = sub nsw i32 %5, %mul, !dbg !1296
  %shl = shl i32 %sub, 1, !dbg !1297
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1298
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1299
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1300
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1301
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1301
  %div12 = udiv i32 %9, %10, !dbg !1301, !klee.check.div !104
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1302
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1303
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1304
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1304
  %div13 = sdiv i32 %11, %12, !dbg !1304, !klee.check.div !104
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
  %div20 = sdiv i32 %18, %19, !dbg !1326, !klee.check.div !104
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1327
  %mul21 = mul nsw i32 %div20, %20, !dbg !1328
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1329
  %shl23 = shl i32 %sub22, 1, !dbg !1330
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1331
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1332
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1333
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1334
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1334
  %div24 = udiv i32 %21, %22, !dbg !1334, !klee.check.div !104
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1335
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1336
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1337
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1337
  %div25 = sdiv i32 %23, %24, !dbg !1337, !klee.check.div !104
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
  %div = udiv i32 %3, %4, !dbg !1369, !klee.check.div !104
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
  %div7 = udiv i32 %10, %11, !dbg !1396, !klee.check.div !104
  store i32 %div7, i32* %retval, align 4, !dbg !1397
  br label %return, !dbg !1397

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1398
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1400
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1401
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1401
  %div9 = udiv i32 %12, %13, !dbg !1401, !klee.check.div !104
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
  %div = udiv i32 %4, %5, !dbg !1434, !klee.check.div !104
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1435
  %mul = mul i32 %div, %6, !dbg !1436
  %sub3 = sub i32 %3, %mul, !dbg !1437
  %shl = shl i32 %sub3, 1, !dbg !1438
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1439
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1440
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1441
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1442
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1442
  %div4 = udiv i32 %7, %8, !dbg !1442, !klee.check.div !104
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1443
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1444
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1445
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1445
  %div5 = udiv i32 %9, %10, !dbg !1445, !klee.check.div !104
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
  %div11 = udiv i32 %14, %15, !dbg !1462, !klee.check.div !104
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1463
  %mul12 = mul i32 %div11, %16, !dbg !1464
  %sub13 = sub i32 %13, %mul12, !dbg !1465
  %shl14 = shl i32 %sub13, 1, !dbg !1466
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1467
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1468
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1469
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1470
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1470
  %div15 = udiv i32 %17, %18, !dbg !1470, !klee.check.div !104
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1471
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1472
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1473
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1473
  %div16 = udiv i32 %19, %20, !dbg !1473, !klee.check.div !104
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
  %div = udiv i32 %4, %5, !dbg !1527, !klee.check.div !104
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1528
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1529
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1530
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1531
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1532
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1532
  %div6 = udiv i32 %7, %8, !dbg !1532, !klee.check.div !104
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
  %div20 = udiv i32 %18, %19, !dbg !1572, !klee.check.div !104
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1573
  %mul21 = mul i32 %div20, %20, !dbg !1574
  %sub22 = sub i32 %17, %mul21, !dbg !1575
  %shl = shl i32 %sub22, 1, !dbg !1576
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1577
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1578
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1579
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1580
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1580
  %div23 = udiv i32 %21, %22, !dbg !1580, !klee.check.div !104
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1581
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1582
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1583
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1583
  %div24 = udiv i32 %23, %24, !dbg !1583, !klee.check.div !104
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
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1613

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1614
  %cmp1 = icmp sle i32 %1, 0, !dbg !1617
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1618

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1619
  %cmp3 = icmp sge i32 %2, 0, !dbg !1622
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1623

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1624
  br label %return, !dbg !1624

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1626
  %sub = sub nsw i32 0, %3, !dbg !1628
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1629
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1630
  %sub5 = sub nsw i32 0, %4, !dbg !1631
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1632
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1633
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1634
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1635
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1636
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1636
  %div = udiv i32 %6, %7, !dbg !1636, !klee.check.div !104
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1637
  %mul = mul i32 %div, %8, !dbg !1638
  %sub6 = sub i32 %5, %mul, !dbg !1639
  %shl = shl i32 %sub6, 1, !dbg !1640
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1641
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1642
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1643
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1644
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1644
  %div7 = udiv i32 %9, %10, !dbg !1644, !klee.check.div !104
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1645
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1646
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1647
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1647
  %div8 = udiv i32 %11, %12, !dbg !1647, !klee.check.div !104
  %add = add i32 %div7, %div8, !dbg !1648
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1649
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1650
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1652
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1653

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1654
  store i32 %14, i32* %retval, align 4, !dbg !1656
  br label %return, !dbg !1656

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1657
  br label %return, !dbg !1657

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1659
  %neg = xor i32 %15, -1, !dbg !1661
  %add13 = add nsw i32 %neg, 1, !dbg !1662
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1663
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1664
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1665
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1666
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1667
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1667
  %div14 = udiv i32 %17, %18, !dbg !1667, !klee.check.div !104
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1668
  %mul15 = mul i32 %div14, %19, !dbg !1669
  %sub16 = sub i32 %16, %mul15, !dbg !1670
  %shl17 = shl i32 %sub16, 1, !dbg !1671
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1672
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1673
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1674
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1675
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1675
  %div18 = udiv i32 %20, %21, !dbg !1675, !klee.check.div !104
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1676
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1677
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1678
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1678
  %div19 = sdiv i32 %22, %23, !dbg !1678, !klee.check.div !104
  %add20 = add i32 %div18, %div19, !dbg !1679
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1680
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1681
  %neg21 = xor i32 %24, -1, !dbg !1682
  %add22 = add nsw i32 %neg21, 1, !dbg !1683
  store i32 %add22, i32* %retval, align 4, !dbg !1684
  br label %return, !dbg !1684

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1685
  %cmp24 = icmp sle i32 %25, 0, !dbg !1688
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1689

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1690
  %cmp26 = icmp sge i32 %26, 0, !dbg !1693
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1694

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1695
  br label %return, !dbg !1695

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1697
  %neg29 = xor i32 %27, -1, !dbg !1699
  %add30 = add nsw i32 %neg29, 1, !dbg !1700
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1701
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1702
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1703
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1704
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1705
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1705
  %div31 = udiv i32 %29, %30, !dbg !1705, !klee.check.div !104
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1706
  %mul32 = mul i32 %div31, %31, !dbg !1707
  %sub33 = sub i32 %28, %mul32, !dbg !1708
  %shl34 = shl i32 %sub33, 1, !dbg !1709
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1710
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1711
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1712
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1713
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1713
  %div35 = udiv i32 %32, %33, !dbg !1713, !klee.check.div !104
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1714
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1715
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1716
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1716
  %div36 = udiv i32 %34, %35, !dbg !1716, !klee.check.div !104
  %add37 = add i32 %div35, %div36, !dbg !1717
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1718
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1719
  %neg38 = xor i32 %36, -1, !dbg !1720
  %add39 = add nsw i32 %neg38, 1, !dbg !1721
  store i32 %add39, i32* %retval, align 4, !dbg !1722
  br label %return, !dbg !1722

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1723
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1725
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1726
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1727
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1727
  %div41 = sdiv i32 %38, %39, !dbg !1727, !klee.check.div !104
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1728
  %mul42 = mul nsw i32 %div41, %40, !dbg !1729
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1730
  %shl44 = shl i32 %sub43, 1, !dbg !1731
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1732
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1733
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1734
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1735
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1735
  %div45 = sdiv i32 %41, %42, !dbg !1735, !klee.check.div !104
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1736
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1737
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1738
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1738
  %div46 = udiv i32 %43, %44, !dbg !1738, !klee.check.div !104
  %add47 = add i32 %div45, %div46, !dbg !1739
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1740
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1741
  store i32 %45, i32* %retval, align 4, !dbg !1742
  br label %return, !dbg !1742

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1743
  ret i32 %46, !dbg !1743
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1744 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1747, metadata !DIExpression()), !dbg !1748
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1749, metadata !DIExpression()), !dbg !1750
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1751, metadata !DIExpression()), !dbg !1752
  store i32 0, i32* %numerator_prime, align 4, !dbg !1752
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1753, metadata !DIExpression()), !dbg !1754
  store i32 0, i32* %u32Temp1, align 4, !dbg !1754
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1755, metadata !DIExpression()), !dbg !1756
  store i32 0, i32* %u32Temp2, align 4, !dbg !1756
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1757, metadata !DIExpression()), !dbg !1758
  store i32 0, i32* %u32Temp3, align 4, !dbg !1758
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1759, metadata !DIExpression()), !dbg !1760
  store i32 0, i32* %s32Temp1, align 4, !dbg !1760
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1761, metadata !DIExpression()), !dbg !1762
  store i32 0, i32* %s32Temp2, align 4, !dbg !1762
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1763, metadata !DIExpression()), !dbg !1764
  store i32 0, i32* %s32Temp3, align 4, !dbg !1764
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1765
  %cmp = icmp eq i32 %0, 0, !dbg !1767
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1768

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1769
  %cmp1 = icmp slt i32 %1, 0, !dbg !1772
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1773

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1774
  br label %return, !dbg !1774

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1776
  br label %return, !dbg !1776

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1778
  %cmp4 = icmp slt i32 %2, 0, !dbg !1781
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1782

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1783
  %conv = sext i32 %3 to i64, !dbg !1786
  %call = call i32 @klee_alarm_s32_neg_valid(i64 %conv), !dbg !1787
  %tobool = icmp ne i32 %call, 0, !dbg !1787
  br i1 %tobool, label %if.end, label %if.then6, !dbg !1788

if.then6:                                         ; preds = %if.then5
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 1481, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !1789
  unreachable, !dbg !1789

if.end:                                           ; preds = %if.then5
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1791
  %sub = sub nsw i32 0, %4, !dbg !1792
  %conv7 = sext i32 %sub to i64, !dbg !1793
  store volatile i64 %conv7, i64* @klee_alarm_sink_s64, align 8, !dbg !1794
  store i16 0, i16* %retval, align 2, !dbg !1795
  br label %return, !dbg !1795

if.else8:                                         ; preds = %if.else3
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1796
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1798
  %int_cast_to_i64 = zext i32 %6 to i64, !dbg !1799
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1799
  %div = udiv i32 %5, %6, !dbg !1799, !klee.check.div !104
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1800
  %mul = mul i32 %div, %7, !dbg !1801
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1802
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1803
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1804
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1805
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1806
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1806
  %div9 = udiv i32 %9, %10, !dbg !1806, !klee.check.div !104
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1807
  %mul10 = mul i32 %div9, %11, !dbg !1808
  %sub11 = sub i32 %8, %mul10, !dbg !1809
  %shl = shl i32 %sub11, 1, !dbg !1810
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1811
  %12 = load i32, i32* %s32Temp2, align 4, !dbg !1812
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1813
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1814
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1814
  %div12 = udiv i32 %12, %13, !dbg !1814, !klee.check.div !104
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1815
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1816
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1817
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1817
  %div13 = udiv i32 %14, %15, !dbg !1817, !klee.check.div !104
  %add = add i32 %div12, %div13, !dbg !1818
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1819
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1820
  %cmp14 = icmp sle i32 %16, 32767, !dbg !1822
  br i1 %cmp14, label %if.then16, label %if.else18, !dbg !1823

if.then16:                                        ; preds = %if.else8
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1824
  %conv17 = trunc i32 %17 to i16, !dbg !1826
  store i16 %conv17, i16* %retval, align 2, !dbg !1827
  br label %return, !dbg !1827

if.else18:                                        ; preds = %if.else8
  store i16 32767, i16* %retval, align 2, !dbg !1828
  br label %return, !dbg !1828

return:                                           ; preds = %if.else18, %if.then16, %if.end, %if.else, %if.then2
  %18 = load i16, i16* %retval, align 2, !dbg !1830
  ret i16 %18, !dbg !1830
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !1831 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !1834, metadata !DIExpression()), !dbg !1835
  %0 = load i64, i64* %value.addr, align 8, !dbg !1836
  %cmp = icmp ne i64 %0, -2147483648, !dbg !1837
  %conv = zext i1 %cmp to i32, !dbg !1837
  ret i32 %conv, !dbg !1838
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1839 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1845, metadata !DIExpression()), !dbg !1846
  %2 = icmp eq i64 %0, 0, !dbg !1847
  br i1 %2, label %3, label %4, !dbg !1849

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1850
  unreachable, !dbg !1850

4:                                                ; preds = %1
  ret void, !dbg !1851
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_u32/alarm_0043/div_Ccode_alarm_0043.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_u32/alarm_0043")
!4 = !{}
!5 = !{!6, !13, !18, !22}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_u32/alarm_0043")
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
!25 = !{!0}
!26 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_u32/alarm_0043")
!27 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!28 = distinct !DICompileUnit(language: DW_LANG_C99, file: !29, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!29 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_u32/alarm_0043/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_u32/alarm_0043")
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
!40 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_u32/alarm_0043")
!41 = !DISubroutineType(types: !42)
!42 = !{!43}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DILocalVariable(name: "numerator", scope: !39, file: !40, line: 9, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !43)
!47 = !DILocation(line: 9, column: 13, scope: !39)
!48 = !DILocalVariable(name: "denominator", scope: !39, file: !40, line: 10, type: !49)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !15, line: 26, baseType: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !51)
!51 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 10, column: 14, scope: !39)
!53 = !DILocalVariable(name: "result", scope: !39, file: !40, line: 11, type: !8)
!54 = !DILocation(line: 11, column: 13, scope: !39)
!55 = !DILocation(line: 13, column: 24, scope: !39)
!56 = !DILocation(line: 13, column: 5, scope: !39)
!57 = !DILocation(line: 14, column: 24, scope: !39)
!58 = !DILocation(line: 14, column: 5, scope: !39)
!59 = !DILocation(line: 16, column: 30, scope: !39)
!60 = !DILocation(line: 16, column: 41, scope: !39)
!61 = !DILocation(line: 16, column: 14, scope: !39)
!62 = !DILocation(line: 16, column: 12, scope: !39)
!63 = !DILocation(line: 18, column: 11, scope: !39)
!64 = !DILocation(line: 19, column: 5, scope: !39)
!65 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !66, file: !66, line: 170, type: !67, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_div_s32_u32/alarm_0043")
!67 = !DISubroutineType(types: !68)
!68 = !{!6, !6, !6}
!69 = !DILocalVariable(name: "numerator", arg: 1, scope: !65, file: !66, line: 170, type: !6)
!70 = !DILocation(line: 170, column: 31, scope: !65)
!71 = !DILocalVariable(name: "denominator", arg: 2, scope: !65, file: !66, line: 170, type: !6)
!72 = !DILocation(line: 170, column: 47, scope: !65)
!73 = !DILocalVariable(name: "s32Temp1", scope: !65, file: !66, line: 172, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !45)
!75 = !DILocation(line: 172, column: 6, scope: !65)
!76 = !DILocalVariable(name: "s32Temp2", scope: !65, file: !66, line: 172, type: !74)
!77 = !DILocation(line: 172, column: 15, scope: !65)
!78 = !DILocation(line: 173, column: 13, scope: !65)
!79 = !DILocation(line: 173, column: 22, scope: !65)
!80 = !DILocation(line: 173, column: 11, scope: !65)
!81 = !DILocation(line: 175, column: 6, scope: !82)
!82 = distinct !DILexicalBlock(scope: !65, file: !66, line: 175, column: 6)
!83 = !DILocation(line: 175, column: 18, scope: !82)
!84 = !DILocation(line: 175, column: 6, scope: !65)
!85 = !DILocation(line: 177, column: 7, scope: !86)
!86 = distinct !DILexicalBlock(scope: !87, file: !66, line: 177, column: 7)
!87 = distinct !DILexicalBlock(scope: !82, file: !66, line: 176, column: 2)
!88 = !DILocation(line: 177, column: 17, scope: !86)
!89 = !DILocation(line: 177, column: 7, scope: !87)
!90 = !DILocation(line: 179, column: 4, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !66, line: 178, column: 3)
!92 = !DILocation(line: 183, column: 4, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !66, line: 182, column: 3)
!94 = !DILocation(line: 188, column: 7, scope: !95)
!95 = distinct !DILexicalBlock(scope: !96, file: !66, line: 188, column: 7)
!96 = distinct !DILexicalBlock(scope: !82, file: !66, line: 187, column: 2)
!97 = !DILocation(line: 188, column: 16, scope: !95)
!98 = !DILocation(line: 188, column: 7, scope: !96)
!99 = !DILocation(line: 190, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !95, file: !66, line: 189, column: 3)
!101 = !DILocation(line: 190, column: 28, scope: !100)
!102 = !DILocation(line: 190, column: 37, scope: !100)
!103 = !DILocation(line: 190, column: 36, scope: !100)
!104 = !{!"True"}
!105 = !DILocation(line: 190, column: 52, scope: !100)
!106 = !DILocation(line: 190, column: 50, scope: !100)
!107 = !DILocation(line: 190, column: 25, scope: !100)
!108 = !DILocation(line: 190, column: 65, scope: !100)
!109 = !DILocation(line: 190, column: 13, scope: !100)
!110 = !DILocation(line: 191, column: 15, scope: !100)
!111 = !DILocation(line: 191, column: 24, scope: !100)
!112 = !DILocation(line: 191, column: 23, scope: !100)
!113 = !DILocation(line: 191, column: 13, scope: !100)
!114 = !DILocation(line: 192, column: 15, scope: !100)
!115 = !DILocation(line: 192, column: 27, scope: !100)
!116 = !DILocation(line: 192, column: 36, scope: !100)
!117 = !DILocation(line: 192, column: 42, scope: !100)
!118 = !DILocation(line: 192, column: 41, scope: !100)
!119 = !DILocation(line: 192, column: 24, scope: !100)
!120 = !DILocation(line: 192, column: 13, scope: !100)
!121 = !DILocation(line: 193, column: 7, scope: !122)
!122 = distinct !DILexicalBlock(scope: !100, file: !66, line: 193, column: 7)
!123 = !DILocation(line: 193, column: 16, scope: !122)
!124 = !DILocation(line: 193, column: 7, scope: !100)
!125 = !DILocation(line: 195, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !127, file: !66, line: 195, column: 8)
!127 = distinct !DILexicalBlock(scope: !122, file: !66, line: 194, column: 4)
!128 = !DILocation(line: 195, column: 17, scope: !126)
!129 = !DILocation(line: 195, column: 8, scope: !127)
!130 = !DILocation(line: 197, column: 18, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !66, line: 196, column: 5)
!132 = !DILocation(line: 197, column: 13, scope: !131)
!133 = !DILocation(line: 197, column: 6, scope: !131)
!134 = !DILocation(line: 201, column: 6, scope: !135)
!135 = distinct !DILexicalBlock(scope: !126, file: !66, line: 200, column: 5)
!136 = !DILocation(line: 206, column: 5, scope: !137)
!137 = distinct !DILexicalBlock(scope: !122, file: !66, line: 205, column: 4)
!138 = !DILocation(line: 211, column: 7, scope: !139)
!139 = distinct !DILexicalBlock(scope: !140, file: !66, line: 211, column: 7)
!140 = distinct !DILexicalBlock(scope: !95, file: !66, line: 210, column: 3)
!141 = !DILocation(line: 211, column: 19, scope: !139)
!142 = !DILocation(line: 211, column: 7, scope: !140)
!143 = !DILocation(line: 213, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !66, line: 212, column: 4)
!145 = !DILocation(line: 213, column: 29, scope: !144)
!146 = !DILocation(line: 213, column: 38, scope: !144)
!147 = !DILocation(line: 213, column: 37, scope: !144)
!148 = !DILocation(line: 213, column: 53, scope: !144)
!149 = !DILocation(line: 213, column: 51, scope: !144)
!150 = !DILocation(line: 213, column: 26, scope: !144)
!151 = !DILocation(line: 213, column: 66, scope: !144)
!152 = !DILocation(line: 213, column: 14, scope: !144)
!153 = !DILocation(line: 214, column: 16, scope: !144)
!154 = !DILocation(line: 214, column: 25, scope: !144)
!155 = !DILocation(line: 214, column: 24, scope: !144)
!156 = !DILocation(line: 214, column: 14, scope: !144)
!157 = !DILocation(line: 215, column: 16, scope: !144)
!158 = !DILocation(line: 215, column: 28, scope: !144)
!159 = !DILocation(line: 215, column: 37, scope: !144)
!160 = !DILocation(line: 215, column: 43, scope: !144)
!161 = !DILocation(line: 215, column: 42, scope: !144)
!162 = !DILocation(line: 215, column: 25, scope: !144)
!163 = !DILocation(line: 215, column: 14, scope: !144)
!164 = !DILocation(line: 216, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !144, file: !66, line: 216, column: 8)
!166 = !DILocation(line: 216, column: 17, scope: !165)
!167 = !DILocation(line: 216, column: 8, scope: !144)
!168 = !DILocation(line: 218, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !170, file: !66, line: 218, column: 9)
!170 = distinct !DILexicalBlock(scope: !165, file: !66, line: 217, column: 5)
!171 = !DILocation(line: 218, column: 18, scope: !169)
!172 = !DILocation(line: 218, column: 9, scope: !170)
!173 = !DILocation(line: 220, column: 19, scope: !174)
!174 = distinct !DILexicalBlock(scope: !169, file: !66, line: 219, column: 6)
!175 = !DILocation(line: 220, column: 14, scope: !174)
!176 = !DILocation(line: 220, column: 7, scope: !174)
!177 = !DILocation(line: 224, column: 7, scope: !178)
!178 = distinct !DILexicalBlock(scope: !169, file: !66, line: 223, column: 6)
!179 = !DILocation(line: 229, column: 6, scope: !180)
!180 = distinct !DILexicalBlock(scope: !165, file: !66, line: 228, column: 5)
!181 = !DILocation(line: 234, column: 5, scope: !182)
!182 = distinct !DILexicalBlock(scope: !139, file: !66, line: 233, column: 4)
!183 = !DILocation(line: 238, column: 1, scope: !65)
!184 = distinct !DISubprogram(name: "s16_div_s32_s16", scope: !66, file: !66, line: 255, type: !185, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!185 = !DISubroutineType(types: !186)
!186 = !{!6, !74, !6}
!187 = !DILocalVariable(name: "numerator", arg: 1, scope: !184, file: !66, line: 255, type: !74)
!188 = !DILocation(line: 255, column: 25, scope: !184)
!189 = !DILocalVariable(name: "denominator", arg: 2, scope: !184, file: !66, line: 255, type: !6)
!190 = !DILocation(line: 255, column: 41, scope: !184)
!191 = !DILocalVariable(name: "s32Temp1", scope: !184, file: !66, line: 257, type: !74)
!192 = !DILocation(line: 257, column: 6, scope: !184)
!193 = !DILocalVariable(name: "s32Temp2", scope: !184, file: !66, line: 257, type: !74)
!194 = !DILocation(line: 257, column: 17, scope: !184)
!195 = !DILocation(line: 258, column: 13, scope: !184)
!196 = !DILocation(line: 258, column: 11, scope: !184)
!197 = !DILocation(line: 259, column: 5, scope: !198)
!198 = distinct !DILexicalBlock(scope: !184, file: !66, line: 259, column: 5)
!199 = !DILocation(line: 259, column: 17, scope: !198)
!200 = !DILocation(line: 259, column: 5, scope: !184)
!201 = !DILocation(line: 261, column: 7, scope: !202)
!202 = distinct !DILexicalBlock(scope: !203, file: !66, line: 261, column: 7)
!203 = distinct !DILexicalBlock(scope: !198, file: !66, line: 260, column: 2)
!204 = !DILocation(line: 261, column: 17, scope: !202)
!205 = !DILocation(line: 261, column: 7, scope: !203)
!206 = !DILocation(line: 263, column: 4, scope: !207)
!207 = distinct !DILexicalBlock(scope: !202, file: !66, line: 262, column: 3)
!208 = !DILocation(line: 267, column: 4, scope: !209)
!209 = distinct !DILexicalBlock(scope: !202, file: !66, line: 266, column: 3)
!210 = !DILocation(line: 272, column: 6, scope: !211)
!211 = distinct !DILexicalBlock(scope: !212, file: !66, line: 272, column: 6)
!212 = distinct !DILexicalBlock(scope: !198, file: !66, line: 271, column: 2)
!213 = !DILocation(line: 272, column: 16, scope: !211)
!214 = !DILocation(line: 272, column: 6, scope: !212)
!215 = !DILocation(line: 274, column: 16, scope: !216)
!216 = distinct !DILexicalBlock(scope: !211, file: !66, line: 273, column: 3)
!217 = !DILocation(line: 274, column: 28, scope: !216)
!218 = !DILocation(line: 274, column: 37, scope: !216)
!219 = !DILocation(line: 274, column: 36, scope: !216)
!220 = !DILocation(line: 274, column: 52, scope: !216)
!221 = !DILocation(line: 274, column: 50, scope: !216)
!222 = !DILocation(line: 274, column: 25, scope: !216)
!223 = !DILocation(line: 274, column: 65, scope: !216)
!224 = !DILocation(line: 274, column: 13, scope: !216)
!225 = !DILocation(line: 275, column: 15, scope: !216)
!226 = !DILocation(line: 275, column: 24, scope: !216)
!227 = !DILocation(line: 275, column: 23, scope: !216)
!228 = !DILocation(line: 275, column: 13, scope: !216)
!229 = !DILocation(line: 276, column: 15, scope: !216)
!230 = !DILocation(line: 276, column: 27, scope: !216)
!231 = !DILocation(line: 276, column: 38, scope: !216)
!232 = !DILocation(line: 276, column: 37, scope: !216)
!233 = !DILocation(line: 276, column: 24, scope: !216)
!234 = !DILocation(line: 276, column: 13, scope: !216)
!235 = !DILocation(line: 277, column: 7, scope: !236)
!236 = distinct !DILexicalBlock(scope: !216, file: !66, line: 277, column: 7)
!237 = !DILocation(line: 277, column: 16, scope: !236)
!238 = !DILocation(line: 277, column: 7, scope: !216)
!239 = !DILocation(line: 279, column: 8, scope: !240)
!240 = distinct !DILexicalBlock(scope: !241, file: !66, line: 279, column: 8)
!241 = distinct !DILexicalBlock(scope: !236, file: !66, line: 278, column: 4)
!242 = !DILocation(line: 279, column: 17, scope: !240)
!243 = !DILocation(line: 279, column: 8, scope: !241)
!244 = !DILocation(line: 281, column: 18, scope: !245)
!245 = distinct !DILexicalBlock(scope: !240, file: !66, line: 280, column: 5)
!246 = !DILocation(line: 281, column: 13, scope: !245)
!247 = !DILocation(line: 281, column: 6, scope: !245)
!248 = !DILocation(line: 285, column: 6, scope: !249)
!249 = distinct !DILexicalBlock(scope: !240, file: !66, line: 284, column: 5)
!250 = !DILocation(line: 290, column: 5, scope: !251)
!251 = distinct !DILexicalBlock(scope: !236, file: !66, line: 289, column: 4)
!252 = !DILocation(line: 295, column: 7, scope: !253)
!253 = distinct !DILexicalBlock(scope: !254, file: !66, line: 295, column: 7)
!254 = distinct !DILexicalBlock(scope: !211, file: !66, line: 294, column: 3)
!255 = !DILocation(line: 295, column: 19, scope: !253)
!256 = !DILocation(line: 295, column: 7, scope: !254)
!257 = !DILocation(line: 297, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !253, file: !66, line: 296, column: 4)
!259 = !DILocation(line: 297, column: 29, scope: !258)
!260 = !DILocation(line: 297, column: 38, scope: !258)
!261 = !DILocation(line: 297, column: 37, scope: !258)
!262 = !DILocation(line: 297, column: 53, scope: !258)
!263 = !DILocation(line: 297, column: 51, scope: !258)
!264 = !DILocation(line: 297, column: 26, scope: !258)
!265 = !DILocation(line: 297, column: 66, scope: !258)
!266 = !DILocation(line: 297, column: 14, scope: !258)
!267 = !DILocation(line: 298, column: 16, scope: !258)
!268 = !DILocation(line: 298, column: 25, scope: !258)
!269 = !DILocation(line: 298, column: 24, scope: !258)
!270 = !DILocation(line: 298, column: 14, scope: !258)
!271 = !DILocation(line: 299, column: 16, scope: !258)
!272 = !DILocation(line: 299, column: 28, scope: !258)
!273 = !DILocation(line: 299, column: 39, scope: !258)
!274 = !DILocation(line: 299, column: 38, scope: !258)
!275 = !DILocation(line: 299, column: 25, scope: !258)
!276 = !DILocation(line: 299, column: 14, scope: !258)
!277 = !DILocation(line: 300, column: 8, scope: !278)
!278 = distinct !DILexicalBlock(scope: !258, file: !66, line: 300, column: 8)
!279 = !DILocation(line: 300, column: 17, scope: !278)
!280 = !DILocation(line: 300, column: 8, scope: !258)
!281 = !DILocation(line: 302, column: 9, scope: !282)
!282 = distinct !DILexicalBlock(scope: !283, file: !66, line: 302, column: 9)
!283 = distinct !DILexicalBlock(scope: !278, file: !66, line: 301, column: 5)
!284 = !DILocation(line: 302, column: 18, scope: !282)
!285 = !DILocation(line: 302, column: 9, scope: !283)
!286 = !DILocation(line: 304, column: 19, scope: !287)
!287 = distinct !DILexicalBlock(scope: !282, file: !66, line: 303, column: 6)
!288 = !DILocation(line: 304, column: 14, scope: !287)
!289 = !DILocation(line: 304, column: 7, scope: !287)
!290 = !DILocation(line: 308, column: 7, scope: !291)
!291 = distinct !DILexicalBlock(scope: !282, file: !66, line: 307, column: 6)
!292 = !DILocation(line: 313, column: 6, scope: !293)
!293 = distinct !DILexicalBlock(scope: !278, file: !66, line: 312, column: 5)
!294 = !DILocation(line: 319, column: 5, scope: !295)
!295 = distinct !DILexicalBlock(scope: !253, file: !66, line: 318, column: 4)
!296 = !DILocation(line: 325, column: 1, scope: !184)
!297 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !66, file: !66, line: 343, type: !298, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!298 = !DISubroutineType(types: !299)
!299 = !{!6, !6, !18}
!300 = !DILocalVariable(name: "numerator", arg: 1, scope: !297, file: !66, line: 343, type: !6)
!301 = !DILocation(line: 343, column: 31, scope: !297)
!302 = !DILocalVariable(name: "denominator", arg: 2, scope: !297, file: !66, line: 343, type: !18)
!303 = !DILocation(line: 343, column: 47, scope: !297)
!304 = !DILocalVariable(name: "u16Temp1", scope: !297, file: !66, line: 345, type: !18)
!305 = !DILocation(line: 345, column: 6, scope: !297)
!306 = !DILocalVariable(name: "s32Temp1", scope: !297, file: !66, line: 346, type: !74)
!307 = !DILocation(line: 346, column: 6, scope: !297)
!308 = !DILocalVariable(name: "s32Temp2", scope: !297, file: !66, line: 346, type: !74)
!309 = !DILocation(line: 346, column: 15, scope: !297)
!310 = !DILocation(line: 347, column: 13, scope: !297)
!311 = !DILocation(line: 347, column: 25, scope: !297)
!312 = !DILocation(line: 347, column: 11, scope: !297)
!313 = !DILocation(line: 348, column: 13, scope: !297)
!314 = !DILocation(line: 348, column: 22, scope: !297)
!315 = !DILocation(line: 348, column: 11, scope: !297)
!316 = !DILocation(line: 349, column: 5, scope: !317)
!317 = distinct !DILexicalBlock(scope: !297, file: !66, line: 349, column: 5)
!318 = !DILocation(line: 349, column: 14, scope: !317)
!319 = !DILocation(line: 349, column: 5, scope: !297)
!320 = !DILocation(line: 351, column: 7, scope: !321)
!321 = distinct !DILexicalBlock(scope: !322, file: !66, line: 351, column: 7)
!322 = distinct !DILexicalBlock(scope: !317, file: !66, line: 350, column: 2)
!323 = !DILocation(line: 351, column: 17, scope: !321)
!324 = !DILocation(line: 351, column: 7, scope: !322)
!325 = !DILocation(line: 353, column: 4, scope: !326)
!326 = distinct !DILexicalBlock(scope: !321, file: !66, line: 352, column: 3)
!327 = !DILocation(line: 357, column: 4, scope: !328)
!328 = distinct !DILexicalBlock(scope: !321, file: !66, line: 356, column: 3)
!329 = !DILocation(line: 362, column: 15, scope: !330)
!330 = distinct !DILexicalBlock(scope: !317, file: !66, line: 361, column: 2)
!331 = !DILocation(line: 362, column: 24, scope: !330)
!332 = !DILocation(line: 362, column: 32, scope: !330)
!333 = !DILocation(line: 362, column: 41, scope: !330)
!334 = !DILocation(line: 362, column: 47, scope: !330)
!335 = !DILocation(line: 362, column: 46, scope: !330)
!336 = !DILocation(line: 362, column: 57, scope: !330)
!337 = !DILocation(line: 362, column: 56, scope: !330)
!338 = !DILocation(line: 362, column: 29, scope: !330)
!339 = !DILocation(line: 362, column: 12, scope: !330)
!340 = !DILocation(line: 363, column: 14, scope: !330)
!341 = !DILocation(line: 363, column: 22, scope: !330)
!342 = !DILocation(line: 363, column: 12, scope: !330)
!343 = !DILocation(line: 364, column: 14, scope: !330)
!344 = !DILocation(line: 364, column: 23, scope: !330)
!345 = !DILocation(line: 364, column: 22, scope: !330)
!346 = !DILocation(line: 364, column: 12, scope: !330)
!347 = !DILocation(line: 365, column: 16, scope: !330)
!348 = !DILocation(line: 365, column: 25, scope: !330)
!349 = !DILocation(line: 365, column: 31, scope: !330)
!350 = !DILocation(line: 365, column: 30, scope: !330)
!351 = !DILocation(line: 365, column: 43, scope: !330)
!352 = !DILocation(line: 365, column: 41, scope: !330)
!353 = !DILocation(line: 365, column: 12, scope: !330)
!354 = !DILocation(line: 366, column: 6, scope: !355)
!355 = distinct !DILexicalBlock(scope: !330, file: !66, line: 366, column: 6)
!356 = !DILocation(line: 366, column: 15, scope: !355)
!357 = !DILocation(line: 366, column: 6, scope: !330)
!358 = !DILocation(line: 368, column: 7, scope: !359)
!359 = distinct !DILexicalBlock(scope: !360, file: !66, line: 368, column: 7)
!360 = distinct !DILexicalBlock(scope: !355, file: !66, line: 367, column: 3)
!361 = !DILocation(line: 368, column: 16, scope: !359)
!362 = !DILocation(line: 368, column: 7, scope: !360)
!363 = !DILocation(line: 370, column: 17, scope: !364)
!364 = distinct !DILexicalBlock(scope: !359, file: !66, line: 369, column: 4)
!365 = !DILocation(line: 370, column: 12, scope: !364)
!366 = !DILocation(line: 370, column: 5, scope: !364)
!367 = !DILocation(line: 374, column: 5, scope: !368)
!368 = distinct !DILexicalBlock(scope: !359, file: !66, line: 373, column: 4)
!369 = !DILocation(line: 379, column: 4, scope: !370)
!370 = distinct !DILexicalBlock(scope: !355, file: !66, line: 378, column: 3)
!371 = !DILocation(line: 382, column: 1, scope: !297)
!372 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !66, file: !66, line: 399, type: !298, scopeLine: 400, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!373 = !DILocalVariable(name: "numerator", arg: 1, scope: !372, file: !66, line: 399, type: !6)
!374 = !DILocation(line: 399, column: 30, scope: !372)
!375 = !DILocalVariable(name: "denominator", arg: 2, scope: !372, file: !66, line: 399, type: !18)
!376 = !DILocation(line: 399, column: 45, scope: !372)
!377 = !DILocalVariable(name: "u16Temp1", scope: !372, file: !66, line: 401, type: !18)
!378 = !DILocation(line: 401, column: 6, scope: !372)
!379 = !DILocalVariable(name: "s32Temp1", scope: !372, file: !66, line: 402, type: !74)
!380 = !DILocation(line: 402, column: 6, scope: !372)
!381 = !DILocation(line: 403, column: 13, scope: !372)
!382 = !DILocation(line: 403, column: 25, scope: !372)
!383 = !DILocation(line: 403, column: 11, scope: !372)
!384 = !DILocation(line: 404, column: 5, scope: !385)
!385 = distinct !DILexicalBlock(scope: !372, file: !66, line: 404, column: 5)
!386 = !DILocation(line: 404, column: 13, scope: !385)
!387 = !DILocation(line: 404, column: 5, scope: !372)
!388 = !DILocation(line: 406, column: 6, scope: !389)
!389 = distinct !DILexicalBlock(scope: !390, file: !66, line: 406, column: 6)
!390 = distinct !DILexicalBlock(scope: !385, file: !66, line: 405, column: 2)
!391 = !DILocation(line: 406, column: 15, scope: !389)
!392 = !DILocation(line: 406, column: 6, scope: !390)
!393 = !DILocation(line: 408, column: 4, scope: !394)
!394 = distinct !DILexicalBlock(scope: !389, file: !66, line: 407, column: 3)
!395 = !DILocation(line: 412, column: 4, scope: !396)
!396 = distinct !DILexicalBlock(scope: !389, file: !66, line: 411, column: 3)
!397 = !DILocation(line: 418, column: 15, scope: !398)
!398 = distinct !DILexicalBlock(scope: !385, file: !66, line: 417, column: 2)
!399 = !DILocation(line: 418, column: 27, scope: !398)
!400 = !DILocation(line: 418, column: 37, scope: !398)
!401 = !DILocation(line: 418, column: 36, scope: !398)
!402 = !DILocation(line: 418, column: 49, scope: !398)
!403 = !DILocation(line: 418, column: 47, scope: !398)
!404 = !DILocation(line: 418, column: 25, scope: !398)
!405 = !DILocation(line: 418, column: 59, scope: !398)
!406 = !DILocation(line: 418, column: 12, scope: !398)
!407 = !DILocation(line: 419, column: 15, scope: !398)
!408 = !DILocation(line: 419, column: 24, scope: !398)
!409 = !DILocation(line: 419, column: 23, scope: !398)
!410 = !DILocation(line: 419, column: 37, scope: !398)
!411 = !DILocation(line: 419, column: 47, scope: !398)
!412 = !DILocation(line: 419, column: 46, scope: !398)
!413 = !DILocation(line: 419, column: 34, scope: !398)
!414 = !DILocation(line: 419, column: 12, scope: !398)
!415 = !DILocation(line: 420, column: 10, scope: !398)
!416 = !DILocation(line: 420, column: 3, scope: !398)
!417 = !DILocation(line: 422, column: 1, scope: !372)
!418 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !66, file: !66, line: 440, type: !419, scopeLine: 441, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!419 = !DISubroutineType(types: !420)
!420 = !{!13, !18, !18}
!421 = !DILocalVariable(name: "numerator", arg: 1, scope: !418, file: !66, line: 440, type: !18)
!422 = !DILocation(line: 440, column: 28, scope: !418)
!423 = !DILocalVariable(name: "denominator", arg: 2, scope: !418, file: !66, line: 440, type: !18)
!424 = !DILocation(line: 440, column: 43, scope: !418)
!425 = !DILocalVariable(name: "u32Temp1", scope: !418, file: !66, line: 442, type: !426)
!426 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !49)
!427 = !DILocation(line: 442, column: 6, scope: !418)
!428 = !DILocalVariable(name: "u32Temp2", scope: !418, file: !66, line: 442, type: !426)
!429 = !DILocation(line: 442, column: 20, scope: !418)
!430 = !DILocalVariable(name: "u32Temp3", scope: !418, file: !66, line: 442, type: !426)
!431 = !DILocation(line: 442, column: 33, scope: !418)
!432 = !DILocation(line: 443, column: 5, scope: !433)
!433 = distinct !DILexicalBlock(scope: !418, file: !66, line: 443, column: 5)
!434 = !DILocation(line: 443, column: 16, scope: !433)
!435 = !DILocation(line: 443, column: 5, scope: !418)
!436 = !DILocation(line: 445, column: 3, scope: !437)
!437 = distinct !DILexicalBlock(scope: !433, file: !66, line: 444, column: 2)
!438 = !DILocation(line: 449, column: 15, scope: !439)
!439 = distinct !DILexicalBlock(scope: !433, file: !66, line: 448, column: 2)
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
!451 = distinct !DILexicalBlock(scope: !439, file: !66, line: 452, column: 6)
!452 = !DILocation(line: 452, column: 15, scope: !451)
!453 = !DILocation(line: 452, column: 6, scope: !439)
!454 = !DILocation(line: 454, column: 15, scope: !455)
!455 = distinct !DILexicalBlock(scope: !451, file: !66, line: 453, column: 3)
!456 = !DILocation(line: 454, column: 11, scope: !455)
!457 = !DILocation(line: 454, column: 4, scope: !455)
!458 = !DILocation(line: 458, column: 4, scope: !459)
!459 = distinct !DILexicalBlock(scope: !451, file: !66, line: 457, column: 3)
!460 = !DILocation(line: 461, column: 1, scope: !418)
!461 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !66, file: !66, line: 478, type: !462, scopeLine: 479, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!462 = !DISubroutineType(types: !463)
!463 = !{!18, !74, !18}
!464 = !DILocalVariable(name: "x_value", arg: 1, scope: !461, file: !66, line: 478, type: !74)
!465 = !DILocation(line: 478, column: 25, scope: !461)
!466 = !DILocalVariable(name: "y_value", arg: 2, scope: !461, file: !66, line: 478, type: !18)
!467 = !DILocation(line: 478, column: 38, scope: !461)
!468 = !DILocalVariable(name: "s32Temp1", scope: !461, file: !66, line: 480, type: !74)
!469 = !DILocation(line: 480, column: 6, scope: !461)
!470 = !DILocation(line: 481, column: 12, scope: !461)
!471 = !DILocation(line: 481, column: 20, scope: !461)
!472 = !DILocation(line: 481, column: 10, scope: !461)
!473 = !DILocation(line: 482, column: 6, scope: !474)
!474 = distinct !DILexicalBlock(scope: !461, file: !66, line: 482, column: 5)
!475 = !DILocation(line: 482, column: 14, scope: !474)
!476 = !DILocation(line: 482, column: 24, scope: !474)
!477 = !DILocation(line: 482, column: 5, scope: !461)
!478 = !DILocation(line: 484, column: 6, scope: !479)
!479 = distinct !DILexicalBlock(scope: !480, file: !66, line: 484, column: 6)
!480 = distinct !DILexicalBlock(scope: !474, file: !66, line: 483, column: 2)
!481 = !DILocation(line: 484, column: 14, scope: !479)
!482 = !DILocation(line: 484, column: 6, scope: !480)
!483 = !DILocation(line: 486, column: 4, scope: !484)
!484 = distinct !DILexicalBlock(scope: !479, file: !66, line: 485, column: 3)
!485 = !DILocation(line: 490, column: 4, scope: !486)
!486 = distinct !DILexicalBlock(scope: !479, file: !66, line: 489, column: 3)
!487 = !DILocation(line: 495, column: 15, scope: !488)
!488 = distinct !DILexicalBlock(scope: !474, file: !66, line: 494, column: 2)
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
!506 = distinct !DILexicalBlock(scope: !488, file: !66, line: 497, column: 6)
!507 = !DILocation(line: 497, column: 15, scope: !506)
!508 = !DILocation(line: 497, column: 6, scope: !488)
!509 = !DILocation(line: 499, column: 7, scope: !510)
!510 = distinct !DILexicalBlock(scope: !511, file: !66, line: 499, column: 7)
!511 = distinct !DILexicalBlock(scope: !506, file: !66, line: 498, column: 3)
!512 = !DILocation(line: 499, column: 16, scope: !510)
!513 = !DILocation(line: 499, column: 7, scope: !511)
!514 = !DILocation(line: 501, column: 17, scope: !515)
!515 = distinct !DILexicalBlock(scope: !510, file: !66, line: 500, column: 4)
!516 = !DILocation(line: 501, column: 12, scope: !515)
!517 = !DILocation(line: 501, column: 5, scope: !515)
!518 = !DILocation(line: 505, column: 5, scope: !519)
!519 = distinct !DILexicalBlock(scope: !510, file: !66, line: 504, column: 4)
!520 = !DILocation(line: 510, column: 4, scope: !521)
!521 = distinct !DILexicalBlock(scope: !506, file: !66, line: 509, column: 3)
!522 = !DILocation(line: 513, column: 1, scope: !461)
!523 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !66, file: !66, line: 531, type: !524, scopeLine: 532, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!524 = !DISubroutineType(types: !525)
!525 = !{!18, !18, !18}
!526 = !DILocalVariable(name: "numerator", arg: 1, scope: !523, file: !66, line: 531, type: !18)
!527 = !DILocation(line: 531, column: 31, scope: !523)
!528 = !DILocalVariable(name: "denominator", arg: 2, scope: !523, file: !66, line: 531, type: !18)
!529 = !DILocation(line: 531, column: 46, scope: !523)
!530 = !DILocalVariable(name: "u32Temp", scope: !523, file: !66, line: 533, type: !426)
!531 = !DILocation(line: 533, column: 6, scope: !523)
!532 = !DILocation(line: 534, column: 5, scope: !533)
!533 = distinct !DILexicalBlock(scope: !523, file: !66, line: 534, column: 5)
!534 = !DILocation(line: 534, column: 17, scope: !533)
!535 = !DILocation(line: 534, column: 5, scope: !523)
!536 = !DILocation(line: 536, column: 3, scope: !537)
!537 = distinct !DILexicalBlock(scope: !533, file: !66, line: 535, column: 2)
!538 = !DILocation(line: 540, column: 14, scope: !539)
!539 = distinct !DILexicalBlock(scope: !533, file: !66, line: 539, column: 2)
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
!550 = distinct !DILexicalBlock(scope: !539, file: !66, line: 542, column: 6)
!551 = !DILocation(line: 542, column: 14, scope: !550)
!552 = !DILocation(line: 542, column: 6, scope: !539)
!553 = !DILocation(line: 544, column: 11, scope: !554)
!554 = distinct !DILexicalBlock(scope: !550, file: !66, line: 543, column: 3)
!555 = !DILocation(line: 544, column: 19, scope: !554)
!556 = !DILocation(line: 544, column: 4, scope: !554)
!557 = !DILocation(line: 548, column: 4, scope: !558)
!558 = distinct !DILexicalBlock(scope: !550, file: !66, line: 547, column: 3)
!559 = !DILocation(line: 552, column: 1, scope: !523)
!560 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !66, file: !66, line: 569, type: !561, scopeLine: 570, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!561 = !DISubroutineType(types: !562)
!562 = !{!18, !426, !18}
!563 = !DILocalVariable(name: "x_value", arg: 1, scope: !560, file: !66, line: 569, type: !426)
!564 = !DILocation(line: 569, column: 25, scope: !560)
!565 = !DILocalVariable(name: "y_value", arg: 2, scope: !560, file: !66, line: 569, type: !18)
!566 = !DILocation(line: 569, column: 38, scope: !560)
!567 = !DILocalVariable(name: "u32Temp1", scope: !560, file: !66, line: 571, type: !426)
!568 = !DILocation(line: 571, column: 6, scope: !560)
!569 = !DILocalVariable(name: "u32Temp2", scope: !560, file: !66, line: 571, type: !426)
!570 = !DILocation(line: 571, column: 17, scope: !560)
!571 = !DILocation(line: 572, column: 12, scope: !560)
!572 = !DILocation(line: 572, column: 20, scope: !560)
!573 = !DILocation(line: 572, column: 10, scope: !560)
!574 = !DILocation(line: 573, column: 5, scope: !575)
!575 = distinct !DILexicalBlock(scope: !560, file: !66, line: 573, column: 5)
!576 = !DILocation(line: 573, column: 13, scope: !575)
!577 = !DILocation(line: 573, column: 5, scope: !560)
!578 = !DILocation(line: 575, column: 3, scope: !579)
!579 = distinct !DILexicalBlock(scope: !575, file: !66, line: 574, column: 2)
!580 = !DILocation(line: 579, column: 14, scope: !581)
!581 = distinct !DILexicalBlock(scope: !575, file: !66, line: 578, column: 2)
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
!601 = distinct !DILexicalBlock(scope: !581, file: !66, line: 582, column: 6)
!602 = !DILocation(line: 582, column: 15, scope: !601)
!603 = !DILocation(line: 582, column: 6, scope: !581)
!604 = !DILocation(line: 584, column: 11, scope: !605)
!605 = distinct !DILexicalBlock(scope: !601, file: !66, line: 583, column: 3)
!606 = !DILocation(line: 584, column: 20, scope: !605)
!607 = !DILocation(line: 584, column: 4, scope: !605)
!608 = !DILocation(line: 588, column: 4, scope: !609)
!609 = distinct !DILexicalBlock(scope: !601, file: !66, line: 587, column: 3)
!610 = !DILocation(line: 592, column: 1, scope: !560)
!611 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !66, file: !66, line: 611, type: !612, scopeLine: 612, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!612 = !DISubroutineType(types: !613)
!613 = !{!6, !6, !18, !6}
!614 = !DILocalVariable(name: "factor1", arg: 1, scope: !611, file: !66, line: 611, type: !6)
!615 = !DILocation(line: 611, column: 33, scope: !611)
!616 = !DILocalVariable(name: "factor2", arg: 2, scope: !611, file: !66, line: 611, type: !18)
!617 = !DILocation(line: 611, column: 46, scope: !611)
!618 = !DILocalVariable(name: "denominator", arg: 3, scope: !611, file: !66, line: 611, type: !6)
!619 = !DILocation(line: 611, column: 59, scope: !611)
!620 = !DILocalVariable(name: "s32Result", scope: !611, file: !66, line: 613, type: !74)
!621 = !DILocation(line: 613, column: 6, scope: !611)
!622 = !DILocalVariable(name: "s32Temp1", scope: !611, file: !66, line: 613, type: !74)
!623 = !DILocation(line: 613, column: 21, scope: !611)
!624 = !DILocation(line: 614, column: 14, scope: !611)
!625 = !DILocation(line: 614, column: 24, scope: !611)
!626 = !DILocation(line: 614, column: 22, scope: !611)
!627 = !DILocation(line: 614, column: 12, scope: !611)
!628 = !DILocation(line: 615, column: 5, scope: !629)
!629 = distinct !DILexicalBlock(scope: !611, file: !66, line: 615, column: 5)
!630 = !DILocation(line: 615, column: 17, scope: !629)
!631 = !DILocation(line: 615, column: 5, scope: !611)
!632 = !DILocation(line: 617, column: 6, scope: !633)
!633 = distinct !DILexicalBlock(scope: !634, file: !66, line: 617, column: 6)
!634 = distinct !DILexicalBlock(scope: !629, file: !66, line: 616, column: 2)
!635 = !DILocation(line: 617, column: 16, scope: !633)
!636 = !DILocation(line: 617, column: 6, scope: !634)
!637 = !DILocation(line: 619, column: 4, scope: !638)
!638 = distinct !DILexicalBlock(scope: !633, file: !66, line: 618, column: 3)
!639 = !DILocation(line: 623, column: 4, scope: !640)
!640 = distinct !DILexicalBlock(scope: !633, file: !66, line: 622, column: 3)
!641 = !DILocation(line: 628, column: 14, scope: !642)
!642 = distinct !DILexicalBlock(scope: !629, file: !66, line: 627, column: 2)
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
!662 = distinct !DILexicalBlock(scope: !642, file: !66, line: 631, column: 6)
!663 = !DILocation(line: 631, column: 16, scope: !662)
!664 = !DILocation(line: 631, column: 6, scope: !642)
!665 = !DILocation(line: 633, column: 7, scope: !666)
!666 = distinct !DILexicalBlock(scope: !667, file: !66, line: 633, column: 7)
!667 = distinct !DILexicalBlock(scope: !662, file: !66, line: 632, column: 3)
!668 = !DILocation(line: 633, column: 17, scope: !666)
!669 = !DILocation(line: 633, column: 7, scope: !667)
!670 = !DILocation(line: 635, column: 17, scope: !671)
!671 = distinct !DILexicalBlock(scope: !666, file: !66, line: 634, column: 4)
!672 = !DILocation(line: 635, column: 12, scope: !671)
!673 = !DILocation(line: 635, column: 5, scope: !671)
!674 = !DILocation(line: 640, column: 5, scope: !675)
!675 = distinct !DILexicalBlock(scope: !666, file: !66, line: 639, column: 4)
!676 = !DILocation(line: 645, column: 4, scope: !677)
!677 = distinct !DILexicalBlock(scope: !662, file: !66, line: 644, column: 3)
!678 = !DILocation(line: 649, column: 1, scope: !611)
!679 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !66, file: !66, line: 667, type: !680, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!680 = !DISubroutineType(types: !681)
!681 = !{!6, !18, !6, !18}
!682 = !DILocalVariable(name: "factor1", arg: 1, scope: !679, file: !66, line: 667, type: !18)
!683 = !DILocation(line: 667, column: 33, scope: !679)
!684 = !DILocalVariable(name: "factor2", arg: 2, scope: !679, file: !66, line: 667, type: !6)
!685 = !DILocation(line: 667, column: 46, scope: !679)
!686 = !DILocalVariable(name: "denominator", arg: 3, scope: !679, file: !66, line: 667, type: !18)
!687 = !DILocation(line: 667, column: 59, scope: !679)
!688 = !DILocalVariable(name: "s32Result", scope: !679, file: !66, line: 669, type: !74)
!689 = !DILocation(line: 669, column: 6, scope: !679)
!690 = !DILocalVariable(name: "s32Temp1", scope: !679, file: !66, line: 669, type: !74)
!691 = !DILocation(line: 669, column: 21, scope: !679)
!692 = !DILocation(line: 670, column: 14, scope: !679)
!693 = !DILocation(line: 670, column: 24, scope: !679)
!694 = !DILocation(line: 670, column: 22, scope: !679)
!695 = !DILocation(line: 670, column: 12, scope: !679)
!696 = !DILocation(line: 671, column: 5, scope: !697)
!697 = distinct !DILexicalBlock(scope: !679, file: !66, line: 671, column: 5)
!698 = !DILocation(line: 671, column: 16, scope: !697)
!699 = !DILocation(line: 671, column: 5, scope: !679)
!700 = !DILocation(line: 673, column: 6, scope: !701)
!701 = distinct !DILexicalBlock(scope: !702, file: !66, line: 673, column: 6)
!702 = distinct !DILexicalBlock(scope: !697, file: !66, line: 672, column: 2)
!703 = !DILocation(line: 673, column: 16, scope: !701)
!704 = !DILocation(line: 673, column: 6, scope: !702)
!705 = !DILocation(line: 675, column: 4, scope: !706)
!706 = distinct !DILexicalBlock(scope: !701, file: !66, line: 674, column: 3)
!707 = !DILocation(line: 679, column: 4, scope: !708)
!708 = distinct !DILexicalBlock(scope: !701, file: !66, line: 678, column: 3)
!709 = !DILocation(line: 684, column: 14, scope: !710)
!710 = distinct !DILexicalBlock(scope: !697, file: !66, line: 683, column: 2)
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
!728 = distinct !DILexicalBlock(scope: !710, file: !66, line: 686, column: 6)
!729 = !DILocation(line: 686, column: 16, scope: !728)
!730 = !DILocation(line: 686, column: 6, scope: !710)
!731 = !DILocation(line: 688, column: 7, scope: !732)
!732 = distinct !DILexicalBlock(scope: !733, file: !66, line: 688, column: 7)
!733 = distinct !DILexicalBlock(scope: !728, file: !66, line: 687, column: 3)
!734 = !DILocation(line: 688, column: 17, scope: !732)
!735 = !DILocation(line: 688, column: 7, scope: !733)
!736 = !DILocation(line: 690, column: 17, scope: !737)
!737 = distinct !DILexicalBlock(scope: !732, file: !66, line: 689, column: 4)
!738 = !DILocation(line: 690, column: 12, scope: !737)
!739 = !DILocation(line: 690, column: 5, scope: !737)
!740 = !DILocation(line: 694, column: 5, scope: !741)
!741 = distinct !DILexicalBlock(scope: !732, file: !66, line: 693, column: 4)
!742 = !DILocation(line: 699, column: 4, scope: !743)
!743 = distinct !DILexicalBlock(scope: !728, file: !66, line: 698, column: 3)
!744 = !DILocation(line: 702, column: 1, scope: !679)
!745 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !66, file: !66, line: 721, type: !746, scopeLine: 722, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!746 = !DISubroutineType(types: !747)
!747 = !{!18, !6, !18, !6}
!748 = !DILocalVariable(name: "factor1", arg: 1, scope: !745, file: !66, line: 721, type: !6)
!749 = !DILocation(line: 721, column: 33, scope: !745)
!750 = !DILocalVariable(name: "factor2", arg: 2, scope: !745, file: !66, line: 721, type: !18)
!751 = !DILocation(line: 721, column: 46, scope: !745)
!752 = !DILocalVariable(name: "denominator", arg: 3, scope: !745, file: !66, line: 721, type: !6)
!753 = !DILocation(line: 721, column: 59, scope: !745)
!754 = !DILocalVariable(name: "u32Result", scope: !745, file: !66, line: 723, type: !426)
!755 = !DILocation(line: 723, column: 6, scope: !745)
!756 = !DILocalVariable(name: "u32Temp1", scope: !745, file: !66, line: 723, type: !426)
!757 = !DILocation(line: 723, column: 21, scope: !745)
!758 = !DILocalVariable(name: "s32Result", scope: !745, file: !66, line: 724, type: !74)
!759 = !DILocation(line: 724, column: 6, scope: !745)
!760 = !DILocalVariable(name: "s32Temp1", scope: !745, file: !66, line: 724, type: !74)
!761 = !DILocation(line: 724, column: 21, scope: !745)
!762 = !DILocation(line: 725, column: 14, scope: !745)
!763 = !DILocation(line: 725, column: 24, scope: !745)
!764 = !DILocation(line: 725, column: 22, scope: !745)
!765 = !DILocation(line: 725, column: 12, scope: !745)
!766 = !DILocation(line: 727, column: 5, scope: !767)
!767 = distinct !DILexicalBlock(scope: !745, file: !66, line: 727, column: 5)
!768 = !DILocation(line: 727, column: 17, scope: !767)
!769 = !DILocation(line: 727, column: 5, scope: !745)
!770 = !DILocation(line: 729, column: 6, scope: !771)
!771 = distinct !DILexicalBlock(scope: !772, file: !66, line: 729, column: 6)
!772 = distinct !DILexicalBlock(scope: !767, file: !66, line: 728, column: 2)
!773 = !DILocation(line: 729, column: 16, scope: !771)
!774 = !DILocation(line: 729, column: 6, scope: !772)
!775 = !DILocation(line: 731, column: 4, scope: !776)
!776 = distinct !DILexicalBlock(scope: !771, file: !66, line: 730, column: 3)
!777 = !DILocation(line: 735, column: 4, scope: !778)
!778 = distinct !DILexicalBlock(scope: !771, file: !66, line: 734, column: 3)
!779 = !DILocation(line: 740, column: 15, scope: !780)
!780 = distinct !DILexicalBlock(scope: !767, file: !66, line: 739, column: 2)
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
!798 = distinct !DILexicalBlock(scope: !780, file: !66, line: 742, column: 6)
!799 = !DILocation(line: 742, column: 16, scope: !798)
!800 = !DILocation(line: 742, column: 6, scope: !780)
!801 = !DILocation(line: 744, column: 7, scope: !802)
!802 = distinct !DILexicalBlock(scope: !803, file: !66, line: 744, column: 7)
!803 = distinct !DILexicalBlock(scope: !798, file: !66, line: 743, column: 3)
!804 = !DILocation(line: 744, column: 17, scope: !802)
!805 = !DILocation(line: 744, column: 7, scope: !803)
!806 = !DILocation(line: 746, column: 17, scope: !807)
!807 = distinct !DILexicalBlock(scope: !802, file: !66, line: 745, column: 4)
!808 = !DILocation(line: 746, column: 12, scope: !807)
!809 = !DILocation(line: 746, column: 5, scope: !807)
!810 = !DILocation(line: 750, column: 5, scope: !811)
!811 = distinct !DILexicalBlock(scope: !802, file: !66, line: 749, column: 4)
!812 = !DILocation(line: 755, column: 4, scope: !813)
!813 = distinct !DILexicalBlock(scope: !798, file: !66, line: 754, column: 3)
!814 = !DILocation(line: 758, column: 1, scope: !745)
!815 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !66, file: !66, line: 777, type: !816, scopeLine: 778, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!816 = !DISubroutineType(types: !817)
!817 = !{!18, !6, !18, !18}
!818 = !DILocalVariable(name: "factor1", arg: 1, scope: !815, file: !66, line: 777, type: !6)
!819 = !DILocation(line: 777, column: 33, scope: !815)
!820 = !DILocalVariable(name: "factor2", arg: 2, scope: !815, file: !66, line: 777, type: !18)
!821 = !DILocation(line: 777, column: 46, scope: !815)
!822 = !DILocalVariable(name: "denominator", arg: 3, scope: !815, file: !66, line: 777, type: !18)
!823 = !DILocation(line: 777, column: 59, scope: !815)
!824 = !DILocalVariable(name: "s32Result", scope: !815, file: !66, line: 779, type: !74)
!825 = !DILocation(line: 779, column: 6, scope: !815)
!826 = !DILocalVariable(name: "s32Temp1", scope: !815, file: !66, line: 779, type: !74)
!827 = !DILocation(line: 779, column: 21, scope: !815)
!828 = !DILocation(line: 780, column: 14, scope: !815)
!829 = !DILocation(line: 780, column: 24, scope: !815)
!830 = !DILocation(line: 780, column: 22, scope: !815)
!831 = !DILocation(line: 780, column: 12, scope: !815)
!832 = !DILocation(line: 782, column: 5, scope: !833)
!833 = distinct !DILexicalBlock(scope: !815, file: !66, line: 782, column: 5)
!834 = !DILocation(line: 782, column: 17, scope: !833)
!835 = !DILocation(line: 782, column: 5, scope: !815)
!836 = !DILocation(line: 784, column: 6, scope: !837)
!837 = distinct !DILexicalBlock(scope: !838, file: !66, line: 784, column: 6)
!838 = distinct !DILexicalBlock(scope: !833, file: !66, line: 783, column: 2)
!839 = !DILocation(line: 784, column: 16, scope: !837)
!840 = !DILocation(line: 784, column: 6, scope: !838)
!841 = !DILocation(line: 786, column: 4, scope: !842)
!842 = distinct !DILexicalBlock(scope: !837, file: !66, line: 785, column: 3)
!843 = !DILocation(line: 790, column: 4, scope: !844)
!844 = distinct !DILexicalBlock(scope: !837, file: !66, line: 789, column: 3)
!845 = !DILocation(line: 795, column: 15, scope: !846)
!846 = distinct !DILexicalBlock(scope: !833, file: !66, line: 794, column: 2)
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
!864 = distinct !DILexicalBlock(scope: !846, file: !66, line: 797, column: 6)
!865 = !DILocation(line: 797, column: 16, scope: !864)
!866 = !DILocation(line: 797, column: 6, scope: !846)
!867 = !DILocation(line: 799, column: 7, scope: !868)
!868 = distinct !DILexicalBlock(scope: !869, file: !66, line: 799, column: 7)
!869 = distinct !DILexicalBlock(scope: !864, file: !66, line: 798, column: 3)
!870 = !DILocation(line: 799, column: 17, scope: !868)
!871 = !DILocation(line: 799, column: 7, scope: !869)
!872 = !DILocation(line: 801, column: 17, scope: !873)
!873 = distinct !DILexicalBlock(scope: !868, file: !66, line: 800, column: 4)
!874 = !DILocation(line: 801, column: 12, scope: !873)
!875 = !DILocation(line: 801, column: 5, scope: !873)
!876 = !DILocation(line: 805, column: 5, scope: !877)
!877 = distinct !DILexicalBlock(scope: !868, file: !66, line: 804, column: 4)
!878 = !DILocation(line: 810, column: 4, scope: !879)
!879 = distinct !DILexicalBlock(scope: !864, file: !66, line: 809, column: 3)
!880 = !DILocation(line: 814, column: 1, scope: !815)
!881 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !66, file: !66, line: 832, type: !882, scopeLine: 833, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!882 = !DISubroutineType(types: !883)
!883 = !{!18, !18, !18, !18}
!884 = !DILocalVariable(name: "factor1", arg: 1, scope: !881, file: !66, line: 832, type: !18)
!885 = !DILocation(line: 832, column: 33, scope: !881)
!886 = !DILocalVariable(name: "factor2", arg: 2, scope: !881, file: !66, line: 832, type: !18)
!887 = !DILocation(line: 832, column: 46, scope: !881)
!888 = !DILocalVariable(name: "denominator", arg: 3, scope: !881, file: !66, line: 832, type: !18)
!889 = !DILocation(line: 832, column: 59, scope: !881)
!890 = !DILocalVariable(name: "u32Temp1", scope: !881, file: !66, line: 834, type: !426)
!891 = !DILocation(line: 834, column: 6, scope: !881)
!892 = !DILocalVariable(name: "u16TempDenom", scope: !881, file: !66, line: 835, type: !18)
!893 = !DILocation(line: 835, column: 6, scope: !881)
!894 = !DILocation(line: 837, column: 5, scope: !895)
!895 = distinct !DILexicalBlock(scope: !881, file: !66, line: 837, column: 5)
!896 = !DILocation(line: 837, column: 17, scope: !895)
!897 = !DILocation(line: 837, column: 5, scope: !881)
!898 = !DILocation(line: 839, column: 3, scope: !899)
!899 = distinct !DILexicalBlock(scope: !895, file: !66, line: 838, column: 2)
!900 = !DILocation(line: 843, column: 14, scope: !901)
!901 = distinct !DILexicalBlock(scope: !895, file: !66, line: 842, column: 2)
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
!917 = distinct !DILexicalBlock(scope: !901, file: !66, line: 847, column: 6)
!918 = !DILocation(line: 847, column: 15, scope: !917)
!919 = !DILocation(line: 847, column: 6, scope: !901)
!920 = !DILocation(line: 849, column: 12, scope: !921)
!921 = distinct !DILexicalBlock(scope: !917, file: !66, line: 848, column: 3)
!922 = !DILocation(line: 849, column: 21, scope: !921)
!923 = !DILocation(line: 849, column: 11, scope: !921)
!924 = !DILocation(line: 849, column: 4, scope: !921)
!925 = !DILocation(line: 854, column: 4, scope: !926)
!926 = distinct !DILexicalBlock(scope: !917, file: !66, line: 853, column: 3)
!927 = !DILocation(line: 859, column: 1, scope: !881)
!928 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !66, file: !66, line: 876, type: !929, scopeLine: 877, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!929 = !DISubroutineType(types: !930)
!930 = !{!18, !18, !18, !426}
!931 = !DILocalVariable(name: "factor1", arg: 1, scope: !928, file: !66, line: 876, type: !18)
!932 = !DILocation(line: 876, column: 33, scope: !928)
!933 = !DILocalVariable(name: "factor2", arg: 2, scope: !928, file: !66, line: 876, type: !18)
!934 = !DILocation(line: 876, column: 46, scope: !928)
!935 = !DILocalVariable(name: "denominator", arg: 3, scope: !928, file: !66, line: 876, type: !426)
!936 = !DILocation(line: 876, column: 59, scope: !928)
!937 = !DILocalVariable(name: "u32Temp1", scope: !928, file: !66, line: 878, type: !426)
!938 = !DILocation(line: 878, column: 6, scope: !928)
!939 = !DILocation(line: 879, column: 5, scope: !940)
!940 = distinct !DILexicalBlock(scope: !928, file: !66, line: 879, column: 5)
!941 = !DILocation(line: 879, column: 17, scope: !940)
!942 = !DILocation(line: 879, column: 5, scope: !928)
!943 = !DILocation(line: 881, column: 3, scope: !944)
!944 = distinct !DILexicalBlock(scope: !940, file: !66, line: 880, column: 2)
!945 = !DILocation(line: 885, column: 15, scope: !946)
!946 = distinct !DILexicalBlock(scope: !940, file: !66, line: 884, column: 2)
!947 = !DILocation(line: 885, column: 25, scope: !946)
!948 = !DILocation(line: 885, column: 23, scope: !946)
!949 = !DILocation(line: 885, column: 36, scope: !946)
!950 = !DILocation(line: 885, column: 34, scope: !946)
!951 = !DILocation(line: 885, column: 12, scope: !946)
!952 = !DILocation(line: 886, column: 8, scope: !953)
!953 = distinct !DILexicalBlock(scope: !946, file: !66, line: 886, column: 6)
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
!965 = distinct !DILexicalBlock(scope: !953, file: !66, line: 887, column: 3)
!966 = !DILocation(line: 889, column: 3, scope: !965)
!967 = !DILocation(line: 890, column: 6, scope: !968)
!968 = distinct !DILexicalBlock(scope: !946, file: !66, line: 890, column: 6)
!969 = !DILocation(line: 890, column: 15, scope: !968)
!970 = !DILocation(line: 890, column: 6, scope: !946)
!971 = !DILocation(line: 892, column: 12, scope: !972)
!972 = distinct !DILexicalBlock(scope: !968, file: !66, line: 891, column: 3)
!973 = !DILocation(line: 892, column: 21, scope: !972)
!974 = !DILocation(line: 892, column: 11, scope: !972)
!975 = !DILocation(line: 892, column: 4, scope: !972)
!976 = !DILocation(line: 896, column: 4, scope: !977)
!977 = distinct !DILexicalBlock(scope: !968, file: !66, line: 895, column: 3)
!978 = !DILocation(line: 899, column: 1, scope: !928)
!979 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !66, file: !66, line: 916, type: !980, scopeLine: 917, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!980 = !DISubroutineType(types: !981)
!981 = !{!426, !426, !18}
!982 = !DILocalVariable(name: "x_value", arg: 1, scope: !979, file: !66, line: 916, type: !426)
!983 = !DILocation(line: 916, column: 25, scope: !979)
!984 = !DILocalVariable(name: "y_value", arg: 2, scope: !979, file: !66, line: 916, type: !18)
!985 = !DILocation(line: 916, column: 38, scope: !979)
!986 = !DILocalVariable(name: "u32Temp1", scope: !979, file: !66, line: 918, type: !426)
!987 = !DILocation(line: 918, column: 6, scope: !979)
!988 = !DILocation(line: 919, column: 5, scope: !989)
!989 = distinct !DILexicalBlock(scope: !979, file: !66, line: 919, column: 5)
!990 = !DILocation(line: 919, column: 13, scope: !989)
!991 = !DILocation(line: 919, column: 5, scope: !979)
!992 = !DILocation(line: 921, column: 3, scope: !993)
!993 = distinct !DILexicalBlock(scope: !989, file: !66, line: 920, column: 2)
!994 = !DILocation(line: 925, column: 15, scope: !995)
!995 = distinct !DILexicalBlock(scope: !989, file: !66, line: 924, column: 2)
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
!1015 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !66, file: !66, line: 947, type: !1016, scopeLine: 948, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!6, !6, !6, !6}
!1018 = !DILocalVariable(name: "fak1", arg: 1, scope: !1015, file: !66, line: 947, type: !6)
!1019 = !DILocation(line: 947, column: 33, scope: !1015)
!1020 = !DILocalVariable(name: "fak2", arg: 2, scope: !1015, file: !66, line: 947, type: !6)
!1021 = !DILocation(line: 947, column: 43, scope: !1015)
!1022 = !DILocalVariable(name: "div", arg: 3, scope: !1015, file: !66, line: 947, type: !6)
!1023 = !DILocation(line: 947, column: 53, scope: !1015)
!1024 = !DILocalVariable(name: "s32Temp1", scope: !1015, file: !66, line: 949, type: !74)
!1025 = !DILocation(line: 949, column: 6, scope: !1015)
!1026 = !DILocalVariable(name: "s32Temp2", scope: !1015, file: !66, line: 949, type: !74)
!1027 = !DILocation(line: 949, column: 20, scope: !1015)
!1028 = !DILocalVariable(name: "s32Temp3", scope: !1015, file: !66, line: 949, type: !74)
!1029 = !DILocation(line: 949, column: 34, scope: !1015)
!1030 = !DILocation(line: 950, column: 13, scope: !1015)
!1031 = !DILocation(line: 950, column: 20, scope: !1015)
!1032 = !DILocation(line: 950, column: 18, scope: !1015)
!1033 = !DILocation(line: 950, column: 11, scope: !1015)
!1034 = !DILocation(line: 951, column: 5, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1015, file: !66, line: 951, column: 5)
!1036 = !DILocation(line: 951, column: 9, scope: !1035)
!1037 = !DILocation(line: 951, column: 5, scope: !1015)
!1038 = !DILocation(line: 953, column: 6, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1040, file: !66, line: 953, column: 6)
!1040 = distinct !DILexicalBlock(scope: !1035, file: !66, line: 952, column: 2)
!1041 = !DILocation(line: 953, column: 15, scope: !1039)
!1042 = !DILocation(line: 953, column: 6, scope: !1040)
!1043 = !DILocation(line: 955, column: 4, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1039, file: !66, line: 954, column: 3)
!1045 = !DILocation(line: 959, column: 4, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1039, file: !66, line: 958, column: 3)
!1047 = !DILocation(line: 964, column: 15, scope: !1048)
!1048 = distinct !DILexicalBlock(scope: !1035, file: !66, line: 963, column: 2)
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
!1066 = distinct !DILexicalBlock(scope: !1048, file: !66, line: 966, column: 6)
!1067 = !DILocation(line: 966, column: 15, scope: !1066)
!1068 = !DILocation(line: 966, column: 6, scope: !1048)
!1069 = !DILocation(line: 968, column: 7, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1071, file: !66, line: 968, column: 7)
!1071 = distinct !DILexicalBlock(scope: !1066, file: !66, line: 967, column: 3)
!1072 = !DILocation(line: 968, column: 16, scope: !1070)
!1073 = !DILocation(line: 968, column: 7, scope: !1071)
!1074 = !DILocation(line: 970, column: 17, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1070, file: !66, line: 969, column: 4)
!1076 = !DILocation(line: 970, column: 12, scope: !1075)
!1077 = !DILocation(line: 970, column: 5, scope: !1075)
!1078 = !DILocation(line: 974, column: 5, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1070, file: !66, line: 973, column: 4)
!1080 = !DILocation(line: 979, column: 4, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1066, file: !66, line: 978, column: 3)
!1082 = !DILocation(line: 982, column: 1, scope: !1015)
!1083 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !66, file: !66, line: 1000, type: !1084, scopeLine: 1001, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!6, !6, !6, !18}
!1086 = !DILocalVariable(name: "data1", arg: 1, scope: !1083, file: !66, line: 1000, type: !6)
!1087 = !DILocation(line: 1000, column: 33, scope: !1083)
!1088 = !DILocalVariable(name: "data2", arg: 2, scope: !1083, file: !66, line: 1000, type: !6)
!1089 = !DILocation(line: 1000, column: 43, scope: !1083)
!1090 = !DILocalVariable(name: "denominator", arg: 3, scope: !1083, file: !66, line: 1000, type: !18)
!1091 = !DILocation(line: 1000, column: 53, scope: !1083)
!1092 = !DILocalVariable(name: "s32Result", scope: !1083, file: !66, line: 1002, type: !74)
!1093 = !DILocation(line: 1002, column: 6, scope: !1083)
!1094 = !DILocalVariable(name: "s32Temp1", scope: !1083, file: !66, line: 1002, type: !74)
!1095 = !DILocation(line: 1002, column: 21, scope: !1083)
!1096 = !DILocation(line: 1003, column: 14, scope: !1083)
!1097 = !DILocation(line: 1003, column: 22, scope: !1083)
!1098 = !DILocation(line: 1003, column: 20, scope: !1083)
!1099 = !DILocation(line: 1003, column: 12, scope: !1083)
!1100 = !DILocation(line: 1005, column: 5, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1083, file: !66, line: 1005, column: 5)
!1102 = !DILocation(line: 1005, column: 17, scope: !1101)
!1103 = !DILocation(line: 1005, column: 5, scope: !1083)
!1104 = !DILocation(line: 1007, column: 6, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1106, file: !66, line: 1007, column: 6)
!1106 = distinct !DILexicalBlock(scope: !1101, file: !66, line: 1006, column: 2)
!1107 = !DILocation(line: 1007, column: 16, scope: !1105)
!1108 = !DILocation(line: 1007, column: 6, scope: !1106)
!1109 = !DILocation(line: 1009, column: 4, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1105, file: !66, line: 1008, column: 3)
!1111 = !DILocation(line: 1011, column: 11, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1105, file: !66, line: 1011, column: 11)
!1113 = !DILocation(line: 1011, column: 21, scope: !1112)
!1114 = !DILocation(line: 1011, column: 11, scope: !1105)
!1115 = !DILocation(line: 1013, column: 4, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1112, file: !66, line: 1012, column: 3)
!1117 = !DILocation(line: 1017, column: 4, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1112, file: !66, line: 1016, column: 3)
!1119 = !DILocation(line: 1022, column: 15, scope: !1120)
!1120 = distinct !DILexicalBlock(scope: !1101, file: !66, line: 1021, column: 2)
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
!1138 = distinct !DILexicalBlock(scope: !1120, file: !66, line: 1024, column: 6)
!1139 = !DILocation(line: 1024, column: 16, scope: !1138)
!1140 = !DILocation(line: 1024, column: 6, scope: !1120)
!1141 = !DILocation(line: 1026, column: 7, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1143, file: !66, line: 1026, column: 7)
!1143 = distinct !DILexicalBlock(scope: !1138, file: !66, line: 1025, column: 3)
!1144 = !DILocation(line: 1026, column: 17, scope: !1142)
!1145 = !DILocation(line: 1026, column: 7, scope: !1143)
!1146 = !DILocation(line: 1028, column: 17, scope: !1147)
!1147 = distinct !DILexicalBlock(scope: !1142, file: !66, line: 1027, column: 4)
!1148 = !DILocation(line: 1028, column: 12, scope: !1147)
!1149 = !DILocation(line: 1028, column: 5, scope: !1147)
!1150 = !DILocation(line: 1032, column: 5, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1142, file: !66, line: 1031, column: 4)
!1152 = !DILocation(line: 1037, column: 4, scope: !1153)
!1153 = distinct !DILexicalBlock(scope: !1138, file: !66, line: 1036, column: 3)
!1154 = !DILocation(line: 1041, column: 1, scope: !1083)
!1155 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !66, file: !66, line: 1058, type: !1156, scopeLine: 1059, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1156 = !DISubroutineType(types: !1157)
!1157 = !{!426, !426, !74}
!1158 = !DILocalVariable(name: "numerator", arg: 1, scope: !1155, file: !66, line: 1058, type: !426)
!1159 = !DILocation(line: 1058, column: 25, scope: !1155)
!1160 = !DILocalVariable(name: "denominator", arg: 2, scope: !1155, file: !66, line: 1058, type: !74)
!1161 = !DILocation(line: 1058, column: 40, scope: !1155)
!1162 = !DILocalVariable(name: "u32Temp1", scope: !1155, file: !66, line: 1060, type: !426)
!1163 = !DILocation(line: 1060, column: 6, scope: !1155)
!1164 = !DILocation(line: 1061, column: 5, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1155, file: !66, line: 1061, column: 5)
!1166 = !DILocation(line: 1061, column: 17, scope: !1165)
!1167 = !DILocation(line: 1061, column: 5, scope: !1155)
!1168 = !DILocation(line: 1063, column: 3, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1165, file: !66, line: 1062, column: 2)
!1170 = !DILocation(line: 1067, column: 6, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1172, file: !66, line: 1067, column: 6)
!1172 = distinct !DILexicalBlock(scope: !1165, file: !66, line: 1066, column: 2)
!1173 = !DILocation(line: 1067, column: 18, scope: !1171)
!1174 = !DILocation(line: 1067, column: 6, scope: !1172)
!1175 = !DILocation(line: 1069, column: 4, scope: !1176)
!1176 = distinct !DILexicalBlock(scope: !1171, file: !66, line: 1068, column: 3)
!1177 = !DILocation(line: 1073, column: 16, scope: !1178)
!1178 = distinct !DILexicalBlock(scope: !1171, file: !66, line: 1072, column: 3)
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
!1198 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !66, file: !66, line: 1095, type: !1199, scopeLine: 1096, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1199 = !DISubroutineType(types: !1200)
!1200 = !{!426, !74, !426}
!1201 = !DILocalVariable(name: "numerator", arg: 1, scope: !1198, file: !66, line: 1095, type: !74)
!1202 = !DILocation(line: 1095, column: 25, scope: !1198)
!1203 = !DILocalVariable(name: "denominator", arg: 2, scope: !1198, file: !66, line: 1095, type: !426)
!1204 = !DILocation(line: 1095, column: 40, scope: !1198)
!1205 = !DILocalVariable(name: "s32Temp1", scope: !1198, file: !66, line: 1097, type: !74)
!1206 = !DILocation(line: 1097, column: 6, scope: !1198)
!1207 = !DILocation(line: 1098, column: 5, scope: !1208)
!1208 = distinct !DILexicalBlock(scope: !1198, file: !66, line: 1098, column: 5)
!1209 = !DILocation(line: 1098, column: 17, scope: !1208)
!1210 = !DILocation(line: 1098, column: 5, scope: !1198)
!1211 = !DILocation(line: 1100, column: 6, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1213, file: !66, line: 1100, column: 6)
!1213 = distinct !DILexicalBlock(scope: !1208, file: !66, line: 1099, column: 2)
!1214 = !DILocation(line: 1100, column: 16, scope: !1212)
!1215 = !DILocation(line: 1100, column: 6, scope: !1213)
!1216 = !DILocation(line: 1102, column: 4, scope: !1217)
!1217 = distinct !DILexicalBlock(scope: !1212, file: !66, line: 1101, column: 3)
!1218 = !DILocation(line: 1106, column: 4, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1212, file: !66, line: 1105, column: 3)
!1220 = !DILocation(line: 1111, column: 6, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1222, file: !66, line: 1111, column: 6)
!1222 = distinct !DILexicalBlock(scope: !1208, file: !66, line: 1110, column: 2)
!1223 = !DILocation(line: 1111, column: 16, scope: !1221)
!1224 = !DILocation(line: 1111, column: 6, scope: !1222)
!1225 = !DILocation(line: 1113, column: 17, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1221, file: !66, line: 1112, column: 3)
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
!1244 = distinct !DILexicalBlock(scope: !1221, file: !66, line: 1117, column: 3)
!1245 = !DILocation(line: 1121, column: 1, scope: !1198)
!1246 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !66, file: !66, line: 1138, type: !1247, scopeLine: 1139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1247 = !DISubroutineType(types: !1248)
!1248 = !{!426, !74, !74}
!1249 = !DILocalVariable(name: "numerator", arg: 1, scope: !1246, file: !66, line: 1138, type: !74)
!1250 = !DILocation(line: 1138, column: 25, scope: !1246)
!1251 = !DILocalVariable(name: "denominator", arg: 2, scope: !1246, file: !66, line: 1138, type: !74)
!1252 = !DILocation(line: 1138, column: 40, scope: !1246)
!1253 = !DILocalVariable(name: "u32Temp1", scope: !1246, file: !66, line: 1140, type: !426)
!1254 = !DILocation(line: 1140, column: 6, scope: !1246)
!1255 = !DILocalVariable(name: "u32Temp2", scope: !1246, file: !66, line: 1140, type: !426)
!1256 = !DILocation(line: 1140, column: 20, scope: !1246)
!1257 = !DILocation(line: 1141, column: 5, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1246, file: !66, line: 1141, column: 5)
!1259 = !DILocation(line: 1141, column: 17, scope: !1258)
!1260 = !DILocation(line: 1141, column: 5, scope: !1246)
!1261 = !DILocation(line: 1143, column: 6, scope: !1262)
!1262 = distinct !DILexicalBlock(scope: !1263, file: !66, line: 1143, column: 6)
!1263 = distinct !DILexicalBlock(scope: !1258, file: !66, line: 1142, column: 2)
!1264 = !DILocation(line: 1143, column: 16, scope: !1262)
!1265 = !DILocation(line: 1143, column: 6, scope: !1263)
!1266 = !DILocation(line: 1145, column: 4, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1262, file: !66, line: 1144, column: 3)
!1268 = !DILocation(line: 1149, column: 4, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1262, file: !66, line: 1148, column: 3)
!1270 = !DILocation(line: 1154, column: 6, scope: !1271)
!1271 = distinct !DILexicalBlock(scope: !1272, file: !66, line: 1154, column: 6)
!1272 = distinct !DILexicalBlock(scope: !1258, file: !66, line: 1153, column: 2)
!1273 = !DILocation(line: 1154, column: 16, scope: !1271)
!1274 = !DILocation(line: 1154, column: 6, scope: !1272)
!1275 = !DILocation(line: 1156, column: 7, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1277, file: !66, line: 1156, column: 7)
!1277 = distinct !DILexicalBlock(scope: !1271, file: !66, line: 1155, column: 3)
!1278 = !DILocation(line: 1156, column: 17, scope: !1276)
!1279 = !DILocation(line: 1156, column: 7, scope: !1277)
!1280 = !DILocation(line: 1158, column: 5, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1276, file: !66, line: 1157, column: 4)
!1282 = !DILocation(line: 1162, column: 8, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1284, file: !66, line: 1162, column: 8)
!1284 = distinct !DILexicalBlock(scope: !1276, file: !66, line: 1161, column: 4)
!1285 = !DILocation(line: 1162, column: 20, scope: !1283)
!1286 = !DILocation(line: 1162, column: 8, scope: !1284)
!1287 = !DILocation(line: 1164, column: 6, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1283, file: !66, line: 1163, column: 5)
!1289 = !DILocation(line: 1168, column: 18, scope: !1290)
!1290 = distinct !DILexicalBlock(scope: !1283, file: !66, line: 1167, column: 5)
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
!1310 = distinct !DILexicalBlock(scope: !1311, file: !66, line: 1176, column: 7)
!1311 = distinct !DILexicalBlock(scope: !1271, file: !66, line: 1175, column: 3)
!1312 = !DILocation(line: 1176, column: 19, scope: !1310)
!1313 = !DILocation(line: 1176, column: 7, scope: !1311)
!1314 = !DILocation(line: 1178, column: 5, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1310, file: !66, line: 1177, column: 4)
!1316 = !DILocation(line: 1182, column: 18, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1310, file: !66, line: 1181, column: 4)
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
!1343 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !66, file: !66, line: 1208, type: !1344, scopeLine: 1209, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1344 = !DISubroutineType(types: !1345)
!1345 = !{!426, !426, !426}
!1346 = !DILocalVariable(name: "numerator", arg: 1, scope: !1343, file: !66, line: 1208, type: !426)
!1347 = !DILocation(line: 1208, column: 25, scope: !1343)
!1348 = !DILocalVariable(name: "denominator", arg: 2, scope: !1343, file: !66, line: 1208, type: !426)
!1349 = !DILocation(line: 1208, column: 40, scope: !1343)
!1350 = !DILocalVariable(name: "u32Temp1", scope: !1343, file: !66, line: 1211, type: !426)
!1351 = !DILocation(line: 1211, column: 6, scope: !1343)
!1352 = !DILocalVariable(name: "u32Temp2", scope: !1343, file: !66, line: 1211, type: !426)
!1353 = !DILocation(line: 1211, column: 20, scope: !1343)
!1354 = !DILocalVariable(name: "u32Temp3", scope: !1343, file: !66, line: 1211, type: !426)
!1355 = !DILocation(line: 1211, column: 34, scope: !1343)
!1356 = !DILocalVariable(name: "numerator_old", scope: !1343, file: !66, line: 1211, type: !426)
!1357 = !DILocation(line: 1211, column: 48, scope: !1343)
!1358 = !DILocation(line: 1212, column: 5, scope: !1359)
!1359 = distinct !DILexicalBlock(scope: !1343, file: !66, line: 1212, column: 5)
!1360 = !DILocation(line: 1212, column: 16, scope: !1359)
!1361 = !DILocation(line: 1212, column: 5, scope: !1343)
!1362 = !DILocation(line: 1214, column: 3, scope: !1363)
!1363 = distinct !DILexicalBlock(scope: !1359, file: !66, line: 1213, column: 2)
!1364 = !DILocation(line: 1218, column: 14, scope: !1365)
!1365 = distinct !DILexicalBlock(scope: !1359, file: !66, line: 1217, column: 2)
!1366 = !DILocation(line: 1218, column: 26, scope: !1365)
!1367 = !DILocation(line: 1218, column: 41, scope: !1365)
!1368 = !DILocation(line: 1218, column: 51, scope: !1365)
!1369 = !DILocation(line: 1218, column: 50, scope: !1365)
!1370 = !DILocation(line: 1218, column: 38, scope: !1365)
!1371 = !DILocation(line: 1218, column: 24, scope: !1365)
!1372 = !DILocation(line: 1218, column: 12, scope: !1365)
!1373 = !DILocation(line: 1219, column: 7, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1365, file: !66, line: 1219, column: 6)
!1375 = !DILocation(line: 1219, column: 16, scope: !1374)
!1376 = !DILocation(line: 1219, column: 24, scope: !1374)
!1377 = !DILocation(line: 1219, column: 6, scope: !1365)
!1378 = !DILocation(line: 1221, column: 16, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1374, file: !66, line: 1220, column: 3)
!1380 = !DILocation(line: 1221, column: 27, scope: !1379)
!1381 = !DILocation(line: 1221, column: 13, scope: !1379)
!1382 = !DILocation(line: 1222, column: 3, scope: !1379)
!1383 = !DILocation(line: 1225, column: 16, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !1374, file: !66, line: 1224, column: 3)
!1385 = !DILocation(line: 1225, column: 27, scope: !1384)
!1386 = !DILocation(line: 1225, column: 32, scope: !1384)
!1387 = !DILocation(line: 1225, column: 13, scope: !1384)
!1388 = !DILocation(line: 1228, column: 6, scope: !1389)
!1389 = distinct !DILexicalBlock(scope: !1365, file: !66, line: 1228, column: 6)
!1390 = !DILocation(line: 1228, column: 17, scope: !1389)
!1391 = !DILocation(line: 1228, column: 15, scope: !1389)
!1392 = !DILocation(line: 1228, column: 6, scope: !1365)
!1393 = !DILocation(line: 1230, column: 12, scope: !1394)
!1394 = distinct !DILexicalBlock(scope: !1389, file: !66, line: 1229, column: 3)
!1395 = !DILocation(line: 1230, column: 22, scope: !1394)
!1396 = !DILocation(line: 1230, column: 21, scope: !1394)
!1397 = !DILocation(line: 1230, column: 4, scope: !1394)
!1398 = !DILocation(line: 1234, column: 13, scope: !1399)
!1399 = distinct !DILexicalBlock(scope: !1389, file: !66, line: 1233, column: 3)
!1400 = !DILocation(line: 1234, column: 23, scope: !1399)
!1401 = !DILocation(line: 1234, column: 22, scope: !1399)
!1402 = !DILocation(line: 1234, column: 36, scope: !1399)
!1403 = !DILocation(line: 1234, column: 4, scope: !1399)
!1404 = !DILocation(line: 1239, column: 1, scope: !1343)
!1405 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !66, file: !66, line: 1256, type: !1406, scopeLine: 1257, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1406 = !DISubroutineType(types: !1407)
!1407 = !{!74, !426, !74}
!1408 = !DILocalVariable(name: "numerator", arg: 1, scope: !1405, file: !66, line: 1256, type: !426)
!1409 = !DILocation(line: 1256, column: 25, scope: !1405)
!1410 = !DILocalVariable(name: "denominator", arg: 2, scope: !1405, file: !66, line: 1256, type: !74)
!1411 = !DILocation(line: 1256, column: 40, scope: !1405)
!1412 = !DILocalVariable(name: "u32Temp1", scope: !1405, file: !66, line: 1258, type: !426)
!1413 = !DILocation(line: 1258, column: 6, scope: !1405)
!1414 = !DILocalVariable(name: "u32Temp2", scope: !1405, file: !66, line: 1258, type: !426)
!1415 = !DILocation(line: 1258, column: 20, scope: !1405)
!1416 = !DILocation(line: 1259, column: 5, scope: !1417)
!1417 = distinct !DILexicalBlock(scope: !1405, file: !66, line: 1259, column: 5)
!1418 = !DILocation(line: 1259, column: 17, scope: !1417)
!1419 = !DILocation(line: 1259, column: 5, scope: !1405)
!1420 = !DILocation(line: 1261, column: 6, scope: !1421)
!1421 = distinct !DILexicalBlock(scope: !1422, file: !66, line: 1261, column: 6)
!1422 = distinct !DILexicalBlock(scope: !1417, file: !66, line: 1260, column: 2)
!1423 = !DILocation(line: 1261, column: 18, scope: !1421)
!1424 = !DILocation(line: 1261, column: 6, scope: !1422)
!1425 = !DILocation(line: 1263, column: 4, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1421, file: !66, line: 1262, column: 3)
!1427 = !DILocation(line: 1267, column: 19, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1421, file: !66, line: 1266, column: 3)
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
!1449 = distinct !DILexicalBlock(scope: !1428, file: !66, line: 1270, column: 7)
!1450 = !DILocation(line: 1270, column: 16, scope: !1449)
!1451 = !DILocation(line: 1270, column: 7, scope: !1428)
!1452 = !DILocation(line: 1272, column: 13, scope: !1453)
!1453 = distinct !DILexicalBlock(scope: !1449, file: !66, line: 1271, column: 4)
!1454 = !DILocation(line: 1272, column: 12, scope: !1453)
!1455 = !DILocation(line: 1272, column: 5, scope: !1453)
!1456 = !DILocation(line: 1276, column: 5, scope: !1457)
!1457 = distinct !DILexicalBlock(scope: !1449, file: !66, line: 1275, column: 4)
!1458 = !DILocation(line: 1282, column: 15, scope: !1459)
!1459 = distinct !DILexicalBlock(scope: !1417, file: !66, line: 1281, column: 2)
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
!1477 = distinct !DILexicalBlock(scope: !1459, file: !66, line: 1284, column: 6)
!1478 = !DILocation(line: 1284, column: 15, scope: !1477)
!1479 = !DILocation(line: 1284, column: 6, scope: !1459)
!1480 = !DILocation(line: 1286, column: 11, scope: !1481)
!1481 = distinct !DILexicalBlock(scope: !1477, file: !66, line: 1285, column: 3)
!1482 = !DILocation(line: 1286, column: 4, scope: !1481)
!1483 = !DILocation(line: 1290, column: 4, scope: !1484)
!1484 = distinct !DILexicalBlock(scope: !1477, file: !66, line: 1289, column: 3)
!1485 = !DILocation(line: 1293, column: 1, scope: !1405)
!1486 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !66, file: !66, line: 1311, type: !1487, scopeLine: 1312, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1487 = !DISubroutineType(types: !1488)
!1488 = !{!74, !74, !426}
!1489 = !DILocalVariable(name: "numerator", arg: 1, scope: !1486, file: !66, line: 1311, type: !74)
!1490 = !DILocation(line: 1311, column: 25, scope: !1486)
!1491 = !DILocalVariable(name: "denominator", arg: 2, scope: !1486, file: !66, line: 1311, type: !426)
!1492 = !DILocation(line: 1311, column: 40, scope: !1486)
!1493 = !DILocalVariable(name: "s32Temp1", scope: !1486, file: !66, line: 1313, type: !74)
!1494 = !DILocation(line: 1313, column: 6, scope: !1486)
!1495 = !DILocalVariable(name: "s32Temp2", scope: !1486, file: !66, line: 1313, type: !74)
!1496 = !DILocation(line: 1313, column: 20, scope: !1486)
!1497 = !DILocalVariable(name: "u32Temp0", scope: !1486, file: !66, line: 1314, type: !426)
!1498 = !DILocation(line: 1314, column: 6, scope: !1486)
!1499 = !DILocalVariable(name: "u32Temp1", scope: !1486, file: !66, line: 1314, type: !426)
!1500 = !DILocation(line: 1314, column: 20, scope: !1486)
!1501 = !DILocalVariable(name: "u32Temp2", scope: !1486, file: !66, line: 1314, type: !426)
!1502 = !DILocation(line: 1314, column: 34, scope: !1486)
!1503 = !DILocation(line: 1315, column: 5, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1486, file: !66, line: 1315, column: 5)
!1505 = !DILocation(line: 1315, column: 17, scope: !1504)
!1506 = !DILocation(line: 1315, column: 5, scope: !1486)
!1507 = !DILocation(line: 1317, column: 6, scope: !1508)
!1508 = distinct !DILexicalBlock(scope: !1509, file: !66, line: 1317, column: 6)
!1509 = distinct !DILexicalBlock(scope: !1504, file: !66, line: 1316, column: 2)
!1510 = !DILocation(line: 1317, column: 16, scope: !1508)
!1511 = !DILocation(line: 1317, column: 6, scope: !1509)
!1512 = !DILocation(line: 1319, column: 4, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1508, file: !66, line: 1318, column: 3)
!1514 = !DILocation(line: 1323, column: 4, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1508, file: !66, line: 1322, column: 3)
!1516 = !DILocation(line: 1328, column: 6, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1518, file: !66, line: 1328, column: 6)
!1518 = distinct !DILexicalBlock(scope: !1504, file: !66, line: 1327, column: 2)
!1519 = !DILocation(line: 1328, column: 16, scope: !1517)
!1520 = !DILocation(line: 1328, column: 6, scope: !1518)
!1521 = !DILocation(line: 1330, column: 16, scope: !1522)
!1522 = distinct !DILexicalBlock(scope: !1517, file: !66, line: 1329, column: 3)
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
!1538 = distinct !DILexicalBlock(scope: !1522, file: !66, line: 1334, column: 7)
!1539 = !DILocation(line: 1334, column: 20, scope: !1538)
!1540 = !DILocation(line: 1334, column: 27, scope: !1538)
!1541 = !DILocation(line: 1334, column: 7, scope: !1522)
!1542 = !DILocation(line: 1336, column: 20, scope: !1543)
!1543 = distinct !DILexicalBlock(scope: !1538, file: !66, line: 1335, column: 4)
!1544 = !DILocation(line: 1336, column: 32, scope: !1543)
!1545 = !DILocation(line: 1336, column: 17, scope: !1543)
!1546 = !DILocation(line: 1337, column: 4, scope: !1543)
!1547 = !DILocation(line: 1340, column: 20, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1538, file: !66, line: 1339, column: 4)
!1549 = !DILocation(line: 1340, column: 32, scope: !1548)
!1550 = !DILocation(line: 1340, column: 38, scope: !1548)
!1551 = !DILocation(line: 1340, column: 17, scope: !1548)
!1552 = !DILocation(line: 1344, column: 7, scope: !1553)
!1553 = distinct !DILexicalBlock(scope: !1522, file: !66, line: 1344, column: 7)
!1554 = !DILocation(line: 1344, column: 18, scope: !1553)
!1555 = !DILocation(line: 1344, column: 16, scope: !1553)
!1556 = !DILocation(line: 1344, column: 7, scope: !1522)
!1557 = !DILocation(line: 1346, column: 14, scope: !1558)
!1558 = distinct !DILexicalBlock(scope: !1553, file: !66, line: 1345, column: 4)
!1559 = !DILocation(line: 1346, column: 13, scope: !1558)
!1560 = !DILocation(line: 1346, column: 23, scope: !1558)
!1561 = !DILocation(line: 1346, column: 5, scope: !1558)
!1562 = !DILocation(line: 1350, column: 14, scope: !1563)
!1563 = distinct !DILexicalBlock(scope: !1553, file: !66, line: 1349, column: 4)
!1564 = !DILocation(line: 1350, column: 23, scope: !1563)
!1565 = !DILocation(line: 1350, column: 12, scope: !1563)
!1566 = !DILocation(line: 1350, column: 27, scope: !1563)
!1567 = !DILocation(line: 1350, column: 5, scope: !1563)
!1568 = !DILocation(line: 1357, column: 16, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1517, file: !66, line: 1356, column: 3)
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
!1589 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !66, file: !66, line: 1379, type: !1590, scopeLine: 1380, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1590 = !DISubroutineType(types: !1591)
!1591 = !{!74, !74, !74}
!1592 = !DILocalVariable(name: "numerator", arg: 1, scope: !1589, file: !66, line: 1379, type: !74)
!1593 = !DILocation(line: 1379, column: 25, scope: !1589)
!1594 = !DILocalVariable(name: "denominator", arg: 2, scope: !1589, file: !66, line: 1379, type: !74)
!1595 = !DILocation(line: 1379, column: 40, scope: !1589)
!1596 = !DILocalVariable(name: "s32Temp1", scope: !1589, file: !66, line: 1381, type: !74)
!1597 = !DILocation(line: 1381, column: 6, scope: !1589)
!1598 = !DILocalVariable(name: "s32Temp2", scope: !1589, file: !66, line: 1381, type: !74)
!1599 = !DILocation(line: 1381, column: 20, scope: !1589)
!1600 = !DILocalVariable(name: "denominator_prime", scope: !1589, file: !66, line: 1382, type: !426)
!1601 = !DILocation(line: 1382, column: 6, scope: !1589)
!1602 = !DILocalVariable(name: "u32Temp1", scope: !1589, file: !66, line: 1382, type: !426)
!1603 = !DILocation(line: 1382, column: 29, scope: !1589)
!1604 = !DILocalVariable(name: "u32Temp2", scope: !1589, file: !66, line: 1382, type: !426)
!1605 = !DILocation(line: 1382, column: 43, scope: !1589)
!1606 = !DILocalVariable(name: "u32numerator", scope: !1589, file: !66, line: 1383, type: !426)
!1607 = !DILocation(line: 1383, column: 6, scope: !1589)
!1608 = !DILocalVariable(name: "u32denominator", scope: !1589, file: !66, line: 1383, type: !426)
!1609 = !DILocation(line: 1383, column: 23, scope: !1589)
!1610 = !DILocation(line: 1384, column: 5, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1589, file: !66, line: 1384, column: 5)
!1612 = !DILocation(line: 1384, column: 15, scope: !1611)
!1613 = !DILocation(line: 1384, column: 5, scope: !1589)
!1614 = !DILocation(line: 1386, column: 6, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1616, file: !66, line: 1386, column: 6)
!1616 = distinct !DILexicalBlock(scope: !1611, file: !66, line: 1385, column: 2)
!1617 = !DILocation(line: 1386, column: 18, scope: !1615)
!1618 = !DILocation(line: 1386, column: 6, scope: !1616)
!1619 = !DILocation(line: 1388, column: 7, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1621, file: !66, line: 1388, column: 7)
!1621 = distinct !DILexicalBlock(scope: !1615, file: !66, line: 1387, column: 3)
!1622 = !DILocation(line: 1388, column: 19, scope: !1620)
!1623 = !DILocation(line: 1388, column: 7, scope: !1621)
!1624 = !DILocation(line: 1390, column: 5, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !1620, file: !66, line: 1389, column: 4)
!1626 = !DILocation(line: 1394, column: 21, scope: !1627)
!1627 = distinct !DILexicalBlock(scope: !1620, file: !66, line: 1393, column: 4)
!1628 = !DILocation(line: 1394, column: 20, scope: !1627)
!1629 = !DILocation(line: 1394, column: 18, scope: !1627)
!1630 = !DILocation(line: 1395, column: 23, scope: !1627)
!1631 = !DILocation(line: 1395, column: 22, scope: !1627)
!1632 = !DILocation(line: 1395, column: 20, scope: !1627)
!1633 = !DILocation(line: 1396, column: 16, scope: !1627)
!1634 = !DILocation(line: 1396, column: 33, scope: !1627)
!1635 = !DILocation(line: 1396, column: 46, scope: !1627)
!1636 = !DILocation(line: 1396, column: 45, scope: !1627)
!1637 = !DILocation(line: 1396, column: 64, scope: !1627)
!1638 = !DILocation(line: 1396, column: 62, scope: !1627)
!1639 = !DILocation(line: 1396, column: 29, scope: !1627)
!1640 = !DILocation(line: 1396, column: 81, scope: !1627)
!1641 = !DILocation(line: 1396, column: 14, scope: !1627)
!1642 = !DILocation(line: 1397, column: 17, scope: !1627)
!1643 = !DILocation(line: 1397, column: 30, scope: !1627)
!1644 = !DILocation(line: 1397, column: 29, scope: !1627)
!1645 = !DILocation(line: 1397, column: 49, scope: !1627)
!1646 = !DILocation(line: 1397, column: 58, scope: !1627)
!1647 = !DILocation(line: 1397, column: 57, scope: !1627)
!1648 = !DILocation(line: 1397, column: 46, scope: !1627)
!1649 = !DILocation(line: 1397, column: 14, scope: !1627)
!1650 = !DILocation(line: 1398, column: 8, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1627, file: !66, line: 1398, column: 8)
!1652 = !DILocation(line: 1398, column: 17, scope: !1651)
!1653 = !DILocation(line: 1398, column: 8, scope: !1627)
!1654 = !DILocation(line: 1400, column: 13, scope: !1655)
!1655 = distinct !DILexicalBlock(scope: !1651, file: !66, line: 1399, column: 5)
!1656 = !DILocation(line: 1400, column: 6, scope: !1655)
!1657 = !DILocation(line: 1404, column: 6, scope: !1658)
!1658 = distinct !DILexicalBlock(scope: !1651, file: !66, line: 1403, column: 5)
!1659 = !DILocation(line: 1410, column: 20, scope: !1660)
!1660 = distinct !DILexicalBlock(scope: !1615, file: !66, line: 1409, column: 3)
!1661 = !DILocation(line: 1410, column: 19, scope: !1660)
!1662 = !DILocation(line: 1410, column: 29, scope: !1660)
!1663 = !DILocation(line: 1410, column: 17, scope: !1660)
!1664 = !DILocation(line: 1411, column: 16, scope: !1660)
!1665 = !DILocation(line: 1411, column: 33, scope: !1660)
!1666 = !DILocation(line: 1411, column: 46, scope: !1660)
!1667 = !DILocation(line: 1411, column: 45, scope: !1660)
!1668 = !DILocation(line: 1411, column: 61, scope: !1660)
!1669 = !DILocation(line: 1411, column: 59, scope: !1660)
!1670 = !DILocation(line: 1411, column: 29, scope: !1660)
!1671 = !DILocation(line: 1411, column: 75, scope: !1660)
!1672 = !DILocation(line: 1411, column: 13, scope: !1660)
!1673 = !DILocation(line: 1412, column: 16, scope: !1660)
!1674 = !DILocation(line: 1412, column: 29, scope: !1660)
!1675 = !DILocation(line: 1412, column: 28, scope: !1660)
!1676 = !DILocation(line: 1412, column: 45, scope: !1660)
!1677 = !DILocation(line: 1412, column: 54, scope: !1660)
!1678 = !DILocation(line: 1412, column: 53, scope: !1660)
!1679 = !DILocation(line: 1412, column: 42, scope: !1660)
!1680 = !DILocation(line: 1412, column: 13, scope: !1660)
!1681 = !DILocation(line: 1413, column: 13, scope: !1660)
!1682 = !DILocation(line: 1413, column: 12, scope: !1660)
!1683 = !DILocation(line: 1413, column: 22, scope: !1660)
!1684 = !DILocation(line: 1413, column: 4, scope: !1660)
!1685 = !DILocation(line: 1418, column: 6, scope: !1686)
!1686 = distinct !DILexicalBlock(scope: !1687, file: !66, line: 1418, column: 6)
!1687 = distinct !DILexicalBlock(scope: !1611, file: !66, line: 1417, column: 2)
!1688 = !DILocation(line: 1418, column: 18, scope: !1686)
!1689 = !DILocation(line: 1418, column: 6, scope: !1687)
!1690 = !DILocation(line: 1420, column: 7, scope: !1691)
!1691 = distinct !DILexicalBlock(scope: !1692, file: !66, line: 1420, column: 7)
!1692 = distinct !DILexicalBlock(scope: !1686, file: !66, line: 1419, column: 3)
!1693 = !DILocation(line: 1420, column: 19, scope: !1691)
!1694 = !DILocation(line: 1420, column: 7, scope: !1692)
!1695 = !DILocation(line: 1422, column: 5, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1691, file: !66, line: 1421, column: 4)
!1697 = !DILocation(line: 1426, column: 23, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1691, file: !66, line: 1425, column: 4)
!1699 = !DILocation(line: 1426, column: 22, scope: !1698)
!1700 = !DILocation(line: 1426, column: 35, scope: !1698)
!1701 = !DILocation(line: 1426, column: 20, scope: !1698)
!1702 = !DILocation(line: 1427, column: 17, scope: !1698)
!1703 = !DILocation(line: 1427, column: 31, scope: !1698)
!1704 = !DILocation(line: 1427, column: 41, scope: !1698)
!1705 = !DILocation(line: 1427, column: 40, scope: !1698)
!1706 = !DILocation(line: 1427, column: 59, scope: !1698)
!1707 = !DILocation(line: 1427, column: 57, scope: !1698)
!1708 = !DILocation(line: 1427, column: 27, scope: !1698)
!1709 = !DILocation(line: 1427, column: 76, scope: !1698)
!1710 = !DILocation(line: 1427, column: 14, scope: !1698)
!1711 = !DILocation(line: 1428, column: 17, scope: !1698)
!1712 = !DILocation(line: 1428, column: 27, scope: !1698)
!1713 = !DILocation(line: 1428, column: 26, scope: !1698)
!1714 = !DILocation(line: 1428, column: 46, scope: !1698)
!1715 = !DILocation(line: 1428, column: 55, scope: !1698)
!1716 = !DILocation(line: 1428, column: 54, scope: !1698)
!1717 = !DILocation(line: 1428, column: 43, scope: !1698)
!1718 = !DILocation(line: 1428, column: 14, scope: !1698)
!1719 = !DILocation(line: 1429, column: 14, scope: !1698)
!1720 = !DILocation(line: 1429, column: 13, scope: !1698)
!1721 = !DILocation(line: 1429, column: 23, scope: !1698)
!1722 = !DILocation(line: 1429, column: 5, scope: !1698)
!1723 = !DILocation(line: 1434, column: 16, scope: !1724)
!1724 = distinct !DILexicalBlock(scope: !1686, file: !66, line: 1433, column: 3)
!1725 = !DILocation(line: 1434, column: 30, scope: !1724)
!1726 = !DILocation(line: 1434, column: 40, scope: !1724)
!1727 = !DILocation(line: 1434, column: 39, scope: !1724)
!1728 = !DILocation(line: 1434, column: 55, scope: !1724)
!1729 = !DILocation(line: 1434, column: 53, scope: !1724)
!1730 = !DILocation(line: 1434, column: 26, scope: !1724)
!1731 = !DILocation(line: 1434, column: 69, scope: !1724)
!1732 = !DILocation(line: 1434, column: 13, scope: !1724)
!1733 = !DILocation(line: 1435, column: 16, scope: !1724)
!1734 = !DILocation(line: 1435, column: 26, scope: !1724)
!1735 = !DILocation(line: 1435, column: 25, scope: !1724)
!1736 = !DILocation(line: 1435, column: 42, scope: !1724)
!1737 = !DILocation(line: 1435, column: 51, scope: !1724)
!1738 = !DILocation(line: 1435, column: 50, scope: !1724)
!1739 = !DILocation(line: 1435, column: 39, scope: !1724)
!1740 = !DILocation(line: 1435, column: 13, scope: !1724)
!1741 = !DILocation(line: 1436, column: 11, scope: !1724)
!1742 = !DILocation(line: 1436, column: 4, scope: !1724)
!1743 = !DILocation(line: 1439, column: 1, scope: !1589)
!1744 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !66, file: !66, line: 1457, type: !1745, scopeLine: 1458, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1745 = !DISubroutineType(types: !1746)
!1746 = !{!6, !74, !426}
!1747 = !DILocalVariable(name: "numerator", arg: 1, scope: !1744, file: !66, line: 1457, type: !74)
!1748 = !DILocation(line: 1457, column: 25, scope: !1744)
!1749 = !DILocalVariable(name: "denominator", arg: 2, scope: !1744, file: !66, line: 1457, type: !426)
!1750 = !DILocation(line: 1457, column: 40, scope: !1744)
!1751 = !DILocalVariable(name: "numerator_prime", scope: !1744, file: !66, line: 1460, type: !426)
!1752 = !DILocation(line: 1460, column: 6, scope: !1744)
!1753 = !DILocalVariable(name: "u32Temp1", scope: !1744, file: !66, line: 1460, type: !426)
!1754 = !DILocation(line: 1460, column: 27, scope: !1744)
!1755 = !DILocalVariable(name: "u32Temp2", scope: !1744, file: !66, line: 1460, type: !426)
!1756 = !DILocation(line: 1460, column: 41, scope: !1744)
!1757 = !DILocalVariable(name: "u32Temp3", scope: !1744, file: !66, line: 1460, type: !426)
!1758 = !DILocation(line: 1460, column: 55, scope: !1744)
!1759 = !DILocalVariable(name: "s32Temp1", scope: !1744, file: !66, line: 1461, type: !74)
!1760 = !DILocation(line: 1461, column: 6, scope: !1744)
!1761 = !DILocalVariable(name: "s32Temp2", scope: !1744, file: !66, line: 1461, type: !74)
!1762 = !DILocation(line: 1461, column: 20, scope: !1744)
!1763 = !DILocalVariable(name: "s32Temp3", scope: !1744, file: !66, line: 1461, type: !74)
!1764 = !DILocation(line: 1461, column: 34, scope: !1744)
!1765 = !DILocation(line: 1462, column: 5, scope: !1766)
!1766 = distinct !DILexicalBlock(scope: !1744, file: !66, line: 1462, column: 5)
!1767 = !DILocation(line: 1462, column: 17, scope: !1766)
!1768 = !DILocation(line: 1462, column: 5, scope: !1744)
!1769 = !DILocation(line: 1464, column: 6, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1771, file: !66, line: 1464, column: 6)
!1771 = distinct !DILexicalBlock(scope: !1766, file: !66, line: 1463, column: 2)
!1772 = !DILocation(line: 1464, column: 15, scope: !1770)
!1773 = !DILocation(line: 1464, column: 6, scope: !1771)
!1774 = !DILocation(line: 1466, column: 4, scope: !1775)
!1775 = distinct !DILexicalBlock(scope: !1770, file: !66, line: 1465, column: 3)
!1776 = !DILocation(line: 1470, column: 4, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1770, file: !66, line: 1469, column: 3)
!1778 = !DILocation(line: 1475, column: 6, scope: !1779)
!1779 = distinct !DILexicalBlock(scope: !1780, file: !66, line: 1475, column: 6)
!1780 = distinct !DILexicalBlock(scope: !1766, file: !66, line: 1474, column: 2)
!1781 = !DILocation(line: 1475, column: 16, scope: !1779)
!1782 = !DILocation(line: 1475, column: 6, scope: !1780)
!1783 = !DILocation(line: 1478, column: 45, scope: !1784)
!1784 = distinct !DILexicalBlock(scope: !1785, file: !66, line: 1478, column: 8)
!1785 = distinct !DILexicalBlock(scope: !1779, file: !66, line: 1476, column: 3)
!1786 = !DILocation(line: 1478, column: 35, scope: !1784)
!1787 = !DILocation(line: 1478, column: 10, scope: !1784)
!1788 = !DILocation(line: 1478, column: 8, scope: !1785)
!1789 = !DILocation(line: 1479, column: 8, scope: !1790)
!1790 = distinct !DILexicalBlock(scope: !1784, file: !66, line: 1478, column: 59)
!1791 = !DILocation(line: 1486, column: 37, scope: !1785)
!1792 = !DILocation(line: 1486, column: 36, scope: !1785)
!1793 = !DILocation(line: 1486, column: 26, scope: !1785)
!1794 = !DILocation(line: 1486, column: 24, scope: !1785)
!1795 = !DILocation(line: 1487, column: 4, scope: !1785)
!1796 = !DILocation(line: 1519, column: 16, scope: !1797)
!1797 = distinct !DILexicalBlock(scope: !1779, file: !66, line: 1518, column: 3)
!1798 = !DILocation(line: 1519, column: 26, scope: !1797)
!1799 = !DILocation(line: 1519, column: 25, scope: !1797)
!1800 = !DILocation(line: 1519, column: 41, scope: !1797)
!1801 = !DILocation(line: 1519, column: 39, scope: !1797)
!1802 = !DILocation(line: 1519, column: 13, scope: !1797)
!1803 = !DILocation(line: 1520, column: 16, scope: !1797)
!1804 = !DILocation(line: 1520, column: 30, scope: !1797)
!1805 = !DILocation(line: 1520, column: 40, scope: !1797)
!1806 = !DILocation(line: 1520, column: 39, scope: !1797)
!1807 = !DILocation(line: 1520, column: 55, scope: !1797)
!1808 = !DILocation(line: 1520, column: 53, scope: !1797)
!1809 = !DILocation(line: 1520, column: 26, scope: !1797)
!1810 = !DILocation(line: 1520, column: 68, scope: !1797)
!1811 = !DILocation(line: 1520, column: 13, scope: !1797)
!1812 = !DILocation(line: 1521, column: 16, scope: !1797)
!1813 = !DILocation(line: 1521, column: 25, scope: !1797)
!1814 = !DILocation(line: 1521, column: 24, scope: !1797)
!1815 = !DILocation(line: 1521, column: 41, scope: !1797)
!1816 = !DILocation(line: 1521, column: 51, scope: !1797)
!1817 = !DILocation(line: 1521, column: 50, scope: !1797)
!1818 = !DILocation(line: 1521, column: 38, scope: !1797)
!1819 = !DILocation(line: 1521, column: 13, scope: !1797)
!1820 = !DILocation(line: 1522, column: 7, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1797, file: !66, line: 1522, column: 7)
!1822 = !DILocation(line: 1522, column: 16, scope: !1821)
!1823 = !DILocation(line: 1522, column: 7, scope: !1797)
!1824 = !DILocation(line: 1524, column: 17, scope: !1825)
!1825 = distinct !DILexicalBlock(scope: !1821, file: !66, line: 1523, column: 4)
!1826 = !DILocation(line: 1524, column: 12, scope: !1825)
!1827 = !DILocation(line: 1524, column: 5, scope: !1825)
!1828 = !DILocation(line: 1528, column: 5, scope: !1829)
!1829 = distinct !DILexicalBlock(scope: !1821, file: !66, line: 1527, column: 4)
!1830 = !DILocation(line: 1532, column: 1, scope: !1744)
!1831 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !26, file: !26, line: 42, type: !1832, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1832 = !DISubroutineType(types: !1833)
!1833 = !{!43, !22}
!1834 = !DILocalVariable(name: "value", arg: 1, scope: !1831, file: !26, line: 42, type: !22)
!1835 = !DILocation(line: 42, column: 38, scope: !1831)
!1836 = !DILocation(line: 44, column: 12, scope: !1831)
!1837 = !DILocation(line: 44, column: 18, scope: !1831)
!1838 = !DILocation(line: 44, column: 5, scope: !1831)
!1839 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1840, file: !1840, line: 12, type: !1841, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !30, retainedNodes: !1844)
!1840 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1841 = !DISubroutineType(types: !1842)
!1842 = !{null, !1843}
!1843 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1844 = !{!1845}
!1845 = !DILocalVariable(name: "z", arg: 1, scope: !1839, file: !1840, line: 12, type: !1843)
!1846 = !DILocation(line: 0, scope: !1839)
!1847 = !DILocation(line: 13, column: 9, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1839, file: !1840, line: 13, column: 7)
!1849 = !DILocation(line: 13, column: 7, scope: !1839)
!1850 = !DILocation(line: 14, column: 5, scope: !1848)
!1851 = !DILocation(line: 15, column: 1, scope: !1839)
