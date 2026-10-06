; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0051/build/s16_fac05_div_s16_s16_alarm_0051.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [129 x i8] c"KLEE-ALARM-0051: signed overflow. assert -2147483648 <= s32Temp1 + (s32)((int)((int)((int)numerator << 16) / (int)denominator));\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0051.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str.1.10 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str.2.11 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %numerator = alloca i16, align 2
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %numerator, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i16* %result, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = bitcast i16* %numerator to i8*, !dbg !58
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !59
  %1 = bitcast i16* %denominator to i8*, !dbg !60
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  %2 = load i16, i16* %numerator, align 2, !dbg !62
  %3 = load i16, i16* %denominator, align 2, !dbg !63
  %call = call signext i16 @s16_fac05_div_s16_s16(i16 signext %2, i16 signext %3), !dbg !64
  store i16 %call, i16* %result, align 2, !dbg !65
  %4 = load i16, i16* %result, align 2, !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_s16(i16 signext %numerator, i16 signext %denominator) #0 !dbg !68 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = load i16, i16* %numerator.addr, align 2, !dbg !80
  %conv = sext i16 %0 to i32, !dbg !82
  %conv1 = sext i32 %conv to i64, !dbg !83
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv1), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.end, label %if.then, !dbg !85

if.then:                                          ; preds = %entry
  store i16 0, i16* %retval, align 2, !dbg !86
  br label %return, !dbg !86

if.end:                                           ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !88
  %conv2 = sext i16 %1 to i32, !dbg !88
  %shl = shl i32 %conv2, 16, !dbg !89
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !90
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !91
  %conv3 = sext i16 %2 to i32, !dbg !91
  %cmp = icmp eq i32 %conv3, 0, !dbg !93
  br i1 %cmp, label %if.then5, label %if.else10, !dbg !94

if.then5:                                         ; preds = %if.end
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !95
  %conv6 = sext i16 %3 to i32, !dbg !95
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !98
  br i1 %cmp7, label %if.then9, label %if.else, !dbg !99

if.then9:                                         ; preds = %if.then5
  store i16 -32768, i16* %retval, align 2, !dbg !100
  br label %return, !dbg !100

if.else:                                          ; preds = %if.then5
  store i16 32767, i16* %retval, align 2, !dbg !102
  br label %return, !dbg !102

if.else10:                                        ; preds = %if.end
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !104
  %cmp11 = icmp ne i32 %4, -2147483648, !dbg !107
  br i1 %cmp11, label %if.then13, label %if.else88, !dbg !108

if.then13:                                        ; preds = %if.else10
  %5 = load i16, i16* %denominator.addr, align 2, !dbg !109
  %conv14 = sext i16 %5 to i64, !dbg !112
  %call15 = call i32 @klee_alarm_divisor_nonzero(i64 %conv14), !dbg !113
  %tobool16 = icmp ne i32 %call15, 0, !dbg !113
  br i1 %tobool16, label %if.end18, label %if.then17, !dbg !114

if.then17:                                        ; preds = %if.then13
  store i16 0, i16* %retval, align 2, !dbg !115
  br label %return, !dbg !115

if.end18:                                         ; preds = %if.then13
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !117
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !119
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !120
  %conv19 = sext i16 %8 to i32, !dbg !121
  %int_cast_to_i64 = zext i32 %conv19 to i64, !dbg !122
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !122
  %div = sdiv i32 %7, %conv19, !dbg !122, !klee.check.div !123
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !124
  %conv20 = sext i16 %9 to i32, !dbg !125
  %mul = mul nsw i32 %div, %conv20, !dbg !126
  %sub = sub nsw i32 %6, %mul, !dbg !127
  %conv21 = sext i32 %sub to i64, !dbg !128
  %call22 = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv21), !dbg !129
  %tobool23 = icmp ne i32 %call22, 0, !dbg !129
  br i1 %tobool23, label %if.end25, label %if.then24, !dbg !130

if.then24:                                        ; preds = %if.end18
  store i16 0, i16* %retval, align 2, !dbg !131
  br label %return, !dbg !131

if.end25:                                         ; preds = %if.end18
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !133
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !135
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !136
  %conv26 = sext i16 %12 to i32, !dbg !137
  %int_cast_to_i641 = zext i32 %conv26 to i64, !dbg !138
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !138
  %div27 = sdiv i32 %11, %conv26, !dbg !138, !klee.check.div !123
  %13 = load i16, i16* %denominator.addr, align 2, !dbg !139
  %conv28 = sext i16 %13 to i32, !dbg !140
  %mul29 = mul nsw i32 %div27, %conv28, !dbg !141
  %sub30 = sub nsw i32 %10, %mul29, !dbg !142
  %conv31 = sext i32 %sub30 to i64, !dbg !143
  %call32 = call i32 @klee_alarm_s32_lshift_upper(i64 %conv31, i32 1), !dbg !144
  %tobool33 = icmp ne i32 %call32, 0, !dbg !144
  br i1 %tobool33, label %if.end35, label %if.then34, !dbg !145

if.then34:                                        ; preds = %if.end25
  store i16 0, i16* %retval, align 2, !dbg !146
  br label %return, !dbg !146

if.end35:                                         ; preds = %if.end25
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !148
  %15 = load i16, i16* %denominator.addr, align 2, !dbg !150
  %conv36 = sext i16 %15 to i32, !dbg !151
  %int_cast_to_i642 = zext i32 %conv36 to i64, !dbg !152
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !152
  %div37 = sdiv i32 %14, %conv36, !dbg !152, !klee.check.div !123
  %conv38 = sext i32 %div37 to i64, !dbg !153
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !154
  %conv39 = sext i16 %16 to i32, !dbg !155
  %conv40 = sext i32 %conv39 to i64, !dbg !156
  %call41 = call i32 @klee_alarm_s32_mul_upper(i64 %conv38, i64 %conv40), !dbg !157
  %tobool42 = icmp ne i32 %call41, 0, !dbg !157
  br i1 %tobool42, label %if.end44, label %if.then43, !dbg !158

if.then43:                                        ; preds = %if.end35
  store i16 0, i16* %retval, align 2, !dbg !159
  br label %return, !dbg !159

if.end44:                                         ; preds = %if.end35
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !161
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !162
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !163
  %conv45 = sext i16 %19 to i32, !dbg !163
  %int_cast_to_i643 = zext i32 %conv45 to i64, !dbg !164
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !164
  %div46 = sdiv i32 %18, %conv45, !dbg !164, !klee.check.div !123
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !165
  %conv47 = sext i16 %20 to i32, !dbg !165
  %mul48 = mul nsw i32 %div46, %conv47, !dbg !166
  %sub49 = sub nsw i32 %17, %mul48, !dbg !167
  %shl50 = shl i32 %sub49, 1, !dbg !168
  store i32 %shl50, i32* %s32Temp2, align 4, !dbg !169
  %21 = load i16, i16* %denominator.addr, align 2, !dbg !170
  %conv51 = sext i16 %21 to i64, !dbg !172
  %call52 = call i32 @klee_alarm_divisor_nonzero(i64 %conv51), !dbg !173
  %tobool53 = icmp ne i32 %call52, 0, !dbg !173
  br i1 %tobool53, label %if.end55, label %if.then54, !dbg !174

if.then54:                                        ; preds = %if.end44
  store i16 0, i16* %retval, align 2, !dbg !175
  br label %return, !dbg !175

if.end55:                                         ; preds = %if.end44
  %22 = load i32, i32* %s32Temp2, align 4, !dbg !177
  %23 = load i16, i16* %denominator.addr, align 2, !dbg !178
  %conv56 = sext i16 %23 to i32, !dbg !178
  %int_cast_to_i644 = zext i32 %conv56 to i64, !dbg !179
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !179
  %div57 = sdiv i32 %22, %conv56, !dbg !179, !klee.check.div !123
  store i32 %div57, i32* %s32Temp1, align 4, !dbg !180
  %24 = load i16, i16* %denominator.addr, align 2, !dbg !181
  %conv58 = sext i16 %24 to i64, !dbg !183
  %call59 = call i32 @klee_alarm_divisor_nonzero(i64 %conv58), !dbg !184
  %tobool60 = icmp ne i32 %call59, 0, !dbg !184
  br i1 %tobool60, label %if.end62, label %if.then61, !dbg !185

if.then61:                                        ; preds = %if.end55
  store i16 0, i16* %retval, align 2, !dbg !186
  br label %return, !dbg !186

if.end62:                                         ; preds = %if.end55
  %25 = load i32, i32* %s32Temp1, align 4, !dbg !188
  %conv63 = sext i32 %25 to i64, !dbg !190
  %26 = load i16, i16* %numerator.addr, align 2, !dbg !191
  %conv64 = sext i16 %26 to i32, !dbg !192
  %shl65 = shl i32 %conv64, 16, !dbg !193
  %27 = load i16, i16* %denominator.addr, align 2, !dbg !194
  %conv66 = sext i16 %27 to i32, !dbg !195
  %int_cast_to_i645 = zext i32 %conv66 to i64, !dbg !196
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !196
  %div67 = sdiv i32 %shl65, %conv66, !dbg !196, !klee.check.div !123
  %conv68 = sext i32 %div67 to i64, !dbg !197
  %call69 = call i32 @klee_alarm_s32_add_upper(i64 %conv63, i64 %conv68), !dbg !198
  %tobool70 = icmp ne i32 %call69, 0, !dbg !198
  br i1 %tobool70, label %if.end72, label %if.then71, !dbg !199

if.then71:                                        ; preds = %if.end62
  store i16 0, i16* %retval, align 2, !dbg !200
  br label %return, !dbg !200

if.end72:                                         ; preds = %if.end62
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !202
  %conv73 = sext i32 %28 to i64, !dbg !204
  %29 = load i16, i16* %numerator.addr, align 2, !dbg !205
  %conv74 = sext i16 %29 to i32, !dbg !206
  %shl75 = shl i32 %conv74, 16, !dbg !207
  %30 = load i16, i16* %denominator.addr, align 2, !dbg !208
  %conv76 = sext i16 %30 to i32, !dbg !209
  %int_cast_to_i646 = zext i32 %conv76 to i64, !dbg !210
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !210
  %div77 = sdiv i32 %shl75, %conv76, !dbg !210, !klee.check.div !123
  %conv78 = sext i32 %div77 to i64, !dbg !211
  %call79 = call i32 @klee_alarm_s32_add_lower(i64 %conv73, i64 %conv78), !dbg !212
  %tobool80 = icmp ne i32 %call79, 0, !dbg !212
  br i1 %tobool80, label %if.end82, label %if.then81, !dbg !213

if.then81:                                        ; preds = %if.end72
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 228, i8* getelementptr inbounds ([129 x i8], [129 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !214
  unreachable, !dbg !214

if.end82:                                         ; preds = %if.end72
  %31 = load i32, i32* %s32Temp1, align 4, !dbg !216
  %32 = load i16, i16* %numerator.addr, align 2, !dbg !217
  %conv83 = sext i16 %32 to i32, !dbg !218
  %shl84 = shl i32 %conv83, 16, !dbg !219
  %33 = load i16, i16* %denominator.addr, align 2, !dbg !220
  %conv85 = sext i16 %33 to i32, !dbg !221
  %int_cast_to_i647 = zext i32 %conv85 to i64, !dbg !222
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !222
  %div86 = sdiv i32 %shl84, %conv85, !dbg !222, !klee.check.div !123
  %add = add nsw i32 %31, %div86, !dbg !223
  %conv87 = sext i32 %add to i64, !dbg !224
  store volatile i64 %conv87, i64* @klee_alarm_sink_s64, align 8, !dbg !225
  store i16 0, i16* %retval, align 2, !dbg !226
  br label %return, !dbg !226

if.else88:                                        ; preds = %if.else10
  %34 = load i16, i16* %denominator.addr, align 2, !dbg !227
  %conv89 = sext i16 %34 to i32, !dbg !227
  %cmp90 = icmp ne i32 %conv89, -1, !dbg !230
  br i1 %cmp90, label %if.then92, label %if.else115, !dbg !231

if.then92:                                        ; preds = %if.else88
  %35 = load i32, i32* %s32Temp1, align 4, !dbg !232
  %36 = load i32, i32* %s32Temp1, align 4, !dbg !234
  %37 = load i16, i16* %denominator.addr, align 2, !dbg !235
  %conv93 = sext i16 %37 to i32, !dbg !235
  %int_cast_to_i648 = zext i32 %conv93 to i64, !dbg !236
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !236
  %div94 = sdiv i32 %36, %conv93, !dbg !236, !klee.check.div !123
  %38 = load i16, i16* %denominator.addr, align 2, !dbg !237
  %conv95 = sext i16 %38 to i32, !dbg !237
  %mul96 = mul nsw i32 %div94, %conv95, !dbg !238
  %sub97 = sub nsw i32 %35, %mul96, !dbg !239
  %shl98 = shl i32 %sub97, 1, !dbg !240
  store i32 %shl98, i32* %s32Temp2, align 4, !dbg !241
  %39 = load i32, i32* %s32Temp2, align 4, !dbg !242
  %40 = load i16, i16* %denominator.addr, align 2, !dbg !243
  %conv99 = sext i16 %40 to i32, !dbg !243
  %int_cast_to_i649 = zext i32 %conv99 to i64, !dbg !244
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !244
  %div100 = sdiv i32 %39, %conv99, !dbg !244, !klee.check.div !123
  store i32 %div100, i32* %s32Temp1, align 4, !dbg !245
  %41 = load i32, i32* %s32Temp1, align 4, !dbg !246
  %42 = load i16, i16* %numerator.addr, align 2, !dbg !247
  %conv101 = sext i16 %42 to i32, !dbg !247
  %shl102 = shl i32 %conv101, 16, !dbg !248
  %43 = load i16, i16* %denominator.addr, align 2, !dbg !249
  %conv103 = sext i16 %43 to i32, !dbg !249
  %int_cast_to_i6410 = zext i32 %conv103 to i64, !dbg !250
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !250
  %div104 = sdiv i32 %shl102, %conv103, !dbg !250, !klee.check.div !123
  %add105 = add nsw i32 %41, %div104, !dbg !251
  store i32 %add105, i32* %s32Temp1, align 4, !dbg !252
  %44 = load i32, i32* %s32Temp1, align 4, !dbg !253
  %cmp106 = icmp slt i32 %44, 32767, !dbg !255
  br i1 %cmp106, label %if.then108, label %if.else114, !dbg !256

if.then108:                                       ; preds = %if.then92
  %45 = load i32, i32* %s32Temp1, align 4, !dbg !257
  %cmp109 = icmp sgt i32 %45, -32768, !dbg !260
  br i1 %cmp109, label %if.then111, label %if.else113, !dbg !261

if.then111:                                       ; preds = %if.then108
  %46 = load i32, i32* %s32Temp1, align 4, !dbg !262
  %conv112 = trunc i32 %46 to i16, !dbg !264
  store i16 %conv112, i16* %retval, align 2, !dbg !265
  br label %return, !dbg !265

if.else113:                                       ; preds = %if.then108
  store i16 -32768, i16* %retval, align 2, !dbg !266
  br label %return, !dbg !266

if.else114:                                       ; preds = %if.then92
  store i16 32767, i16* %retval, align 2, !dbg !268
  br label %return, !dbg !268

if.else115:                                       ; preds = %if.else88
  store i16 32767, i16* %retval, align 2, !dbg !270
  br label %return, !dbg !270

return:                                           ; preds = %if.else115, %if.else114, %if.else113, %if.then111, %if.end82, %if.then71, %if.then61, %if.then54, %if.then43, %if.then34, %if.then24, %if.then17, %if.else, %if.then9, %if.then
  %47 = load i16, i16* %retval, align 2, !dbg !272
  ret i16 %47, !dbg !272
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !273 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !276, metadata !DIExpression()), !dbg !277
  %0 = load i64, i64* %left.addr, align 8, !dbg !278
  %cmp = icmp sge i64 %0, 0, !dbg !279
  %conv = zext i1 %cmp to i32, !dbg !279
  ret i32 %conv, !dbg !280
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_divisor_nonzero(i64 %denominator) #0 !dbg !281 {
entry:
  %denominator.addr = alloca i64, align 8
  store i64 %denominator, i64* %denominator.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %denominator.addr, metadata !282, metadata !DIExpression()), !dbg !283
  %0 = load i64, i64* %denominator.addr, align 8, !dbg !284
  %cmp = icmp ne i64 %0, 0, !dbg !285
  %conv = zext i1 %cmp to i32, !dbg !285
  ret i32 %conv, !dbg !286
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !287 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !290, metadata !DIExpression()), !dbg !291
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !292, metadata !DIExpression()), !dbg !293
  %0 = load i32, i32* %count.addr, align 4, !dbg !294
  %cmp = icmp uge i32 %0, 63, !dbg !296
  br i1 %cmp, label %if.then, label %if.end, !dbg !297

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !298
  br label %return, !dbg !298

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !300
  %2 = load i32, i32* %count.addr, align 4, !dbg !301
  %sh_prom = zext i32 %2 to i64, !dbg !302
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !302
  %shl = shl i64 1, %sh_prom, !dbg !302, !klee.check.shift !123
  %mul = mul nsw i64 %1, %shl, !dbg !303
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !304
  %conv = zext i1 %cmp1 to i32, !dbg !304
  store i32 %conv, i32* %retval, align 4, !dbg !305
  br label %return, !dbg !305

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !306
  ret i32 %3, !dbg !306
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !307 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !310, metadata !DIExpression()), !dbg !311
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !312, metadata !DIExpression()), !dbg !313
  %0 = load i64, i64* %left.addr, align 8, !dbg !314
  %1 = load i64, i64* %right.addr, align 8, !dbg !315
  %mul = mul nsw i64 %0, %1, !dbg !316
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !317
  %conv = zext i1 %cmp to i32, !dbg !317
  ret i32 %conv, !dbg !318
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !319 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !320, metadata !DIExpression()), !dbg !321
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !322, metadata !DIExpression()), !dbg !323
  %0 = load i64, i64* %left.addr, align 8, !dbg !324
  %1 = load i64, i64* %right.addr, align 8, !dbg !325
  %add = add nsw i64 %0, %1, !dbg !326
  %cmp = icmp sle i64 %add, 2147483647, !dbg !327
  %conv = zext i1 %cmp to i32, !dbg !327
  ret i32 %conv, !dbg !328
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_lower(i64 %left, i64 %right) #0 !dbg !329 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !330, metadata !DIExpression()), !dbg !331
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !332, metadata !DIExpression()), !dbg !333
  %0 = load i64, i64* %left.addr, align 8, !dbg !334
  %1 = load i64, i64* %right.addr, align 8, !dbg !335
  %add = add nsw i64 %0, %1, !dbg !336
  %cmp = icmp sge i64 %add, -2147483648, !dbg !337
  %conv = zext i1 %cmp to i32, !dbg !337
  ret i32 %conv, !dbg !338
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_s16(i32 %numerator, i16 signext %denominator) #0 !dbg !339 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !342, metadata !DIExpression()), !dbg !343
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !344, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !346, metadata !DIExpression()), !dbg !347
  store i32 0, i32* %s32Temp1, align 4, !dbg !347
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !348, metadata !DIExpression()), !dbg !349
  store i32 0, i32* %s32Temp2, align 4, !dbg !349
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !350
  store i32 %0, i32* %s32Temp1, align 4, !dbg !351
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !352
  %conv = sext i16 %1 to i32, !dbg !352
  %cmp = icmp eq i32 %conv, 0, !dbg !354
  br i1 %cmp, label %if.then, label %if.else5, !dbg !355

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !356
  %cmp2 = icmp slt i32 %2, 0, !dbg !359
  br i1 %cmp2, label %if.then4, label %if.else, !dbg !360

if.then4:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !361
  br label %return, !dbg !361

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !363
  br label %return, !dbg !363

if.else5:                                         ; preds = %entry
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !365
  %cmp6 = icmp ne i32 %3, -2147483648, !dbg !368
  br i1 %cmp6, label %if.then8, label %if.else24, !dbg !369

if.then8:                                         ; preds = %if.else5
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !370
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !372
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !373
  %conv9 = sext i16 %6 to i32, !dbg !373
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !374
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !374
  %div = sdiv i32 %5, %conv9, !dbg !374, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !375
  %conv10 = sext i16 %7 to i32, !dbg !375
  %mul = mul nsw i32 %div, %conv10, !dbg !376
  %sub = sub nsw i32 %4, %mul, !dbg !377
  %shl = shl i32 %sub, 1, !dbg !378
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !379
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !380
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !381
  %conv11 = sext i16 %9 to i32, !dbg !381
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !382
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !382
  %div12 = sdiv i32 %8, %conv11, !dbg !382, !klee.check.div !123
  store i32 %div12, i32* %s32Temp1, align 4, !dbg !383
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !384
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !385
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !386
  %conv13 = sext i16 %12 to i32, !dbg !386
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !387
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !387
  %div14 = sdiv i32 %11, %conv13, !dbg !387, !klee.check.div !123
  %add = add nsw i32 %10, %div14, !dbg !388
  store i32 %add, i32* %s32Temp1, align 4, !dbg !389
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !390
  %cmp15 = icmp slt i32 %13, 32767, !dbg !392
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !393

if.then17:                                        ; preds = %if.then8
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !394
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !397
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !398

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !399
  %conv21 = trunc i32 %15 to i16, !dbg !401
  store i16 %conv21, i16* %retval, align 2, !dbg !402
  br label %return, !dbg !402

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !403
  br label %return, !dbg !403

if.else23:                                        ; preds = %if.then8
  store i16 32767, i16* %retval, align 2, !dbg !405
  br label %return, !dbg !405

if.else24:                                        ; preds = %if.else5
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !407
  %conv25 = sext i16 %16 to i32, !dbg !407
  %cmp26 = icmp ne i32 %conv25, -1, !dbg !410
  br i1 %cmp26, label %if.then28, label %if.else49, !dbg !411

if.then28:                                        ; preds = %if.else24
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !412
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !414
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !415
  %conv29 = sext i16 %19 to i32, !dbg !415
  %int_cast_to_i643 = zext i32 %conv29 to i64, !dbg !416
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !416
  %div30 = sdiv i32 %18, %conv29, !dbg !416, !klee.check.div !123
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !417
  %conv31 = sext i16 %20 to i32, !dbg !417
  %mul32 = mul nsw i32 %div30, %conv31, !dbg !418
  %sub33 = sub nsw i32 %17, %mul32, !dbg !419
  %shl34 = shl i32 %sub33, 1, !dbg !420
  store i32 %shl34, i32* %s32Temp2, align 4, !dbg !421
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !422
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !423
  %conv35 = sext i16 %22 to i32, !dbg !423
  %int_cast_to_i644 = zext i32 %conv35 to i64, !dbg !424
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !424
  %div36 = sdiv i32 %21, %conv35, !dbg !424, !klee.check.div !123
  store i32 %div36, i32* %s32Temp1, align 4, !dbg !425
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !426
  %24 = load i32, i32* %numerator.addr, align 4, !dbg !427
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !428
  %conv37 = sext i16 %25 to i32, !dbg !428
  %int_cast_to_i645 = zext i32 %conv37 to i64, !dbg !429
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !429
  %div38 = sdiv i32 %24, %conv37, !dbg !429, !klee.check.div !123
  %add39 = add nsw i32 %23, %div38, !dbg !430
  store i32 %add39, i32* %s32Temp1, align 4, !dbg !431
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !432
  %cmp40 = icmp slt i32 %26, 32767, !dbg !434
  br i1 %cmp40, label %if.then42, label %if.else48, !dbg !435

if.then42:                                        ; preds = %if.then28
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !436
  %cmp43 = icmp sgt i32 %27, -32768, !dbg !439
  br i1 %cmp43, label %if.then45, label %if.else47, !dbg !440

if.then45:                                        ; preds = %if.then42
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !441
  %conv46 = trunc i32 %28 to i16, !dbg !443
  store i16 %conv46, i16* %retval, align 2, !dbg !444
  br label %return, !dbg !444

if.else47:                                        ; preds = %if.then42
  store i16 -32768, i16* %retval, align 2, !dbg !445
  br label %return, !dbg !445

if.else48:                                        ; preds = %if.then28
  store i16 32767, i16* %retval, align 2, !dbg !447
  br label %return, !dbg !447

if.else49:                                        ; preds = %if.else24
  store i16 32767, i16* %retval, align 2, !dbg !449
  br label %return, !dbg !449

return:                                           ; preds = %if.else49, %if.else48, %if.else47, %if.then45, %if.else23, %if.else22, %if.then20, %if.else, %if.then4
  %29 = load i16, i16* %retval, align 2, !dbg !451
  ret i16 %29, !dbg !451
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !452 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !455, metadata !DIExpression()), !dbg !456
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !457, metadata !DIExpression()), !dbg !458
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !459, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !461, metadata !DIExpression()), !dbg !462
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !463, metadata !DIExpression()), !dbg !464
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !465
  %conv = zext i16 %0 to i32, !dbg !465
  %and = and i32 %conv, 65535, !dbg !466
  %conv1 = trunc i32 %and to i16, !dbg !465
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !467
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !468
  %conv2 = sext i16 %1 to i32, !dbg !468
  %shl = shl i32 %conv2, 16, !dbg !469
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !470
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !471
  %conv3 = zext i16 %2 to i32, !dbg !471
  %cmp = icmp eq i32 %conv3, 0, !dbg !473
  br i1 %cmp, label %if.then, label %if.else9, !dbg !474

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !475
  %conv5 = sext i16 %3 to i32, !dbg !475
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !478
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !479

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !480
  br label %return, !dbg !480

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !482
  br label %return, !dbg !482

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !484
  %conv10 = sext i16 %4 to i32, !dbg !484
  %shl11 = shl i32 %conv10, 16, !dbg !486
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !487
  %conv12 = sext i16 %5 to i32, !dbg !487
  %shl13 = shl i32 %conv12, 16, !dbg !488
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !489
  %conv14 = zext i16 %6 to i32, !dbg !489
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !490
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !490
  %div = sdiv i32 %shl13, %conv14, !dbg !490, !klee.check.div !123
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !491
  %conv15 = zext i16 %7 to i32, !dbg !491
  %mul = mul nsw i32 %div, %conv15, !dbg !492
  %sub = sub nsw i32 %shl11, %mul, !dbg !493
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !494
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !495
  %shl16 = shl i32 %8, 1, !dbg !496
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !497
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !498
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !499
  %conv17 = zext i16 %10 to i32, !dbg !499
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !500
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !500
  %div18 = sdiv i32 %9, %conv17, !dbg !500, !klee.check.div !123
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !501
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !502
  %conv19 = sext i16 %11 to i32, !dbg !502
  %shl20 = shl i32 %conv19, 16, !dbg !503
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !504
  %conv21 = zext i16 %12 to i32, !dbg !504
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !505
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !505
  %div22 = sdiv i32 %shl20, %conv21, !dbg !505, !klee.check.div !123
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !506
  %add = add nsw i32 %div22, %13, !dbg !507
  store i32 %add, i32* %s32Temp1, align 4, !dbg !508
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !509
  %cmp23 = icmp slt i32 %14, 32767, !dbg !511
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !512

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !513
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !516
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !517

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !518
  %conv29 = trunc i32 %16 to i16, !dbg !520
  store i16 %conv29, i16* %retval, align 2, !dbg !521
  br label %return, !dbg !521

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !522
  br label %return, !dbg !522

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !524
  br label %return, !dbg !524

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !526
  ret i16 %17, !dbg !526
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !527 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !528, metadata !DIExpression()), !dbg !529
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !530, metadata !DIExpression()), !dbg !531
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !532, metadata !DIExpression()), !dbg !533
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !534, metadata !DIExpression()), !dbg !535
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !536
  %conv = zext i16 %0 to i32, !dbg !536
  %and = and i32 %conv, 65535, !dbg !537
  %conv1 = trunc i32 %and to i16, !dbg !536
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !538
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !539
  %conv2 = zext i16 %1 to i32, !dbg !539
  %cmp = icmp eq i32 %conv2, 0, !dbg !541
  br i1 %cmp, label %if.then, label %if.else8, !dbg !542

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !543
  %conv4 = sext i16 %2 to i32, !dbg !543
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !546
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !547

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !548
  br label %return, !dbg !548

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !550
  br label %return, !dbg !550

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !552
  %conv9 = sext i16 %3 to i32, !dbg !552
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !554
  %conv10 = sext i16 %4 to i32, !dbg !554
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !555
  %conv11 = zext i16 %5 to i32, !dbg !555
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !556
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !556
  %div = sdiv i32 %conv10, %conv11, !dbg !556, !klee.check.div !123
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !557
  %conv12 = zext i16 %6 to i32, !dbg !557
  %mul = mul nsw i32 %div, %conv12, !dbg !558
  %sub = sub nsw i32 %conv9, %mul, !dbg !559
  %shl = shl i32 %sub, 1, !dbg !560
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !561
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !562
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !563
  %conv13 = zext i16 %8 to i32, !dbg !563
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !564
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !564
  %div14 = sdiv i32 %7, %conv13, !dbg !564, !klee.check.div !123
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !565
  %conv15 = sext i16 %9 to i32, !dbg !565
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !566
  %conv16 = zext i16 %10 to i32, !dbg !566
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !567
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !567
  %div17 = sdiv i32 %conv15, %conv16, !dbg !567, !klee.check.div !123
  %add = add nsw i32 %div14, %div17, !dbg !568
  store i32 %add, i32* %s32Temp1, align 4, !dbg !569
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !570
  %conv18 = trunc i32 %11 to i16, !dbg !570
  store i16 %conv18, i16* %retval, align 2, !dbg !571
  br label %return, !dbg !571

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !572
  ret i16 %12, !dbg !572
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !573 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !576, metadata !DIExpression()), !dbg !577
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !578, metadata !DIExpression()), !dbg !579
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !580, metadata !DIExpression()), !dbg !582
  store i32 0, i32* %u32Temp1, align 4, !dbg !582
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !583, metadata !DIExpression()), !dbg !584
  store i32 0, i32* %u32Temp2, align 4, !dbg !584
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !585, metadata !DIExpression()), !dbg !586
  store i32 0, i32* %u32Temp3, align 4, !dbg !586
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !587
  %conv = zext i16 %0 to i32, !dbg !587
  %cmp = icmp eq i32 %conv, 0, !dbg !589
  br i1 %cmp, label %if.then, label %if.else, !dbg !590

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !591
  br label %return, !dbg !591

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !593
  %conv2 = zext i16 %1 to i32, !dbg !593
  %shl = shl i32 %conv2, 16, !dbg !595
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !596
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !597
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !598
  %conv3 = zext i16 %3 to i32, !dbg !598
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !599
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !599
  %div = udiv i32 %2, %conv3, !dbg !599, !klee.check.div !123
  store i32 %div, i32* %u32Temp2, align 4, !dbg !600
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !601
  %add = add i32 %4, 128, !dbg !602
  %shr = lshr i32 %add, 8, !dbg !603
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !604
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !605
  %cmp4 = icmp ult i32 %5, 255, !dbg !607
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !608

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !609
  %conv7 = trunc i32 %6 to i8, !dbg !611
  store i8 %conv7, i8* %retval, align 1, !dbg !612
  br label %return, !dbg !612

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !613
  br label %return, !dbg !613

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !615
  ret i8 %7, !dbg !615
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !616 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !619, metadata !DIExpression()), !dbg !620
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !621, metadata !DIExpression()), !dbg !622
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !623, metadata !DIExpression()), !dbg !624
  store i32 0, i32* %s32Temp1, align 4, !dbg !624
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !625
  %conv = zext i16 %0 to i32, !dbg !625
  %and = and i32 %conv, 65535, !dbg !626
  %conv1 = trunc i32 %and to i16, !dbg !625
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !627
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !628
  %conv2 = zext i16 %1 to i32, !dbg !628
  %and3 = and i32 %conv2, 65535, !dbg !630
  %cmp = icmp eq i32 %and3, 0, !dbg !631
  br i1 %cmp, label %if.then, label %if.else8, !dbg !632

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !633
  %cmp5 = icmp sge i32 %2, 0, !dbg !636
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !637

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !638
  br label %return, !dbg !638

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !640
  br label %return, !dbg !640

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !642
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !644
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !645
  %conv9 = zext i16 %5 to i32, !dbg !645
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !646
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !646
  %div = sdiv i32 %4, %conv9, !dbg !646, !klee.check.div !123
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !647
  %conv10 = zext i16 %6 to i32, !dbg !647
  %mul = mul nsw i32 %div, %conv10, !dbg !648
  %sub = sub nsw i32 %3, %mul, !dbg !649
  %shl = shl i32 %sub, 1, !dbg !650
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !651
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !652
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !653
  %conv11 = zext i16 %8 to i32, !dbg !653
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !654
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !654
  %div12 = sdiv i32 %7, %conv11, !dbg !654, !klee.check.div !123
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !655
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !656
  %conv13 = zext i16 %10 to i32, !dbg !656
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !657
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !657
  %div14 = sdiv i32 %9, %conv13, !dbg !657, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !658
  store i32 %add, i32* %s32Temp1, align 4, !dbg !659
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !660
  %cmp15 = icmp slt i32 %11, 65535, !dbg !662
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !663

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !664
  %cmp18 = icmp sgt i32 %12, 0, !dbg !667
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !668

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !669
  %conv21 = trunc i32 %13 to i16, !dbg !671
  store i16 %conv21, i16* %retval, align 2, !dbg !672
  br label %return, !dbg !672

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !673
  br label %return, !dbg !673

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !675
  br label %return, !dbg !675

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !677
  ret i16 %14, !dbg !677
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !678 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !681, metadata !DIExpression()), !dbg !682
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !683, metadata !DIExpression()), !dbg !684
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !685, metadata !DIExpression()), !dbg !686
  store i32 0, i32* %u32Temp, align 4, !dbg !686
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !687
  %conv = zext i16 %0 to i32, !dbg !687
  %cmp = icmp eq i32 %conv, 0, !dbg !689
  br i1 %cmp, label %if.then, label %if.else, !dbg !690

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !691
  br label %return, !dbg !691

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !693
  %conv2 = zext i16 %1 to i32, !dbg !693
  %shl = shl i32 %conv2, 16, !dbg !695
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !696
  %conv3 = zext i16 %2 to i32, !dbg !696
  %shr = ashr i32 %conv3, 1, !dbg !697
  %add = add nsw i32 %shl, %shr, !dbg !698
  store i32 %add, i32* %u32Temp, align 4, !dbg !699
  %3 = load i32, i32* %u32Temp, align 4, !dbg !700
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !701
  %conv4 = zext i16 %4 to i32, !dbg !701
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !702
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !702
  %div = udiv i32 %3, %conv4, !dbg !702, !klee.check.div !123
  store i32 %div, i32* %u32Temp, align 4, !dbg !703
  %5 = load i32, i32* %u32Temp, align 4, !dbg !704
  %cmp5 = icmp ult i32 %5, 65535, !dbg !706
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !707

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !708
  %and = and i32 %6, 65535, !dbg !710
  %conv8 = trunc i32 %and to i16, !dbg !708
  store i16 %conv8, i16* %retval, align 2, !dbg !711
  br label %return, !dbg !711

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !712
  br label %return, !dbg !712

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !714
  ret i16 %7, !dbg !714
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !715 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !718, metadata !DIExpression()), !dbg !719
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !720, metadata !DIExpression()), !dbg !721
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !722, metadata !DIExpression()), !dbg !723
  store i32 0, i32* %u32Temp1, align 4, !dbg !723
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !724, metadata !DIExpression()), !dbg !725
  store i32 0, i32* %u32Temp2, align 4, !dbg !725
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !726
  %conv = zext i16 %0 to i32, !dbg !726
  %and = and i32 %conv, 65535, !dbg !727
  %conv1 = trunc i32 %and to i16, !dbg !726
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !728
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !729
  %conv2 = zext i16 %1 to i32, !dbg !729
  %cmp = icmp eq i32 %conv2, 0, !dbg !731
  br i1 %cmp, label %if.then, label %if.else, !dbg !732

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !733
  br label %return, !dbg !733

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !735
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !737
  %conv4 = zext i16 %3 to i32, !dbg !737
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !738
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !738
  %div = udiv i32 %2, %conv4, !dbg !738, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !739
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !740
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !741
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !742
  %conv5 = zext i16 %6 to i32, !dbg !742
  %mul = mul i32 %5, %conv5, !dbg !743
  %sub = sub i32 %4, %mul, !dbg !744
  %shl = shl i32 %sub, 1, !dbg !745
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !746
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !747
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !748
  %conv6 = zext i16 %8 to i32, !dbg !748
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !749
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !749
  %div7 = udiv i32 %7, %conv6, !dbg !749, !klee.check.div !123
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !750
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !751
  %conv8 = zext i16 %10 to i32, !dbg !751
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !752
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !752
  %div9 = udiv i32 %9, %conv8, !dbg !752, !klee.check.div !123
  %add = add i32 %div7, %div9, !dbg !753
  store i32 %add, i32* %u32Temp2, align 4, !dbg !754
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !755
  %cmp10 = icmp ult i32 %11, 65535, !dbg !757
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !758

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !759
  %and13 = and i32 %12, 65535, !dbg !761
  %conv14 = trunc i32 %and13 to i16, !dbg !759
  store i16 %conv14, i16* %retval, align 2, !dbg !762
  br label %return, !dbg !762

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !763
  br label %return, !dbg !763

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !765
  ret i16 %13, !dbg !765
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !766 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !769, metadata !DIExpression()), !dbg !770
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !771, metadata !DIExpression()), !dbg !772
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !773, metadata !DIExpression()), !dbg !774
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !775, metadata !DIExpression()), !dbg !776
  store i32 0, i32* %s32Result, align 4, !dbg !776
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !777, metadata !DIExpression()), !dbg !778
  store i32 0, i32* %s32Temp1, align 4, !dbg !778
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !779
  %conv = sext i16 %0 to i32, !dbg !779
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !780
  %conv1 = zext i16 %1 to i32, !dbg !780
  %mul = mul nsw i32 %conv, %conv1, !dbg !781
  store i32 %mul, i32* %s32Result, align 4, !dbg !782
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !783
  %conv2 = sext i16 %2 to i32, !dbg !783
  %cmp = icmp eq i32 %conv2, 0, !dbg !785
  br i1 %cmp, label %if.then, label %if.else7, !dbg !786

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !787
  %cmp4 = icmp slt i32 %3, 0, !dbg !790
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !791

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !792
  br label %return, !dbg !792

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !794
  br label %return, !dbg !794

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !796
  %5 = load i32, i32* %s32Result, align 4, !dbg !798
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !799
  %conv8 = sext i16 %6 to i32, !dbg !799
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !800
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !800
  %div = sdiv i32 %5, %conv8, !dbg !800, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !801
  %conv9 = sext i16 %7 to i32, !dbg !801
  %mul10 = mul nsw i32 %div, %conv9, !dbg !802
  %sub = sub nsw i32 %4, %mul10, !dbg !803
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !804
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !805
  %shl = shl i32 %8, 1, !dbg !806
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !807
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !808
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !809
  %conv11 = sext i16 %10 to i32, !dbg !809
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !810
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !810
  %div12 = sdiv i32 %9, %conv11, !dbg !810, !klee.check.div !123
  %11 = load i32, i32* %s32Result, align 4, !dbg !811
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !812
  %conv13 = sext i16 %12 to i32, !dbg !812
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !813
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !813
  %div14 = sdiv i32 %11, %conv13, !dbg !813, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !814
  store i32 %add, i32* %s32Result, align 4, !dbg !815
  %13 = load i32, i32* %s32Result, align 4, !dbg !816
  %cmp15 = icmp slt i32 %13, 32767, !dbg !818
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !819

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !820
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !823
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !824

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !825
  %conv21 = trunc i32 %15 to i16, !dbg !827
  store i16 %conv21, i16* %retval, align 2, !dbg !828
  br label %return, !dbg !828

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !829
  br label %return, !dbg !829

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !831
  br label %return, !dbg !831

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !833
  ret i16 %16, !dbg !833
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !834 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !837, metadata !DIExpression()), !dbg !838
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !839, metadata !DIExpression()), !dbg !840
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !841, metadata !DIExpression()), !dbg !842
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !843, metadata !DIExpression()), !dbg !844
  store i32 0, i32* %s32Result, align 4, !dbg !844
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !845, metadata !DIExpression()), !dbg !846
  store i32 0, i32* %s32Temp1, align 4, !dbg !846
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !847
  %conv = zext i16 %0 to i32, !dbg !847
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !848
  %conv1 = sext i16 %1 to i32, !dbg !848
  %mul = mul nsw i32 %conv, %conv1, !dbg !849
  store i32 %mul, i32* %s32Result, align 4, !dbg !850
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !851
  %conv2 = zext i16 %2 to i32, !dbg !851
  %cmp = icmp eq i32 %conv2, 0, !dbg !853
  br i1 %cmp, label %if.then, label %if.else7, !dbg !854

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !855
  %cmp4 = icmp slt i32 %3, 0, !dbg !858
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !859

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !860
  br label %return, !dbg !860

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !862
  br label %return, !dbg !862

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !864
  %5 = load i32, i32* %s32Result, align 4, !dbg !866
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !867
  %conv8 = zext i16 %6 to i32, !dbg !867
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !868
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !868
  %div = sdiv i32 %5, %conv8, !dbg !868, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !869
  %conv9 = zext i16 %7 to i32, !dbg !869
  %mul10 = mul nsw i32 %div, %conv9, !dbg !870
  %sub = sub nsw i32 %4, %mul10, !dbg !871
  %shl = shl i32 %sub, 1, !dbg !872
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !873
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !874
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !875
  %conv11 = zext i16 %9 to i32, !dbg !875
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !876
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !876
  %div12 = sdiv i32 %8, %conv11, !dbg !876, !klee.check.div !123
  %10 = load i32, i32* %s32Result, align 4, !dbg !877
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !878
  %conv13 = zext i16 %11 to i32, !dbg !878
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !879
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !879
  %div14 = sdiv i32 %10, %conv13, !dbg !879, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !880
  store i32 %add, i32* %s32Result, align 4, !dbg !881
  %12 = load i32, i32* %s32Result, align 4, !dbg !882
  %cmp15 = icmp slt i32 %12, 32767, !dbg !884
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !885

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !886
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !889
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !890

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !891
  %conv21 = trunc i32 %14 to i16, !dbg !893
  store i16 %conv21, i16* %retval, align 2, !dbg !894
  br label %return, !dbg !894

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !895
  br label %return, !dbg !895

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !897
  br label %return, !dbg !897

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !899
  ret i16 %15, !dbg !899
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !900 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !903, metadata !DIExpression()), !dbg !904
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !905, metadata !DIExpression()), !dbg !906
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !907, metadata !DIExpression()), !dbg !908
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !909, metadata !DIExpression()), !dbg !910
  store i32 0, i32* %u32Result, align 4, !dbg !910
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !911, metadata !DIExpression()), !dbg !912
  store i32 0, i32* %u32Temp1, align 4, !dbg !912
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !913, metadata !DIExpression()), !dbg !914
  store i32 0, i32* %s32Result, align 4, !dbg !914
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !915, metadata !DIExpression()), !dbg !916
  store i32 0, i32* %s32Temp1, align 4, !dbg !916
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !917
  %conv = sext i16 %0 to i32, !dbg !917
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !918
  %conv1 = zext i16 %1 to i32, !dbg !918
  %mul = mul nsw i32 %conv, %conv1, !dbg !919
  store i32 %mul, i32* %s32Result, align 4, !dbg !920
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !921
  %conv2 = sext i16 %2 to i32, !dbg !921
  %cmp = icmp eq i32 %conv2, 0, !dbg !923
  br i1 %cmp, label %if.then, label %if.else7, !dbg !924

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !925
  %cmp4 = icmp sge i32 %3, 0, !dbg !928
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !929

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !930
  br label %return, !dbg !930

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !932
  br label %return, !dbg !932

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !934
  %5 = load i32, i32* %s32Result, align 4, !dbg !936
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !937
  %conv8 = sext i16 %6 to i32, !dbg !937
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !938
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !938
  %div = sdiv i32 %5, %conv8, !dbg !938, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !939
  %conv9 = sext i16 %7 to i32, !dbg !939
  %mul10 = mul nsw i32 %div, %conv9, !dbg !940
  %sub = sub nsw i32 %4, %mul10, !dbg !941
  %shl = shl i32 %sub, 1, !dbg !942
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !943
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !944
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !945
  %conv11 = sext i16 %9 to i32, !dbg !945
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !946
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !946
  %div12 = sdiv i32 %8, %conv11, !dbg !946, !klee.check.div !123
  %10 = load i32, i32* %s32Result, align 4, !dbg !947
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !948
  %conv13 = sext i16 %11 to i32, !dbg !948
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !949
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !949
  %div14 = sdiv i32 %10, %conv13, !dbg !949, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !950
  store i32 %add, i32* %s32Result, align 4, !dbg !951
  %12 = load i32, i32* %s32Result, align 4, !dbg !952
  %cmp15 = icmp slt i32 %12, 65535, !dbg !954
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !955

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !956
  %cmp18 = icmp sgt i32 %13, 0, !dbg !959
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !960

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !961
  %conv21 = trunc i32 %14 to i16, !dbg !963
  store i16 %conv21, i16* %retval, align 2, !dbg !964
  br label %return, !dbg !964

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !965
  br label %return, !dbg !965

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !967
  br label %return, !dbg !967

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !969
  ret i16 %15, !dbg !969
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !970 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !973, metadata !DIExpression()), !dbg !974
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !975, metadata !DIExpression()), !dbg !976
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !977, metadata !DIExpression()), !dbg !978
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !979, metadata !DIExpression()), !dbg !980
  store i32 0, i32* %s32Result, align 4, !dbg !980
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !981, metadata !DIExpression()), !dbg !982
  store i32 0, i32* %s32Temp1, align 4, !dbg !982
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !983
  %conv = sext i16 %0 to i32, !dbg !983
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !984
  %conv1 = zext i16 %1 to i32, !dbg !984
  %mul = mul nsw i32 %conv, %conv1, !dbg !985
  store i32 %mul, i32* %s32Result, align 4, !dbg !986
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !987
  %conv2 = zext i16 %2 to i32, !dbg !987
  %cmp = icmp eq i32 %conv2, 0, !dbg !989
  br i1 %cmp, label %if.then, label %if.else7, !dbg !990

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !991
  %cmp4 = icmp sge i32 %3, 0, !dbg !994
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !995

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !996
  br label %return, !dbg !996

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !998
  br label %return, !dbg !998

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !1000
  %5 = load i32, i32* %s32Result, align 4, !dbg !1002
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !1003
  %conv8 = zext i16 %6 to i32, !dbg !1003
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1004
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1004
  %div = sdiv i32 %5, %conv8, !dbg !1004, !klee.check.div !123
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1005
  %conv9 = zext i16 %7 to i32, !dbg !1005
  %mul10 = mul nsw i32 %div, %conv9, !dbg !1006
  %sub = sub nsw i32 %4, %mul10, !dbg !1007
  %shl = shl i32 %sub, 1, !dbg !1008
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1009
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !1010
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !1011
  %conv11 = zext i16 %9 to i32, !dbg !1011
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !1012
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1012
  %div12 = sdiv i32 %8, %conv11, !dbg !1012, !klee.check.div !123
  %10 = load i32, i32* %s32Result, align 4, !dbg !1013
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !1014
  %conv13 = zext i16 %11 to i32, !dbg !1014
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !1015
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1015
  %div14 = sdiv i32 %10, %conv13, !dbg !1015, !klee.check.div !123
  %add = add nsw i32 %div12, %div14, !dbg !1016
  store i32 %add, i32* %s32Result, align 4, !dbg !1017
  %12 = load i32, i32* %s32Result, align 4, !dbg !1018
  %cmp15 = icmp slt i32 %12, 65535, !dbg !1020
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !1021

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !1022
  %cmp18 = icmp sgt i32 %13, 0, !dbg !1025
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !1026

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !1027
  %conv21 = trunc i32 %14 to i16, !dbg !1029
  store i16 %conv21, i16* %retval, align 2, !dbg !1030
  br label %return, !dbg !1030

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !1031
  br label %return, !dbg !1031

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !1033
  br label %return, !dbg !1033

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1035
  ret i16 %15, !dbg !1035
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !1036 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1039, metadata !DIExpression()), !dbg !1040
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1041, metadata !DIExpression()), !dbg !1042
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1043, metadata !DIExpression()), !dbg !1044
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1045, metadata !DIExpression()), !dbg !1046
  store i32 0, i32* %u32Temp1, align 4, !dbg !1046
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !1047, metadata !DIExpression()), !dbg !1048
  store i16 0, i16* %u16TempDenom, align 2, !dbg !1048
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !1049
  %conv = zext i16 %0 to i32, !dbg !1049
  %cmp = icmp eq i32 %conv, 0, !dbg !1051
  br i1 %cmp, label %if.then, label %if.else, !dbg !1052

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1053
  br label %return, !dbg !1053

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1055
  %conv2 = zext i16 %1 to i32, !dbg !1055
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1057
  %conv3 = zext i16 %2 to i32, !dbg !1057
  %mul = mul nsw i32 %conv2, %conv3, !dbg !1058
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1059
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !1060
  %conv4 = zext i16 %3 to i32, !dbg !1060
  %shr = ashr i32 %conv4, 1, !dbg !1061
  %conv5 = trunc i32 %shr to i16, !dbg !1060
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !1062
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1063
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !1064
  %conv6 = zext i16 %5 to i32, !dbg !1064
  %add = add i32 %4, %conv6, !dbg !1065
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1066
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1067
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1068
  %conv7 = zext i16 %7 to i32, !dbg !1068
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !1069
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1069
  %div = udiv i32 %6, %conv7, !dbg !1069, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1070
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1071
  %cmp8 = icmp ult i32 %8, 65535, !dbg !1073
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !1074

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1075
  %and = and i32 %9, 65535, !dbg !1077
  %conv11 = trunc i32 %and to i16, !dbg !1078
  store i16 %conv11, i16* %retval, align 2, !dbg !1079
  br label %return, !dbg !1079

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !1080
  br label %return, !dbg !1080

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !1082
  ret i16 %10, !dbg !1082
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !1083 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !1086, metadata !DIExpression()), !dbg !1087
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !1088, metadata !DIExpression()), !dbg !1089
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1090, metadata !DIExpression()), !dbg !1091
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1092, metadata !DIExpression()), !dbg !1093
  store i32 0, i32* %u32Temp1, align 4, !dbg !1093
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1094
  %cmp = icmp eq i32 %0, 0, !dbg !1096
  br i1 %cmp, label %if.then, label %if.else, !dbg !1097

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1098
  br label %return, !dbg !1098

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !1100
  %conv = zext i16 %1 to i32, !dbg !1100
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !1102
  %conv1 = zext i16 %2 to i32, !dbg !1102
  %mul = mul nsw i32 %conv, %conv1, !dbg !1103
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !1104
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1105
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1105
  %div = udiv i32 %mul, %3, !dbg !1105, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1106
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !1107
  %conv2 = zext i16 %4 to i32, !dbg !1107
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !1109
  %conv3 = zext i16 %5 to i32, !dbg !1109
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !1110
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1111
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1112
  %mul5 = mul i32 %6, %7, !dbg !1113
  %sub = sub i32 %mul4, %mul5, !dbg !1114
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1115
  %div6 = udiv i32 %8, 2, !dbg !1116
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !1117
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !1118

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1119
  %inc = add i32 %9, 1, !dbg !1119
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !1119
  br label %if.end, !dbg !1121

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1122
  %cmp10 = icmp ult i32 %10, 65535, !dbg !1124
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !1125

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1126
  %and = and i32 %11, 65535, !dbg !1128
  %conv13 = trunc i32 %and to i16, !dbg !1129
  store i16 %conv13, i16* %retval, align 2, !dbg !1130
  br label %return, !dbg !1130

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1131
  br label %return, !dbg !1131

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1133
  ret i16 %12, !dbg !1133
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1134 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1137, metadata !DIExpression()), !dbg !1138
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1139, metadata !DIExpression()), !dbg !1140
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1141, metadata !DIExpression()), !dbg !1142
  store i32 0, i32* %u32Temp1, align 4, !dbg !1142
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1143
  %conv = zext i16 %0 to i32, !dbg !1143
  %cmp = icmp eq i32 %conv, 0, !dbg !1145
  br i1 %cmp, label %if.then, label %if.else, !dbg !1146

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1147
  br label %return, !dbg !1147

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1149
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1151
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1152
  %conv2 = zext i16 %3 to i32, !dbg !1152
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1153
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1153
  %div = udiv i32 %2, %conv2, !dbg !1153, !klee.check.div !123
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1154
  %conv3 = zext i16 %4 to i32, !dbg !1154
  %mul = mul i32 %div, %conv3, !dbg !1155
  %sub = sub i32 %1, %mul, !dbg !1156
  %shl = shl i32 %sub, 1, !dbg !1157
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1158
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1159
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1160
  %conv4 = zext i16 %6 to i32, !dbg !1160
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1161
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1161
  %div5 = udiv i32 %5, %conv4, !dbg !1161, !klee.check.div !123
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1162
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1163
  %conv6 = zext i16 %8 to i32, !dbg !1163
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1164
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1164
  %div7 = udiv i32 %7, %conv6, !dbg !1164, !klee.check.div !123
  %add = add i32 %div5, %div7, !dbg !1165
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1166
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1167
  store i32 %9, i32* %retval, align 4, !dbg !1168
  br label %return, !dbg !1168

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1169
  ret i32 %10, !dbg !1169
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1170 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1173, metadata !DIExpression()), !dbg !1174
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1175, metadata !DIExpression()), !dbg !1176
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1177, metadata !DIExpression()), !dbg !1178
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1179, metadata !DIExpression()), !dbg !1180
  store i32 0, i32* %s32Temp1, align 4, !dbg !1180
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1181, metadata !DIExpression()), !dbg !1182
  store i32 0, i32* %s32Temp2, align 4, !dbg !1182
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1183, metadata !DIExpression()), !dbg !1184
  store i32 0, i32* %s32Temp3, align 4, !dbg !1184
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1185
  %conv = sext i16 %0 to i32, !dbg !1185
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1186
  %conv1 = sext i16 %1 to i32, !dbg !1186
  %mul = mul nsw i32 %conv, %conv1, !dbg !1187
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1188
  %2 = load i16, i16* %div.addr, align 2, !dbg !1189
  %conv2 = sext i16 %2 to i32, !dbg !1189
  %cmp = icmp eq i32 %conv2, 0, !dbg !1191
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1192

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1193
  %cmp4 = icmp slt i32 %3, 0, !dbg !1196
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1197

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1198
  br label %return, !dbg !1198

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1200
  br label %return, !dbg !1200

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1202
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1204
  %6 = load i16, i16* %div.addr, align 2, !dbg !1205
  %conv8 = sext i16 %6 to i32, !dbg !1205
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1206
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1206
  %div9 = sdiv i32 %5, %conv8, !dbg !1206, !klee.check.div !123
  %7 = load i16, i16* %div.addr, align 2, !dbg !1207
  %conv10 = sext i16 %7 to i32, !dbg !1207
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1208
  %sub = sub nsw i32 %4, %mul11, !dbg !1209
  %shl = shl i32 %sub, 1, !dbg !1210
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1211
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1212
  %9 = load i16, i16* %div.addr, align 2, !dbg !1213
  %conv12 = sext i16 %9 to i32, !dbg !1213
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1214
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1214
  %div13 = sdiv i32 %8, %conv12, !dbg !1214, !klee.check.div !123
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1215
  %11 = load i16, i16* %div.addr, align 2, !dbg !1216
  %conv14 = sext i16 %11 to i32, !dbg !1216
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1217
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1217
  %div15 = sdiv i32 %10, %conv14, !dbg !1217, !klee.check.div !123
  %add = add nsw i32 %div13, %div15, !dbg !1218
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1219
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1220
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1222
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1223

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1224
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1227
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1228

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1229
  %conv22 = trunc i32 %14 to i16, !dbg !1231
  store i16 %conv22, i16* %retval, align 2, !dbg !1232
  br label %return, !dbg !1232

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1233
  br label %return, !dbg !1233

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1235
  br label %return, !dbg !1235

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1237
  ret i16 %15, !dbg !1237
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1238 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1241, metadata !DIExpression()), !dbg !1242
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1243, metadata !DIExpression()), !dbg !1244
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1245, metadata !DIExpression()), !dbg !1246
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1247, metadata !DIExpression()), !dbg !1248
  store i32 0, i32* %s32Result, align 4, !dbg !1248
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1249, metadata !DIExpression()), !dbg !1250
  store i32 0, i32* %s32Temp1, align 4, !dbg !1250
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1251
  %conv = sext i16 %0 to i32, !dbg !1251
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1252
  %conv1 = sext i16 %1 to i32, !dbg !1252
  %mul = mul nsw i32 %conv, %conv1, !dbg !1253
  store i32 %mul, i32* %s32Result, align 4, !dbg !1254
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1255
  %conv2 = zext i16 %2 to i32, !dbg !1255
  %cmp = icmp eq i32 %conv2, 0, !dbg !1257
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1258

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1259
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1262
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1263

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1264
  br label %return, !dbg !1264

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1266
  %cmp7 = icmp eq i32 %4, 0, !dbg !1268
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1269

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1270
  br label %return, !dbg !1270

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1272
  br label %return, !dbg !1272

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1274
  %6 = load i32, i32* %s32Result, align 4, !dbg !1276
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1277
  %conv12 = zext i16 %7 to i32, !dbg !1277
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1278
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1278
  %div = sdiv i32 %6, %conv12, !dbg !1278, !klee.check.div !123
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1279
  %conv13 = zext i16 %8 to i32, !dbg !1279
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1280
  %sub = sub nsw i32 %5, %mul14, !dbg !1281
  %shl = shl i32 %sub, 1, !dbg !1282
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1283
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1284
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1285
  %conv15 = zext i16 %10 to i32, !dbg !1285
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1286
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1286
  %div16 = sdiv i32 %9, %conv15, !dbg !1286, !klee.check.div !123
  %11 = load i32, i32* %s32Result, align 4, !dbg !1287
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1288
  %conv17 = zext i16 %12 to i32, !dbg !1288
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1289
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1289
  %div18 = sdiv i32 %11, %conv17, !dbg !1289, !klee.check.div !123
  %add = add nsw i32 %div16, %div18, !dbg !1290
  store i32 %add, i32* %s32Result, align 4, !dbg !1291
  %13 = load i32, i32* %s32Result, align 4, !dbg !1292
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1294
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1295

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1296
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1299
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1300

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1301
  %conv25 = trunc i32 %15 to i16, !dbg !1303
  store i16 %conv25, i16* %retval, align 2, !dbg !1304
  br label %return, !dbg !1304

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1305
  br label %return, !dbg !1305

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1307
  br label %return, !dbg !1307

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1309
  ret i16 %16, !dbg !1309
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1310 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1313, metadata !DIExpression()), !dbg !1314
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1315, metadata !DIExpression()), !dbg !1316
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1317, metadata !DIExpression()), !dbg !1318
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1319
  %cmp = icmp eq i32 %0, 0, !dbg !1321
  br i1 %cmp, label %if.then, label %if.else, !dbg !1322

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1323
  br label %return, !dbg !1323

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1325
  %cmp1 = icmp sle i32 %1, 0, !dbg !1328
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1329

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1330
  br label %return, !dbg !1330

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1332
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1334
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1335
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1336
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1336
  %div = udiv i32 %3, %4, !dbg !1336, !klee.check.div !123
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1337
  %mul = mul i32 %div, %5, !dbg !1338
  %sub = sub i32 %2, %mul, !dbg !1339
  %shl = shl i32 %sub, 1, !dbg !1340
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1341
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1342
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1343
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1344
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1344
  %div4 = udiv i32 %6, %7, !dbg !1344, !klee.check.div !123
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1345
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1346
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1347
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1347
  %div5 = udiv i32 %8, %9, !dbg !1347, !klee.check.div !123
  %add = add i32 %div4, %div5, !dbg !1348
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1349
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1350
  store i32 %10, i32* %retval, align 4, !dbg !1351
  br label %return, !dbg !1351

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1352
  ret i32 %11, !dbg !1352
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1353 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1356, metadata !DIExpression()), !dbg !1357
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1358, metadata !DIExpression()), !dbg !1359
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1360, metadata !DIExpression()), !dbg !1361
  store i32 0, i32* %s32Temp1, align 4, !dbg !1361
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1362
  %cmp = icmp eq i32 %0, 0, !dbg !1364
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1365

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1366
  %cmp1 = icmp sge i32 %1, 0, !dbg !1369
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1370

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1371
  br label %return, !dbg !1371

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1373
  br label %return, !dbg !1373

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1375
  %cmp4 = icmp sge i32 %2, 0, !dbg !1378
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1379

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1380
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1382
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1383
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1384
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1384
  %div = udiv i32 %4, %5, !dbg !1384, !klee.check.div !123
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1385
  %mul = mul i32 %div, %6, !dbg !1386
  %sub = sub i32 %3, %mul, !dbg !1387
  %shl = shl i32 %sub, 1, !dbg !1388
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1389
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1390
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1391
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1392
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1392
  %div6 = udiv i32 %7, %8, !dbg !1392, !klee.check.div !123
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1393
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1394
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1395
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1395
  %div7 = udiv i32 %9, %10, !dbg !1395, !klee.check.div !123
  %add = add i32 %div6, %div7, !dbg !1396
  store i32 %add, i32* %retval, align 4, !dbg !1397
  br label %return, !dbg !1397

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1398
  br label %return, !dbg !1398

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1400
  ret i32 %11, !dbg !1400
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1401 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1404, metadata !DIExpression()), !dbg !1405
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1406, metadata !DIExpression()), !dbg !1407
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1408, metadata !DIExpression()), !dbg !1409
  store i32 0, i32* %u32Temp1, align 4, !dbg !1409
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1410, metadata !DIExpression()), !dbg !1411
  store i32 0, i32* %u32Temp2, align 4, !dbg !1411
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1412
  %cmp = icmp eq i32 %0, 0, !dbg !1414
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1415

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1416
  %cmp1 = icmp slt i32 %1, 0, !dbg !1419
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1420

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1421
  br label %return, !dbg !1421

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1423
  br label %return, !dbg !1423

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1425
  %cmp4 = icmp sge i32 %2, 0, !dbg !1428
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1429

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1430
  %cmp6 = icmp eq i32 %3, 0, !dbg !1433
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1434

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1435
  br label %return, !dbg !1435

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1437
  %cmp9 = icmp sle i32 %4, 0, !dbg !1440
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1441

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1442
  br label %return, !dbg !1442

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1444
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1446
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1447
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1448
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1448
  %div = sdiv i32 %6, %7, !dbg !1448, !klee.check.div !123
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1449
  %mul = mul nsw i32 %div, %8, !dbg !1450
  %sub = sub nsw i32 %5, %mul, !dbg !1451
  %shl = shl i32 %sub, 1, !dbg !1452
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1453
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1454
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1455
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1456
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1456
  %div12 = udiv i32 %9, %10, !dbg !1456, !klee.check.div !123
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1457
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1458
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1459
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1459
  %div13 = sdiv i32 %11, %12, !dbg !1459, !klee.check.div !123
  %add = add i32 %div12, %div13, !dbg !1460
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1461
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1462
  store i32 %13, i32* %retval, align 4, !dbg !1463
  br label %return, !dbg !1463

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1464
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1467
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1468

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1469
  br label %return, !dbg !1469

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1471
  %sub18 = sub nsw i32 0, %15, !dbg !1473
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1474
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1475
  %sub19 = sub nsw i32 0, %16, !dbg !1476
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1477
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1478
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1479
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1480
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1481
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1481
  %div20 = sdiv i32 %18, %19, !dbg !1481, !klee.check.div !123
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1482
  %mul21 = mul nsw i32 %div20, %20, !dbg !1483
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1484
  %shl23 = shl i32 %sub22, 1, !dbg !1485
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1486
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1487
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1488
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1489
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1489
  %div24 = udiv i32 %21, %22, !dbg !1489, !klee.check.div !123
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1490
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1491
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1492
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1492
  %div25 = sdiv i32 %23, %24, !dbg !1492, !klee.check.div !123
  %add26 = add i32 %div24, %div25, !dbg !1493
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1494
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1495
  store i32 %25, i32* %retval, align 4, !dbg !1496
  br label %return, !dbg !1496

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1497
  ret i32 %26, !dbg !1497
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1498 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1501, metadata !DIExpression()), !dbg !1502
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1503, metadata !DIExpression()), !dbg !1504
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1505, metadata !DIExpression()), !dbg !1506
  store i32 0, i32* %u32Temp1, align 4, !dbg !1506
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1507, metadata !DIExpression()), !dbg !1508
  store i32 0, i32* %u32Temp2, align 4, !dbg !1508
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1509, metadata !DIExpression()), !dbg !1510
  store i32 0, i32* %u32Temp3, align 4, !dbg !1510
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1511, metadata !DIExpression()), !dbg !1512
  store i32 0, i32* %numerator_old, align 4, !dbg !1512
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1513
  %cmp = icmp eq i32 %0, 0, !dbg !1515
  br i1 %cmp, label %if.then, label %if.else, !dbg !1516

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1517
  br label %return, !dbg !1517

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1519
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1521
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1522
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1523
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1524
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1524
  %div = udiv i32 %3, %4, !dbg !1524, !klee.check.div !123
  %mul = mul i32 %2, %div, !dbg !1525
  %sub = sub i32 %1, %mul, !dbg !1526
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1527
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1528
  %and = and i32 %5, 1, !dbg !1530
  %cmp1 = icmp eq i32 %and, 0, !dbg !1531
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1532

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1533
  %shr = lshr i32 %6, 1, !dbg !1535
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1536
  br label %if.end, !dbg !1537

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1538
  %shr4 = lshr i32 %7, 1, !dbg !1540
  %add = add i32 %shr4, 1, !dbg !1541
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1542
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1543
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1545
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1546
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1547

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1548
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1550
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1551
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1551
  %div7 = udiv i32 %10, %11, !dbg !1551, !klee.check.div !123
  store i32 %div7, i32* %retval, align 4, !dbg !1552
  br label %return, !dbg !1552

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1553
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1555
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1556
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1556
  %div9 = udiv i32 %12, %13, !dbg !1556, !klee.check.div !123
  %add10 = add i32 %div9, 1, !dbg !1557
  store i32 %add10, i32* %retval, align 4, !dbg !1558
  br label %return, !dbg !1558

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1559
  ret i32 %14, !dbg !1559
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1560 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1563, metadata !DIExpression()), !dbg !1564
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1565, metadata !DIExpression()), !dbg !1566
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1567, metadata !DIExpression()), !dbg !1568
  store i32 0, i32* %u32Temp1, align 4, !dbg !1568
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1569, metadata !DIExpression()), !dbg !1570
  store i32 0, i32* %u32Temp2, align 4, !dbg !1570
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1571
  %cmp = icmp sle i32 %0, 0, !dbg !1573
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1574

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1575
  %cmp1 = icmp sge i32 %1, 0, !dbg !1578
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1579

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1580
  br label %return, !dbg !1580

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1582
  %sub = sub nsw i32 0, %2, !dbg !1584
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1585
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1586
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1587
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1588
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1589
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1589
  %div = udiv i32 %4, %5, !dbg !1589, !klee.check.div !123
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1590
  %mul = mul i32 %div, %6, !dbg !1591
  %sub3 = sub i32 %3, %mul, !dbg !1592
  %shl = shl i32 %sub3, 1, !dbg !1593
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1594
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1595
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1596
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1597
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1597
  %div4 = udiv i32 %7, %8, !dbg !1597, !klee.check.div !123
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1598
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1599
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1600
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1600
  %div5 = udiv i32 %9, %10, !dbg !1600, !klee.check.div !123
  %add = add i32 %div4, %div5, !dbg !1601
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1602
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1603
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1605
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1606

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1607
  %sub8 = sub i32 0, %12, !dbg !1609
  store i32 %sub8, i32* %retval, align 4, !dbg !1610
  br label %return, !dbg !1610

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1611
  br label %return, !dbg !1611

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1613
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1615
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1616
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1617
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1617
  %div11 = udiv i32 %14, %15, !dbg !1617, !klee.check.div !123
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1618
  %mul12 = mul i32 %div11, %16, !dbg !1619
  %sub13 = sub i32 %13, %mul12, !dbg !1620
  %shl14 = shl i32 %sub13, 1, !dbg !1621
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1622
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1623
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1624
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1625
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1625
  %div15 = udiv i32 %17, %18, !dbg !1625, !klee.check.div !123
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1626
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1627
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1628
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1628
  %div16 = udiv i32 %19, %20, !dbg !1628, !klee.check.div !123
  %add17 = add i32 %div15, %div16, !dbg !1629
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1630
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1631
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1633
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1634

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1635
  store i32 %22, i32* %retval, align 4, !dbg !1637
  br label %return, !dbg !1637

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1638
  br label %return, !dbg !1638

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1640
  ret i32 %23, !dbg !1640
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1641 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1644, metadata !DIExpression()), !dbg !1645
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1646, metadata !DIExpression()), !dbg !1647
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1648, metadata !DIExpression()), !dbg !1649
  store i32 0, i32* %s32Temp1, align 4, !dbg !1649
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1650, metadata !DIExpression()), !dbg !1651
  store i32 0, i32* %s32Temp2, align 4, !dbg !1651
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1652, metadata !DIExpression()), !dbg !1653
  store i32 0, i32* %u32Temp0, align 4, !dbg !1653
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1654, metadata !DIExpression()), !dbg !1655
  store i32 0, i32* %u32Temp1, align 4, !dbg !1655
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1656, metadata !DIExpression()), !dbg !1657
  store i32 0, i32* %u32Temp2, align 4, !dbg !1657
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1658
  %cmp = icmp eq i32 %0, 0, !dbg !1660
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1661

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1662
  %cmp1 = icmp slt i32 %1, 0, !dbg !1665
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1666

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1667
  br label %return, !dbg !1667

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1669
  br label %return, !dbg !1669

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1671
  %cmp4 = icmp sle i32 %2, 0, !dbg !1674
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1675

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1676
  %sub = sub nsw i32 0, %3, !dbg !1678
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1679
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1680
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1681
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1682
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1682
  %div = udiv i32 %4, %5, !dbg !1682, !klee.check.div !123
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1683
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1684
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1685
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1686
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1687
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1687
  %div6 = udiv i32 %7, %8, !dbg !1687, !klee.check.div !123
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1688
  %mul = mul i32 %div6, %9, !dbg !1689
  %sub7 = sub i32 %6, %mul, !dbg !1690
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1691
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1692
  %and = and i32 %10, 1, !dbg !1694
  %cmp8 = icmp eq i32 %and, 0, !dbg !1695
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1696

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1697
  %shr = lshr i32 %11, 1, !dbg !1699
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1700
  br label %if.end, !dbg !1701

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1702
  %shr11 = lshr i32 %12, 1, !dbg !1704
  %add = add i32 %shr11, 1, !dbg !1705
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1706
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1707
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1709
  %cmp12 = icmp ult i32 %13, %14, !dbg !1710
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1711

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1712
  %neg = xor i32 %15, -1, !dbg !1714
  %add14 = add i32 %neg, 1, !dbg !1715
  store i32 %add14, i32* %retval, align 4, !dbg !1716
  br label %return, !dbg !1716

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1717
  %add16 = add i32 %16, 1, !dbg !1719
  %neg17 = xor i32 %add16, -1, !dbg !1720
  %add18 = add i32 %neg17, 1, !dbg !1721
  store i32 %add18, i32* %retval, align 4, !dbg !1722
  br label %return, !dbg !1722

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1723
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1725
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1726
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1727
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1727
  %div20 = udiv i32 %18, %19, !dbg !1727, !klee.check.div !123
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1728
  %mul21 = mul i32 %div20, %20, !dbg !1729
  %sub22 = sub i32 %17, %mul21, !dbg !1730
  %shl = shl i32 %sub22, 1, !dbg !1731
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1732
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1733
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1734
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1735
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1735
  %div23 = udiv i32 %21, %22, !dbg !1735, !klee.check.div !123
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1736
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1737
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1738
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1738
  %div24 = udiv i32 %23, %24, !dbg !1738, !klee.check.div !123
  %add25 = add i32 %div23, %div24, !dbg !1739
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1740
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1741
  store i32 %25, i32* %retval, align 4, !dbg !1742
  br label %return, !dbg !1742

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1743
  ret i32 %26, !dbg !1743
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1744 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1747, metadata !DIExpression()), !dbg !1748
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1749, metadata !DIExpression()), !dbg !1750
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1751, metadata !DIExpression()), !dbg !1752
  store i32 0, i32* %s32Temp1, align 4, !dbg !1752
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1753, metadata !DIExpression()), !dbg !1754
  store i32 0, i32* %s32Temp2, align 4, !dbg !1754
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1755, metadata !DIExpression()), !dbg !1756
  store i32 0, i32* %denominator_prime, align 4, !dbg !1756
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1757, metadata !DIExpression()), !dbg !1758
  store i32 0, i32* %u32Temp1, align 4, !dbg !1758
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1759, metadata !DIExpression()), !dbg !1760
  store i32 0, i32* %u32Temp2, align 4, !dbg !1760
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1761, metadata !DIExpression()), !dbg !1762
  store i32 0, i32* %u32numerator, align 4, !dbg !1762
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1763, metadata !DIExpression()), !dbg !1764
  store i32 0, i32* %u32denominator, align 4, !dbg !1764
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1765
  %cmp = icmp slt i32 %0, 0, !dbg !1767
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1768

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1769
  %cmp1 = icmp sle i32 %1, 0, !dbg !1772
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1773

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1774
  %cmp3 = icmp sge i32 %2, 0, !dbg !1777
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1778

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1779
  br label %return, !dbg !1779

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1781
  %sub = sub nsw i32 0, %3, !dbg !1783
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1784
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1785
  %sub5 = sub nsw i32 0, %4, !dbg !1786
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1787
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1788
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1789
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1790
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1791
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1791
  %div = udiv i32 %6, %7, !dbg !1791, !klee.check.div !123
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1792
  %mul = mul i32 %div, %8, !dbg !1793
  %sub6 = sub i32 %5, %mul, !dbg !1794
  %shl = shl i32 %sub6, 1, !dbg !1795
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1796
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1797
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1798
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1799
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1799
  %div7 = udiv i32 %9, %10, !dbg !1799, !klee.check.div !123
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1800
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1801
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1802
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1802
  %div8 = udiv i32 %11, %12, !dbg !1802, !klee.check.div !123
  %add = add i32 %div7, %div8, !dbg !1803
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1804
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1805
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1807
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1808

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1809
  store i32 %14, i32* %retval, align 4, !dbg !1811
  br label %return, !dbg !1811

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1812
  br label %return, !dbg !1812

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1814
  %neg = xor i32 %15, -1, !dbg !1816
  %add13 = add nsw i32 %neg, 1, !dbg !1817
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1818
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1819
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1820
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1821
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1822
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1822
  %div14 = udiv i32 %17, %18, !dbg !1822, !klee.check.div !123
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1823
  %mul15 = mul i32 %div14, %19, !dbg !1824
  %sub16 = sub i32 %16, %mul15, !dbg !1825
  %shl17 = shl i32 %sub16, 1, !dbg !1826
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1827
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1828
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1829
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1830
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1830
  %div18 = udiv i32 %20, %21, !dbg !1830, !klee.check.div !123
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1831
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1832
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1833
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1833
  %div19 = sdiv i32 %22, %23, !dbg !1833, !klee.check.div !123
  %add20 = add i32 %div18, %div19, !dbg !1834
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1835
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1836
  %neg21 = xor i32 %24, -1, !dbg !1837
  %add22 = add nsw i32 %neg21, 1, !dbg !1838
  store i32 %add22, i32* %retval, align 4, !dbg !1839
  br label %return, !dbg !1839

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1840
  %cmp24 = icmp sle i32 %25, 0, !dbg !1843
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1844

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1845
  %cmp26 = icmp sge i32 %26, 0, !dbg !1848
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1849

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1850
  br label %return, !dbg !1850

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1852
  %neg29 = xor i32 %27, -1, !dbg !1854
  %add30 = add nsw i32 %neg29, 1, !dbg !1855
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1856
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1857
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1858
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1859
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1860
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1860
  %div31 = udiv i32 %29, %30, !dbg !1860, !klee.check.div !123
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1861
  %mul32 = mul i32 %div31, %31, !dbg !1862
  %sub33 = sub i32 %28, %mul32, !dbg !1863
  %shl34 = shl i32 %sub33, 1, !dbg !1864
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1865
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1866
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1867
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1868
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1868
  %div35 = udiv i32 %32, %33, !dbg !1868, !klee.check.div !123
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1869
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1870
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1871
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1871
  %div36 = udiv i32 %34, %35, !dbg !1871, !klee.check.div !123
  %add37 = add i32 %div35, %div36, !dbg !1872
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1873
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1874
  %neg38 = xor i32 %36, -1, !dbg !1875
  %add39 = add nsw i32 %neg38, 1, !dbg !1876
  store i32 %add39, i32* %retval, align 4, !dbg !1877
  br label %return, !dbg !1877

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1878
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1880
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1881
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1882
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1882
  %div41 = sdiv i32 %38, %39, !dbg !1882, !klee.check.div !123
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1883
  %mul42 = mul nsw i32 %div41, %40, !dbg !1884
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1885
  %shl44 = shl i32 %sub43, 1, !dbg !1886
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1887
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1888
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1889
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1890
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1890
  %div45 = sdiv i32 %41, %42, !dbg !1890, !klee.check.div !123
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1891
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1892
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1893
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1893
  %div46 = udiv i32 %43, %44, !dbg !1893, !klee.check.div !123
  %add47 = add i32 %div45, %div46, !dbg !1894
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1895
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1896
  store i32 %45, i32* %retval, align 4, !dbg !1897
  br label %return, !dbg !1897

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1898
  ret i32 %46, !dbg !1898
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1899 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1902, metadata !DIExpression()), !dbg !1903
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1904, metadata !DIExpression()), !dbg !1905
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1906, metadata !DIExpression()), !dbg !1907
  store i32 0, i32* %numerator_prime, align 4, !dbg !1907
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1908, metadata !DIExpression()), !dbg !1909
  store i32 0, i32* %u32Temp1, align 4, !dbg !1909
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1910, metadata !DIExpression()), !dbg !1911
  store i32 0, i32* %u32Temp2, align 4, !dbg !1911
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1912, metadata !DIExpression()), !dbg !1913
  store i32 0, i32* %u32Temp3, align 4, !dbg !1913
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1914, metadata !DIExpression()), !dbg !1915
  store i32 0, i32* %s32Temp1, align 4, !dbg !1915
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1916, metadata !DIExpression()), !dbg !1917
  store i32 0, i32* %s32Temp2, align 4, !dbg !1917
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1918, metadata !DIExpression()), !dbg !1919
  store i32 0, i32* %s32Temp3, align 4, !dbg !1919
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1920
  %cmp = icmp eq i32 %0, 0, !dbg !1922
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1923

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1924
  %cmp1 = icmp slt i32 %1, 0, !dbg !1927
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1928

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1929
  br label %return, !dbg !1929

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1931
  br label %return, !dbg !1931

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1933
  %cmp4 = icmp slt i32 %2, 0, !dbg !1936
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1937

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1938
  %sub = sub nsw i32 0, %3, !dbg !1940
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1941
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1942
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1943
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1944
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1944
  %div = udiv i32 %4, %5, !dbg !1944, !klee.check.div !123
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1945
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1946
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1947
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1948
  %mul = mul i32 %7, %8, !dbg !1949
  %sub6 = sub i32 %6, %mul, !dbg !1950
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1951
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1952
  %and = and i32 %9, 1, !dbg !1954
  %cmp7 = icmp eq i32 %and, 0, !dbg !1955
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1956

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1957
  %shr = lshr i32 %10, 1, !dbg !1959
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1960
  br label %if.end, !dbg !1961

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1962
  %shr10 = lshr i32 %11, 1, !dbg !1964
  %add = add i32 %shr10, 1, !dbg !1965
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1966
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1967
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1969
  %cmp11 = icmp ult i32 %12, %13, !dbg !1970
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1971

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1972
  %neg = xor i32 %14, -1, !dbg !1974
  %add13 = add i32 %neg, 1, !dbg !1975
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1976
  br label %if.end18, !dbg !1977

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1978
  %add15 = add i32 %15, 1, !dbg !1980
  %neg16 = xor i32 %add15, -1, !dbg !1981
  %add17 = add i32 %neg16, 1, !dbg !1982
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1983
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1984
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1986
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1987

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1988
  %conv = trunc i32 %17 to i16, !dbg !1990
  store i16 %conv, i16* %retval, align 2, !dbg !1991
  br label %return, !dbg !1991

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1992
  br label %return, !dbg !1992

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1994
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1996
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1997
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1997
  %div23 = udiv i32 %18, %19, !dbg !1997, !klee.check.div !123
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1998
  %mul24 = mul i32 %div23, %20, !dbg !1999
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !2000
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !2001
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !2002
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !2003
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !2004
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !2004
  %div25 = udiv i32 %22, %23, !dbg !2004, !klee.check.div !123
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !2005
  %mul26 = mul i32 %div25, %24, !dbg !2006
  %sub27 = sub i32 %21, %mul26, !dbg !2007
  %shl = shl i32 %sub27, 1, !dbg !2008
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !2009
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !2010
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !2011
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !2012
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !2012
  %div28 = udiv i32 %25, %26, !dbg !2012, !klee.check.div !123
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !2013
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !2014
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !2015
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !2015
  %div29 = udiv i32 %27, %28, !dbg !2015, !klee.check.div !123
  %add30 = add i32 %div28, %div29, !dbg !2016
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !2017
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !2018
  %cmp31 = icmp sle i32 %29, 32767, !dbg !2020
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2021

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !2022
  %conv34 = trunc i32 %30 to i16, !dbg !2024
  store i16 %conv34, i16* %retval, align 2, !dbg !2025
  br label %return, !dbg !2025

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !2026
  br label %return, !dbg !2026

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !2028
  ret i16 %31, !dbg !2028
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !2029 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2035, metadata !DIExpression()), !dbg !2036
  %2 = icmp eq i64 %0, 0, !dbg !2037
  br i1 %2, label %3, label %4, !dbg !2039

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !2040
  unreachable, !dbg !2040

4:                                                ; preds = %1
  ret void, !dbg !2041
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !2042 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !2048, metadata !DIExpression()), !dbg !2050
  call void @llvm.dbg.value(metadata i64 %1, metadata !2049, metadata !DIExpression()), !dbg !2050
  %3 = icmp ult i64 %1, %0, !dbg !2051
  br i1 %3, label %5, label %4, !dbg !2053

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !2054
  unreachable, !dbg !2054

5:                                                ; preds = %2
  ret void, !dbg !2056
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!35, !2, !37, !39}
!llvm.ident = !{!41, !41, !42, !42}
!llvm.module.flags = !{!43, !44, !45, !46, !47}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !33, line: 21, type: !34, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !32, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0051/div_Ccode_alarm_0051.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0051")
!4 = !{}
!5 = !{!6, !11, !12, !16, !20, !24, !28}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !13, line: 11, baseType: !14)
!13 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0051")
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !7, line: 26, baseType: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !9, line: 41, baseType: !11)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !17, line: 26, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 42, baseType: !19)
!19 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !13, line: 9, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !7, line: 25, baseType: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !9, line: 39, baseType: !23)
!23 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !13, line: 6, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !17, line: 24, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 38, baseType: !27)
!27 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !13, line: 8, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !17, line: 25, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !9, line: 40, baseType: !31)
!31 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!32 = !{!0}
!33 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0051")
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!35 = distinct !DICompileUnit(language: DW_LANG_C99, file: !36, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0051/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0051")
!37 = distinct !DICompileUnit(language: DW_LANG_C89, file: !38, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!38 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!39 = distinct !DICompileUnit(language: DW_LANG_C89, file: !40, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!40 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!41 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!42 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!43 = !{i32 7, !"Dwarf Version", i32 4}
!44 = !{i32 2, !"Debug Info Version", i32 3}
!45 = !{i32 1, !"wchar_size", i32 4}
!46 = !{i32 7, !"uwtable", i32 1}
!47 = !{i32 7, !"frame-pointer", i32 2}
!48 = distinct !DISubprogram(name: "main", scope: !49, file: !49, line: 7, type: !50, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !35, retainedNodes: !4)
!49 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0051")
!50 = !DISubroutineType(types: !51)
!51 = !{!11}
!52 = !DILocalVariable(name: "numerator", scope: !48, file: !49, line: 9, type: !21)
!53 = !DILocation(line: 9, column: 13, scope: !48)
!54 = !DILocalVariable(name: "denominator", scope: !48, file: !49, line: 10, type: !21)
!55 = !DILocation(line: 10, column: 13, scope: !48)
!56 = !DILocalVariable(name: "result", scope: !48, file: !49, line: 11, type: !21)
!57 = !DILocation(line: 11, column: 13, scope: !48)
!58 = !DILocation(line: 13, column: 24, scope: !48)
!59 = !DILocation(line: 13, column: 5, scope: !48)
!60 = !DILocation(line: 14, column: 24, scope: !48)
!61 = !DILocation(line: 14, column: 5, scope: !48)
!62 = !DILocation(line: 16, column: 36, scope: !48)
!63 = !DILocation(line: 16, column: 47, scope: !48)
!64 = !DILocation(line: 16, column: 14, scope: !48)
!65 = !DILocation(line: 16, column: 12, scope: !48)
!66 = !DILocation(line: 18, column: 11, scope: !48)
!67 = !DILocation(line: 19, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !69, file: !69, line: 170, type: !70, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_s16/alarm_0051")
!70 = !DISubroutineType(types: !71)
!71 = !{!20, !20, !20}
!72 = !DILocalVariable(name: "numerator", arg: 1, scope: !68, file: !69, line: 170, type: !20)
!73 = !DILocation(line: 170, column: 31, scope: !68)
!74 = !DILocalVariable(name: "denominator", arg: 2, scope: !68, file: !69, line: 170, type: !20)
!75 = !DILocation(line: 170, column: 47, scope: !68)
!76 = !DILocalVariable(name: "s32Temp1", scope: !68, file: !69, line: 172, type: !12)
!77 = !DILocation(line: 172, column: 6, scope: !68)
!78 = !DILocalVariable(name: "s32Temp2", scope: !68, file: !69, line: 172, type: !12)
!79 = !DILocation(line: 172, column: 15, scope: !68)
!80 = !DILocation(line: 174, column: 61, scope: !81)
!81 = distinct !DILexicalBlock(scope: !68, file: !69, line: 174, column: 6)
!82 = !DILocation(line: 174, column: 56, scope: !81)
!83 = !DILocation(line: 174, column: 46, scope: !81)
!84 = !DILocation(line: 174, column: 8, scope: !81)
!85 = !DILocation(line: 174, column: 6, scope: !68)
!86 = !DILocation(line: 175, column: 6, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !69, line: 174, column: 75)
!88 = !DILocation(line: 177, column: 13, scope: !68)
!89 = !DILocation(line: 177, column: 22, scope: !68)
!90 = !DILocation(line: 177, column: 11, scope: !68)
!91 = !DILocation(line: 179, column: 6, scope: !92)
!92 = distinct !DILexicalBlock(scope: !68, file: !69, line: 179, column: 6)
!93 = !DILocation(line: 179, column: 18, scope: !92)
!94 = !DILocation(line: 179, column: 6, scope: !68)
!95 = !DILocation(line: 181, column: 7, scope: !96)
!96 = distinct !DILexicalBlock(scope: !97, file: !69, line: 181, column: 7)
!97 = distinct !DILexicalBlock(scope: !92, file: !69, line: 180, column: 2)
!98 = !DILocation(line: 181, column: 17, scope: !96)
!99 = !DILocation(line: 181, column: 7, scope: !97)
!100 = !DILocation(line: 183, column: 4, scope: !101)
!101 = distinct !DILexicalBlock(scope: !96, file: !69, line: 182, column: 3)
!102 = !DILocation(line: 187, column: 4, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !69, line: 186, column: 3)
!104 = !DILocation(line: 192, column: 7, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !69, line: 192, column: 7)
!106 = distinct !DILexicalBlock(scope: !92, file: !69, line: 191, column: 2)
!107 = !DILocation(line: 192, column: 16, scope: !105)
!108 = !DILocation(line: 192, column: 7, scope: !106)
!109 = !DILocation(line: 195, column: 47, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !69, line: 195, column: 8)
!111 = distinct !DILexicalBlock(scope: !105, file: !69, line: 193, column: 3)
!112 = !DILocation(line: 195, column: 37, scope: !110)
!113 = !DILocation(line: 195, column: 10, scope: !110)
!114 = !DILocation(line: 195, column: 8, scope: !111)
!115 = !DILocation(line: 196, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !69, line: 195, column: 63)
!117 = !DILocation(line: 199, column: 64, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !69, line: 199, column: 8)
!119 = !DILocation(line: 199, column: 87, scope: !118)
!120 = !DILocation(line: 199, column: 103, scope: !118)
!121 = !DILocation(line: 199, column: 98, scope: !118)
!122 = !DILocation(line: 199, column: 96, scope: !118)
!123 = !{!"True"}
!124 = !DILocation(line: 199, column: 123, scope: !118)
!125 = !DILocation(line: 199, column: 118, scope: !118)
!126 = !DILocation(line: 199, column: 116, scope: !118)
!127 = !DILocation(line: 199, column: 73, scope: !118)
!128 = !DILocation(line: 199, column: 48, scope: !118)
!129 = !DILocation(line: 199, column: 10, scope: !118)
!130 = !DILocation(line: 199, column: 8, scope: !111)
!131 = !DILocation(line: 200, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !118, file: !69, line: 199, column: 141)
!133 = !DILocation(line: 203, column: 54, scope: !134)
!134 = distinct !DILexicalBlock(scope: !111, file: !69, line: 203, column: 8)
!135 = !DILocation(line: 203, column: 77, scope: !134)
!136 = !DILocation(line: 203, column: 93, scope: !134)
!137 = !DILocation(line: 203, column: 88, scope: !134)
!138 = !DILocation(line: 203, column: 86, scope: !134)
!139 = !DILocation(line: 203, column: 113, scope: !134)
!140 = !DILocation(line: 203, column: 108, scope: !134)
!141 = !DILocation(line: 203, column: 106, scope: !134)
!142 = !DILocation(line: 203, column: 63, scope: !134)
!143 = !DILocation(line: 203, column: 38, scope: !134)
!144 = !DILocation(line: 203, column: 10, scope: !134)
!145 = !DILocation(line: 203, column: 8, scope: !111)
!146 = !DILocation(line: 204, column: 8, scope: !147)
!147 = distinct !DILexicalBlock(scope: !134, file: !69, line: 203, column: 146)
!148 = !DILocation(line: 207, column: 51, scope: !149)
!149 = distinct !DILexicalBlock(scope: !111, file: !69, line: 207, column: 8)
!150 = !DILocation(line: 207, column: 67, scope: !149)
!151 = !DILocation(line: 207, column: 62, scope: !149)
!152 = !DILocation(line: 207, column: 60, scope: !149)
!153 = !DILocation(line: 207, column: 35, scope: !149)
!154 = !DILocation(line: 207, column: 97, scope: !149)
!155 = !DILocation(line: 207, column: 92, scope: !149)
!156 = !DILocation(line: 207, column: 82, scope: !149)
!157 = !DILocation(line: 207, column: 10, scope: !149)
!158 = !DILocation(line: 207, column: 8, scope: !111)
!159 = !DILocation(line: 208, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !149, file: !69, line: 207, column: 113)
!161 = !DILocation(line: 210, column: 16, scope: !111)
!162 = !DILocation(line: 210, column: 28, scope: !111)
!163 = !DILocation(line: 210, column: 37, scope: !111)
!164 = !DILocation(line: 210, column: 36, scope: !111)
!165 = !DILocation(line: 210, column: 52, scope: !111)
!166 = !DILocation(line: 210, column: 50, scope: !111)
!167 = !DILocation(line: 210, column: 25, scope: !111)
!168 = !DILocation(line: 210, column: 65, scope: !111)
!169 = !DILocation(line: 210, column: 13, scope: !111)
!170 = !DILocation(line: 212, column: 47, scope: !171)
!171 = distinct !DILexicalBlock(scope: !111, file: !69, line: 212, column: 8)
!172 = !DILocation(line: 212, column: 37, scope: !171)
!173 = !DILocation(line: 212, column: 10, scope: !171)
!174 = !DILocation(line: 212, column: 8, scope: !111)
!175 = !DILocation(line: 213, column: 8, scope: !176)
!176 = distinct !DILexicalBlock(scope: !171, file: !69, line: 212, column: 63)
!177 = !DILocation(line: 215, column: 15, scope: !111)
!178 = !DILocation(line: 215, column: 24, scope: !111)
!179 = !DILocation(line: 215, column: 23, scope: !111)
!180 = !DILocation(line: 215, column: 13, scope: !111)
!181 = !DILocation(line: 217, column: 47, scope: !182)
!182 = distinct !DILexicalBlock(scope: !111, file: !69, line: 217, column: 8)
!183 = !DILocation(line: 217, column: 37, scope: !182)
!184 = !DILocation(line: 217, column: 10, scope: !182)
!185 = !DILocation(line: 217, column: 8, scope: !111)
!186 = !DILocation(line: 218, column: 8, scope: !187)
!187 = distinct !DILexicalBlock(scope: !182, file: !69, line: 217, column: 63)
!188 = !DILocation(line: 221, column: 45, scope: !189)
!189 = distinct !DILexicalBlock(scope: !111, file: !69, line: 221, column: 8)
!190 = !DILocation(line: 221, column: 35, scope: !189)
!191 = !DILocation(line: 221, column: 89, scope: !189)
!192 = !DILocation(line: 221, column: 84, scope: !189)
!193 = !DILocation(line: 221, column: 99, scope: !189)
!194 = !DILocation(line: 221, column: 113, scope: !189)
!195 = !DILocation(line: 221, column: 108, scope: !189)
!196 = !DILocation(line: 221, column: 106, scope: !189)
!197 = !DILocation(line: 221, column: 56, scope: !189)
!198 = !DILocation(line: 221, column: 10, scope: !189)
!199 = !DILocation(line: 221, column: 8, scope: !111)
!200 = !DILocation(line: 222, column: 8, scope: !201)
!201 = distinct !DILexicalBlock(scope: !189, file: !69, line: 221, column: 131)
!202 = !DILocation(line: 225, column: 45, scope: !203)
!203 = distinct !DILexicalBlock(scope: !111, file: !69, line: 225, column: 8)
!204 = !DILocation(line: 225, column: 35, scope: !203)
!205 = !DILocation(line: 225, column: 89, scope: !203)
!206 = !DILocation(line: 225, column: 84, scope: !203)
!207 = !DILocation(line: 225, column: 99, scope: !203)
!208 = !DILocation(line: 225, column: 113, scope: !203)
!209 = !DILocation(line: 225, column: 108, scope: !203)
!210 = !DILocation(line: 225, column: 106, scope: !203)
!211 = !DILocation(line: 225, column: 56, scope: !203)
!212 = !DILocation(line: 225, column: 10, scope: !203)
!213 = !DILocation(line: 225, column: 8, scope: !111)
!214 = !DILocation(line: 226, column: 8, scope: !215)
!215 = distinct !DILexicalBlock(scope: !203, file: !69, line: 225, column: 131)
!216 = !DILocation(line: 233, column: 36, scope: !111)
!217 = !DILocation(line: 233, column: 70, scope: !111)
!218 = !DILocation(line: 233, column: 65, scope: !111)
!219 = !DILocation(line: 233, column: 80, scope: !111)
!220 = !DILocation(line: 233, column: 94, scope: !111)
!221 = !DILocation(line: 233, column: 89, scope: !111)
!222 = !DILocation(line: 233, column: 87, scope: !111)
!223 = !DILocation(line: 233, column: 45, scope: !111)
!224 = !DILocation(line: 233, column: 26, scope: !111)
!225 = !DILocation(line: 233, column: 24, scope: !111)
!226 = !DILocation(line: 234, column: 4, scope: !111)
!227 = !DILocation(line: 253, column: 7, scope: !228)
!228 = distinct !DILexicalBlock(scope: !229, file: !69, line: 253, column: 7)
!229 = distinct !DILexicalBlock(scope: !105, file: !69, line: 252, column: 3)
!230 = !DILocation(line: 253, column: 19, scope: !228)
!231 = !DILocation(line: 253, column: 7, scope: !229)
!232 = !DILocation(line: 255, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !228, file: !69, line: 254, column: 4)
!234 = !DILocation(line: 255, column: 29, scope: !233)
!235 = !DILocation(line: 255, column: 38, scope: !233)
!236 = !DILocation(line: 255, column: 37, scope: !233)
!237 = !DILocation(line: 255, column: 53, scope: !233)
!238 = !DILocation(line: 255, column: 51, scope: !233)
!239 = !DILocation(line: 255, column: 26, scope: !233)
!240 = !DILocation(line: 255, column: 66, scope: !233)
!241 = !DILocation(line: 255, column: 14, scope: !233)
!242 = !DILocation(line: 256, column: 16, scope: !233)
!243 = !DILocation(line: 256, column: 25, scope: !233)
!244 = !DILocation(line: 256, column: 24, scope: !233)
!245 = !DILocation(line: 256, column: 14, scope: !233)
!246 = !DILocation(line: 257, column: 16, scope: !233)
!247 = !DILocation(line: 257, column: 28, scope: !233)
!248 = !DILocation(line: 257, column: 37, scope: !233)
!249 = !DILocation(line: 257, column: 43, scope: !233)
!250 = !DILocation(line: 257, column: 42, scope: !233)
!251 = !DILocation(line: 257, column: 25, scope: !233)
!252 = !DILocation(line: 257, column: 14, scope: !233)
!253 = !DILocation(line: 258, column: 8, scope: !254)
!254 = distinct !DILexicalBlock(scope: !233, file: !69, line: 258, column: 8)
!255 = !DILocation(line: 258, column: 17, scope: !254)
!256 = !DILocation(line: 258, column: 8, scope: !233)
!257 = !DILocation(line: 260, column: 9, scope: !258)
!258 = distinct !DILexicalBlock(scope: !259, file: !69, line: 260, column: 9)
!259 = distinct !DILexicalBlock(scope: !254, file: !69, line: 259, column: 5)
!260 = !DILocation(line: 260, column: 18, scope: !258)
!261 = !DILocation(line: 260, column: 9, scope: !259)
!262 = !DILocation(line: 262, column: 19, scope: !263)
!263 = distinct !DILexicalBlock(scope: !258, file: !69, line: 261, column: 6)
!264 = !DILocation(line: 262, column: 14, scope: !263)
!265 = !DILocation(line: 262, column: 7, scope: !263)
!266 = !DILocation(line: 266, column: 7, scope: !267)
!267 = distinct !DILexicalBlock(scope: !258, file: !69, line: 265, column: 6)
!268 = !DILocation(line: 271, column: 6, scope: !269)
!269 = distinct !DILexicalBlock(scope: !254, file: !69, line: 270, column: 5)
!270 = !DILocation(line: 276, column: 5, scope: !271)
!271 = distinct !DILexicalBlock(scope: !228, file: !69, line: 275, column: 4)
!272 = !DILocation(line: 280, column: 1, scope: !68)
!273 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !33, file: !33, line: 84, type: !274, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!274 = !DISubroutineType(types: !275)
!275 = !{!11, !6}
!276 = !DILocalVariable(name: "left", arg: 1, scope: !273, file: !33, line: 84, type: !6)
!277 = !DILocation(line: 84, column: 51, scope: !273)
!278 = !DILocation(line: 86, column: 12, scope: !273)
!279 = !DILocation(line: 86, column: 17, scope: !273)
!280 = !DILocation(line: 86, column: 5, scope: !273)
!281 = distinct !DISubprogram(name: "klee_alarm_divisor_nonzero", scope: !33, file: !33, line: 24, type: !274, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!282 = !DILocalVariable(name: "denominator", arg: 1, scope: !281, file: !33, line: 24, type: !6)
!283 = !DILocation(line: 24, column: 40, scope: !281)
!284 = !DILocation(line: 26, column: 12, scope: !281)
!285 = !DILocation(line: 26, column: 24, scope: !281)
!286 = !DILocation(line: 26, column: 5, scope: !281)
!287 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !33, file: !33, line: 90, type: !288, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!288 = !DISubroutineType(types: !289)
!289 = !{!11, !6, !16}
!290 = !DILocalVariable(name: "left", arg: 1, scope: !287, file: !33, line: 90, type: !6)
!291 = !DILocation(line: 90, column: 41, scope: !287)
!292 = !DILocalVariable(name: "count", arg: 2, scope: !287, file: !33, line: 90, type: !16)
!293 = !DILocation(line: 90, column: 56, scope: !287)
!294 = !DILocation(line: 92, column: 9, scope: !295)
!295 = distinct !DILexicalBlock(scope: !287, file: !33, line: 92, column: 9)
!296 = !DILocation(line: 92, column: 15, scope: !295)
!297 = !DILocation(line: 92, column: 9, scope: !287)
!298 = !DILocation(line: 93, column: 9, scope: !299)
!299 = distinct !DILexicalBlock(scope: !295, file: !33, line: 92, column: 32)
!300 = !DILocation(line: 95, column: 12, scope: !287)
!301 = !DILocation(line: 95, column: 34, scope: !287)
!302 = !DILocation(line: 95, column: 31, scope: !287)
!303 = !DILocation(line: 95, column: 17, scope: !287)
!304 = !DILocation(line: 95, column: 41, scope: !287)
!305 = !DILocation(line: 95, column: 5, scope: !287)
!306 = !DILocation(line: 96, column: 1, scope: !287)
!307 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !33, file: !33, line: 78, type: !308, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!308 = !DISubroutineType(types: !309)
!309 = !{!11, !6, !6}
!310 = !DILocalVariable(name: "left", arg: 1, scope: !307, file: !33, line: 78, type: !6)
!311 = !DILocation(line: 78, column: 38, scope: !307)
!312 = !DILocalVariable(name: "right", arg: 2, scope: !307, file: !33, line: 78, type: !6)
!313 = !DILocation(line: 78, column: 52, scope: !307)
!314 = !DILocation(line: 80, column: 12, scope: !307)
!315 = !DILocation(line: 80, column: 19, scope: !307)
!316 = !DILocation(line: 80, column: 17, scope: !307)
!317 = !DILocation(line: 80, column: 25, scope: !307)
!318 = !DILocation(line: 80, column: 5, scope: !307)
!319 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !33, file: !33, line: 54, type: !308, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!320 = !DILocalVariable(name: "left", arg: 1, scope: !319, file: !33, line: 54, type: !6)
!321 = !DILocation(line: 54, column: 38, scope: !319)
!322 = !DILocalVariable(name: "right", arg: 2, scope: !319, file: !33, line: 54, type: !6)
!323 = !DILocation(line: 54, column: 52, scope: !319)
!324 = !DILocation(line: 56, column: 12, scope: !319)
!325 = !DILocation(line: 56, column: 19, scope: !319)
!326 = !DILocation(line: 56, column: 17, scope: !319)
!327 = !DILocation(line: 56, column: 25, scope: !319)
!328 = !DILocation(line: 56, column: 5, scope: !319)
!329 = distinct !DISubprogram(name: "klee_alarm_s32_add_lower", scope: !33, file: !33, line: 48, type: !308, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!330 = !DILocalVariable(name: "left", arg: 1, scope: !329, file: !33, line: 48, type: !6)
!331 = !DILocation(line: 48, column: 38, scope: !329)
!332 = !DILocalVariable(name: "right", arg: 2, scope: !329, file: !33, line: 48, type: !6)
!333 = !DILocation(line: 48, column: 52, scope: !329)
!334 = !DILocation(line: 50, column: 12, scope: !329)
!335 = !DILocation(line: 50, column: 19, scope: !329)
!336 = !DILocation(line: 50, column: 17, scope: !329)
!337 = !DILocation(line: 50, column: 25, scope: !329)
!338 = !DILocation(line: 50, column: 5, scope: !329)
!339 = distinct !DISubprogram(name: "s16_div_s32_s16", scope: !69, file: !69, line: 297, type: !340, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!340 = !DISubroutineType(types: !341)
!341 = !{!20, !12, !20}
!342 = !DILocalVariable(name: "numerator", arg: 1, scope: !339, file: !69, line: 297, type: !12)
!343 = !DILocation(line: 297, column: 25, scope: !339)
!344 = !DILocalVariable(name: "denominator", arg: 2, scope: !339, file: !69, line: 297, type: !20)
!345 = !DILocation(line: 297, column: 41, scope: !339)
!346 = !DILocalVariable(name: "s32Temp1", scope: !339, file: !69, line: 299, type: !12)
!347 = !DILocation(line: 299, column: 6, scope: !339)
!348 = !DILocalVariable(name: "s32Temp2", scope: !339, file: !69, line: 299, type: !12)
!349 = !DILocation(line: 299, column: 17, scope: !339)
!350 = !DILocation(line: 300, column: 13, scope: !339)
!351 = !DILocation(line: 300, column: 11, scope: !339)
!352 = !DILocation(line: 301, column: 5, scope: !353)
!353 = distinct !DILexicalBlock(scope: !339, file: !69, line: 301, column: 5)
!354 = !DILocation(line: 301, column: 17, scope: !353)
!355 = !DILocation(line: 301, column: 5, scope: !339)
!356 = !DILocation(line: 303, column: 7, scope: !357)
!357 = distinct !DILexicalBlock(scope: !358, file: !69, line: 303, column: 7)
!358 = distinct !DILexicalBlock(scope: !353, file: !69, line: 302, column: 2)
!359 = !DILocation(line: 303, column: 17, scope: !357)
!360 = !DILocation(line: 303, column: 7, scope: !358)
!361 = !DILocation(line: 305, column: 4, scope: !362)
!362 = distinct !DILexicalBlock(scope: !357, file: !69, line: 304, column: 3)
!363 = !DILocation(line: 309, column: 4, scope: !364)
!364 = distinct !DILexicalBlock(scope: !357, file: !69, line: 308, column: 3)
!365 = !DILocation(line: 314, column: 6, scope: !366)
!366 = distinct !DILexicalBlock(scope: !367, file: !69, line: 314, column: 6)
!367 = distinct !DILexicalBlock(scope: !353, file: !69, line: 313, column: 2)
!368 = !DILocation(line: 314, column: 16, scope: !366)
!369 = !DILocation(line: 314, column: 6, scope: !367)
!370 = !DILocation(line: 316, column: 16, scope: !371)
!371 = distinct !DILexicalBlock(scope: !366, file: !69, line: 315, column: 3)
!372 = !DILocation(line: 316, column: 28, scope: !371)
!373 = !DILocation(line: 316, column: 37, scope: !371)
!374 = !DILocation(line: 316, column: 36, scope: !371)
!375 = !DILocation(line: 316, column: 52, scope: !371)
!376 = !DILocation(line: 316, column: 50, scope: !371)
!377 = !DILocation(line: 316, column: 25, scope: !371)
!378 = !DILocation(line: 316, column: 65, scope: !371)
!379 = !DILocation(line: 316, column: 13, scope: !371)
!380 = !DILocation(line: 317, column: 15, scope: !371)
!381 = !DILocation(line: 317, column: 24, scope: !371)
!382 = !DILocation(line: 317, column: 23, scope: !371)
!383 = !DILocation(line: 317, column: 13, scope: !371)
!384 = !DILocation(line: 318, column: 15, scope: !371)
!385 = !DILocation(line: 318, column: 27, scope: !371)
!386 = !DILocation(line: 318, column: 38, scope: !371)
!387 = !DILocation(line: 318, column: 37, scope: !371)
!388 = !DILocation(line: 318, column: 24, scope: !371)
!389 = !DILocation(line: 318, column: 13, scope: !371)
!390 = !DILocation(line: 319, column: 7, scope: !391)
!391 = distinct !DILexicalBlock(scope: !371, file: !69, line: 319, column: 7)
!392 = !DILocation(line: 319, column: 16, scope: !391)
!393 = !DILocation(line: 319, column: 7, scope: !371)
!394 = !DILocation(line: 321, column: 8, scope: !395)
!395 = distinct !DILexicalBlock(scope: !396, file: !69, line: 321, column: 8)
!396 = distinct !DILexicalBlock(scope: !391, file: !69, line: 320, column: 4)
!397 = !DILocation(line: 321, column: 17, scope: !395)
!398 = !DILocation(line: 321, column: 8, scope: !396)
!399 = !DILocation(line: 323, column: 18, scope: !400)
!400 = distinct !DILexicalBlock(scope: !395, file: !69, line: 322, column: 5)
!401 = !DILocation(line: 323, column: 13, scope: !400)
!402 = !DILocation(line: 323, column: 6, scope: !400)
!403 = !DILocation(line: 327, column: 6, scope: !404)
!404 = distinct !DILexicalBlock(scope: !395, file: !69, line: 326, column: 5)
!405 = !DILocation(line: 332, column: 5, scope: !406)
!406 = distinct !DILexicalBlock(scope: !391, file: !69, line: 331, column: 4)
!407 = !DILocation(line: 337, column: 7, scope: !408)
!408 = distinct !DILexicalBlock(scope: !409, file: !69, line: 337, column: 7)
!409 = distinct !DILexicalBlock(scope: !366, file: !69, line: 336, column: 3)
!410 = !DILocation(line: 337, column: 19, scope: !408)
!411 = !DILocation(line: 337, column: 7, scope: !409)
!412 = !DILocation(line: 339, column: 17, scope: !413)
!413 = distinct !DILexicalBlock(scope: !408, file: !69, line: 338, column: 4)
!414 = !DILocation(line: 339, column: 29, scope: !413)
!415 = !DILocation(line: 339, column: 38, scope: !413)
!416 = !DILocation(line: 339, column: 37, scope: !413)
!417 = !DILocation(line: 339, column: 53, scope: !413)
!418 = !DILocation(line: 339, column: 51, scope: !413)
!419 = !DILocation(line: 339, column: 26, scope: !413)
!420 = !DILocation(line: 339, column: 66, scope: !413)
!421 = !DILocation(line: 339, column: 14, scope: !413)
!422 = !DILocation(line: 340, column: 16, scope: !413)
!423 = !DILocation(line: 340, column: 25, scope: !413)
!424 = !DILocation(line: 340, column: 24, scope: !413)
!425 = !DILocation(line: 340, column: 14, scope: !413)
!426 = !DILocation(line: 341, column: 16, scope: !413)
!427 = !DILocation(line: 341, column: 28, scope: !413)
!428 = !DILocation(line: 341, column: 39, scope: !413)
!429 = !DILocation(line: 341, column: 38, scope: !413)
!430 = !DILocation(line: 341, column: 25, scope: !413)
!431 = !DILocation(line: 341, column: 14, scope: !413)
!432 = !DILocation(line: 342, column: 8, scope: !433)
!433 = distinct !DILexicalBlock(scope: !413, file: !69, line: 342, column: 8)
!434 = !DILocation(line: 342, column: 17, scope: !433)
!435 = !DILocation(line: 342, column: 8, scope: !413)
!436 = !DILocation(line: 344, column: 9, scope: !437)
!437 = distinct !DILexicalBlock(scope: !438, file: !69, line: 344, column: 9)
!438 = distinct !DILexicalBlock(scope: !433, file: !69, line: 343, column: 5)
!439 = !DILocation(line: 344, column: 18, scope: !437)
!440 = !DILocation(line: 344, column: 9, scope: !438)
!441 = !DILocation(line: 346, column: 19, scope: !442)
!442 = distinct !DILexicalBlock(scope: !437, file: !69, line: 345, column: 6)
!443 = !DILocation(line: 346, column: 14, scope: !442)
!444 = !DILocation(line: 346, column: 7, scope: !442)
!445 = !DILocation(line: 350, column: 7, scope: !446)
!446 = distinct !DILexicalBlock(scope: !437, file: !69, line: 349, column: 6)
!447 = !DILocation(line: 355, column: 6, scope: !448)
!448 = distinct !DILexicalBlock(scope: !433, file: !69, line: 354, column: 5)
!449 = !DILocation(line: 361, column: 5, scope: !450)
!450 = distinct !DILexicalBlock(scope: !408, file: !69, line: 360, column: 4)
!451 = !DILocation(line: 367, column: 1, scope: !339)
!452 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !69, file: !69, line: 385, type: !453, scopeLine: 386, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!453 = !DISubroutineType(types: !454)
!454 = !{!20, !20, !28}
!455 = !DILocalVariable(name: "numerator", arg: 1, scope: !452, file: !69, line: 385, type: !20)
!456 = !DILocation(line: 385, column: 31, scope: !452)
!457 = !DILocalVariable(name: "denominator", arg: 2, scope: !452, file: !69, line: 385, type: !28)
!458 = !DILocation(line: 385, column: 47, scope: !452)
!459 = !DILocalVariable(name: "u16Temp1", scope: !452, file: !69, line: 387, type: !28)
!460 = !DILocation(line: 387, column: 6, scope: !452)
!461 = !DILocalVariable(name: "s32Temp1", scope: !452, file: !69, line: 388, type: !12)
!462 = !DILocation(line: 388, column: 6, scope: !452)
!463 = !DILocalVariable(name: "s32Temp2", scope: !452, file: !69, line: 388, type: !12)
!464 = !DILocation(line: 388, column: 15, scope: !452)
!465 = !DILocation(line: 389, column: 13, scope: !452)
!466 = !DILocation(line: 389, column: 25, scope: !452)
!467 = !DILocation(line: 389, column: 11, scope: !452)
!468 = !DILocation(line: 390, column: 13, scope: !452)
!469 = !DILocation(line: 390, column: 22, scope: !452)
!470 = !DILocation(line: 390, column: 11, scope: !452)
!471 = !DILocation(line: 391, column: 5, scope: !472)
!472 = distinct !DILexicalBlock(scope: !452, file: !69, line: 391, column: 5)
!473 = !DILocation(line: 391, column: 14, scope: !472)
!474 = !DILocation(line: 391, column: 5, scope: !452)
!475 = !DILocation(line: 393, column: 7, scope: !476)
!476 = distinct !DILexicalBlock(scope: !477, file: !69, line: 393, column: 7)
!477 = distinct !DILexicalBlock(scope: !472, file: !69, line: 392, column: 2)
!478 = !DILocation(line: 393, column: 17, scope: !476)
!479 = !DILocation(line: 393, column: 7, scope: !477)
!480 = !DILocation(line: 395, column: 4, scope: !481)
!481 = distinct !DILexicalBlock(scope: !476, file: !69, line: 394, column: 3)
!482 = !DILocation(line: 399, column: 4, scope: !483)
!483 = distinct !DILexicalBlock(scope: !476, file: !69, line: 398, column: 3)
!484 = !DILocation(line: 404, column: 15, scope: !485)
!485 = distinct !DILexicalBlock(scope: !472, file: !69, line: 403, column: 2)
!486 = !DILocation(line: 404, column: 24, scope: !485)
!487 = !DILocation(line: 404, column: 32, scope: !485)
!488 = !DILocation(line: 404, column: 41, scope: !485)
!489 = !DILocation(line: 404, column: 47, scope: !485)
!490 = !DILocation(line: 404, column: 46, scope: !485)
!491 = !DILocation(line: 404, column: 57, scope: !485)
!492 = !DILocation(line: 404, column: 56, scope: !485)
!493 = !DILocation(line: 404, column: 29, scope: !485)
!494 = !DILocation(line: 404, column: 12, scope: !485)
!495 = !DILocation(line: 405, column: 14, scope: !485)
!496 = !DILocation(line: 405, column: 22, scope: !485)
!497 = !DILocation(line: 405, column: 12, scope: !485)
!498 = !DILocation(line: 406, column: 14, scope: !485)
!499 = !DILocation(line: 406, column: 23, scope: !485)
!500 = !DILocation(line: 406, column: 22, scope: !485)
!501 = !DILocation(line: 406, column: 12, scope: !485)
!502 = !DILocation(line: 407, column: 16, scope: !485)
!503 = !DILocation(line: 407, column: 25, scope: !485)
!504 = !DILocation(line: 407, column: 31, scope: !485)
!505 = !DILocation(line: 407, column: 30, scope: !485)
!506 = !DILocation(line: 407, column: 43, scope: !485)
!507 = !DILocation(line: 407, column: 41, scope: !485)
!508 = !DILocation(line: 407, column: 12, scope: !485)
!509 = !DILocation(line: 408, column: 6, scope: !510)
!510 = distinct !DILexicalBlock(scope: !485, file: !69, line: 408, column: 6)
!511 = !DILocation(line: 408, column: 15, scope: !510)
!512 = !DILocation(line: 408, column: 6, scope: !485)
!513 = !DILocation(line: 410, column: 7, scope: !514)
!514 = distinct !DILexicalBlock(scope: !515, file: !69, line: 410, column: 7)
!515 = distinct !DILexicalBlock(scope: !510, file: !69, line: 409, column: 3)
!516 = !DILocation(line: 410, column: 16, scope: !514)
!517 = !DILocation(line: 410, column: 7, scope: !515)
!518 = !DILocation(line: 412, column: 17, scope: !519)
!519 = distinct !DILexicalBlock(scope: !514, file: !69, line: 411, column: 4)
!520 = !DILocation(line: 412, column: 12, scope: !519)
!521 = !DILocation(line: 412, column: 5, scope: !519)
!522 = !DILocation(line: 416, column: 5, scope: !523)
!523 = distinct !DILexicalBlock(scope: !514, file: !69, line: 415, column: 4)
!524 = !DILocation(line: 421, column: 4, scope: !525)
!525 = distinct !DILexicalBlock(scope: !510, file: !69, line: 420, column: 3)
!526 = !DILocation(line: 424, column: 1, scope: !452)
!527 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !69, file: !69, line: 441, type: !453, scopeLine: 442, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!528 = !DILocalVariable(name: "numerator", arg: 1, scope: !527, file: !69, line: 441, type: !20)
!529 = !DILocation(line: 441, column: 30, scope: !527)
!530 = !DILocalVariable(name: "denominator", arg: 2, scope: !527, file: !69, line: 441, type: !28)
!531 = !DILocation(line: 441, column: 45, scope: !527)
!532 = !DILocalVariable(name: "u16Temp1", scope: !527, file: !69, line: 443, type: !28)
!533 = !DILocation(line: 443, column: 6, scope: !527)
!534 = !DILocalVariable(name: "s32Temp1", scope: !527, file: !69, line: 444, type: !12)
!535 = !DILocation(line: 444, column: 6, scope: !527)
!536 = !DILocation(line: 445, column: 13, scope: !527)
!537 = !DILocation(line: 445, column: 25, scope: !527)
!538 = !DILocation(line: 445, column: 11, scope: !527)
!539 = !DILocation(line: 446, column: 5, scope: !540)
!540 = distinct !DILexicalBlock(scope: !527, file: !69, line: 446, column: 5)
!541 = !DILocation(line: 446, column: 13, scope: !540)
!542 = !DILocation(line: 446, column: 5, scope: !527)
!543 = !DILocation(line: 448, column: 6, scope: !544)
!544 = distinct !DILexicalBlock(scope: !545, file: !69, line: 448, column: 6)
!545 = distinct !DILexicalBlock(scope: !540, file: !69, line: 447, column: 2)
!546 = !DILocation(line: 448, column: 15, scope: !544)
!547 = !DILocation(line: 448, column: 6, scope: !545)
!548 = !DILocation(line: 450, column: 4, scope: !549)
!549 = distinct !DILexicalBlock(scope: !544, file: !69, line: 449, column: 3)
!550 = !DILocation(line: 454, column: 4, scope: !551)
!551 = distinct !DILexicalBlock(scope: !544, file: !69, line: 453, column: 3)
!552 = !DILocation(line: 460, column: 15, scope: !553)
!553 = distinct !DILexicalBlock(scope: !540, file: !69, line: 459, column: 2)
!554 = !DILocation(line: 460, column: 27, scope: !553)
!555 = !DILocation(line: 460, column: 37, scope: !553)
!556 = !DILocation(line: 460, column: 36, scope: !553)
!557 = !DILocation(line: 460, column: 49, scope: !553)
!558 = !DILocation(line: 460, column: 47, scope: !553)
!559 = !DILocation(line: 460, column: 25, scope: !553)
!560 = !DILocation(line: 460, column: 59, scope: !553)
!561 = !DILocation(line: 460, column: 12, scope: !553)
!562 = !DILocation(line: 461, column: 15, scope: !553)
!563 = !DILocation(line: 461, column: 24, scope: !553)
!564 = !DILocation(line: 461, column: 23, scope: !553)
!565 = !DILocation(line: 461, column: 37, scope: !553)
!566 = !DILocation(line: 461, column: 47, scope: !553)
!567 = !DILocation(line: 461, column: 46, scope: !553)
!568 = !DILocation(line: 461, column: 34, scope: !553)
!569 = !DILocation(line: 461, column: 12, scope: !553)
!570 = !DILocation(line: 462, column: 10, scope: !553)
!571 = !DILocation(line: 462, column: 3, scope: !553)
!572 = !DILocation(line: 464, column: 1, scope: !527)
!573 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !69, file: !69, line: 482, type: !574, scopeLine: 483, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!574 = !DISubroutineType(types: !575)
!575 = !{!24, !28, !28}
!576 = !DILocalVariable(name: "numerator", arg: 1, scope: !573, file: !69, line: 482, type: !28)
!577 = !DILocation(line: 482, column: 28, scope: !573)
!578 = !DILocalVariable(name: "denominator", arg: 2, scope: !573, file: !69, line: 482, type: !28)
!579 = !DILocation(line: 482, column: 43, scope: !573)
!580 = !DILocalVariable(name: "u32Temp1", scope: !573, file: !69, line: 484, type: !581)
!581 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !13, line: 10, baseType: !16)
!582 = !DILocation(line: 484, column: 6, scope: !573)
!583 = !DILocalVariable(name: "u32Temp2", scope: !573, file: !69, line: 484, type: !581)
!584 = !DILocation(line: 484, column: 20, scope: !573)
!585 = !DILocalVariable(name: "u32Temp3", scope: !573, file: !69, line: 484, type: !581)
!586 = !DILocation(line: 484, column: 33, scope: !573)
!587 = !DILocation(line: 485, column: 5, scope: !588)
!588 = distinct !DILexicalBlock(scope: !573, file: !69, line: 485, column: 5)
!589 = !DILocation(line: 485, column: 16, scope: !588)
!590 = !DILocation(line: 485, column: 5, scope: !573)
!591 = !DILocation(line: 487, column: 3, scope: !592)
!592 = distinct !DILexicalBlock(scope: !588, file: !69, line: 486, column: 2)
!593 = !DILocation(line: 491, column: 15, scope: !594)
!594 = distinct !DILexicalBlock(scope: !588, file: !69, line: 490, column: 2)
!595 = !DILocation(line: 491, column: 24, scope: !594)
!596 = !DILocation(line: 491, column: 12, scope: !594)
!597 = !DILocation(line: 492, column: 14, scope: !594)
!598 = !DILocation(line: 492, column: 25, scope: !594)
!599 = !DILocation(line: 492, column: 23, scope: !594)
!600 = !DILocation(line: 492, column: 12, scope: !594)
!601 = !DILocation(line: 493, column: 15, scope: !594)
!602 = !DILocation(line: 493, column: 24, scope: !594)
!603 = !DILocation(line: 493, column: 32, scope: !594)
!604 = !DILocation(line: 493, column: 12, scope: !594)
!605 = !DILocation(line: 494, column: 6, scope: !606)
!606 = distinct !DILexicalBlock(scope: !594, file: !69, line: 494, column: 6)
!607 = !DILocation(line: 494, column: 15, scope: !606)
!608 = !DILocation(line: 494, column: 6, scope: !594)
!609 = !DILocation(line: 496, column: 15, scope: !610)
!610 = distinct !DILexicalBlock(scope: !606, file: !69, line: 495, column: 3)
!611 = !DILocation(line: 496, column: 11, scope: !610)
!612 = !DILocation(line: 496, column: 4, scope: !610)
!613 = !DILocation(line: 500, column: 4, scope: !614)
!614 = distinct !DILexicalBlock(scope: !606, file: !69, line: 499, column: 3)
!615 = !DILocation(line: 503, column: 1, scope: !573)
!616 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !69, file: !69, line: 520, type: !617, scopeLine: 521, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!617 = !DISubroutineType(types: !618)
!618 = !{!28, !12, !28}
!619 = !DILocalVariable(name: "x_value", arg: 1, scope: !616, file: !69, line: 520, type: !12)
!620 = !DILocation(line: 520, column: 25, scope: !616)
!621 = !DILocalVariable(name: "y_value", arg: 2, scope: !616, file: !69, line: 520, type: !28)
!622 = !DILocation(line: 520, column: 38, scope: !616)
!623 = !DILocalVariable(name: "s32Temp1", scope: !616, file: !69, line: 522, type: !12)
!624 = !DILocation(line: 522, column: 6, scope: !616)
!625 = !DILocation(line: 523, column: 12, scope: !616)
!626 = !DILocation(line: 523, column: 20, scope: !616)
!627 = !DILocation(line: 523, column: 10, scope: !616)
!628 = !DILocation(line: 524, column: 6, scope: !629)
!629 = distinct !DILexicalBlock(scope: !616, file: !69, line: 524, column: 5)
!630 = !DILocation(line: 524, column: 14, scope: !629)
!631 = !DILocation(line: 524, column: 24, scope: !629)
!632 = !DILocation(line: 524, column: 5, scope: !616)
!633 = !DILocation(line: 526, column: 6, scope: !634)
!634 = distinct !DILexicalBlock(scope: !635, file: !69, line: 526, column: 6)
!635 = distinct !DILexicalBlock(scope: !629, file: !69, line: 525, column: 2)
!636 = !DILocation(line: 526, column: 14, scope: !634)
!637 = !DILocation(line: 526, column: 6, scope: !635)
!638 = !DILocation(line: 528, column: 4, scope: !639)
!639 = distinct !DILexicalBlock(scope: !634, file: !69, line: 527, column: 3)
!640 = !DILocation(line: 532, column: 4, scope: !641)
!641 = distinct !DILexicalBlock(scope: !634, file: !69, line: 531, column: 3)
!642 = !DILocation(line: 537, column: 15, scope: !643)
!643 = distinct !DILexicalBlock(scope: !629, file: !69, line: 536, column: 2)
!644 = !DILocation(line: 537, column: 27, scope: !643)
!645 = !DILocation(line: 537, column: 35, scope: !643)
!646 = !DILocation(line: 537, column: 34, scope: !643)
!647 = !DILocation(line: 537, column: 46, scope: !643)
!648 = !DILocation(line: 537, column: 44, scope: !643)
!649 = !DILocation(line: 537, column: 23, scope: !643)
!650 = !DILocation(line: 537, column: 56, scope: !643)
!651 = !DILocation(line: 537, column: 12, scope: !643)
!652 = !DILocation(line: 538, column: 15, scope: !643)
!653 = !DILocation(line: 538, column: 24, scope: !643)
!654 = !DILocation(line: 538, column: 23, scope: !643)
!655 = !DILocation(line: 538, column: 36, scope: !643)
!656 = !DILocation(line: 538, column: 44, scope: !643)
!657 = !DILocation(line: 538, column: 43, scope: !643)
!658 = !DILocation(line: 538, column: 33, scope: !643)
!659 = !DILocation(line: 538, column: 12, scope: !643)
!660 = !DILocation(line: 539, column: 6, scope: !661)
!661 = distinct !DILexicalBlock(scope: !643, file: !69, line: 539, column: 6)
!662 = !DILocation(line: 539, column: 15, scope: !661)
!663 = !DILocation(line: 539, column: 6, scope: !643)
!664 = !DILocation(line: 541, column: 7, scope: !665)
!665 = distinct !DILexicalBlock(scope: !666, file: !69, line: 541, column: 7)
!666 = distinct !DILexicalBlock(scope: !661, file: !69, line: 540, column: 3)
!667 = !DILocation(line: 541, column: 16, scope: !665)
!668 = !DILocation(line: 541, column: 7, scope: !666)
!669 = !DILocation(line: 543, column: 17, scope: !670)
!670 = distinct !DILexicalBlock(scope: !665, file: !69, line: 542, column: 4)
!671 = !DILocation(line: 543, column: 12, scope: !670)
!672 = !DILocation(line: 543, column: 5, scope: !670)
!673 = !DILocation(line: 547, column: 5, scope: !674)
!674 = distinct !DILexicalBlock(scope: !665, file: !69, line: 546, column: 4)
!675 = !DILocation(line: 552, column: 4, scope: !676)
!676 = distinct !DILexicalBlock(scope: !661, file: !69, line: 551, column: 3)
!677 = !DILocation(line: 555, column: 1, scope: !616)
!678 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !69, file: !69, line: 573, type: !679, scopeLine: 574, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!679 = !DISubroutineType(types: !680)
!680 = !{!28, !28, !28}
!681 = !DILocalVariable(name: "numerator", arg: 1, scope: !678, file: !69, line: 573, type: !28)
!682 = !DILocation(line: 573, column: 31, scope: !678)
!683 = !DILocalVariable(name: "denominator", arg: 2, scope: !678, file: !69, line: 573, type: !28)
!684 = !DILocation(line: 573, column: 46, scope: !678)
!685 = !DILocalVariable(name: "u32Temp", scope: !678, file: !69, line: 575, type: !581)
!686 = !DILocation(line: 575, column: 6, scope: !678)
!687 = !DILocation(line: 576, column: 5, scope: !688)
!688 = distinct !DILexicalBlock(scope: !678, file: !69, line: 576, column: 5)
!689 = !DILocation(line: 576, column: 17, scope: !688)
!690 = !DILocation(line: 576, column: 5, scope: !678)
!691 = !DILocation(line: 578, column: 3, scope: !692)
!692 = distinct !DILexicalBlock(scope: !688, file: !69, line: 577, column: 2)
!693 = !DILocation(line: 582, column: 14, scope: !694)
!694 = distinct !DILexicalBlock(scope: !688, file: !69, line: 581, column: 2)
!695 = !DILocation(line: 582, column: 23, scope: !694)
!696 = !DILocation(line: 582, column: 32, scope: !694)
!697 = !DILocation(line: 582, column: 44, scope: !694)
!698 = !DILocation(line: 582, column: 29, scope: !694)
!699 = !DILocation(line: 582, column: 11, scope: !694)
!700 = !DILocation(line: 583, column: 13, scope: !694)
!701 = !DILocation(line: 583, column: 21, scope: !694)
!702 = !DILocation(line: 583, column: 20, scope: !694)
!703 = !DILocation(line: 583, column: 11, scope: !694)
!704 = !DILocation(line: 584, column: 6, scope: !705)
!705 = distinct !DILexicalBlock(scope: !694, file: !69, line: 584, column: 6)
!706 = !DILocation(line: 584, column: 14, scope: !705)
!707 = !DILocation(line: 584, column: 6, scope: !694)
!708 = !DILocation(line: 586, column: 11, scope: !709)
!709 = distinct !DILexicalBlock(scope: !705, file: !69, line: 585, column: 3)
!710 = !DILocation(line: 586, column: 19, scope: !709)
!711 = !DILocation(line: 586, column: 4, scope: !709)
!712 = !DILocation(line: 590, column: 4, scope: !713)
!713 = distinct !DILexicalBlock(scope: !705, file: !69, line: 589, column: 3)
!714 = !DILocation(line: 594, column: 1, scope: !678)
!715 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !69, file: !69, line: 611, type: !716, scopeLine: 612, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!716 = !DISubroutineType(types: !717)
!717 = !{!28, !581, !28}
!718 = !DILocalVariable(name: "x_value", arg: 1, scope: !715, file: !69, line: 611, type: !581)
!719 = !DILocation(line: 611, column: 25, scope: !715)
!720 = !DILocalVariable(name: "y_value", arg: 2, scope: !715, file: !69, line: 611, type: !28)
!721 = !DILocation(line: 611, column: 38, scope: !715)
!722 = !DILocalVariable(name: "u32Temp1", scope: !715, file: !69, line: 613, type: !581)
!723 = !DILocation(line: 613, column: 6, scope: !715)
!724 = !DILocalVariable(name: "u32Temp2", scope: !715, file: !69, line: 613, type: !581)
!725 = !DILocation(line: 613, column: 17, scope: !715)
!726 = !DILocation(line: 614, column: 12, scope: !715)
!727 = !DILocation(line: 614, column: 20, scope: !715)
!728 = !DILocation(line: 614, column: 10, scope: !715)
!729 = !DILocation(line: 615, column: 5, scope: !730)
!730 = distinct !DILexicalBlock(scope: !715, file: !69, line: 615, column: 5)
!731 = !DILocation(line: 615, column: 13, scope: !730)
!732 = !DILocation(line: 615, column: 5, scope: !715)
!733 = !DILocation(line: 617, column: 3, scope: !734)
!734 = distinct !DILexicalBlock(scope: !730, file: !69, line: 616, column: 2)
!735 = !DILocation(line: 621, column: 14, scope: !736)
!736 = distinct !DILexicalBlock(scope: !730, file: !69, line: 620, column: 2)
!737 = !DILocation(line: 621, column: 22, scope: !736)
!738 = !DILocation(line: 621, column: 21, scope: !736)
!739 = !DILocation(line: 621, column: 12, scope: !736)
!740 = !DILocation(line: 622, column: 14, scope: !736)
!741 = !DILocation(line: 622, column: 25, scope: !736)
!742 = !DILocation(line: 622, column: 36, scope: !736)
!743 = !DILocation(line: 622, column: 34, scope: !736)
!744 = !DILocation(line: 622, column: 22, scope: !736)
!745 = !DILocation(line: 622, column: 45, scope: !736)
!746 = !DILocation(line: 622, column: 12, scope: !736)
!747 = !DILocation(line: 623, column: 15, scope: !736)
!748 = !DILocation(line: 623, column: 24, scope: !736)
!749 = !DILocation(line: 623, column: 23, scope: !736)
!750 = !DILocation(line: 623, column: 36, scope: !736)
!751 = !DILocation(line: 623, column: 44, scope: !736)
!752 = !DILocation(line: 623, column: 43, scope: !736)
!753 = !DILocation(line: 623, column: 33, scope: !736)
!754 = !DILocation(line: 623, column: 12, scope: !736)
!755 = !DILocation(line: 624, column: 6, scope: !756)
!756 = distinct !DILexicalBlock(scope: !736, file: !69, line: 624, column: 6)
!757 = !DILocation(line: 624, column: 15, scope: !756)
!758 = !DILocation(line: 624, column: 6, scope: !736)
!759 = !DILocation(line: 626, column: 11, scope: !760)
!760 = distinct !DILexicalBlock(scope: !756, file: !69, line: 625, column: 3)
!761 = !DILocation(line: 626, column: 20, scope: !760)
!762 = !DILocation(line: 626, column: 4, scope: !760)
!763 = !DILocation(line: 630, column: 4, scope: !764)
!764 = distinct !DILexicalBlock(scope: !756, file: !69, line: 629, column: 3)
!765 = !DILocation(line: 634, column: 1, scope: !715)
!766 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 653, type: !767, scopeLine: 654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!767 = !DISubroutineType(types: !768)
!768 = !{!20, !20, !28, !20}
!769 = !DILocalVariable(name: "factor1", arg: 1, scope: !766, file: !69, line: 653, type: !20)
!770 = !DILocation(line: 653, column: 33, scope: !766)
!771 = !DILocalVariable(name: "factor2", arg: 2, scope: !766, file: !69, line: 653, type: !28)
!772 = !DILocation(line: 653, column: 46, scope: !766)
!773 = !DILocalVariable(name: "denominator", arg: 3, scope: !766, file: !69, line: 653, type: !20)
!774 = !DILocation(line: 653, column: 59, scope: !766)
!775 = !DILocalVariable(name: "s32Result", scope: !766, file: !69, line: 655, type: !12)
!776 = !DILocation(line: 655, column: 6, scope: !766)
!777 = !DILocalVariable(name: "s32Temp1", scope: !766, file: !69, line: 655, type: !12)
!778 = !DILocation(line: 655, column: 21, scope: !766)
!779 = !DILocation(line: 656, column: 14, scope: !766)
!780 = !DILocation(line: 656, column: 24, scope: !766)
!781 = !DILocation(line: 656, column: 22, scope: !766)
!782 = !DILocation(line: 656, column: 12, scope: !766)
!783 = !DILocation(line: 657, column: 5, scope: !784)
!784 = distinct !DILexicalBlock(scope: !766, file: !69, line: 657, column: 5)
!785 = !DILocation(line: 657, column: 17, scope: !784)
!786 = !DILocation(line: 657, column: 5, scope: !766)
!787 = !DILocation(line: 659, column: 6, scope: !788)
!788 = distinct !DILexicalBlock(scope: !789, file: !69, line: 659, column: 6)
!789 = distinct !DILexicalBlock(scope: !784, file: !69, line: 658, column: 2)
!790 = !DILocation(line: 659, column: 16, scope: !788)
!791 = !DILocation(line: 659, column: 6, scope: !789)
!792 = !DILocation(line: 661, column: 4, scope: !793)
!793 = distinct !DILexicalBlock(scope: !788, file: !69, line: 660, column: 3)
!794 = !DILocation(line: 665, column: 4, scope: !795)
!795 = distinct !DILexicalBlock(scope: !788, file: !69, line: 664, column: 3)
!796 = !DILocation(line: 670, column: 14, scope: !797)
!797 = distinct !DILexicalBlock(scope: !784, file: !69, line: 669, column: 2)
!798 = !DILocation(line: 670, column: 27, scope: !797)
!799 = !DILocation(line: 670, column: 37, scope: !797)
!800 = !DILocation(line: 670, column: 36, scope: !797)
!801 = !DILocation(line: 670, column: 50, scope: !797)
!802 = !DILocation(line: 670, column: 49, scope: !797)
!803 = !DILocation(line: 670, column: 24, scope: !797)
!804 = !DILocation(line: 670, column: 12, scope: !797)
!805 = !DILocation(line: 671, column: 14, scope: !797)
!806 = !DILocation(line: 671, column: 23, scope: !797)
!807 = !DILocation(line: 671, column: 12, scope: !797)
!808 = !DILocation(line: 672, column: 16, scope: !797)
!809 = !DILocation(line: 672, column: 25, scope: !797)
!810 = !DILocation(line: 672, column: 24, scope: !797)
!811 = !DILocation(line: 672, column: 41, scope: !797)
!812 = !DILocation(line: 672, column: 51, scope: !797)
!813 = !DILocation(line: 672, column: 50, scope: !797)
!814 = !DILocation(line: 672, column: 38, scope: !797)
!815 = !DILocation(line: 672, column: 13, scope: !797)
!816 = !DILocation(line: 673, column: 6, scope: !817)
!817 = distinct !DILexicalBlock(scope: !797, file: !69, line: 673, column: 6)
!818 = !DILocation(line: 673, column: 16, scope: !817)
!819 = !DILocation(line: 673, column: 6, scope: !797)
!820 = !DILocation(line: 675, column: 7, scope: !821)
!821 = distinct !DILexicalBlock(scope: !822, file: !69, line: 675, column: 7)
!822 = distinct !DILexicalBlock(scope: !817, file: !69, line: 674, column: 3)
!823 = !DILocation(line: 675, column: 17, scope: !821)
!824 = !DILocation(line: 675, column: 7, scope: !822)
!825 = !DILocation(line: 677, column: 17, scope: !826)
!826 = distinct !DILexicalBlock(scope: !821, file: !69, line: 676, column: 4)
!827 = !DILocation(line: 677, column: 12, scope: !826)
!828 = !DILocation(line: 677, column: 5, scope: !826)
!829 = !DILocation(line: 682, column: 5, scope: !830)
!830 = distinct !DILexicalBlock(scope: !821, file: !69, line: 681, column: 4)
!831 = !DILocation(line: 687, column: 4, scope: !832)
!832 = distinct !DILexicalBlock(scope: !817, file: !69, line: 686, column: 3)
!833 = !DILocation(line: 691, column: 1, scope: !766)
!834 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !69, file: !69, line: 709, type: !835, scopeLine: 710, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!835 = !DISubroutineType(types: !836)
!836 = !{!20, !28, !20, !28}
!837 = !DILocalVariable(name: "factor1", arg: 1, scope: !834, file: !69, line: 709, type: !28)
!838 = !DILocation(line: 709, column: 33, scope: !834)
!839 = !DILocalVariable(name: "factor2", arg: 2, scope: !834, file: !69, line: 709, type: !20)
!840 = !DILocation(line: 709, column: 46, scope: !834)
!841 = !DILocalVariable(name: "denominator", arg: 3, scope: !834, file: !69, line: 709, type: !28)
!842 = !DILocation(line: 709, column: 59, scope: !834)
!843 = !DILocalVariable(name: "s32Result", scope: !834, file: !69, line: 711, type: !12)
!844 = !DILocation(line: 711, column: 6, scope: !834)
!845 = !DILocalVariable(name: "s32Temp1", scope: !834, file: !69, line: 711, type: !12)
!846 = !DILocation(line: 711, column: 21, scope: !834)
!847 = !DILocation(line: 712, column: 14, scope: !834)
!848 = !DILocation(line: 712, column: 24, scope: !834)
!849 = !DILocation(line: 712, column: 22, scope: !834)
!850 = !DILocation(line: 712, column: 12, scope: !834)
!851 = !DILocation(line: 713, column: 5, scope: !852)
!852 = distinct !DILexicalBlock(scope: !834, file: !69, line: 713, column: 5)
!853 = !DILocation(line: 713, column: 16, scope: !852)
!854 = !DILocation(line: 713, column: 5, scope: !834)
!855 = !DILocation(line: 715, column: 6, scope: !856)
!856 = distinct !DILexicalBlock(scope: !857, file: !69, line: 715, column: 6)
!857 = distinct !DILexicalBlock(scope: !852, file: !69, line: 714, column: 2)
!858 = !DILocation(line: 715, column: 16, scope: !856)
!859 = !DILocation(line: 715, column: 6, scope: !857)
!860 = !DILocation(line: 717, column: 4, scope: !861)
!861 = distinct !DILexicalBlock(scope: !856, file: !69, line: 716, column: 3)
!862 = !DILocation(line: 721, column: 4, scope: !863)
!863 = distinct !DILexicalBlock(scope: !856, file: !69, line: 720, column: 3)
!864 = !DILocation(line: 726, column: 14, scope: !865)
!865 = distinct !DILexicalBlock(scope: !852, file: !69, line: 725, column: 2)
!866 = !DILocation(line: 726, column: 28, scope: !865)
!867 = !DILocation(line: 726, column: 38, scope: !865)
!868 = !DILocation(line: 726, column: 37, scope: !865)
!869 = !DILocation(line: 726, column: 53, scope: !865)
!870 = !DILocation(line: 726, column: 51, scope: !865)
!871 = !DILocation(line: 726, column: 24, scope: !865)
!872 = !DILocation(line: 726, column: 66, scope: !865)
!873 = !DILocation(line: 726, column: 12, scope: !865)
!874 = !DILocation(line: 727, column: 16, scope: !865)
!875 = !DILocation(line: 727, column: 25, scope: !865)
!876 = !DILocation(line: 727, column: 24, scope: !865)
!877 = !DILocation(line: 727, column: 41, scope: !865)
!878 = !DILocation(line: 727, column: 51, scope: !865)
!879 = !DILocation(line: 727, column: 50, scope: !865)
!880 = !DILocation(line: 727, column: 38, scope: !865)
!881 = !DILocation(line: 727, column: 13, scope: !865)
!882 = !DILocation(line: 728, column: 6, scope: !883)
!883 = distinct !DILexicalBlock(scope: !865, file: !69, line: 728, column: 6)
!884 = !DILocation(line: 728, column: 16, scope: !883)
!885 = !DILocation(line: 728, column: 6, scope: !865)
!886 = !DILocation(line: 730, column: 7, scope: !887)
!887 = distinct !DILexicalBlock(scope: !888, file: !69, line: 730, column: 7)
!888 = distinct !DILexicalBlock(scope: !883, file: !69, line: 729, column: 3)
!889 = !DILocation(line: 730, column: 17, scope: !887)
!890 = !DILocation(line: 730, column: 7, scope: !888)
!891 = !DILocation(line: 732, column: 17, scope: !892)
!892 = distinct !DILexicalBlock(scope: !887, file: !69, line: 731, column: 4)
!893 = !DILocation(line: 732, column: 12, scope: !892)
!894 = !DILocation(line: 732, column: 5, scope: !892)
!895 = !DILocation(line: 736, column: 5, scope: !896)
!896 = distinct !DILexicalBlock(scope: !887, file: !69, line: 735, column: 4)
!897 = !DILocation(line: 741, column: 4, scope: !898)
!898 = distinct !DILexicalBlock(scope: !883, file: !69, line: 740, column: 3)
!899 = !DILocation(line: 744, column: 1, scope: !834)
!900 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !69, file: !69, line: 763, type: !901, scopeLine: 764, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!901 = !DISubroutineType(types: !902)
!902 = !{!28, !20, !28, !20}
!903 = !DILocalVariable(name: "factor1", arg: 1, scope: !900, file: !69, line: 763, type: !20)
!904 = !DILocation(line: 763, column: 33, scope: !900)
!905 = !DILocalVariable(name: "factor2", arg: 2, scope: !900, file: !69, line: 763, type: !28)
!906 = !DILocation(line: 763, column: 46, scope: !900)
!907 = !DILocalVariable(name: "denominator", arg: 3, scope: !900, file: !69, line: 763, type: !20)
!908 = !DILocation(line: 763, column: 59, scope: !900)
!909 = !DILocalVariable(name: "u32Result", scope: !900, file: !69, line: 765, type: !581)
!910 = !DILocation(line: 765, column: 6, scope: !900)
!911 = !DILocalVariable(name: "u32Temp1", scope: !900, file: !69, line: 765, type: !581)
!912 = !DILocation(line: 765, column: 21, scope: !900)
!913 = !DILocalVariable(name: "s32Result", scope: !900, file: !69, line: 766, type: !12)
!914 = !DILocation(line: 766, column: 6, scope: !900)
!915 = !DILocalVariable(name: "s32Temp1", scope: !900, file: !69, line: 766, type: !12)
!916 = !DILocation(line: 766, column: 21, scope: !900)
!917 = !DILocation(line: 767, column: 14, scope: !900)
!918 = !DILocation(line: 767, column: 24, scope: !900)
!919 = !DILocation(line: 767, column: 22, scope: !900)
!920 = !DILocation(line: 767, column: 12, scope: !900)
!921 = !DILocation(line: 769, column: 5, scope: !922)
!922 = distinct !DILexicalBlock(scope: !900, file: !69, line: 769, column: 5)
!923 = !DILocation(line: 769, column: 17, scope: !922)
!924 = !DILocation(line: 769, column: 5, scope: !900)
!925 = !DILocation(line: 771, column: 6, scope: !926)
!926 = distinct !DILexicalBlock(scope: !927, file: !69, line: 771, column: 6)
!927 = distinct !DILexicalBlock(scope: !922, file: !69, line: 770, column: 2)
!928 = !DILocation(line: 771, column: 16, scope: !926)
!929 = !DILocation(line: 771, column: 6, scope: !927)
!930 = !DILocation(line: 773, column: 4, scope: !931)
!931 = distinct !DILexicalBlock(scope: !926, file: !69, line: 772, column: 3)
!932 = !DILocation(line: 777, column: 4, scope: !933)
!933 = distinct !DILexicalBlock(scope: !926, file: !69, line: 776, column: 3)
!934 = !DILocation(line: 782, column: 15, scope: !935)
!935 = distinct !DILexicalBlock(scope: !922, file: !69, line: 781, column: 2)
!936 = !DILocation(line: 782, column: 29, scope: !935)
!937 = !DILocation(line: 782, column: 39, scope: !935)
!938 = !DILocation(line: 782, column: 38, scope: !935)
!939 = !DILocation(line: 782, column: 54, scope: !935)
!940 = !DILocation(line: 782, column: 52, scope: !935)
!941 = !DILocation(line: 782, column: 25, scope: !935)
!942 = !DILocation(line: 782, column: 68, scope: !935)
!943 = !DILocation(line: 782, column: 12, scope: !935)
!944 = !DILocation(line: 783, column: 16, scope: !935)
!945 = !DILocation(line: 783, column: 25, scope: !935)
!946 = !DILocation(line: 783, column: 24, scope: !935)
!947 = !DILocation(line: 783, column: 41, scope: !935)
!948 = !DILocation(line: 783, column: 51, scope: !935)
!949 = !DILocation(line: 783, column: 50, scope: !935)
!950 = !DILocation(line: 783, column: 38, scope: !935)
!951 = !DILocation(line: 783, column: 13, scope: !935)
!952 = !DILocation(line: 784, column: 6, scope: !953)
!953 = distinct !DILexicalBlock(scope: !935, file: !69, line: 784, column: 6)
!954 = !DILocation(line: 784, column: 16, scope: !953)
!955 = !DILocation(line: 784, column: 6, scope: !935)
!956 = !DILocation(line: 786, column: 7, scope: !957)
!957 = distinct !DILexicalBlock(scope: !958, file: !69, line: 786, column: 7)
!958 = distinct !DILexicalBlock(scope: !953, file: !69, line: 785, column: 3)
!959 = !DILocation(line: 786, column: 17, scope: !957)
!960 = !DILocation(line: 786, column: 7, scope: !958)
!961 = !DILocation(line: 788, column: 17, scope: !962)
!962 = distinct !DILexicalBlock(scope: !957, file: !69, line: 787, column: 4)
!963 = !DILocation(line: 788, column: 12, scope: !962)
!964 = !DILocation(line: 788, column: 5, scope: !962)
!965 = !DILocation(line: 792, column: 5, scope: !966)
!966 = distinct !DILexicalBlock(scope: !957, file: !69, line: 791, column: 4)
!967 = !DILocation(line: 797, column: 4, scope: !968)
!968 = distinct !DILexicalBlock(scope: !953, file: !69, line: 796, column: 3)
!969 = !DILocation(line: 800, column: 1, scope: !900)
!970 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !69, file: !69, line: 819, type: !971, scopeLine: 820, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!971 = !DISubroutineType(types: !972)
!972 = !{!28, !20, !28, !28}
!973 = !DILocalVariable(name: "factor1", arg: 1, scope: !970, file: !69, line: 819, type: !20)
!974 = !DILocation(line: 819, column: 33, scope: !970)
!975 = !DILocalVariable(name: "factor2", arg: 2, scope: !970, file: !69, line: 819, type: !28)
!976 = !DILocation(line: 819, column: 46, scope: !970)
!977 = !DILocalVariable(name: "denominator", arg: 3, scope: !970, file: !69, line: 819, type: !28)
!978 = !DILocation(line: 819, column: 59, scope: !970)
!979 = !DILocalVariable(name: "s32Result", scope: !970, file: !69, line: 821, type: !12)
!980 = !DILocation(line: 821, column: 6, scope: !970)
!981 = !DILocalVariable(name: "s32Temp1", scope: !970, file: !69, line: 821, type: !12)
!982 = !DILocation(line: 821, column: 21, scope: !970)
!983 = !DILocation(line: 822, column: 14, scope: !970)
!984 = !DILocation(line: 822, column: 24, scope: !970)
!985 = !DILocation(line: 822, column: 22, scope: !970)
!986 = !DILocation(line: 822, column: 12, scope: !970)
!987 = !DILocation(line: 824, column: 5, scope: !988)
!988 = distinct !DILexicalBlock(scope: !970, file: !69, line: 824, column: 5)
!989 = !DILocation(line: 824, column: 17, scope: !988)
!990 = !DILocation(line: 824, column: 5, scope: !970)
!991 = !DILocation(line: 826, column: 6, scope: !992)
!992 = distinct !DILexicalBlock(scope: !993, file: !69, line: 826, column: 6)
!993 = distinct !DILexicalBlock(scope: !988, file: !69, line: 825, column: 2)
!994 = !DILocation(line: 826, column: 16, scope: !992)
!995 = !DILocation(line: 826, column: 6, scope: !993)
!996 = !DILocation(line: 828, column: 4, scope: !997)
!997 = distinct !DILexicalBlock(scope: !992, file: !69, line: 827, column: 3)
!998 = !DILocation(line: 832, column: 4, scope: !999)
!999 = distinct !DILexicalBlock(scope: !992, file: !69, line: 831, column: 3)
!1000 = !DILocation(line: 837, column: 15, scope: !1001)
!1001 = distinct !DILexicalBlock(scope: !988, file: !69, line: 836, column: 2)
!1002 = !DILocation(line: 837, column: 29, scope: !1001)
!1003 = !DILocation(line: 837, column: 39, scope: !1001)
!1004 = !DILocation(line: 837, column: 38, scope: !1001)
!1005 = !DILocation(line: 837, column: 54, scope: !1001)
!1006 = !DILocation(line: 837, column: 52, scope: !1001)
!1007 = !DILocation(line: 837, column: 25, scope: !1001)
!1008 = !DILocation(line: 837, column: 68, scope: !1001)
!1009 = !DILocation(line: 837, column: 12, scope: !1001)
!1010 = !DILocation(line: 838, column: 16, scope: !1001)
!1011 = !DILocation(line: 838, column: 25, scope: !1001)
!1012 = !DILocation(line: 838, column: 24, scope: !1001)
!1013 = !DILocation(line: 838, column: 41, scope: !1001)
!1014 = !DILocation(line: 838, column: 51, scope: !1001)
!1015 = !DILocation(line: 838, column: 50, scope: !1001)
!1016 = !DILocation(line: 838, column: 38, scope: !1001)
!1017 = !DILocation(line: 838, column: 13, scope: !1001)
!1018 = !DILocation(line: 839, column: 6, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1001, file: !69, line: 839, column: 6)
!1020 = !DILocation(line: 839, column: 16, scope: !1019)
!1021 = !DILocation(line: 839, column: 6, scope: !1001)
!1022 = !DILocation(line: 841, column: 7, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !1024, file: !69, line: 841, column: 7)
!1024 = distinct !DILexicalBlock(scope: !1019, file: !69, line: 840, column: 3)
!1025 = !DILocation(line: 841, column: 17, scope: !1023)
!1026 = !DILocation(line: 841, column: 7, scope: !1024)
!1027 = !DILocation(line: 843, column: 17, scope: !1028)
!1028 = distinct !DILexicalBlock(scope: !1023, file: !69, line: 842, column: 4)
!1029 = !DILocation(line: 843, column: 12, scope: !1028)
!1030 = !DILocation(line: 843, column: 5, scope: !1028)
!1031 = !DILocation(line: 847, column: 5, scope: !1032)
!1032 = distinct !DILexicalBlock(scope: !1023, file: !69, line: 846, column: 4)
!1033 = !DILocation(line: 852, column: 4, scope: !1034)
!1034 = distinct !DILexicalBlock(scope: !1019, file: !69, line: 851, column: 3)
!1035 = !DILocation(line: 856, column: 1, scope: !970)
!1036 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !69, file: !69, line: 874, type: !1037, scopeLine: 875, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1037 = !DISubroutineType(types: !1038)
!1038 = !{!28, !28, !28, !28}
!1039 = !DILocalVariable(name: "factor1", arg: 1, scope: !1036, file: !69, line: 874, type: !28)
!1040 = !DILocation(line: 874, column: 33, scope: !1036)
!1041 = !DILocalVariable(name: "factor2", arg: 2, scope: !1036, file: !69, line: 874, type: !28)
!1042 = !DILocation(line: 874, column: 46, scope: !1036)
!1043 = !DILocalVariable(name: "denominator", arg: 3, scope: !1036, file: !69, line: 874, type: !28)
!1044 = !DILocation(line: 874, column: 59, scope: !1036)
!1045 = !DILocalVariable(name: "u32Temp1", scope: !1036, file: !69, line: 876, type: !581)
!1046 = !DILocation(line: 876, column: 6, scope: !1036)
!1047 = !DILocalVariable(name: "u16TempDenom", scope: !1036, file: !69, line: 877, type: !28)
!1048 = !DILocation(line: 877, column: 6, scope: !1036)
!1049 = !DILocation(line: 879, column: 5, scope: !1050)
!1050 = distinct !DILexicalBlock(scope: !1036, file: !69, line: 879, column: 5)
!1051 = !DILocation(line: 879, column: 17, scope: !1050)
!1052 = !DILocation(line: 879, column: 5, scope: !1036)
!1053 = !DILocation(line: 881, column: 3, scope: !1054)
!1054 = distinct !DILexicalBlock(scope: !1050, file: !69, line: 880, column: 2)
!1055 = !DILocation(line: 885, column: 14, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !1050, file: !69, line: 884, column: 2)
!1057 = !DILocation(line: 885, column: 24, scope: !1056)
!1058 = !DILocation(line: 885, column: 22, scope: !1056)
!1059 = !DILocation(line: 885, column: 12, scope: !1056)
!1060 = !DILocation(line: 886, column: 18, scope: !1056)
!1061 = !DILocation(line: 886, column: 30, scope: !1056)
!1062 = !DILocation(line: 886, column: 16, scope: !1056)
!1063 = !DILocation(line: 887, column: 14, scope: !1056)
!1064 = !DILocation(line: 887, column: 25, scope: !1056)
!1065 = !DILocation(line: 887, column: 23, scope: !1056)
!1066 = !DILocation(line: 887, column: 12, scope: !1056)
!1067 = !DILocation(line: 888, column: 14, scope: !1056)
!1068 = !DILocation(line: 888, column: 25, scope: !1056)
!1069 = !DILocation(line: 888, column: 23, scope: !1056)
!1070 = !DILocation(line: 888, column: 12, scope: !1056)
!1071 = !DILocation(line: 889, column: 6, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1056, file: !69, line: 889, column: 6)
!1073 = !DILocation(line: 889, column: 15, scope: !1072)
!1074 = !DILocation(line: 889, column: 6, scope: !1056)
!1075 = !DILocation(line: 891, column: 12, scope: !1076)
!1076 = distinct !DILexicalBlock(scope: !1072, file: !69, line: 890, column: 3)
!1077 = !DILocation(line: 891, column: 21, scope: !1076)
!1078 = !DILocation(line: 891, column: 11, scope: !1076)
!1079 = !DILocation(line: 891, column: 4, scope: !1076)
!1080 = !DILocation(line: 896, column: 4, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1072, file: !69, line: 895, column: 3)
!1082 = !DILocation(line: 901, column: 1, scope: !1036)
!1083 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !69, file: !69, line: 918, type: !1084, scopeLine: 919, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!28, !28, !28, !581}
!1086 = !DILocalVariable(name: "factor1", arg: 1, scope: !1083, file: !69, line: 918, type: !28)
!1087 = !DILocation(line: 918, column: 33, scope: !1083)
!1088 = !DILocalVariable(name: "factor2", arg: 2, scope: !1083, file: !69, line: 918, type: !28)
!1089 = !DILocation(line: 918, column: 46, scope: !1083)
!1090 = !DILocalVariable(name: "denominator", arg: 3, scope: !1083, file: !69, line: 918, type: !581)
!1091 = !DILocation(line: 918, column: 59, scope: !1083)
!1092 = !DILocalVariable(name: "u32Temp1", scope: !1083, file: !69, line: 920, type: !581)
!1093 = !DILocation(line: 920, column: 6, scope: !1083)
!1094 = !DILocation(line: 921, column: 5, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1083, file: !69, line: 921, column: 5)
!1096 = !DILocation(line: 921, column: 17, scope: !1095)
!1097 = !DILocation(line: 921, column: 5, scope: !1083)
!1098 = !DILocation(line: 923, column: 3, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !1095, file: !69, line: 922, column: 2)
!1100 = !DILocation(line: 927, column: 15, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1095, file: !69, line: 926, column: 2)
!1102 = !DILocation(line: 927, column: 25, scope: !1101)
!1103 = !DILocation(line: 927, column: 23, scope: !1101)
!1104 = !DILocation(line: 927, column: 36, scope: !1101)
!1105 = !DILocation(line: 927, column: 34, scope: !1101)
!1106 = !DILocation(line: 927, column: 12, scope: !1101)
!1107 = !DILocation(line: 928, column: 8, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1101, file: !69, line: 928, column: 6)
!1109 = !DILocation(line: 928, column: 18, scope: !1108)
!1110 = !DILocation(line: 928, column: 16, scope: !1108)
!1111 = !DILocation(line: 928, column: 28, scope: !1108)
!1112 = !DILocation(line: 928, column: 40, scope: !1108)
!1113 = !DILocation(line: 928, column: 39, scope: !1108)
!1114 = !DILocation(line: 928, column: 26, scope: !1108)
!1115 = !DILocation(line: 928, column: 53, scope: !1108)
!1116 = !DILocation(line: 928, column: 64, scope: !1108)
!1117 = !DILocation(line: 928, column: 50, scope: !1108)
!1118 = !DILocation(line: 928, column: 6, scope: !1101)
!1119 = !DILocation(line: 930, column: 12, scope: !1120)
!1120 = distinct !DILexicalBlock(scope: !1108, file: !69, line: 929, column: 3)
!1121 = !DILocation(line: 931, column: 3, scope: !1120)
!1122 = !DILocation(line: 932, column: 6, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1101, file: !69, line: 932, column: 6)
!1124 = !DILocation(line: 932, column: 15, scope: !1123)
!1125 = !DILocation(line: 932, column: 6, scope: !1101)
!1126 = !DILocation(line: 934, column: 12, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1123, file: !69, line: 933, column: 3)
!1128 = !DILocation(line: 934, column: 21, scope: !1127)
!1129 = !DILocation(line: 934, column: 11, scope: !1127)
!1130 = !DILocation(line: 934, column: 4, scope: !1127)
!1131 = !DILocation(line: 938, column: 4, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1123, file: !69, line: 937, column: 3)
!1133 = !DILocation(line: 941, column: 1, scope: !1083)
!1134 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !69, file: !69, line: 958, type: !1135, scopeLine: 959, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1135 = !DISubroutineType(types: !1136)
!1136 = !{!581, !581, !28}
!1137 = !DILocalVariable(name: "x_value", arg: 1, scope: !1134, file: !69, line: 958, type: !581)
!1138 = !DILocation(line: 958, column: 25, scope: !1134)
!1139 = !DILocalVariable(name: "y_value", arg: 2, scope: !1134, file: !69, line: 958, type: !28)
!1140 = !DILocation(line: 958, column: 38, scope: !1134)
!1141 = !DILocalVariable(name: "u32Temp1", scope: !1134, file: !69, line: 960, type: !581)
!1142 = !DILocation(line: 960, column: 6, scope: !1134)
!1143 = !DILocation(line: 961, column: 5, scope: !1144)
!1144 = distinct !DILexicalBlock(scope: !1134, file: !69, line: 961, column: 5)
!1145 = !DILocation(line: 961, column: 13, scope: !1144)
!1146 = !DILocation(line: 961, column: 5, scope: !1134)
!1147 = !DILocation(line: 963, column: 3, scope: !1148)
!1148 = distinct !DILexicalBlock(scope: !1144, file: !69, line: 962, column: 2)
!1149 = !DILocation(line: 967, column: 15, scope: !1150)
!1150 = distinct !DILexicalBlock(scope: !1144, file: !69, line: 966, column: 2)
!1151 = !DILocation(line: 967, column: 26, scope: !1150)
!1152 = !DILocation(line: 967, column: 34, scope: !1150)
!1153 = !DILocation(line: 967, column: 33, scope: !1150)
!1154 = !DILocation(line: 967, column: 45, scope: !1150)
!1155 = !DILocation(line: 967, column: 43, scope: !1150)
!1156 = !DILocation(line: 967, column: 23, scope: !1150)
!1157 = !DILocation(line: 967, column: 54, scope: !1150)
!1158 = !DILocation(line: 967, column: 12, scope: !1150)
!1159 = !DILocation(line: 968, column: 15, scope: !1150)
!1160 = !DILocation(line: 968, column: 23, scope: !1150)
!1161 = !DILocation(line: 968, column: 22, scope: !1150)
!1162 = !DILocation(line: 968, column: 35, scope: !1150)
!1163 = !DILocation(line: 968, column: 44, scope: !1150)
!1164 = !DILocation(line: 968, column: 43, scope: !1150)
!1165 = !DILocation(line: 968, column: 32, scope: !1150)
!1166 = !DILocation(line: 968, column: 12, scope: !1150)
!1167 = !DILocation(line: 969, column: 10, scope: !1150)
!1168 = !DILocation(line: 969, column: 3, scope: !1150)
!1169 = !DILocation(line: 971, column: 1, scope: !1134)
!1170 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !69, file: !69, line: 989, type: !1171, scopeLine: 990, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1171 = !DISubroutineType(types: !1172)
!1172 = !{!20, !20, !20, !20}
!1173 = !DILocalVariable(name: "fak1", arg: 1, scope: !1170, file: !69, line: 989, type: !20)
!1174 = !DILocation(line: 989, column: 33, scope: !1170)
!1175 = !DILocalVariable(name: "fak2", arg: 2, scope: !1170, file: !69, line: 989, type: !20)
!1176 = !DILocation(line: 989, column: 43, scope: !1170)
!1177 = !DILocalVariable(name: "div", arg: 3, scope: !1170, file: !69, line: 989, type: !20)
!1178 = !DILocation(line: 989, column: 53, scope: !1170)
!1179 = !DILocalVariable(name: "s32Temp1", scope: !1170, file: !69, line: 991, type: !12)
!1180 = !DILocation(line: 991, column: 6, scope: !1170)
!1181 = !DILocalVariable(name: "s32Temp2", scope: !1170, file: !69, line: 991, type: !12)
!1182 = !DILocation(line: 991, column: 20, scope: !1170)
!1183 = !DILocalVariable(name: "s32Temp3", scope: !1170, file: !69, line: 991, type: !12)
!1184 = !DILocation(line: 991, column: 34, scope: !1170)
!1185 = !DILocation(line: 992, column: 13, scope: !1170)
!1186 = !DILocation(line: 992, column: 20, scope: !1170)
!1187 = !DILocation(line: 992, column: 18, scope: !1170)
!1188 = !DILocation(line: 992, column: 11, scope: !1170)
!1189 = !DILocation(line: 993, column: 5, scope: !1190)
!1190 = distinct !DILexicalBlock(scope: !1170, file: !69, line: 993, column: 5)
!1191 = !DILocation(line: 993, column: 9, scope: !1190)
!1192 = !DILocation(line: 993, column: 5, scope: !1170)
!1193 = !DILocation(line: 995, column: 6, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1195, file: !69, line: 995, column: 6)
!1195 = distinct !DILexicalBlock(scope: !1190, file: !69, line: 994, column: 2)
!1196 = !DILocation(line: 995, column: 15, scope: !1194)
!1197 = !DILocation(line: 995, column: 6, scope: !1195)
!1198 = !DILocation(line: 997, column: 4, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1194, file: !69, line: 996, column: 3)
!1200 = !DILocation(line: 1001, column: 4, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1194, file: !69, line: 1000, column: 3)
!1202 = !DILocation(line: 1006, column: 15, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !1190, file: !69, line: 1005, column: 2)
!1204 = !DILocation(line: 1006, column: 28, scope: !1203)
!1205 = !DILocation(line: 1006, column: 39, scope: !1203)
!1206 = !DILocation(line: 1006, column: 37, scope: !1203)
!1207 = !DILocation(line: 1006, column: 46, scope: !1203)
!1208 = !DILocation(line: 1006, column: 44, scope: !1203)
!1209 = !DILocation(line: 1006, column: 24, scope: !1203)
!1210 = !DILocation(line: 1006, column: 52, scope: !1203)
!1211 = !DILocation(line: 1006, column: 12, scope: !1203)
!1212 = !DILocation(line: 1007, column: 15, scope: !1203)
!1213 = !DILocation(line: 1007, column: 24, scope: !1203)
!1214 = !DILocation(line: 1007, column: 23, scope: !1203)
!1215 = !DILocation(line: 1007, column: 32, scope: !1203)
!1216 = !DILocation(line: 1007, column: 41, scope: !1203)
!1217 = !DILocation(line: 1007, column: 40, scope: !1203)
!1218 = !DILocation(line: 1007, column: 29, scope: !1203)
!1219 = !DILocation(line: 1007, column: 12, scope: !1203)
!1220 = !DILocation(line: 1008, column: 6, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1203, file: !69, line: 1008, column: 6)
!1222 = !DILocation(line: 1008, column: 15, scope: !1221)
!1223 = !DILocation(line: 1008, column: 6, scope: !1203)
!1224 = !DILocation(line: 1010, column: 7, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1226, file: !69, line: 1010, column: 7)
!1226 = distinct !DILexicalBlock(scope: !1221, file: !69, line: 1009, column: 3)
!1227 = !DILocation(line: 1010, column: 16, scope: !1225)
!1228 = !DILocation(line: 1010, column: 7, scope: !1226)
!1229 = !DILocation(line: 1012, column: 17, scope: !1230)
!1230 = distinct !DILexicalBlock(scope: !1225, file: !69, line: 1011, column: 4)
!1231 = !DILocation(line: 1012, column: 12, scope: !1230)
!1232 = !DILocation(line: 1012, column: 5, scope: !1230)
!1233 = !DILocation(line: 1016, column: 5, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1225, file: !69, line: 1015, column: 4)
!1235 = !DILocation(line: 1021, column: 4, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1221, file: !69, line: 1020, column: 3)
!1237 = !DILocation(line: 1024, column: 1, scope: !1170)
!1238 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !69, file: !69, line: 1042, type: !1239, scopeLine: 1043, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1239 = !DISubroutineType(types: !1240)
!1240 = !{!20, !20, !20, !28}
!1241 = !DILocalVariable(name: "data1", arg: 1, scope: !1238, file: !69, line: 1042, type: !20)
!1242 = !DILocation(line: 1042, column: 33, scope: !1238)
!1243 = !DILocalVariable(name: "data2", arg: 2, scope: !1238, file: !69, line: 1042, type: !20)
!1244 = !DILocation(line: 1042, column: 43, scope: !1238)
!1245 = !DILocalVariable(name: "denominator", arg: 3, scope: !1238, file: !69, line: 1042, type: !28)
!1246 = !DILocation(line: 1042, column: 53, scope: !1238)
!1247 = !DILocalVariable(name: "s32Result", scope: !1238, file: !69, line: 1044, type: !12)
!1248 = !DILocation(line: 1044, column: 6, scope: !1238)
!1249 = !DILocalVariable(name: "s32Temp1", scope: !1238, file: !69, line: 1044, type: !12)
!1250 = !DILocation(line: 1044, column: 21, scope: !1238)
!1251 = !DILocation(line: 1045, column: 14, scope: !1238)
!1252 = !DILocation(line: 1045, column: 22, scope: !1238)
!1253 = !DILocation(line: 1045, column: 20, scope: !1238)
!1254 = !DILocation(line: 1045, column: 12, scope: !1238)
!1255 = !DILocation(line: 1047, column: 5, scope: !1256)
!1256 = distinct !DILexicalBlock(scope: !1238, file: !69, line: 1047, column: 5)
!1257 = !DILocation(line: 1047, column: 17, scope: !1256)
!1258 = !DILocation(line: 1047, column: 5, scope: !1238)
!1259 = !DILocation(line: 1049, column: 6, scope: !1260)
!1260 = distinct !DILexicalBlock(scope: !1261, file: !69, line: 1049, column: 6)
!1261 = distinct !DILexicalBlock(scope: !1256, file: !69, line: 1048, column: 2)
!1262 = !DILocation(line: 1049, column: 16, scope: !1260)
!1263 = !DILocation(line: 1049, column: 6, scope: !1261)
!1264 = !DILocation(line: 1051, column: 4, scope: !1265)
!1265 = distinct !DILexicalBlock(scope: !1260, file: !69, line: 1050, column: 3)
!1266 = !DILocation(line: 1053, column: 11, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1260, file: !69, line: 1053, column: 11)
!1268 = !DILocation(line: 1053, column: 21, scope: !1267)
!1269 = !DILocation(line: 1053, column: 11, scope: !1260)
!1270 = !DILocation(line: 1055, column: 4, scope: !1271)
!1271 = distinct !DILexicalBlock(scope: !1267, file: !69, line: 1054, column: 3)
!1272 = !DILocation(line: 1059, column: 4, scope: !1273)
!1273 = distinct !DILexicalBlock(scope: !1267, file: !69, line: 1058, column: 3)
!1274 = !DILocation(line: 1064, column: 15, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1256, file: !69, line: 1063, column: 2)
!1276 = !DILocation(line: 1064, column: 28, scope: !1275)
!1277 = !DILocation(line: 1064, column: 38, scope: !1275)
!1278 = !DILocation(line: 1064, column: 37, scope: !1275)
!1279 = !DILocation(line: 1064, column: 51, scope: !1275)
!1280 = !DILocation(line: 1064, column: 50, scope: !1275)
!1281 = !DILocation(line: 1064, column: 25, scope: !1275)
!1282 = !DILocation(line: 1064, column: 64, scope: !1275)
!1283 = !DILocation(line: 1064, column: 12, scope: !1275)
!1284 = !DILocation(line: 1065, column: 16, scope: !1275)
!1285 = !DILocation(line: 1065, column: 25, scope: !1275)
!1286 = !DILocation(line: 1065, column: 24, scope: !1275)
!1287 = !DILocation(line: 1065, column: 41, scope: !1275)
!1288 = !DILocation(line: 1065, column: 51, scope: !1275)
!1289 = !DILocation(line: 1065, column: 50, scope: !1275)
!1290 = !DILocation(line: 1065, column: 38, scope: !1275)
!1291 = !DILocation(line: 1065, column: 13, scope: !1275)
!1292 = !DILocation(line: 1066, column: 6, scope: !1293)
!1293 = distinct !DILexicalBlock(scope: !1275, file: !69, line: 1066, column: 6)
!1294 = !DILocation(line: 1066, column: 16, scope: !1293)
!1295 = !DILocation(line: 1066, column: 6, scope: !1275)
!1296 = !DILocation(line: 1068, column: 7, scope: !1297)
!1297 = distinct !DILexicalBlock(scope: !1298, file: !69, line: 1068, column: 7)
!1298 = distinct !DILexicalBlock(scope: !1293, file: !69, line: 1067, column: 3)
!1299 = !DILocation(line: 1068, column: 17, scope: !1297)
!1300 = !DILocation(line: 1068, column: 7, scope: !1298)
!1301 = !DILocation(line: 1070, column: 17, scope: !1302)
!1302 = distinct !DILexicalBlock(scope: !1297, file: !69, line: 1069, column: 4)
!1303 = !DILocation(line: 1070, column: 12, scope: !1302)
!1304 = !DILocation(line: 1070, column: 5, scope: !1302)
!1305 = !DILocation(line: 1074, column: 5, scope: !1306)
!1306 = distinct !DILexicalBlock(scope: !1297, file: !69, line: 1073, column: 4)
!1307 = !DILocation(line: 1079, column: 4, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1293, file: !69, line: 1078, column: 3)
!1309 = !DILocation(line: 1083, column: 1, scope: !1238)
!1310 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !69, file: !69, line: 1100, type: !1311, scopeLine: 1101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1311 = !DISubroutineType(types: !1312)
!1312 = !{!581, !581, !12}
!1313 = !DILocalVariable(name: "numerator", arg: 1, scope: !1310, file: !69, line: 1100, type: !581)
!1314 = !DILocation(line: 1100, column: 25, scope: !1310)
!1315 = !DILocalVariable(name: "denominator", arg: 2, scope: !1310, file: !69, line: 1100, type: !12)
!1316 = !DILocation(line: 1100, column: 40, scope: !1310)
!1317 = !DILocalVariable(name: "u32Temp1", scope: !1310, file: !69, line: 1102, type: !581)
!1318 = !DILocation(line: 1102, column: 6, scope: !1310)
!1319 = !DILocation(line: 1103, column: 5, scope: !1320)
!1320 = distinct !DILexicalBlock(scope: !1310, file: !69, line: 1103, column: 5)
!1321 = !DILocation(line: 1103, column: 17, scope: !1320)
!1322 = !DILocation(line: 1103, column: 5, scope: !1310)
!1323 = !DILocation(line: 1105, column: 3, scope: !1324)
!1324 = distinct !DILexicalBlock(scope: !1320, file: !69, line: 1104, column: 2)
!1325 = !DILocation(line: 1109, column: 6, scope: !1326)
!1326 = distinct !DILexicalBlock(scope: !1327, file: !69, line: 1109, column: 6)
!1327 = distinct !DILexicalBlock(scope: !1320, file: !69, line: 1108, column: 2)
!1328 = !DILocation(line: 1109, column: 18, scope: !1326)
!1329 = !DILocation(line: 1109, column: 6, scope: !1327)
!1330 = !DILocation(line: 1111, column: 4, scope: !1331)
!1331 = distinct !DILexicalBlock(scope: !1326, file: !69, line: 1110, column: 3)
!1332 = !DILocation(line: 1115, column: 16, scope: !1333)
!1333 = distinct !DILexicalBlock(scope: !1326, file: !69, line: 1114, column: 3)
!1334 = !DILocation(line: 1115, column: 30, scope: !1333)
!1335 = !DILocation(line: 1115, column: 40, scope: !1333)
!1336 = !DILocation(line: 1115, column: 39, scope: !1333)
!1337 = !DILocation(line: 1115, column: 55, scope: !1333)
!1338 = !DILocation(line: 1115, column: 53, scope: !1333)
!1339 = !DILocation(line: 1115, column: 26, scope: !1333)
!1340 = !DILocation(line: 1115, column: 68, scope: !1333)
!1341 = !DILocation(line: 1115, column: 13, scope: !1333)
!1342 = !DILocation(line: 1116, column: 16, scope: !1333)
!1343 = !DILocation(line: 1116, column: 25, scope: !1333)
!1344 = !DILocation(line: 1116, column: 24, scope: !1333)
!1345 = !DILocation(line: 1116, column: 41, scope: !1333)
!1346 = !DILocation(line: 1116, column: 51, scope: !1333)
!1347 = !DILocation(line: 1116, column: 50, scope: !1333)
!1348 = !DILocation(line: 1116, column: 38, scope: !1333)
!1349 = !DILocation(line: 1116, column: 13, scope: !1333)
!1350 = !DILocation(line: 1117, column: 11, scope: !1333)
!1351 = !DILocation(line: 1117, column: 4, scope: !1333)
!1352 = !DILocation(line: 1120, column: 1, scope: !1310)
!1353 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !69, file: !69, line: 1137, type: !1354, scopeLine: 1138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1354 = !DISubroutineType(types: !1355)
!1355 = !{!581, !12, !581}
!1356 = !DILocalVariable(name: "numerator", arg: 1, scope: !1353, file: !69, line: 1137, type: !12)
!1357 = !DILocation(line: 1137, column: 25, scope: !1353)
!1358 = !DILocalVariable(name: "denominator", arg: 2, scope: !1353, file: !69, line: 1137, type: !581)
!1359 = !DILocation(line: 1137, column: 40, scope: !1353)
!1360 = !DILocalVariable(name: "s32Temp1", scope: !1353, file: !69, line: 1139, type: !12)
!1361 = !DILocation(line: 1139, column: 6, scope: !1353)
!1362 = !DILocation(line: 1140, column: 5, scope: !1363)
!1363 = distinct !DILexicalBlock(scope: !1353, file: !69, line: 1140, column: 5)
!1364 = !DILocation(line: 1140, column: 17, scope: !1363)
!1365 = !DILocation(line: 1140, column: 5, scope: !1353)
!1366 = !DILocation(line: 1142, column: 6, scope: !1367)
!1367 = distinct !DILexicalBlock(scope: !1368, file: !69, line: 1142, column: 6)
!1368 = distinct !DILexicalBlock(scope: !1363, file: !69, line: 1141, column: 2)
!1369 = !DILocation(line: 1142, column: 16, scope: !1367)
!1370 = !DILocation(line: 1142, column: 6, scope: !1368)
!1371 = !DILocation(line: 1144, column: 4, scope: !1372)
!1372 = distinct !DILexicalBlock(scope: !1367, file: !69, line: 1143, column: 3)
!1373 = !DILocation(line: 1148, column: 4, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1367, file: !69, line: 1147, column: 3)
!1375 = !DILocation(line: 1153, column: 6, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1377, file: !69, line: 1153, column: 6)
!1377 = distinct !DILexicalBlock(scope: !1363, file: !69, line: 1152, column: 2)
!1378 = !DILocation(line: 1153, column: 16, scope: !1376)
!1379 = !DILocation(line: 1153, column: 6, scope: !1377)
!1380 = !DILocation(line: 1155, column: 17, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1376, file: !69, line: 1154, column: 3)
!1382 = !DILocation(line: 1155, column: 31, scope: !1381)
!1383 = !DILocation(line: 1155, column: 41, scope: !1381)
!1384 = !DILocation(line: 1155, column: 40, scope: !1381)
!1385 = !DILocation(line: 1155, column: 56, scope: !1381)
!1386 = !DILocation(line: 1155, column: 54, scope: !1381)
!1387 = !DILocation(line: 1155, column: 27, scope: !1381)
!1388 = !DILocation(line: 1155, column: 69, scope: !1381)
!1389 = !DILocation(line: 1155, column: 13, scope: !1381)
!1390 = !DILocation(line: 1156, column: 13, scope: !1381)
!1391 = !DILocation(line: 1156, column: 23, scope: !1381)
!1392 = !DILocation(line: 1156, column: 22, scope: !1381)
!1393 = !DILocation(line: 1156, column: 39, scope: !1381)
!1394 = !DILocation(line: 1156, column: 48, scope: !1381)
!1395 = !DILocation(line: 1156, column: 47, scope: !1381)
!1396 = !DILocation(line: 1156, column: 36, scope: !1381)
!1397 = !DILocation(line: 1156, column: 4, scope: !1381)
!1398 = !DILocation(line: 1160, column: 4, scope: !1399)
!1399 = distinct !DILexicalBlock(scope: !1376, file: !69, line: 1159, column: 3)
!1400 = !DILocation(line: 1163, column: 1, scope: !1353)
!1401 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !69, file: !69, line: 1180, type: !1402, scopeLine: 1181, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1402 = !DISubroutineType(types: !1403)
!1403 = !{!581, !12, !12}
!1404 = !DILocalVariable(name: "numerator", arg: 1, scope: !1401, file: !69, line: 1180, type: !12)
!1405 = !DILocation(line: 1180, column: 25, scope: !1401)
!1406 = !DILocalVariable(name: "denominator", arg: 2, scope: !1401, file: !69, line: 1180, type: !12)
!1407 = !DILocation(line: 1180, column: 40, scope: !1401)
!1408 = !DILocalVariable(name: "u32Temp1", scope: !1401, file: !69, line: 1182, type: !581)
!1409 = !DILocation(line: 1182, column: 6, scope: !1401)
!1410 = !DILocalVariable(name: "u32Temp2", scope: !1401, file: !69, line: 1182, type: !581)
!1411 = !DILocation(line: 1182, column: 20, scope: !1401)
!1412 = !DILocation(line: 1183, column: 5, scope: !1413)
!1413 = distinct !DILexicalBlock(scope: !1401, file: !69, line: 1183, column: 5)
!1414 = !DILocation(line: 1183, column: 17, scope: !1413)
!1415 = !DILocation(line: 1183, column: 5, scope: !1401)
!1416 = !DILocation(line: 1185, column: 6, scope: !1417)
!1417 = distinct !DILexicalBlock(scope: !1418, file: !69, line: 1185, column: 6)
!1418 = distinct !DILexicalBlock(scope: !1413, file: !69, line: 1184, column: 2)
!1419 = !DILocation(line: 1185, column: 16, scope: !1417)
!1420 = !DILocation(line: 1185, column: 6, scope: !1418)
!1421 = !DILocation(line: 1187, column: 4, scope: !1422)
!1422 = distinct !DILexicalBlock(scope: !1417, file: !69, line: 1186, column: 3)
!1423 = !DILocation(line: 1191, column: 4, scope: !1424)
!1424 = distinct !DILexicalBlock(scope: !1417, file: !69, line: 1190, column: 3)
!1425 = !DILocation(line: 1196, column: 6, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1427, file: !69, line: 1196, column: 6)
!1427 = distinct !DILexicalBlock(scope: !1413, file: !69, line: 1195, column: 2)
!1428 = !DILocation(line: 1196, column: 16, scope: !1426)
!1429 = !DILocation(line: 1196, column: 6, scope: !1427)
!1430 = !DILocation(line: 1198, column: 7, scope: !1431)
!1431 = distinct !DILexicalBlock(scope: !1432, file: !69, line: 1198, column: 7)
!1432 = distinct !DILexicalBlock(scope: !1426, file: !69, line: 1197, column: 3)
!1433 = !DILocation(line: 1198, column: 17, scope: !1431)
!1434 = !DILocation(line: 1198, column: 7, scope: !1432)
!1435 = !DILocation(line: 1200, column: 5, scope: !1436)
!1436 = distinct !DILexicalBlock(scope: !1431, file: !69, line: 1199, column: 4)
!1437 = !DILocation(line: 1204, column: 8, scope: !1438)
!1438 = distinct !DILexicalBlock(scope: !1439, file: !69, line: 1204, column: 8)
!1439 = distinct !DILexicalBlock(scope: !1431, file: !69, line: 1203, column: 4)
!1440 = !DILocation(line: 1204, column: 20, scope: !1438)
!1441 = !DILocation(line: 1204, column: 8, scope: !1439)
!1442 = !DILocation(line: 1206, column: 6, scope: !1443)
!1443 = distinct !DILexicalBlock(scope: !1438, file: !69, line: 1205, column: 5)
!1444 = !DILocation(line: 1210, column: 18, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1438, file: !69, line: 1209, column: 5)
!1446 = !DILocation(line: 1210, column: 32, scope: !1445)
!1447 = !DILocation(line: 1210, column: 42, scope: !1445)
!1448 = !DILocation(line: 1210, column: 41, scope: !1445)
!1449 = !DILocation(line: 1210, column: 57, scope: !1445)
!1450 = !DILocation(line: 1210, column: 55, scope: !1445)
!1451 = !DILocation(line: 1210, column: 28, scope: !1445)
!1452 = !DILocation(line: 1210, column: 71, scope: !1445)
!1453 = !DILocation(line: 1210, column: 15, scope: !1445)
!1454 = !DILocation(line: 1211, column: 18, scope: !1445)
!1455 = !DILocation(line: 1211, column: 29, scope: !1445)
!1456 = !DILocation(line: 1211, column: 27, scope: !1445)
!1457 = !DILocation(line: 1211, column: 45, scope: !1445)
!1458 = !DILocation(line: 1211, column: 57, scope: !1445)
!1459 = !DILocation(line: 1211, column: 55, scope: !1445)
!1460 = !DILocation(line: 1211, column: 42, scope: !1445)
!1461 = !DILocation(line: 1211, column: 15, scope: !1445)
!1462 = !DILocation(line: 1212, column: 13, scope: !1445)
!1463 = !DILocation(line: 1212, column: 6, scope: !1445)
!1464 = !DILocation(line: 1218, column: 7, scope: !1465)
!1465 = distinct !DILexicalBlock(scope: !1466, file: !69, line: 1218, column: 7)
!1466 = distinct !DILexicalBlock(scope: !1426, file: !69, line: 1217, column: 3)
!1467 = !DILocation(line: 1218, column: 19, scope: !1465)
!1468 = !DILocation(line: 1218, column: 7, scope: !1466)
!1469 = !DILocation(line: 1220, column: 5, scope: !1470)
!1470 = distinct !DILexicalBlock(scope: !1465, file: !69, line: 1219, column: 4)
!1471 = !DILocation(line: 1224, column: 18, scope: !1472)
!1472 = distinct !DILexicalBlock(scope: !1465, file: !69, line: 1223, column: 4)
!1473 = !DILocation(line: 1224, column: 17, scope: !1472)
!1474 = !DILocation(line: 1224, column: 15, scope: !1472)
!1475 = !DILocation(line: 1225, column: 20, scope: !1472)
!1476 = !DILocation(line: 1225, column: 19, scope: !1472)
!1477 = !DILocation(line: 1225, column: 17, scope: !1472)
!1478 = !DILocation(line: 1226, column: 17, scope: !1472)
!1479 = !DILocation(line: 1226, column: 31, scope: !1472)
!1480 = !DILocation(line: 1226, column: 41, scope: !1472)
!1481 = !DILocation(line: 1226, column: 40, scope: !1472)
!1482 = !DILocation(line: 1226, column: 56, scope: !1472)
!1483 = !DILocation(line: 1226, column: 54, scope: !1472)
!1484 = !DILocation(line: 1226, column: 27, scope: !1472)
!1485 = !DILocation(line: 1226, column: 70, scope: !1472)
!1486 = !DILocation(line: 1226, column: 14, scope: !1472)
!1487 = !DILocation(line: 1227, column: 17, scope: !1472)
!1488 = !DILocation(line: 1227, column: 28, scope: !1472)
!1489 = !DILocation(line: 1227, column: 26, scope: !1472)
!1490 = !DILocation(line: 1227, column: 44, scope: !1472)
!1491 = !DILocation(line: 1227, column: 56, scope: !1472)
!1492 = !DILocation(line: 1227, column: 54, scope: !1472)
!1493 = !DILocation(line: 1227, column: 41, scope: !1472)
!1494 = !DILocation(line: 1227, column: 14, scope: !1472)
!1495 = !DILocation(line: 1228, column: 12, scope: !1472)
!1496 = !DILocation(line: 1228, column: 5, scope: !1472)
!1497 = !DILocation(line: 1233, column: 1, scope: !1401)
!1498 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !69, file: !69, line: 1250, type: !1499, scopeLine: 1251, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1499 = !DISubroutineType(types: !1500)
!1500 = !{!581, !581, !581}
!1501 = !DILocalVariable(name: "numerator", arg: 1, scope: !1498, file: !69, line: 1250, type: !581)
!1502 = !DILocation(line: 1250, column: 25, scope: !1498)
!1503 = !DILocalVariable(name: "denominator", arg: 2, scope: !1498, file: !69, line: 1250, type: !581)
!1504 = !DILocation(line: 1250, column: 40, scope: !1498)
!1505 = !DILocalVariable(name: "u32Temp1", scope: !1498, file: !69, line: 1253, type: !581)
!1506 = !DILocation(line: 1253, column: 6, scope: !1498)
!1507 = !DILocalVariable(name: "u32Temp2", scope: !1498, file: !69, line: 1253, type: !581)
!1508 = !DILocation(line: 1253, column: 20, scope: !1498)
!1509 = !DILocalVariable(name: "u32Temp3", scope: !1498, file: !69, line: 1253, type: !581)
!1510 = !DILocation(line: 1253, column: 34, scope: !1498)
!1511 = !DILocalVariable(name: "numerator_old", scope: !1498, file: !69, line: 1253, type: !581)
!1512 = !DILocation(line: 1253, column: 48, scope: !1498)
!1513 = !DILocation(line: 1254, column: 5, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1498, file: !69, line: 1254, column: 5)
!1515 = !DILocation(line: 1254, column: 16, scope: !1514)
!1516 = !DILocation(line: 1254, column: 5, scope: !1498)
!1517 = !DILocation(line: 1256, column: 3, scope: !1518)
!1518 = distinct !DILexicalBlock(scope: !1514, file: !69, line: 1255, column: 2)
!1519 = !DILocation(line: 1260, column: 14, scope: !1520)
!1520 = distinct !DILexicalBlock(scope: !1514, file: !69, line: 1259, column: 2)
!1521 = !DILocation(line: 1260, column: 26, scope: !1520)
!1522 = !DILocation(line: 1260, column: 41, scope: !1520)
!1523 = !DILocation(line: 1260, column: 51, scope: !1520)
!1524 = !DILocation(line: 1260, column: 50, scope: !1520)
!1525 = !DILocation(line: 1260, column: 38, scope: !1520)
!1526 = !DILocation(line: 1260, column: 24, scope: !1520)
!1527 = !DILocation(line: 1260, column: 12, scope: !1520)
!1528 = !DILocation(line: 1261, column: 7, scope: !1529)
!1529 = distinct !DILexicalBlock(scope: !1520, file: !69, line: 1261, column: 6)
!1530 = !DILocation(line: 1261, column: 16, scope: !1529)
!1531 = !DILocation(line: 1261, column: 24, scope: !1529)
!1532 = !DILocation(line: 1261, column: 6, scope: !1520)
!1533 = !DILocation(line: 1263, column: 16, scope: !1534)
!1534 = distinct !DILexicalBlock(scope: !1529, file: !69, line: 1262, column: 3)
!1535 = !DILocation(line: 1263, column: 27, scope: !1534)
!1536 = !DILocation(line: 1263, column: 13, scope: !1534)
!1537 = !DILocation(line: 1264, column: 3, scope: !1534)
!1538 = !DILocation(line: 1267, column: 16, scope: !1539)
!1539 = distinct !DILexicalBlock(scope: !1529, file: !69, line: 1266, column: 3)
!1540 = !DILocation(line: 1267, column: 27, scope: !1539)
!1541 = !DILocation(line: 1267, column: 32, scope: !1539)
!1542 = !DILocation(line: 1267, column: 13, scope: !1539)
!1543 = !DILocation(line: 1270, column: 6, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1520, file: !69, line: 1270, column: 6)
!1545 = !DILocation(line: 1270, column: 17, scope: !1544)
!1546 = !DILocation(line: 1270, column: 15, scope: !1544)
!1547 = !DILocation(line: 1270, column: 6, scope: !1520)
!1548 = !DILocation(line: 1272, column: 12, scope: !1549)
!1549 = distinct !DILexicalBlock(scope: !1544, file: !69, line: 1271, column: 3)
!1550 = !DILocation(line: 1272, column: 22, scope: !1549)
!1551 = !DILocation(line: 1272, column: 21, scope: !1549)
!1552 = !DILocation(line: 1272, column: 4, scope: !1549)
!1553 = !DILocation(line: 1276, column: 13, scope: !1554)
!1554 = distinct !DILexicalBlock(scope: !1544, file: !69, line: 1275, column: 3)
!1555 = !DILocation(line: 1276, column: 23, scope: !1554)
!1556 = !DILocation(line: 1276, column: 22, scope: !1554)
!1557 = !DILocation(line: 1276, column: 36, scope: !1554)
!1558 = !DILocation(line: 1276, column: 4, scope: !1554)
!1559 = !DILocation(line: 1281, column: 1, scope: !1498)
!1560 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !69, file: !69, line: 1298, type: !1561, scopeLine: 1299, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1561 = !DISubroutineType(types: !1562)
!1562 = !{!12, !581, !12}
!1563 = !DILocalVariable(name: "numerator", arg: 1, scope: !1560, file: !69, line: 1298, type: !581)
!1564 = !DILocation(line: 1298, column: 25, scope: !1560)
!1565 = !DILocalVariable(name: "denominator", arg: 2, scope: !1560, file: !69, line: 1298, type: !12)
!1566 = !DILocation(line: 1298, column: 40, scope: !1560)
!1567 = !DILocalVariable(name: "u32Temp1", scope: !1560, file: !69, line: 1300, type: !581)
!1568 = !DILocation(line: 1300, column: 6, scope: !1560)
!1569 = !DILocalVariable(name: "u32Temp2", scope: !1560, file: !69, line: 1300, type: !581)
!1570 = !DILocation(line: 1300, column: 20, scope: !1560)
!1571 = !DILocation(line: 1301, column: 5, scope: !1572)
!1572 = distinct !DILexicalBlock(scope: !1560, file: !69, line: 1301, column: 5)
!1573 = !DILocation(line: 1301, column: 17, scope: !1572)
!1574 = !DILocation(line: 1301, column: 5, scope: !1560)
!1575 = !DILocation(line: 1303, column: 6, scope: !1576)
!1576 = distinct !DILexicalBlock(scope: !1577, file: !69, line: 1303, column: 6)
!1577 = distinct !DILexicalBlock(scope: !1572, file: !69, line: 1302, column: 2)
!1578 = !DILocation(line: 1303, column: 18, scope: !1576)
!1579 = !DILocation(line: 1303, column: 6, scope: !1577)
!1580 = !DILocation(line: 1305, column: 4, scope: !1581)
!1581 = distinct !DILexicalBlock(scope: !1576, file: !69, line: 1304, column: 3)
!1582 = !DILocation(line: 1309, column: 19, scope: !1583)
!1583 = distinct !DILexicalBlock(scope: !1576, file: !69, line: 1308, column: 3)
!1584 = !DILocation(line: 1309, column: 18, scope: !1583)
!1585 = !DILocation(line: 1309, column: 16, scope: !1583)
!1586 = !DILocation(line: 1310, column: 16, scope: !1583)
!1587 = !DILocation(line: 1310, column: 30, scope: !1583)
!1588 = !DILocation(line: 1310, column: 40, scope: !1583)
!1589 = !DILocation(line: 1310, column: 39, scope: !1583)
!1590 = !DILocation(line: 1310, column: 55, scope: !1583)
!1591 = !DILocation(line: 1310, column: 53, scope: !1583)
!1592 = !DILocation(line: 1310, column: 26, scope: !1583)
!1593 = !DILocation(line: 1310, column: 69, scope: !1583)
!1594 = !DILocation(line: 1310, column: 13, scope: !1583)
!1595 = !DILocation(line: 1311, column: 16, scope: !1583)
!1596 = !DILocation(line: 1311, column: 25, scope: !1583)
!1597 = !DILocation(line: 1311, column: 24, scope: !1583)
!1598 = !DILocation(line: 1311, column: 41, scope: !1583)
!1599 = !DILocation(line: 1311, column: 51, scope: !1583)
!1600 = !DILocation(line: 1311, column: 50, scope: !1583)
!1601 = !DILocation(line: 1311, column: 38, scope: !1583)
!1602 = !DILocation(line: 1311, column: 13, scope: !1583)
!1603 = !DILocation(line: 1312, column: 7, scope: !1604)
!1604 = distinct !DILexicalBlock(scope: !1583, file: !69, line: 1312, column: 7)
!1605 = !DILocation(line: 1312, column: 16, scope: !1604)
!1606 = !DILocation(line: 1312, column: 7, scope: !1583)
!1607 = !DILocation(line: 1314, column: 13, scope: !1608)
!1608 = distinct !DILexicalBlock(scope: !1604, file: !69, line: 1313, column: 4)
!1609 = !DILocation(line: 1314, column: 12, scope: !1608)
!1610 = !DILocation(line: 1314, column: 5, scope: !1608)
!1611 = !DILocation(line: 1318, column: 5, scope: !1612)
!1612 = distinct !DILexicalBlock(scope: !1604, file: !69, line: 1317, column: 4)
!1613 = !DILocation(line: 1324, column: 15, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1572, file: !69, line: 1323, column: 2)
!1615 = !DILocation(line: 1324, column: 29, scope: !1614)
!1616 = !DILocation(line: 1324, column: 39, scope: !1614)
!1617 = !DILocation(line: 1324, column: 38, scope: !1614)
!1618 = !DILocation(line: 1324, column: 54, scope: !1614)
!1619 = !DILocation(line: 1324, column: 52, scope: !1614)
!1620 = !DILocation(line: 1324, column: 25, scope: !1614)
!1621 = !DILocation(line: 1324, column: 68, scope: !1614)
!1622 = !DILocation(line: 1324, column: 12, scope: !1614)
!1623 = !DILocation(line: 1325, column: 15, scope: !1614)
!1624 = !DILocation(line: 1325, column: 24, scope: !1614)
!1625 = !DILocation(line: 1325, column: 23, scope: !1614)
!1626 = !DILocation(line: 1325, column: 40, scope: !1614)
!1627 = !DILocation(line: 1325, column: 50, scope: !1614)
!1628 = !DILocation(line: 1325, column: 49, scope: !1614)
!1629 = !DILocation(line: 1325, column: 37, scope: !1614)
!1630 = !DILocation(line: 1325, column: 12, scope: !1614)
!1631 = !DILocation(line: 1326, column: 6, scope: !1632)
!1632 = distinct !DILexicalBlock(scope: !1614, file: !69, line: 1326, column: 6)
!1633 = !DILocation(line: 1326, column: 15, scope: !1632)
!1634 = !DILocation(line: 1326, column: 6, scope: !1614)
!1635 = !DILocation(line: 1328, column: 11, scope: !1636)
!1636 = distinct !DILexicalBlock(scope: !1632, file: !69, line: 1327, column: 3)
!1637 = !DILocation(line: 1328, column: 4, scope: !1636)
!1638 = !DILocation(line: 1332, column: 4, scope: !1639)
!1639 = distinct !DILexicalBlock(scope: !1632, file: !69, line: 1331, column: 3)
!1640 = !DILocation(line: 1335, column: 1, scope: !1560)
!1641 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !69, file: !69, line: 1353, type: !1642, scopeLine: 1354, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1642 = !DISubroutineType(types: !1643)
!1643 = !{!12, !12, !581}
!1644 = !DILocalVariable(name: "numerator", arg: 1, scope: !1641, file: !69, line: 1353, type: !12)
!1645 = !DILocation(line: 1353, column: 25, scope: !1641)
!1646 = !DILocalVariable(name: "denominator", arg: 2, scope: !1641, file: !69, line: 1353, type: !581)
!1647 = !DILocation(line: 1353, column: 40, scope: !1641)
!1648 = !DILocalVariable(name: "s32Temp1", scope: !1641, file: !69, line: 1355, type: !12)
!1649 = !DILocation(line: 1355, column: 6, scope: !1641)
!1650 = !DILocalVariable(name: "s32Temp2", scope: !1641, file: !69, line: 1355, type: !12)
!1651 = !DILocation(line: 1355, column: 20, scope: !1641)
!1652 = !DILocalVariable(name: "u32Temp0", scope: !1641, file: !69, line: 1356, type: !581)
!1653 = !DILocation(line: 1356, column: 6, scope: !1641)
!1654 = !DILocalVariable(name: "u32Temp1", scope: !1641, file: !69, line: 1356, type: !581)
!1655 = !DILocation(line: 1356, column: 20, scope: !1641)
!1656 = !DILocalVariable(name: "u32Temp2", scope: !1641, file: !69, line: 1356, type: !581)
!1657 = !DILocation(line: 1356, column: 34, scope: !1641)
!1658 = !DILocation(line: 1357, column: 5, scope: !1659)
!1659 = distinct !DILexicalBlock(scope: !1641, file: !69, line: 1357, column: 5)
!1660 = !DILocation(line: 1357, column: 17, scope: !1659)
!1661 = !DILocation(line: 1357, column: 5, scope: !1641)
!1662 = !DILocation(line: 1359, column: 6, scope: !1663)
!1663 = distinct !DILexicalBlock(scope: !1664, file: !69, line: 1359, column: 6)
!1664 = distinct !DILexicalBlock(scope: !1659, file: !69, line: 1358, column: 2)
!1665 = !DILocation(line: 1359, column: 16, scope: !1663)
!1666 = !DILocation(line: 1359, column: 6, scope: !1664)
!1667 = !DILocation(line: 1361, column: 4, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1663, file: !69, line: 1360, column: 3)
!1669 = !DILocation(line: 1365, column: 4, scope: !1670)
!1670 = distinct !DILexicalBlock(scope: !1663, file: !69, line: 1364, column: 3)
!1671 = !DILocation(line: 1370, column: 6, scope: !1672)
!1672 = distinct !DILexicalBlock(scope: !1673, file: !69, line: 1370, column: 6)
!1673 = distinct !DILexicalBlock(scope: !1659, file: !69, line: 1369, column: 2)
!1674 = !DILocation(line: 1370, column: 16, scope: !1672)
!1675 = !DILocation(line: 1370, column: 6, scope: !1673)
!1676 = !DILocation(line: 1372, column: 16, scope: !1677)
!1677 = distinct !DILexicalBlock(scope: !1672, file: !69, line: 1371, column: 3)
!1678 = !DILocation(line: 1372, column: 15, scope: !1677)
!1679 = !DILocation(line: 1372, column: 13, scope: !1677)
!1680 = !DILocation(line: 1373, column: 16, scope: !1677)
!1681 = !DILocation(line: 1373, column: 25, scope: !1677)
!1682 = !DILocation(line: 1373, column: 24, scope: !1677)
!1683 = !DILocation(line: 1373, column: 13, scope: !1677)
!1684 = !DILocation(line: 1374, column: 15, scope: !1677)
!1685 = !DILocation(line: 1374, column: 28, scope: !1677)
!1686 = !DILocation(line: 1374, column: 37, scope: !1677)
!1687 = !DILocation(line: 1374, column: 36, scope: !1677)
!1688 = !DILocation(line: 1374, column: 52, scope: !1677)
!1689 = !DILocation(line: 1374, column: 50, scope: !1677)
!1690 = !DILocation(line: 1374, column: 24, scope: !1677)
!1691 = !DILocation(line: 1374, column: 13, scope: !1677)
!1692 = !DILocation(line: 1376, column: 8, scope: !1693)
!1693 = distinct !DILexicalBlock(scope: !1677, file: !69, line: 1376, column: 7)
!1694 = !DILocation(line: 1376, column: 20, scope: !1693)
!1695 = !DILocation(line: 1376, column: 27, scope: !1693)
!1696 = !DILocation(line: 1376, column: 7, scope: !1677)
!1697 = !DILocation(line: 1378, column: 20, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1693, file: !69, line: 1377, column: 4)
!1699 = !DILocation(line: 1378, column: 32, scope: !1698)
!1700 = !DILocation(line: 1378, column: 17, scope: !1698)
!1701 = !DILocation(line: 1379, column: 4, scope: !1698)
!1702 = !DILocation(line: 1382, column: 20, scope: !1703)
!1703 = distinct !DILexicalBlock(scope: !1693, file: !69, line: 1381, column: 4)
!1704 = !DILocation(line: 1382, column: 32, scope: !1703)
!1705 = !DILocation(line: 1382, column: 38, scope: !1703)
!1706 = !DILocation(line: 1382, column: 17, scope: !1703)
!1707 = !DILocation(line: 1386, column: 7, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1677, file: !69, line: 1386, column: 7)
!1709 = !DILocation(line: 1386, column: 18, scope: !1708)
!1710 = !DILocation(line: 1386, column: 16, scope: !1708)
!1711 = !DILocation(line: 1386, column: 7, scope: !1677)
!1712 = !DILocation(line: 1388, column: 14, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1708, file: !69, line: 1387, column: 4)
!1714 = !DILocation(line: 1388, column: 13, scope: !1713)
!1715 = !DILocation(line: 1388, column: 23, scope: !1713)
!1716 = !DILocation(line: 1388, column: 5, scope: !1713)
!1717 = !DILocation(line: 1392, column: 14, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1708, file: !69, line: 1391, column: 4)
!1719 = !DILocation(line: 1392, column: 23, scope: !1718)
!1720 = !DILocation(line: 1392, column: 12, scope: !1718)
!1721 = !DILocation(line: 1392, column: 27, scope: !1718)
!1722 = !DILocation(line: 1392, column: 5, scope: !1718)
!1723 = !DILocation(line: 1399, column: 16, scope: !1724)
!1724 = distinct !DILexicalBlock(scope: !1672, file: !69, line: 1398, column: 3)
!1725 = !DILocation(line: 1399, column: 30, scope: !1724)
!1726 = !DILocation(line: 1399, column: 40, scope: !1724)
!1727 = !DILocation(line: 1399, column: 39, scope: !1724)
!1728 = !DILocation(line: 1399, column: 55, scope: !1724)
!1729 = !DILocation(line: 1399, column: 53, scope: !1724)
!1730 = !DILocation(line: 1399, column: 26, scope: !1724)
!1731 = !DILocation(line: 1399, column: 69, scope: !1724)
!1732 = !DILocation(line: 1399, column: 13, scope: !1724)
!1733 = !DILocation(line: 1400, column: 16, scope: !1724)
!1734 = !DILocation(line: 1400, column: 26, scope: !1724)
!1735 = !DILocation(line: 1400, column: 25, scope: !1724)
!1736 = !DILocation(line: 1400, column: 42, scope: !1724)
!1737 = !DILocation(line: 1400, column: 51, scope: !1724)
!1738 = !DILocation(line: 1400, column: 50, scope: !1724)
!1739 = !DILocation(line: 1400, column: 39, scope: !1724)
!1740 = !DILocation(line: 1400, column: 13, scope: !1724)
!1741 = !DILocation(line: 1401, column: 11, scope: !1724)
!1742 = !DILocation(line: 1401, column: 4, scope: !1724)
!1743 = !DILocation(line: 1404, column: 1, scope: !1641)
!1744 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !69, file: !69, line: 1421, type: !1745, scopeLine: 1422, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1745 = !DISubroutineType(types: !1746)
!1746 = !{!12, !12, !12}
!1747 = !DILocalVariable(name: "numerator", arg: 1, scope: !1744, file: !69, line: 1421, type: !12)
!1748 = !DILocation(line: 1421, column: 25, scope: !1744)
!1749 = !DILocalVariable(name: "denominator", arg: 2, scope: !1744, file: !69, line: 1421, type: !12)
!1750 = !DILocation(line: 1421, column: 40, scope: !1744)
!1751 = !DILocalVariable(name: "s32Temp1", scope: !1744, file: !69, line: 1423, type: !12)
!1752 = !DILocation(line: 1423, column: 6, scope: !1744)
!1753 = !DILocalVariable(name: "s32Temp2", scope: !1744, file: !69, line: 1423, type: !12)
!1754 = !DILocation(line: 1423, column: 20, scope: !1744)
!1755 = !DILocalVariable(name: "denominator_prime", scope: !1744, file: !69, line: 1424, type: !581)
!1756 = !DILocation(line: 1424, column: 6, scope: !1744)
!1757 = !DILocalVariable(name: "u32Temp1", scope: !1744, file: !69, line: 1424, type: !581)
!1758 = !DILocation(line: 1424, column: 29, scope: !1744)
!1759 = !DILocalVariable(name: "u32Temp2", scope: !1744, file: !69, line: 1424, type: !581)
!1760 = !DILocation(line: 1424, column: 43, scope: !1744)
!1761 = !DILocalVariable(name: "u32numerator", scope: !1744, file: !69, line: 1425, type: !581)
!1762 = !DILocation(line: 1425, column: 6, scope: !1744)
!1763 = !DILocalVariable(name: "u32denominator", scope: !1744, file: !69, line: 1425, type: !581)
!1764 = !DILocation(line: 1425, column: 23, scope: !1744)
!1765 = !DILocation(line: 1426, column: 5, scope: !1766)
!1766 = distinct !DILexicalBlock(scope: !1744, file: !69, line: 1426, column: 5)
!1767 = !DILocation(line: 1426, column: 15, scope: !1766)
!1768 = !DILocation(line: 1426, column: 5, scope: !1744)
!1769 = !DILocation(line: 1428, column: 6, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1771, file: !69, line: 1428, column: 6)
!1771 = distinct !DILexicalBlock(scope: !1766, file: !69, line: 1427, column: 2)
!1772 = !DILocation(line: 1428, column: 18, scope: !1770)
!1773 = !DILocation(line: 1428, column: 6, scope: !1771)
!1774 = !DILocation(line: 1430, column: 7, scope: !1775)
!1775 = distinct !DILexicalBlock(scope: !1776, file: !69, line: 1430, column: 7)
!1776 = distinct !DILexicalBlock(scope: !1770, file: !69, line: 1429, column: 3)
!1777 = !DILocation(line: 1430, column: 19, scope: !1775)
!1778 = !DILocation(line: 1430, column: 7, scope: !1776)
!1779 = !DILocation(line: 1432, column: 5, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1775, file: !69, line: 1431, column: 4)
!1781 = !DILocation(line: 1436, column: 21, scope: !1782)
!1782 = distinct !DILexicalBlock(scope: !1775, file: !69, line: 1435, column: 4)
!1783 = !DILocation(line: 1436, column: 20, scope: !1782)
!1784 = !DILocation(line: 1436, column: 18, scope: !1782)
!1785 = !DILocation(line: 1437, column: 23, scope: !1782)
!1786 = !DILocation(line: 1437, column: 22, scope: !1782)
!1787 = !DILocation(line: 1437, column: 20, scope: !1782)
!1788 = !DILocation(line: 1438, column: 16, scope: !1782)
!1789 = !DILocation(line: 1438, column: 33, scope: !1782)
!1790 = !DILocation(line: 1438, column: 46, scope: !1782)
!1791 = !DILocation(line: 1438, column: 45, scope: !1782)
!1792 = !DILocation(line: 1438, column: 64, scope: !1782)
!1793 = !DILocation(line: 1438, column: 62, scope: !1782)
!1794 = !DILocation(line: 1438, column: 29, scope: !1782)
!1795 = !DILocation(line: 1438, column: 81, scope: !1782)
!1796 = !DILocation(line: 1438, column: 14, scope: !1782)
!1797 = !DILocation(line: 1439, column: 17, scope: !1782)
!1798 = !DILocation(line: 1439, column: 30, scope: !1782)
!1799 = !DILocation(line: 1439, column: 29, scope: !1782)
!1800 = !DILocation(line: 1439, column: 49, scope: !1782)
!1801 = !DILocation(line: 1439, column: 58, scope: !1782)
!1802 = !DILocation(line: 1439, column: 57, scope: !1782)
!1803 = !DILocation(line: 1439, column: 46, scope: !1782)
!1804 = !DILocation(line: 1439, column: 14, scope: !1782)
!1805 = !DILocation(line: 1440, column: 8, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1782, file: !69, line: 1440, column: 8)
!1807 = !DILocation(line: 1440, column: 17, scope: !1806)
!1808 = !DILocation(line: 1440, column: 8, scope: !1782)
!1809 = !DILocation(line: 1442, column: 13, scope: !1810)
!1810 = distinct !DILexicalBlock(scope: !1806, file: !69, line: 1441, column: 5)
!1811 = !DILocation(line: 1442, column: 6, scope: !1810)
!1812 = !DILocation(line: 1446, column: 6, scope: !1813)
!1813 = distinct !DILexicalBlock(scope: !1806, file: !69, line: 1445, column: 5)
!1814 = !DILocation(line: 1452, column: 20, scope: !1815)
!1815 = distinct !DILexicalBlock(scope: !1770, file: !69, line: 1451, column: 3)
!1816 = !DILocation(line: 1452, column: 19, scope: !1815)
!1817 = !DILocation(line: 1452, column: 29, scope: !1815)
!1818 = !DILocation(line: 1452, column: 17, scope: !1815)
!1819 = !DILocation(line: 1453, column: 16, scope: !1815)
!1820 = !DILocation(line: 1453, column: 33, scope: !1815)
!1821 = !DILocation(line: 1453, column: 46, scope: !1815)
!1822 = !DILocation(line: 1453, column: 45, scope: !1815)
!1823 = !DILocation(line: 1453, column: 61, scope: !1815)
!1824 = !DILocation(line: 1453, column: 59, scope: !1815)
!1825 = !DILocation(line: 1453, column: 29, scope: !1815)
!1826 = !DILocation(line: 1453, column: 75, scope: !1815)
!1827 = !DILocation(line: 1453, column: 13, scope: !1815)
!1828 = !DILocation(line: 1454, column: 16, scope: !1815)
!1829 = !DILocation(line: 1454, column: 29, scope: !1815)
!1830 = !DILocation(line: 1454, column: 28, scope: !1815)
!1831 = !DILocation(line: 1454, column: 45, scope: !1815)
!1832 = !DILocation(line: 1454, column: 54, scope: !1815)
!1833 = !DILocation(line: 1454, column: 53, scope: !1815)
!1834 = !DILocation(line: 1454, column: 42, scope: !1815)
!1835 = !DILocation(line: 1454, column: 13, scope: !1815)
!1836 = !DILocation(line: 1455, column: 13, scope: !1815)
!1837 = !DILocation(line: 1455, column: 12, scope: !1815)
!1838 = !DILocation(line: 1455, column: 22, scope: !1815)
!1839 = !DILocation(line: 1455, column: 4, scope: !1815)
!1840 = !DILocation(line: 1460, column: 6, scope: !1841)
!1841 = distinct !DILexicalBlock(scope: !1842, file: !69, line: 1460, column: 6)
!1842 = distinct !DILexicalBlock(scope: !1766, file: !69, line: 1459, column: 2)
!1843 = !DILocation(line: 1460, column: 18, scope: !1841)
!1844 = !DILocation(line: 1460, column: 6, scope: !1842)
!1845 = !DILocation(line: 1462, column: 7, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1847, file: !69, line: 1462, column: 7)
!1847 = distinct !DILexicalBlock(scope: !1841, file: !69, line: 1461, column: 3)
!1848 = !DILocation(line: 1462, column: 19, scope: !1846)
!1849 = !DILocation(line: 1462, column: 7, scope: !1847)
!1850 = !DILocation(line: 1464, column: 5, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1846, file: !69, line: 1463, column: 4)
!1852 = !DILocation(line: 1468, column: 23, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !1846, file: !69, line: 1467, column: 4)
!1854 = !DILocation(line: 1468, column: 22, scope: !1853)
!1855 = !DILocation(line: 1468, column: 35, scope: !1853)
!1856 = !DILocation(line: 1468, column: 20, scope: !1853)
!1857 = !DILocation(line: 1469, column: 17, scope: !1853)
!1858 = !DILocation(line: 1469, column: 31, scope: !1853)
!1859 = !DILocation(line: 1469, column: 41, scope: !1853)
!1860 = !DILocation(line: 1469, column: 40, scope: !1853)
!1861 = !DILocation(line: 1469, column: 59, scope: !1853)
!1862 = !DILocation(line: 1469, column: 57, scope: !1853)
!1863 = !DILocation(line: 1469, column: 27, scope: !1853)
!1864 = !DILocation(line: 1469, column: 76, scope: !1853)
!1865 = !DILocation(line: 1469, column: 14, scope: !1853)
!1866 = !DILocation(line: 1470, column: 17, scope: !1853)
!1867 = !DILocation(line: 1470, column: 27, scope: !1853)
!1868 = !DILocation(line: 1470, column: 26, scope: !1853)
!1869 = !DILocation(line: 1470, column: 46, scope: !1853)
!1870 = !DILocation(line: 1470, column: 55, scope: !1853)
!1871 = !DILocation(line: 1470, column: 54, scope: !1853)
!1872 = !DILocation(line: 1470, column: 43, scope: !1853)
!1873 = !DILocation(line: 1470, column: 14, scope: !1853)
!1874 = !DILocation(line: 1471, column: 14, scope: !1853)
!1875 = !DILocation(line: 1471, column: 13, scope: !1853)
!1876 = !DILocation(line: 1471, column: 23, scope: !1853)
!1877 = !DILocation(line: 1471, column: 5, scope: !1853)
!1878 = !DILocation(line: 1476, column: 16, scope: !1879)
!1879 = distinct !DILexicalBlock(scope: !1841, file: !69, line: 1475, column: 3)
!1880 = !DILocation(line: 1476, column: 30, scope: !1879)
!1881 = !DILocation(line: 1476, column: 40, scope: !1879)
!1882 = !DILocation(line: 1476, column: 39, scope: !1879)
!1883 = !DILocation(line: 1476, column: 55, scope: !1879)
!1884 = !DILocation(line: 1476, column: 53, scope: !1879)
!1885 = !DILocation(line: 1476, column: 26, scope: !1879)
!1886 = !DILocation(line: 1476, column: 69, scope: !1879)
!1887 = !DILocation(line: 1476, column: 13, scope: !1879)
!1888 = !DILocation(line: 1477, column: 16, scope: !1879)
!1889 = !DILocation(line: 1477, column: 26, scope: !1879)
!1890 = !DILocation(line: 1477, column: 25, scope: !1879)
!1891 = !DILocation(line: 1477, column: 42, scope: !1879)
!1892 = !DILocation(line: 1477, column: 51, scope: !1879)
!1893 = !DILocation(line: 1477, column: 50, scope: !1879)
!1894 = !DILocation(line: 1477, column: 39, scope: !1879)
!1895 = !DILocation(line: 1477, column: 13, scope: !1879)
!1896 = !DILocation(line: 1478, column: 11, scope: !1879)
!1897 = !DILocation(line: 1478, column: 4, scope: !1879)
!1898 = !DILocation(line: 1481, column: 1, scope: !1744)
!1899 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !69, file: !69, line: 1499, type: !1900, scopeLine: 1500, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1900 = !DISubroutineType(types: !1901)
!1901 = !{!20, !12, !581}
!1902 = !DILocalVariable(name: "numerator", arg: 1, scope: !1899, file: !69, line: 1499, type: !12)
!1903 = !DILocation(line: 1499, column: 25, scope: !1899)
!1904 = !DILocalVariable(name: "denominator", arg: 2, scope: !1899, file: !69, line: 1499, type: !581)
!1905 = !DILocation(line: 1499, column: 40, scope: !1899)
!1906 = !DILocalVariable(name: "numerator_prime", scope: !1899, file: !69, line: 1502, type: !581)
!1907 = !DILocation(line: 1502, column: 6, scope: !1899)
!1908 = !DILocalVariable(name: "u32Temp1", scope: !1899, file: !69, line: 1502, type: !581)
!1909 = !DILocation(line: 1502, column: 27, scope: !1899)
!1910 = !DILocalVariable(name: "u32Temp2", scope: !1899, file: !69, line: 1502, type: !581)
!1911 = !DILocation(line: 1502, column: 41, scope: !1899)
!1912 = !DILocalVariable(name: "u32Temp3", scope: !1899, file: !69, line: 1502, type: !581)
!1913 = !DILocation(line: 1502, column: 55, scope: !1899)
!1914 = !DILocalVariable(name: "s32Temp1", scope: !1899, file: !69, line: 1503, type: !12)
!1915 = !DILocation(line: 1503, column: 6, scope: !1899)
!1916 = !DILocalVariable(name: "s32Temp2", scope: !1899, file: !69, line: 1503, type: !12)
!1917 = !DILocation(line: 1503, column: 20, scope: !1899)
!1918 = !DILocalVariable(name: "s32Temp3", scope: !1899, file: !69, line: 1503, type: !12)
!1919 = !DILocation(line: 1503, column: 34, scope: !1899)
!1920 = !DILocation(line: 1504, column: 5, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1899, file: !69, line: 1504, column: 5)
!1922 = !DILocation(line: 1504, column: 17, scope: !1921)
!1923 = !DILocation(line: 1504, column: 5, scope: !1899)
!1924 = !DILocation(line: 1506, column: 6, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1926, file: !69, line: 1506, column: 6)
!1926 = distinct !DILexicalBlock(scope: !1921, file: !69, line: 1505, column: 2)
!1927 = !DILocation(line: 1506, column: 15, scope: !1925)
!1928 = !DILocation(line: 1506, column: 6, scope: !1926)
!1929 = !DILocation(line: 1508, column: 4, scope: !1930)
!1930 = distinct !DILexicalBlock(scope: !1925, file: !69, line: 1507, column: 3)
!1931 = !DILocation(line: 1512, column: 4, scope: !1932)
!1932 = distinct !DILexicalBlock(scope: !1925, file: !69, line: 1511, column: 3)
!1933 = !DILocation(line: 1517, column: 6, scope: !1934)
!1934 = distinct !DILexicalBlock(scope: !1935, file: !69, line: 1517, column: 6)
!1935 = distinct !DILexicalBlock(scope: !1921, file: !69, line: 1516, column: 2)
!1936 = !DILocation(line: 1517, column: 16, scope: !1934)
!1937 = !DILocation(line: 1517, column: 6, scope: !1935)
!1938 = !DILocation(line: 1519, column: 23, scope: !1939)
!1939 = distinct !DILexicalBlock(scope: !1934, file: !69, line: 1518, column: 3)
!1940 = !DILocation(line: 1519, column: 22, scope: !1939)
!1941 = !DILocation(line: 1519, column: 20, scope: !1939)
!1942 = !DILocation(line: 1520, column: 16, scope: !1939)
!1943 = !DILocation(line: 1520, column: 32, scope: !1939)
!1944 = !DILocation(line: 1520, column: 31, scope: !1939)
!1945 = !DILocation(line: 1520, column: 13, scope: !1939)
!1946 = !DILocation(line: 1521, column: 15, scope: !1939)
!1947 = !DILocation(line: 1521, column: 34, scope: !1939)
!1948 = !DILocation(line: 1521, column: 45, scope: !1939)
!1949 = !DILocation(line: 1521, column: 43, scope: !1939)
!1950 = !DILocation(line: 1521, column: 31, scope: !1939)
!1951 = !DILocation(line: 1521, column: 13, scope: !1939)
!1952 = !DILocation(line: 1523, column: 8, scope: !1953)
!1953 = distinct !DILexicalBlock(scope: !1939, file: !69, line: 1523, column: 7)
!1954 = !DILocation(line: 1523, column: 20, scope: !1953)
!1955 = !DILocation(line: 1523, column: 27, scope: !1953)
!1956 = !DILocation(line: 1523, column: 7, scope: !1939)
!1957 = !DILocation(line: 1525, column: 19, scope: !1958)
!1958 = distinct !DILexicalBlock(scope: !1953, file: !69, line: 1524, column: 4)
!1959 = !DILocation(line: 1525, column: 31, scope: !1958)
!1960 = !DILocation(line: 1525, column: 17, scope: !1958)
!1961 = !DILocation(line: 1526, column: 4, scope: !1958)
!1962 = !DILocation(line: 1529, column: 20, scope: !1963)
!1963 = distinct !DILexicalBlock(scope: !1953, file: !69, line: 1528, column: 4)
!1964 = !DILocation(line: 1529, column: 32, scope: !1963)
!1965 = !DILocation(line: 1529, column: 38, scope: !1963)
!1966 = !DILocation(line: 1529, column: 17, scope: !1963)
!1967 = !DILocation(line: 1532, column: 7, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1939, file: !69, line: 1532, column: 7)
!1969 = !DILocation(line: 1532, column: 18, scope: !1968)
!1970 = !DILocation(line: 1532, column: 16, scope: !1968)
!1971 = !DILocation(line: 1532, column: 7, scope: !1939)
!1972 = !DILocation(line: 1534, column: 18, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1968, file: !69, line: 1533, column: 4)
!1974 = !DILocation(line: 1534, column: 16, scope: !1973)
!1975 = !DILocation(line: 1534, column: 28, scope: !1973)
!1976 = !DILocation(line: 1534, column: 14, scope: !1973)
!1977 = !DILocation(line: 1535, column: 4, scope: !1973)
!1978 = !DILocation(line: 1538, column: 18, scope: !1979)
!1979 = distinct !DILexicalBlock(scope: !1968, file: !69, line: 1537, column: 4)
!1980 = !DILocation(line: 1538, column: 26, scope: !1979)
!1981 = !DILocation(line: 1538, column: 16, scope: !1979)
!1982 = !DILocation(line: 1538, column: 30, scope: !1979)
!1983 = !DILocation(line: 1538, column: 14, scope: !1979)
!1984 = !DILocation(line: 1540, column: 8, scope: !1985)
!1985 = distinct !DILexicalBlock(scope: !1939, file: !69, line: 1540, column: 7)
!1986 = !DILocation(line: 1540, column: 18, scope: !1985)
!1987 = !DILocation(line: 1540, column: 7, scope: !1939)
!1988 = !DILocation(line: 1542, column: 18, scope: !1989)
!1989 = distinct !DILexicalBlock(scope: !1985, file: !69, line: 1541, column: 4)
!1990 = !DILocation(line: 1542, column: 12, scope: !1989)
!1991 = !DILocation(line: 1542, column: 5, scope: !1989)
!1992 = !DILocation(line: 1546, column: 5, scope: !1993)
!1993 = distinct !DILexicalBlock(scope: !1985, file: !69, line: 1545, column: 4)
!1994 = !DILocation(line: 1551, column: 16, scope: !1995)
!1995 = distinct !DILexicalBlock(scope: !1934, file: !69, line: 1550, column: 3)
!1996 = !DILocation(line: 1551, column: 26, scope: !1995)
!1997 = !DILocation(line: 1551, column: 25, scope: !1995)
!1998 = !DILocation(line: 1551, column: 41, scope: !1995)
!1999 = !DILocation(line: 1551, column: 39, scope: !1995)
!2000 = !DILocation(line: 1551, column: 13, scope: !1995)
!2001 = !DILocation(line: 1552, column: 16, scope: !1995)
!2002 = !DILocation(line: 1552, column: 30, scope: !1995)
!2003 = !DILocation(line: 1552, column: 40, scope: !1995)
!2004 = !DILocation(line: 1552, column: 39, scope: !1995)
!2005 = !DILocation(line: 1552, column: 55, scope: !1995)
!2006 = !DILocation(line: 1552, column: 53, scope: !1995)
!2007 = !DILocation(line: 1552, column: 26, scope: !1995)
!2008 = !DILocation(line: 1552, column: 68, scope: !1995)
!2009 = !DILocation(line: 1552, column: 13, scope: !1995)
!2010 = !DILocation(line: 1553, column: 16, scope: !1995)
!2011 = !DILocation(line: 1553, column: 25, scope: !1995)
!2012 = !DILocation(line: 1553, column: 24, scope: !1995)
!2013 = !DILocation(line: 1553, column: 41, scope: !1995)
!2014 = !DILocation(line: 1553, column: 51, scope: !1995)
!2015 = !DILocation(line: 1553, column: 50, scope: !1995)
!2016 = !DILocation(line: 1553, column: 38, scope: !1995)
!2017 = !DILocation(line: 1553, column: 13, scope: !1995)
!2018 = !DILocation(line: 1554, column: 7, scope: !2019)
!2019 = distinct !DILexicalBlock(scope: !1995, file: !69, line: 1554, column: 7)
!2020 = !DILocation(line: 1554, column: 16, scope: !2019)
!2021 = !DILocation(line: 1554, column: 7, scope: !1995)
!2022 = !DILocation(line: 1556, column: 17, scope: !2023)
!2023 = distinct !DILexicalBlock(scope: !2019, file: !69, line: 1555, column: 4)
!2024 = !DILocation(line: 1556, column: 12, scope: !2023)
!2025 = !DILocation(line: 1556, column: 5, scope: !2023)
!2026 = !DILocation(line: 1560, column: 5, scope: !2027)
!2027 = distinct !DILexicalBlock(scope: !2019, file: !69, line: 1559, column: 4)
!2028 = !DILocation(line: 1564, column: 1, scope: !1899)
!2029 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !2030, file: !2030, line: 12, type: !2031, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !37, retainedNodes: !2034)
!2030 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!2031 = !DISubroutineType(types: !2032)
!2032 = !{null, !2033}
!2033 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!2034 = !{!2035}
!2035 = !DILocalVariable(name: "z", arg: 1, scope: !2029, file: !2030, line: 12, type: !2033)
!2036 = !DILocation(line: 0, scope: !2029)
!2037 = !DILocation(line: 13, column: 9, scope: !2038)
!2038 = distinct !DILexicalBlock(scope: !2029, file: !2030, line: 13, column: 7)
!2039 = !DILocation(line: 13, column: 7, scope: !2029)
!2040 = !DILocation(line: 14, column: 5, scope: !2038)
!2041 = !DILocation(line: 15, column: 1, scope: !2029)
!2042 = distinct !DISubprogram(name: "klee_overshift_check", scope: !2043, file: !2043, line: 20, type: !2044, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !39, retainedNodes: !2047)
!2043 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!2044 = !DISubroutineType(types: !2045)
!2045 = !{null, !2046, !2046}
!2046 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!2047 = !{!2048, !2049}
!2048 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !2042, file: !2043, line: 20, type: !2046)
!2049 = !DILocalVariable(name: "shift", arg: 2, scope: !2042, file: !2043, line: 20, type: !2046)
!2050 = !DILocation(line: 0, scope: !2042)
!2051 = !DILocation(line: 21, column: 13, scope: !2052)
!2052 = distinct !DILexicalBlock(scope: !2042, file: !2043, line: 21, column: 7)
!2053 = !DILocation(line: 21, column: 7, scope: !2042)
!2054 = !DILocation(line: 27, column: 5, scope: !2055)
!2055 = distinct !DILexicalBlock(scope: !2052, file: !2043, line: 21, column: 26)
!2056 = !DILocation(line: 29, column: 1, scope: !2042)
