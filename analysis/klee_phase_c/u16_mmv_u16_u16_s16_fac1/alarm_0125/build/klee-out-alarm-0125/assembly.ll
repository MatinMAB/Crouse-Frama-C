; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mmv_u16_u16_s16_fac1/alarm_0125/build/u16_mmv_u16_u16_s16_fac1_alarm_0125.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"mmv\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"measure\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"crlc\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"src_analysis/sources/avrg_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [64 x i8] c"KLEE-ALARM-0125: signed overflow. assert -s32mmv <= 2147483647;\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0125.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !36 {
entry:
  %retval = alloca i32, align 4
  %mmv = alloca i16, align 2
  %measure = alloca i16, align 2
  %crlc = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %mmv, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i16* %measure, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i16* %crlc, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i16* %result, metadata !49, metadata !DIExpression()), !dbg !50
  %0 = bitcast i16* %mmv to i8*, !dbg !51
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !52
  %1 = bitcast i16* %measure to i8*, !dbg !53
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  %2 = bitcast i16* %crlc to i8*, !dbg !55
  call void @klee_make_symbolic(i8* %2, i64 2, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  %3 = load i16, i16* %mmv, align 2, !dbg !57
  %4 = load i16, i16* %measure, align 2, !dbg !58
  %5 = load i16, i16* %crlc, align 2, !dbg !59
  %call = call zeroext i16 @u16_mmv_u16_u16_s16_fac1(i16 zeroext %3, i16 zeroext %4, i16 signext %5), !dbg !60
  store i16 %call, i16* %result, align 2, !dbg !61
  %6 = load i16, i16* %result, align 2, !dbg !62
  ret i32 0, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mmv_s16_s16_s16_fac1(i16 signext %mmv, i16 signext %measure, i16 signext %crlc) #0 !dbg !64 {
entry:
  %retval = alloca i16, align 2
  %mmv.addr = alloca i16, align 2
  %measure.addr = alloca i16, align 2
  %crlc.addr = alloca i16, align 2
  %s16mmv = alloca i32, align 4
  %s32mmv = alloca i32, align 4
  %result = alloca i32, align 4
  store i16 %mmv, i16* %mmv.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %mmv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i16 %measure, i16* %measure.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %measure.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i16 %crlc, i16* %crlc.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %crlc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %s16mmv, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 0, i32* %s16mmv, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata i32* %s32mmv, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 0, i32* %s32mmv, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %result, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 0, i32* %result, align 4, !dbg !80
  %0 = load i16, i16* %measure.addr, align 2, !dbg !81
  %conv = sext i16 %0 to i32, !dbg !81
  %1 = load i16, i16* %mmv.addr, align 2, !dbg !82
  %conv1 = sext i16 %1 to i32, !dbg !82
  %sub = sub nsw i32 %conv, %conv1, !dbg !83
  store i32 %sub, i32* %s16mmv, align 4, !dbg !84
  %2 = load i32, i32* %s16mmv, align 4, !dbg !85
  %3 = load i16, i16* %crlc.addr, align 2, !dbg !86
  %conv2 = sext i16 %3 to i32, !dbg !86
  %mul = mul nsw i32 %2, %conv2, !dbg !87
  store i32 %mul, i32* %s32mmv, align 4, !dbg !88
  %4 = load i32, i32* %s32mmv, align 4, !dbg !89
  %cmp = icmp sle i32 %4, 0, !dbg !91
  br i1 %cmp, label %if.then, label %if.else50, !dbg !92

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32mmv, align 4, !dbg !93
  %cmp4 = icmp sge i32 %5, 0, !dbg !96
  br i1 %cmp4, label %if.then6, label %if.else16, !dbg !97

if.then6:                                         ; preds = %if.then
  store i32 0, i32* %result, align 4, !dbg !98
  %6 = load i16, i16* %mmv.addr, align 2, !dbg !100
  %conv7 = sext i16 %6 to i32, !dbg !100
  %7 = load i32, i32* %result, align 4, !dbg !101
  %add = add nsw i32 %conv7, %7, !dbg !102
  store i32 %add, i32* %s32mmv, align 4, !dbg !103
  %8 = load i32, i32* %s32mmv, align 4, !dbg !104
  %cmp8 = icmp slt i32 %8, 32767, !dbg !106
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !107

if.then10:                                        ; preds = %if.then6
  %9 = load i32, i32* %s32mmv, align 4, !dbg !108
  %cmp11 = icmp sgt i32 %9, -32768, !dbg !111
  br i1 %cmp11, label %if.then13, label %if.else, !dbg !112

if.then13:                                        ; preds = %if.then10
  %10 = load i32, i32* %s32mmv, align 4, !dbg !113
  %conv14 = trunc i32 %10 to i16, !dbg !113
  store i16 %conv14, i16* %retval, align 2, !dbg !115
  br label %return, !dbg !115

if.else:                                          ; preds = %if.then10
  store i16 -32768, i16* %retval, align 2, !dbg !116
  br label %return, !dbg !116

if.else15:                                        ; preds = %if.then6
  store i16 32767, i16* %retval, align 2, !dbg !118
  br label %return, !dbg !118

if.else16:                                        ; preds = %if.then
  %11 = load i32, i32* %s32mmv, align 4, !dbg !120
  %sub17 = sub nsw i32 0, %11, !dbg !122
  store i32 %sub17, i32* %s32mmv, align 4, !dbg !123
  %12 = load i32, i32* %s32mmv, align 4, !dbg !124
  %shr = ashr i32 %12, 15, !dbg !125
  store i32 %shr, i32* %result, align 4, !dbg !126
  %13 = load i32, i32* %s32mmv, align 4, !dbg !127
  %and = and i32 %13, 16384, !dbg !128
  %shr18 = ashr i32 %and, 14, !dbg !129
  %conv19 = trunc i32 %shr18 to i16, !dbg !130
  store i16 %conv19, i16* %crlc.addr, align 2, !dbg !131
  %14 = load i32, i32* %result, align 4, !dbg !132
  %15 = load i16, i16* %crlc.addr, align 2, !dbg !133
  %conv20 = sext i16 %15 to i32, !dbg !133
  %add21 = add nsw i32 %14, %conv20, !dbg !134
  store i32 %add21, i32* %result, align 4, !dbg !135
  %16 = load i32, i32* %result, align 4, !dbg !136
  %cmp22 = icmp ne i32 %16, 0, !dbg !138
  br i1 %cmp22, label %if.then24, label %if.else37, !dbg !139

if.then24:                                        ; preds = %if.else16
  %17 = load i32, i32* %result, align 4, !dbg !140
  %sub25 = sub nsw i32 0, %17, !dbg !142
  store i32 %sub25, i32* %result, align 4, !dbg !143
  %18 = load i16, i16* %mmv.addr, align 2, !dbg !144
  %conv26 = sext i16 %18 to i32, !dbg !144
  %19 = load i32, i32* %result, align 4, !dbg !145
  %add27 = add nsw i32 %conv26, %19, !dbg !146
  store i32 %add27, i32* %s32mmv, align 4, !dbg !147
  %20 = load i32, i32* %s32mmv, align 4, !dbg !148
  %cmp28 = icmp slt i32 %20, 32767, !dbg !150
  br i1 %cmp28, label %if.then30, label %if.else36, !dbg !151

if.then30:                                        ; preds = %if.then24
  %21 = load i32, i32* %s32mmv, align 4, !dbg !152
  %cmp31 = icmp sgt i32 %21, -32768, !dbg !155
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !156

if.then33:                                        ; preds = %if.then30
  %22 = load i32, i32* %s32mmv, align 4, !dbg !157
  %conv34 = trunc i32 %22 to i16, !dbg !157
  store i16 %conv34, i16* %retval, align 2, !dbg !159
  br label %return, !dbg !159

if.else35:                                        ; preds = %if.then30
  store i16 -32768, i16* %retval, align 2, !dbg !160
  br label %return, !dbg !160

if.else36:                                        ; preds = %if.then24
  store i16 32767, i16* %retval, align 2, !dbg !162
  br label %return, !dbg !162

if.else37:                                        ; preds = %if.else16
  %23 = load i32, i32* %result, align 4, !dbg !164
  %sub38 = sub nsw i32 %23, 1, !dbg !166
  store i32 %sub38, i32* %result, align 4, !dbg !167
  %24 = load i16, i16* %mmv.addr, align 2, !dbg !168
  %conv39 = sext i16 %24 to i32, !dbg !168
  %25 = load i32, i32* %result, align 4, !dbg !169
  %add40 = add nsw i32 %conv39, %25, !dbg !170
  store i32 %add40, i32* %s32mmv, align 4, !dbg !171
  %26 = load i32, i32* %s32mmv, align 4, !dbg !172
  %cmp41 = icmp slt i32 %26, 32767, !dbg !174
  br i1 %cmp41, label %if.then43, label %if.else49, !dbg !175

if.then43:                                        ; preds = %if.else37
  %27 = load i32, i32* %s32mmv, align 4, !dbg !176
  %cmp44 = icmp sgt i32 %27, -32768, !dbg !179
  br i1 %cmp44, label %if.then46, label %if.else48, !dbg !180

if.then46:                                        ; preds = %if.then43
  %28 = load i32, i32* %s32mmv, align 4, !dbg !181
  %conv47 = trunc i32 %28 to i16, !dbg !181
  store i16 %conv47, i16* %retval, align 2, !dbg !183
  br label %return, !dbg !183

if.else48:                                        ; preds = %if.then43
  store i16 -32768, i16* %retval, align 2, !dbg !184
  br label %return, !dbg !184

if.else49:                                        ; preds = %if.else37
  store i16 32767, i16* %retval, align 2, !dbg !186
  br label %return, !dbg !186

if.else50:                                        ; preds = %entry
  %29 = load i32, i32* %s32mmv, align 4, !dbg !188
  %shr51 = ashr i32 %29, 15, !dbg !190
  store i32 %shr51, i32* %result, align 4, !dbg !191
  %30 = load i32, i32* %s32mmv, align 4, !dbg !192
  %and52 = and i32 %30, 16384, !dbg !193
  %shr53 = ashr i32 %and52, 14, !dbg !194
  %conv54 = trunc i32 %shr53 to i16, !dbg !195
  store i16 %conv54, i16* %crlc.addr, align 2, !dbg !196
  %31 = load i32, i32* %result, align 4, !dbg !197
  %32 = load i16, i16* %crlc.addr, align 2, !dbg !198
  %conv55 = sext i16 %32 to i32, !dbg !198
  %add56 = add nsw i32 %31, %conv55, !dbg !199
  store i32 %add56, i32* %result, align 4, !dbg !200
  %33 = load i32, i32* %result, align 4, !dbg !201
  %cmp57 = icmp ne i32 %33, 0, !dbg !203
  br i1 %cmp57, label %if.then59, label %if.else71, !dbg !204

if.then59:                                        ; preds = %if.else50
  %34 = load i16, i16* %mmv.addr, align 2, !dbg !205
  %conv60 = sext i16 %34 to i32, !dbg !205
  %35 = load i32, i32* %result, align 4, !dbg !207
  %add61 = add nsw i32 %conv60, %35, !dbg !208
  store i32 %add61, i32* %s32mmv, align 4, !dbg !209
  %36 = load i32, i32* %s32mmv, align 4, !dbg !210
  %cmp62 = icmp slt i32 %36, 32767, !dbg !212
  br i1 %cmp62, label %if.then64, label %if.else70, !dbg !213

if.then64:                                        ; preds = %if.then59
  %37 = load i32, i32* %s32mmv, align 4, !dbg !214
  %cmp65 = icmp sgt i32 %37, -32768, !dbg !217
  br i1 %cmp65, label %if.then67, label %if.else69, !dbg !218

if.then67:                                        ; preds = %if.then64
  %38 = load i32, i32* %s32mmv, align 4, !dbg !219
  %conv68 = trunc i32 %38 to i16, !dbg !219
  store i16 %conv68, i16* %retval, align 2, !dbg !221
  br label %return, !dbg !221

if.else69:                                        ; preds = %if.then64
  store i16 -32768, i16* %retval, align 2, !dbg !222
  br label %return, !dbg !222

if.else70:                                        ; preds = %if.then59
  store i16 32767, i16* %retval, align 2, !dbg !224
  br label %return, !dbg !224

if.else71:                                        ; preds = %if.else50
  %39 = load i32, i32* %result, align 4, !dbg !226
  %add72 = add nsw i32 %39, 1, !dbg !228
  store i32 %add72, i32* %result, align 4, !dbg !229
  %40 = load i16, i16* %mmv.addr, align 2, !dbg !230
  %conv73 = sext i16 %40 to i32, !dbg !230
  %41 = load i32, i32* %result, align 4, !dbg !231
  %add74 = add nsw i32 %conv73, %41, !dbg !232
  store i32 %add74, i32* %s32mmv, align 4, !dbg !233
  %42 = load i32, i32* %s32mmv, align 4, !dbg !234
  %cmp75 = icmp slt i32 %42, 32767, !dbg !236
  br i1 %cmp75, label %if.then77, label %if.else83, !dbg !237

if.then77:                                        ; preds = %if.else71
  %43 = load i32, i32* %s32mmv, align 4, !dbg !238
  %cmp78 = icmp sgt i32 %43, -32768, !dbg !241
  br i1 %cmp78, label %if.then80, label %if.else82, !dbg !242

if.then80:                                        ; preds = %if.then77
  %44 = load i32, i32* %s32mmv, align 4, !dbg !243
  %conv81 = trunc i32 %44 to i16, !dbg !243
  store i16 %conv81, i16* %retval, align 2, !dbg !245
  br label %return, !dbg !245

if.else82:                                        ; preds = %if.then77
  store i16 -32768, i16* %retval, align 2, !dbg !246
  br label %return, !dbg !246

if.else83:                                        ; preds = %if.else71
  store i16 32767, i16* %retval, align 2, !dbg !248
  br label %return, !dbg !248

return:                                           ; preds = %if.else83, %if.else82, %if.then80, %if.else70, %if.else69, %if.then67, %if.else49, %if.else48, %if.then46, %if.else36, %if.else35, %if.then33, %if.else15, %if.else, %if.then13
  %45 = load i16, i16* %retval, align 2, !dbg !250
  ret i16 %45, !dbg !250
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mmv_u16_u16_s16_fac1(i16 zeroext %mmv, i16 zeroext %measure, i16 signext %crlc) #0 !dbg !251 {
entry:
  %retval = alloca i16, align 2
  %mmv.addr = alloca i16, align 2
  %measure.addr = alloca i16, align 2
  %crlc.addr = alloca i16, align 2
  %s32mmv = alloca i32, align 4
  %u16mmv = alloca i32, align 4
  %result = alloca i32, align 4
  store i16 %mmv, i16* %mmv.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %mmv.addr, metadata !254, metadata !DIExpression()), !dbg !255
  store i16 %measure, i16* %measure.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %measure.addr, metadata !256, metadata !DIExpression()), !dbg !257
  store i16 %crlc, i16* %crlc.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %crlc.addr, metadata !258, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata i32* %s32mmv, metadata !260, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i32* %u16mmv, metadata !262, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata i32* %result, metadata !264, metadata !DIExpression()), !dbg !265
  store i32 0, i32* %s32mmv, align 4, !dbg !266
  store i32 0, i32* %result, align 4, !dbg !267
  store i32 0, i32* %u16mmv, align 4, !dbg !268
  %0 = load i16, i16* %measure.addr, align 2, !dbg !269
  %conv = zext i16 %0 to i32, !dbg !269
  %1 = load i16, i16* %mmv.addr, align 2, !dbg !270
  %conv1 = zext i16 %1 to i32, !dbg !270
  %sub = sub nsw i32 %conv, %conv1, !dbg !271
  store i32 %sub, i32* %result, align 4, !dbg !272
  %2 = load i32, i32* %result, align 4, !dbg !273
  %3 = load i16, i16* %crlc.addr, align 2, !dbg !274
  %conv2 = sext i16 %3 to i32, !dbg !274
  %mul = mul i32 %2, %conv2, !dbg !275
  store i32 %mul, i32* %s32mmv, align 4, !dbg !276
  %4 = load i32, i32* %s32mmv, align 4, !dbg !277
  %cmp = icmp sle i32 %4, 0, !dbg !279
  br i1 %cmp, label %if.then, label %if.else21, !dbg !280

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32mmv, align 4, !dbg !281
  %cmp4 = icmp sge i32 %5, 0, !dbg !284
  br i1 %cmp4, label %if.then6, label %if.else16, !dbg !285

if.then6:                                         ; preds = %if.then
  %6 = load i16, i16* %mmv.addr, align 2, !dbg !286
  %conv7 = zext i16 %6 to i32, !dbg !286
  %7 = load i32, i32* %result, align 4, !dbg !288
  %add = add i32 %conv7, %7, !dbg !289
  store i32 %add, i32* %s32mmv, align 4, !dbg !290
  %8 = load i32, i32* %s32mmv, align 4, !dbg !291
  %cmp8 = icmp slt i32 %8, 65535, !dbg !293
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !294

if.then10:                                        ; preds = %if.then6
  %9 = load i32, i32* %s32mmv, align 4, !dbg !295
  %cmp11 = icmp sgt i32 %9, 0, !dbg !298
  br i1 %cmp11, label %if.then13, label %if.else, !dbg !299

if.then13:                                        ; preds = %if.then10
  %10 = load i32, i32* %s32mmv, align 4, !dbg !300
  %conv14 = trunc i32 %10 to i16, !dbg !302
  store i16 %conv14, i16* %retval, align 2, !dbg !303
  br label %return, !dbg !303

if.else:                                          ; preds = %if.then10
  store i16 0, i16* %retval, align 2, !dbg !304
  br label %return, !dbg !304

if.else15:                                        ; preds = %if.then6
  store i16 -1, i16* %retval, align 2, !dbg !306
  br label %return, !dbg !306

if.else16:                                        ; preds = %if.then
  %11 = load i32, i32* %s32mmv, align 4, !dbg !308
  %conv17 = sext i32 %11 to i64, !dbg !311
  %call = call i32 @klee_alarm_s32_neg_valid(i64 %conv17), !dbg !312
  %tobool = icmp ne i32 %call, 0, !dbg !312
  br i1 %tobool, label %if.end, label %if.then18, !dbg !313

if.then18:                                        ; preds = %if.else16
  call void @klee_report_error(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0), i32 253, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #4, !dbg !314
  unreachable, !dbg !314

if.end:                                           ; preds = %if.else16
  %12 = load i32, i32* %s32mmv, align 4, !dbg !316
  %sub19 = sub nsw i32 0, %12, !dbg !317
  %conv20 = sext i32 %sub19 to i64, !dbg !318
  store volatile i64 %conv20, i64* @klee_alarm_sink_s64, align 8, !dbg !319
  store i16 0, i16* %retval, align 2, !dbg !320
  br label %return, !dbg !320

if.else21:                                        ; preds = %entry
  %13 = load i32, i32* %s32mmv, align 4, !dbg !321
  store i32 %13, i32* %s32mmv, align 4, !dbg !323
  %14 = load i32, i32* %s32mmv, align 4, !dbg !324
  %shr = ashr i32 %14, 15, !dbg !325
  store i32 %shr, i32* %result, align 4, !dbg !326
  %15 = load i32, i32* %s32mmv, align 4, !dbg !327
  %and = and i32 %15, 16384, !dbg !328
  %shr22 = ashr i32 %and, 14, !dbg !329
  %conv23 = trunc i32 %shr22 to i16, !dbg !330
  store i16 %conv23, i16* %crlc.addr, align 2, !dbg !331
  %16 = load i32, i32* %result, align 4, !dbg !332
  %17 = load i16, i16* %crlc.addr, align 2, !dbg !333
  %conv24 = sext i16 %17 to i32, !dbg !333
  %add25 = add i32 %16, %conv24, !dbg !334
  store i32 %add25, i32* %result, align 4, !dbg !335
  %18 = load i32, i32* %result, align 4, !dbg !336
  %cmp26 = icmp ne i32 %18, 0, !dbg !338
  br i1 %cmp26, label %if.then28, label %if.else40, !dbg !339

if.then28:                                        ; preds = %if.else21
  %19 = load i16, i16* %mmv.addr, align 2, !dbg !340
  %conv29 = zext i16 %19 to i32, !dbg !340
  %20 = load i32, i32* %result, align 4, !dbg !342
  %add30 = add i32 %conv29, %20, !dbg !343
  store i32 %add30, i32* %s32mmv, align 4, !dbg !344
  %21 = load i32, i32* %s32mmv, align 4, !dbg !345
  %cmp31 = icmp slt i32 %21, 65535, !dbg !347
  br i1 %cmp31, label %if.then33, label %if.else39, !dbg !348

if.then33:                                        ; preds = %if.then28
  %22 = load i32, i32* %s32mmv, align 4, !dbg !349
  %cmp34 = icmp sgt i32 %22, 0, !dbg !352
  br i1 %cmp34, label %if.then36, label %if.else38, !dbg !353

if.then36:                                        ; preds = %if.then33
  %23 = load i32, i32* %s32mmv, align 4, !dbg !354
  %conv37 = trunc i32 %23 to i16, !dbg !356
  store i16 %conv37, i16* %retval, align 2, !dbg !357
  br label %return, !dbg !357

if.else38:                                        ; preds = %if.then33
  store i16 0, i16* %retval, align 2, !dbg !358
  br label %return, !dbg !358

if.else39:                                        ; preds = %if.then28
  store i16 -1, i16* %retval, align 2, !dbg !360
  br label %return, !dbg !360

if.else40:                                        ; preds = %if.else21
  %24 = load i32, i32* %result, align 4, !dbg !362
  %add41 = add i32 %24, 1, !dbg !364
  store i32 %add41, i32* %result, align 4, !dbg !365
  %25 = load i16, i16* %mmv.addr, align 2, !dbg !366
  %conv42 = zext i16 %25 to i32, !dbg !366
  %26 = load i32, i32* %result, align 4, !dbg !367
  %add43 = add i32 %conv42, %26, !dbg !368
  store i32 %add43, i32* %s32mmv, align 4, !dbg !369
  %27 = load i32, i32* %s32mmv, align 4, !dbg !370
  %cmp44 = icmp slt i32 %27, 65535, !dbg !372
  br i1 %cmp44, label %if.then46, label %if.else52, !dbg !373

if.then46:                                        ; preds = %if.else40
  %28 = load i32, i32* %s32mmv, align 4, !dbg !374
  %cmp47 = icmp sgt i32 %28, 0, !dbg !377
  br i1 %cmp47, label %if.then49, label %if.else51, !dbg !378

if.then49:                                        ; preds = %if.then46
  %29 = load i32, i32* %s32mmv, align 4, !dbg !379
  %conv50 = trunc i32 %29 to i16, !dbg !381
  store i16 %conv50, i16* %retval, align 2, !dbg !382
  br label %return, !dbg !382

if.else51:                                        ; preds = %if.then46
  store i16 0, i16* %retval, align 2, !dbg !383
  br label %return, !dbg !383

if.else52:                                        ; preds = %if.else40
  store i16 -1, i16* %retval, align 2, !dbg !385
  br label %return, !dbg !385

return:                                           ; preds = %if.else52, %if.else51, %if.then49, %if.else39, %if.else38, %if.then36, %if.end, %if.else15, %if.else, %if.then13
  %30 = load i16, i16* %retval, align 2, !dbg !387
  ret i16 %30, !dbg !387
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !388 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !391, metadata !DIExpression()), !dbg !392
  %0 = load i64, i64* %value.addr, align 8, !dbg !393
  %cmp = icmp ne i64 %0, -2147483648, !dbg !394
  %conv = zext i1 %cmp to i32, !dbg !394
  ret i32 %conv, !dbg !395
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mmv_u16_u16_u16_fac2(i16 zeroext %mmv, i16 zeroext %measure, i16 zeroext %crlc) #0 !dbg !396 {
entry:
  %retval = alloca i16, align 2
  %mmv.addr = alloca i16, align 2
  %measure.addr = alloca i16, align 2
  %crlc.addr = alloca i16, align 2
  %Temp = alloca i32, align 4
  %result = alloca i32, align 4
  %measure32 = alloca i32, align 4
  store i16 %mmv, i16* %mmv.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %mmv.addr, metadata !399, metadata !DIExpression()), !dbg !400
  store i16 %measure, i16* %measure.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %measure.addr, metadata !401, metadata !DIExpression()), !dbg !402
  store i16 %crlc, i16* %crlc.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %crlc.addr, metadata !403, metadata !DIExpression()), !dbg !404
  call void @llvm.dbg.declare(metadata i32* %Temp, metadata !405, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.declare(metadata i32* %result, metadata !407, metadata !DIExpression()), !dbg !408
  call void @llvm.dbg.declare(metadata i32* %measure32, metadata !409, metadata !DIExpression()), !dbg !410
  store i32 0, i32* %measure32, align 4, !dbg !410
  %0 = load i16, i16* %mmv.addr, align 2, !dbg !411
  %conv = zext i16 %0 to i32, !dbg !411
  store i32 %conv, i32* %result, align 4, !dbg !412
  %1 = load i16, i16* %mmv.addr, align 2, !dbg !413
  %conv1 = zext i16 %1 to i32, !dbg !413
  %2 = load i16, i16* %measure.addr, align 2, !dbg !415
  %conv2 = zext i16 %2 to i32, !dbg !415
  %cmp = icmp sgt i32 %conv1, %conv2, !dbg !416
  br i1 %cmp, label %if.then, label %if.else52, !dbg !417

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %mmv.addr, align 2, !dbg !418
  %conv4 = zext i16 %3 to i32, !dbg !418
  %4 = load i16, i16* %measure.addr, align 2, !dbg !420
  %conv5 = zext i16 %4 to i32, !dbg !420
  %sub = sub nsw i32 %conv4, %conv5, !dbg !421
  store i32 %sub, i32* %measure32, align 4, !dbg !422
  %5 = load i32, i32* %measure32, align 4, !dbg !423
  %6 = load i16, i16* %crlc.addr, align 2, !dbg !424
  %conv6 = zext i16 %6 to i32, !dbg !424
  %mul = mul nsw i32 %5, %conv6, !dbg !425
  store i32 %mul, i32* %measure32, align 4, !dbg !426
  %7 = load i32, i32* %measure32, align 4, !dbg !427
  %shr = ashr i32 %7, 15, !dbg !428
  store i32 %shr, i32* %Temp, align 4, !dbg !429
  %8 = load i32, i32* %measure32, align 4, !dbg !430
  %and = and i32 %8, 16384, !dbg !431
  %shr7 = ashr i32 %and, 14, !dbg !432
  %conv8 = trunc i32 %shr7 to i16, !dbg !433
  store i16 %conv8, i16* %crlc.addr, align 2, !dbg !434
  %9 = load i32, i32* %Temp, align 4, !dbg !435
  %10 = load i16, i16* %crlc.addr, align 2, !dbg !436
  %conv9 = zext i16 %10 to i32, !dbg !436
  %add = add nsw i32 %9, %conv9, !dbg !437
  store i32 %add, i32* %Temp, align 4, !dbg !438
  %11 = load i32, i32* %Temp, align 4, !dbg !439
  %cmp10 = icmp ne i32 %11, 0, !dbg !441
  br i1 %cmp10, label %if.then12, label %if.else23, !dbg !442

if.then12:                                        ; preds = %if.then
  %12 = load i32, i32* %result, align 4, !dbg !443
  %13 = load i32, i32* %Temp, align 4, !dbg !445
  %sub13 = sub nsw i32 %12, %13, !dbg !446
  store i32 %sub13, i32* %result, align 4, !dbg !447
  %14 = load i32, i32* %result, align 4, !dbg !448
  %cmp14 = icmp slt i32 %14, 65535, !dbg !450
  br i1 %cmp14, label %if.then16, label %if.else22, !dbg !451

if.then16:                                        ; preds = %if.then12
  %15 = load i32, i32* %result, align 4, !dbg !452
  %cmp17 = icmp sgt i32 %15, 0, !dbg !455
  br i1 %cmp17, label %if.then19, label %if.else, !dbg !456

if.then19:                                        ; preds = %if.then16
  %16 = load i32, i32* %result, align 4, !dbg !457
  %and20 = and i32 %16, 65535, !dbg !459
  %conv21 = trunc i32 %and20 to i16, !dbg !457
  store i16 %conv21, i16* %retval, align 2, !dbg !460
  br label %return, !dbg !460

if.else:                                          ; preds = %if.then16
  store i16 0, i16* %retval, align 2, !dbg !461
  br label %return, !dbg !461

if.else22:                                        ; preds = %if.then12
  store i16 -1, i16* %retval, align 2, !dbg !463
  br label %return, !dbg !463

if.else23:                                        ; preds = %if.then
  %17 = load i16, i16* %measure.addr, align 2, !dbg !465
  %conv24 = zext i16 %17 to i32, !dbg !465
  %cmp25 = icmp eq i32 %conv24, 0, !dbg !468
  br i1 %cmp25, label %if.then27, label %if.else39, !dbg !469

if.then27:                                        ; preds = %if.else23
  %18 = load i32, i32* %result, align 4, !dbg !470
  %19 = load i32, i32* %Temp, align 4, !dbg !472
  %sub28 = sub nsw i32 %18, %19, !dbg !473
  store i32 %sub28, i32* %result, align 4, !dbg !474
  %20 = load i32, i32* %result, align 4, !dbg !475
  %cmp29 = icmp slt i32 %20, 65535, !dbg !477
  br i1 %cmp29, label %if.then31, label %if.else38, !dbg !478

if.then31:                                        ; preds = %if.then27
  %21 = load i32, i32* %result, align 4, !dbg !479
  %cmp32 = icmp sgt i32 %21, 0, !dbg !482
  br i1 %cmp32, label %if.then34, label %if.else37, !dbg !483

if.then34:                                        ; preds = %if.then31
  %22 = load i32, i32* %result, align 4, !dbg !484
  %and35 = and i32 %22, 65535, !dbg !486
  %conv36 = trunc i32 %and35 to i16, !dbg !484
  store i16 %conv36, i16* %retval, align 2, !dbg !487
  br label %return, !dbg !487

if.else37:                                        ; preds = %if.then31
  store i16 0, i16* %retval, align 2, !dbg !488
  br label %return, !dbg !488

if.else38:                                        ; preds = %if.then27
  store i16 -1, i16* %retval, align 2, !dbg !490
  br label %return, !dbg !490

if.else39:                                        ; preds = %if.else23
  %23 = load i16, i16* %mmv.addr, align 2, !dbg !492
  %conv40 = zext i16 %23 to i32, !dbg !492
  %add41 = add nsw i32 %conv40, 65535, !dbg !494
  store i32 %add41, i32* %result, align 4, !dbg !495
  %24 = load i32, i32* %result, align 4, !dbg !496
  %cmp42 = icmp ult i32 %24, -1, !dbg !498
  br i1 %cmp42, label %if.then44, label %if.else51, !dbg !499

if.then44:                                        ; preds = %if.else39
  %25 = load i32, i32* %result, align 4, !dbg !500
  %cmp45 = icmp sgt i32 %25, 0, !dbg !503
  br i1 %cmp45, label %if.then47, label %if.else50, !dbg !504

if.then47:                                        ; preds = %if.then44
  %26 = load i32, i32* %result, align 4, !dbg !505
  %and48 = and i32 %26, 65535, !dbg !507
  %conv49 = trunc i32 %and48 to i16, !dbg !508
  store i16 %conv49, i16* %retval, align 2, !dbg !509
  br label %return, !dbg !509

if.else50:                                        ; preds = %if.then44
  store i16 0, i16* %retval, align 2, !dbg !510
  br label %return, !dbg !510

if.else51:                                        ; preds = %if.else39
  store i16 -1, i16* %retval, align 2, !dbg !512
  br label %return, !dbg !512

if.else52:                                        ; preds = %entry
  %27 = load i16, i16* %measure.addr, align 2, !dbg !514
  %conv53 = zext i16 %27 to i32, !dbg !514
  %28 = load i16, i16* %mmv.addr, align 2, !dbg !516
  %conv54 = zext i16 %28 to i32, !dbg !516
  %sub55 = sub nsw i32 %conv53, %conv54, !dbg !517
  store i32 %sub55, i32* %measure32, align 4, !dbg !518
  %29 = load i32, i32* %measure32, align 4, !dbg !519
  %30 = load i16, i16* %crlc.addr, align 2, !dbg !520
  %conv56 = zext i16 %30 to i32, !dbg !520
  %mul57 = mul nsw i32 %29, %conv56, !dbg !521
  store i32 %mul57, i32* %measure32, align 4, !dbg !522
  %31 = load i32, i32* %measure32, align 4, !dbg !523
  %shr58 = ashr i32 %31, 15, !dbg !524
  store i32 %shr58, i32* %Temp, align 4, !dbg !525
  %32 = load i32, i32* %measure32, align 4, !dbg !526
  %and59 = and i32 %32, 16384, !dbg !527
  %shr60 = ashr i32 %and59, 14, !dbg !528
  %conv61 = trunc i32 %shr60 to i16, !dbg !529
  store i16 %conv61, i16* %crlc.addr, align 2, !dbg !530
  %33 = load i32, i32* %Temp, align 4, !dbg !531
  %34 = load i16, i16* %crlc.addr, align 2, !dbg !532
  %conv62 = zext i16 %34 to i32, !dbg !532
  %add63 = add nsw i32 %33, %conv62, !dbg !533
  store i32 %add63, i32* %Temp, align 4, !dbg !534
  %35 = load i32, i32* %Temp, align 4, !dbg !535
  %cmp64 = icmp ne i32 %35, 0, !dbg !537
  br i1 %cmp64, label %if.then66, label %if.else78, !dbg !538

if.then66:                                        ; preds = %if.else52
  %36 = load i32, i32* %Temp, align 4, !dbg !539
  %37 = load i32, i32* %result, align 4, !dbg !541
  %add67 = add nsw i32 %36, %37, !dbg !542
  store i32 %add67, i32* %result, align 4, !dbg !543
  %38 = load i32, i32* %result, align 4, !dbg !544
  %cmp68 = icmp slt i32 %38, 65535, !dbg !546
  br i1 %cmp68, label %if.then70, label %if.else77, !dbg !547

if.then70:                                        ; preds = %if.then66
  %39 = load i32, i32* %result, align 4, !dbg !548
  %cmp71 = icmp sgt i32 %39, 0, !dbg !551
  br i1 %cmp71, label %if.then73, label %if.else76, !dbg !552

if.then73:                                        ; preds = %if.then70
  %40 = load i32, i32* %result, align 4, !dbg !553
  %and74 = and i32 %40, 65535, !dbg !555
  %conv75 = trunc i32 %and74 to i16, !dbg !553
  store i16 %conv75, i16* %retval, align 2, !dbg !556
  br label %return, !dbg !556

if.else76:                                        ; preds = %if.then70
  store i16 0, i16* %retval, align 2, !dbg !557
  br label %return, !dbg !557

if.else77:                                        ; preds = %if.then66
  store i16 -1, i16* %retval, align 2, !dbg !559
  br label %return, !dbg !559

if.else78:                                        ; preds = %if.else52
  %41 = load i16, i16* %measure.addr, align 2, !dbg !561
  %conv79 = zext i16 %41 to i32, !dbg !561
  %cmp80 = icmp eq i32 %conv79, 0, !dbg !564
  br i1 %cmp80, label %if.then82, label %if.else94, !dbg !565

if.then82:                                        ; preds = %if.else78
  %42 = load i32, i32* %Temp, align 4, !dbg !566
  %43 = load i32, i32* %result, align 4, !dbg !568
  %add83 = add nsw i32 %42, %43, !dbg !569
  store i32 %add83, i32* %result, align 4, !dbg !570
  %44 = load i32, i32* %result, align 4, !dbg !571
  %cmp84 = icmp slt i32 %44, 65535, !dbg !573
  br i1 %cmp84, label %if.then86, label %if.else93, !dbg !574

if.then86:                                        ; preds = %if.then82
  %45 = load i32, i32* %result, align 4, !dbg !575
  %cmp87 = icmp sgt i32 %45, 0, !dbg !578
  br i1 %cmp87, label %if.then89, label %if.else92, !dbg !579

if.then89:                                        ; preds = %if.then86
  %46 = load i32, i32* %result, align 4, !dbg !580
  %and90 = and i32 %46, 65535, !dbg !582
  %conv91 = trunc i32 %and90 to i16, !dbg !580
  store i16 %conv91, i16* %retval, align 2, !dbg !583
  br label %return, !dbg !583

if.else92:                                        ; preds = %if.then86
  store i16 0, i16* %retval, align 2, !dbg !584
  br label %return, !dbg !584

if.else93:                                        ; preds = %if.then82
  store i16 -1, i16* %retval, align 2, !dbg !586
  br label %return, !dbg !586

if.else94:                                        ; preds = %if.else78
  %47 = load i16, i16* %mmv.addr, align 2, !dbg !588
  %conv95 = zext i16 %47 to i32, !dbg !588
  %add96 = add nsw i32 %conv95, 1, !dbg !590
  store i32 %add96, i32* %result, align 4, !dbg !591
  %48 = load i32, i32* %result, align 4, !dbg !592
  %cmp97 = icmp slt i32 %48, 65535, !dbg !594
  br i1 %cmp97, label %if.then99, label %if.else106, !dbg !595

if.then99:                                        ; preds = %if.else94
  %49 = load i32, i32* %result, align 4, !dbg !596
  %cmp100 = icmp sgt i32 %49, 0, !dbg !599
  br i1 %cmp100, label %if.then102, label %if.else105, !dbg !600

if.then102:                                       ; preds = %if.then99
  %50 = load i32, i32* %result, align 4, !dbg !601
  %and103 = and i32 %50, 65535, !dbg !603
  %conv104 = trunc i32 %and103 to i16, !dbg !601
  store i16 %conv104, i16* %retval, align 2, !dbg !604
  br label %return, !dbg !604

if.else105:                                       ; preds = %if.then99
  store i16 0, i16* %retval, align 2, !dbg !605
  br label %return, !dbg !605

if.else106:                                       ; preds = %if.else94
  store i16 -1, i16* %retval, align 2, !dbg !607
  br label %return, !dbg !607

return:                                           ; preds = %if.else106, %if.else105, %if.then102, %if.else93, %if.else92, %if.then89, %if.else77, %if.else76, %if.then73, %if.else51, %if.else50, %if.then47, %if.else38, %if.else37, %if.then34, %if.else22, %if.else, %if.then19
  %51 = load i16, i16* %retval, align 2, !dbg !609
  ret i16 %51, !dbg !609
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mmv_u32_u16_u16_fac1(i32 %mmv, i16 zeroext %measure, i16 zeroext %crlc) #0 !dbg !610 {
entry:
  %retval = alloca i32, align 4
  %mmv.addr = alloca i32, align 4
  %measure.addr = alloca i16, align 2
  %crlc.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %mmv, i32* %mmv.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %mmv.addr, metadata !613, metadata !DIExpression()), !dbg !614
  store i16 %measure, i16* %measure.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %measure.addr, metadata !615, metadata !DIExpression()), !dbg !616
  store i16 %crlc, i16* %crlc.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %crlc.addr, metadata !617, metadata !DIExpression()), !dbg !618
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !619, metadata !DIExpression()), !dbg !620
  store i32 -1, i32* %u32Temp1, align 4, !dbg !620
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !621, metadata !DIExpression()), !dbg !622
  store i32 -1, i32* %u32Temp2, align 4, !dbg !622
  %0 = load i32, i32* %mmv.addr, align 4, !dbg !623
  %shr = lshr i32 %0, 16, !dbg !624
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !625
  %1 = load i16, i16* %measure.addr, align 2, !dbg !626
  %conv = zext i16 %1 to i32, !dbg !626
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !627
  %sub = sub i32 %conv, %2, !dbg !628
  store i32 %sub, i32* %u32Temp2, align 4, !dbg !629
  %3 = load i32, i32* %u32Temp2, align 4, !dbg !630
  %cmp = icmp ne i32 %3, 0, !dbg !632
  br i1 %cmp, label %if.then, label %if.else12, !dbg !633

if.then:                                          ; preds = %entry
  %4 = load i16, i16* %measure.addr, align 2, !dbg !634
  %conv2 = zext i16 %4 to i32, !dbg !634
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !637
  %cmp3 = icmp ult i32 %conv2, %5, !dbg !638
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !639

if.then5:                                         ; preds = %if.then
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !640
  %7 = load i16, i16* %measure.addr, align 2, !dbg !642
  %conv6 = zext i16 %7 to i32, !dbg !643
  %sub7 = sub i32 %6, %conv6, !dbg !644
  store i32 %sub7, i32* %u32Temp1, align 4, !dbg !645
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !646
  %9 = load i16, i16* %crlc.addr, align 2, !dbg !647
  %conv8 = zext i16 %9 to i32, !dbg !647
  %mul = mul i32 %8, %conv8, !dbg !648
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !649
  %10 = load i32, i32* %mmv.addr, align 4, !dbg !650
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !651
  %sub9 = sub i32 %10, %11, !dbg !652
  store i32 %sub9, i32* %u32Temp1, align 4, !dbg !653
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !654
  store i32 %12, i32* %retval, align 4, !dbg !655
  br label %return, !dbg !655

if.else:                                          ; preds = %if.then
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !656
  %14 = load i16, i16* %crlc.addr, align 2, !dbg !658
  %conv10 = zext i16 %14 to i32, !dbg !659
  %mul11 = mul i32 %13, %conv10, !dbg !660
  store i32 %mul11, i32* %u32Temp1, align 4, !dbg !661
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !662
  %16 = load i32, i32* %mmv.addr, align 4, !dbg !663
  %add = add i32 %15, %16, !dbg !664
  store i32 %add, i32* %u32Temp1, align 4, !dbg !665
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !666
  store i32 %17, i32* %retval, align 4, !dbg !667
  br label %return, !dbg !667

if.else12:                                        ; preds = %entry
  %18 = load i32, i32* %mmv.addr, align 4, !dbg !668
  %and = and i32 %18, -65536, !dbg !670
  %add13 = add i32 %and, 32768, !dbg !671
  store i32 %add13, i32* %u32Temp1, align 4, !dbg !672
  %19 = load i32, i32* %u32Temp1, align 4, !dbg !673
  store i32 %19, i32* %retval, align 4, !dbg !674
  br label %return, !dbg !674

return:                                           ; preds = %if.else12, %if.else, %if.then5
  %20 = load i32, i32* %retval, align 4, !dbg !675
  ret i32 %20, !dbg !675
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mmv_s16_s16_u16_fac1(i16 signext %mmv, i16 signext %measure, i16 zeroext %crlc) #0 !dbg !676 {
entry:
  %retval = alloca i16, align 2
  %mmv.addr = alloca i16, align 2
  %measure.addr = alloca i16, align 2
  %crlc.addr = alloca i16, align 2
  %s32measure = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %mmv, i16* %mmv.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %mmv.addr, metadata !679, metadata !DIExpression()), !dbg !680
  store i16 %measure, i16* %measure.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %measure.addr, metadata !681, metadata !DIExpression()), !dbg !682
  store i16 %crlc, i16* %crlc.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %crlc.addr, metadata !683, metadata !DIExpression()), !dbg !684
  call void @llvm.dbg.declare(metadata i32* %s32measure, metadata !685, metadata !DIExpression()), !dbg !686
  store i32 0, i32* %s32measure, align 4, !dbg !686
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !687, metadata !DIExpression()), !dbg !688
  store i32 0, i32* %s32Temp1, align 4, !dbg !688
  %0 = load i16, i16* %measure.addr, align 2, !dbg !689
  %conv = sext i16 %0 to i32, !dbg !689
  %1 = load i16, i16* %mmv.addr, align 2, !dbg !691
  %conv1 = sext i16 %1 to i32, !dbg !691
  %cmp = icmp slt i32 %conv, %conv1, !dbg !692
  br i1 %cmp, label %if.then, label %if.else27, !dbg !693

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %mmv.addr, align 2, !dbg !694
  %conv3 = sext i16 %2 to i32, !dbg !694
  %3 = load i16, i16* %measure.addr, align 2, !dbg !696
  %conv4 = sext i16 %3 to i32, !dbg !696
  %sub = sub nsw i32 %conv3, %conv4, !dbg !697
  store i32 %sub, i32* %s32measure, align 4, !dbg !698
  %4 = load i32, i32* %s32measure, align 4, !dbg !699
  %5 = load i16, i16* %crlc.addr, align 2, !dbg !700
  %conv5 = zext i16 %5 to i32, !dbg !700
  %mul = mul i32 %4, %conv5, !dbg !701
  store i32 %mul, i32* %s32measure, align 4, !dbg !702
  %6 = load i32, i32* %s32measure, align 4, !dbg !703
  %shr = lshr i32 %6, 16, !dbg !704
  store i32 %shr, i32* %s32Temp1, align 4, !dbg !705
  %7 = load i32, i32* %s32measure, align 4, !dbg !706
  %and = and i32 %7, 32768, !dbg !707
  %shr6 = lshr i32 %and, 15, !dbg !708
  %conv7 = trunc i32 %shr6 to i16, !dbg !709
  store i16 %conv7, i16* %crlc.addr, align 2, !dbg !710
  %8 = load i32, i32* %s32measure, align 4, !dbg !711
  %cmp8 = icmp ugt i32 %8, 32767, !dbg !713
  br i1 %cmp8, label %if.then10, label %if.else, !dbg !714

if.then10:                                        ; preds = %if.then
  %9 = load i16, i16* %mmv.addr, align 2, !dbg !715
  %conv11 = sext i16 %9 to i32, !dbg !715
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !717
  %11 = load i16, i16* %crlc.addr, align 2, !dbg !718
  %conv12 = zext i16 %11 to i32, !dbg !718
  %add = add i32 %10, %conv12, !dbg !719
  %sub13 = sub i32 %conv11, %add, !dbg !720
  %conv14 = trunc i32 %sub13 to i16, !dbg !721
  store i16 %conv14, i16* %retval, align 2, !dbg !722
  br label %return, !dbg !722

if.else:                                          ; preds = %if.then
  %12 = load i32, i32* %s32measure, align 4, !dbg !723
  %cmp15 = icmp eq i32 %12, 0, !dbg !726
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !727

if.then17:                                        ; preds = %if.else
  %13 = load i16, i16* %mmv.addr, align 2, !dbg !728
  %conv18 = sext i16 %13 to i32, !dbg !728
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !730
  %15 = load i16, i16* %crlc.addr, align 2, !dbg !731
  %conv19 = zext i16 %15 to i32, !dbg !731
  %add20 = add i32 %14, %conv19, !dbg !732
  %sub21 = sub i32 %conv18, %add20, !dbg !733
  %conv22 = trunc i32 %sub21 to i16, !dbg !734
  store i16 %conv22, i16* %retval, align 2, !dbg !735
  br label %return, !dbg !735

if.else23:                                        ; preds = %if.else
  %16 = load i16, i16* %mmv.addr, align 2, !dbg !736
  %conv24 = sext i16 %16 to i32, !dbg !736
  %sub25 = sub nsw i32 %conv24, 1, !dbg !738
  %conv26 = trunc i32 %sub25 to i16, !dbg !739
  store i16 %conv26, i16* %retval, align 2, !dbg !740
  br label %return, !dbg !740

if.else27:                                        ; preds = %entry
  %17 = load i16, i16* %measure.addr, align 2, !dbg !741
  %conv28 = sext i16 %17 to i32, !dbg !741
  %18 = load i16, i16* %mmv.addr, align 2, !dbg !743
  %conv29 = sext i16 %18 to i32, !dbg !743
  %sub30 = sub nsw i32 %conv28, %conv29, !dbg !744
  store i32 %sub30, i32* %s32measure, align 4, !dbg !745
  %19 = load i32, i32* %s32measure, align 4, !dbg !746
  %20 = load i16, i16* %crlc.addr, align 2, !dbg !747
  %conv31 = zext i16 %20 to i32, !dbg !747
  %mul32 = mul i32 %19, %conv31, !dbg !748
  store i32 %mul32, i32* %s32measure, align 4, !dbg !749
  %21 = load i32, i32* %s32measure, align 4, !dbg !750
  %shr33 = lshr i32 %21, 16, !dbg !751
  store i32 %shr33, i32* %s32Temp1, align 4, !dbg !752
  %22 = load i32, i32* %s32measure, align 4, !dbg !753
  %and34 = and i32 %22, 32768, !dbg !754
  %shr35 = lshr i32 %and34, 15, !dbg !755
  %conv36 = trunc i32 %shr35 to i16, !dbg !756
  store i16 %conv36, i16* %crlc.addr, align 2, !dbg !757
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !758
  %24 = load i16, i16* %crlc.addr, align 2, !dbg !760
  %conv37 = zext i16 %24 to i32, !dbg !760
  %add38 = add i32 %23, %conv37, !dbg !761
  %cmp39 = icmp ne i32 %add38, 0, !dbg !762
  br i1 %cmp39, label %if.then41, label %if.else47, !dbg !763

if.then41:                                        ; preds = %if.else27
  %25 = load i16, i16* %mmv.addr, align 2, !dbg !764
  %conv42 = sext i16 %25 to i32, !dbg !764
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !766
  %27 = load i16, i16* %crlc.addr, align 2, !dbg !767
  %conv43 = zext i16 %27 to i32, !dbg !767
  %add44 = add i32 %26, %conv43, !dbg !768
  %add45 = add i32 %conv42, %add44, !dbg !769
  %conv46 = trunc i32 %add45 to i16, !dbg !770
  store i16 %conv46, i16* %retval, align 2, !dbg !771
  br label %return, !dbg !771

if.else47:                                        ; preds = %if.else27
  %28 = load i32, i32* %s32measure, align 4, !dbg !772
  %cmp48 = icmp eq i32 %28, 0, !dbg !775
  br i1 %cmp48, label %if.then50, label %if.else56, !dbg !776

if.then50:                                        ; preds = %if.else47
  %29 = load i16, i16* %mmv.addr, align 2, !dbg !777
  %conv51 = sext i16 %29 to i32, !dbg !777
  %30 = load i32, i32* %s32Temp1, align 4, !dbg !779
  %31 = load i16, i16* %crlc.addr, align 2, !dbg !780
  %conv52 = zext i16 %31 to i32, !dbg !780
  %add53 = add i32 %30, %conv52, !dbg !781
  %add54 = add i32 %conv51, %add53, !dbg !782
  %conv55 = trunc i32 %add54 to i16, !dbg !783
  store i16 %conv55, i16* %retval, align 2, !dbg !784
  br label %return, !dbg !784

if.else56:                                        ; preds = %if.else47
  %32 = load i16, i16* %mmv.addr, align 2, !dbg !785
  %conv57 = sext i16 %32 to i32, !dbg !785
  %add58 = add nsw i32 %conv57, 1, !dbg !787
  %conv59 = trunc i32 %add58 to i16, !dbg !788
  store i16 %conv59, i16* %retval, align 2, !dbg !789
  br label %return, !dbg !789

return:                                           ; preds = %if.else56, %if.then50, %if.then41, %if.else23, %if.then17, %if.then10
  %33 = load i16, i16* %retval, align 2, !dbg !790
  ret i16 %33, !dbg !790
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mmv_s32_s16_u16_fac1(i32 %mmv, i16 signext %measure, i16 zeroext %crlc) #0 !dbg !791 {
entry:
  %retval = alloca i32, align 4
  %mmv.addr = alloca i32, align 4
  %measure.addr = alloca i16, align 2
  %crlc.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i32 %mmv, i32* %mmv.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %mmv.addr, metadata !794, metadata !DIExpression()), !dbg !795
  store i16 %measure, i16* %measure.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %measure.addr, metadata !796, metadata !DIExpression()), !dbg !797
  store i16 %crlc, i16* %crlc.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %crlc.addr, metadata !798, metadata !DIExpression()), !dbg !799
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !800, metadata !DIExpression()), !dbg !801
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !802, metadata !DIExpression()), !dbg !803
  %0 = load i32, i32* %mmv.addr, align 4, !dbg !804
  %shr = ashr i32 %0, 16, !dbg !805
  store i32 %shr, i32* %s32Temp1, align 4, !dbg !806
  %1 = load i32, i32* %s32Temp1, align 4, !dbg !807
  %2 = load i16, i16* %measure.addr, align 2, !dbg !809
  %conv = sext i16 %2 to i32, !dbg !809
  %cmp = icmp ne i32 %1, %conv, !dbg !810
  br i1 %cmp, label %if.then, label %if.else13, !dbg !811

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !812
  %4 = load i16, i16* %measure.addr, align 2, !dbg !815
  %conv2 = sext i16 %4 to i32, !dbg !815
  %cmp3 = icmp sge i32 %3, %conv2, !dbg !816
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !817

if.then5:                                         ; preds = %if.then
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !818
  %6 = load i16, i16* %measure.addr, align 2, !dbg !820
  %conv6 = sext i16 %6 to i32, !dbg !820
  %sub = sub nsw i32 %5, %conv6, !dbg !821
  store i32 %sub, i32* %s32Temp2, align 4, !dbg !822
  %7 = load i32, i32* %s32Temp2, align 4, !dbg !823
  %8 = load i16, i16* %crlc.addr, align 2, !dbg !824
  %conv7 = zext i16 %8 to i32, !dbg !825
  %mul = mul nsw i32 %7, %conv7, !dbg !826
  store i32 %mul, i32* %s32Temp2, align 4, !dbg !827
  %9 = load i32, i32* %mmv.addr, align 4, !dbg !828
  %10 = load i32, i32* %s32Temp2, align 4, !dbg !829
  %sub8 = sub nsw i32 %9, %10, !dbg !830
  store i32 %sub8, i32* %retval, align 4, !dbg !831
  br label %return, !dbg !831

if.else:                                          ; preds = %if.then
  %11 = load i16, i16* %measure.addr, align 2, !dbg !832
  %conv9 = sext i16 %11 to i32, !dbg !832
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !834
  %sub10 = sub nsw i32 %conv9, %12, !dbg !835
  store i32 %sub10, i32* %s32Temp2, align 4, !dbg !836
  %13 = load i32, i32* %s32Temp2, align 4, !dbg !837
  %14 = load i16, i16* %crlc.addr, align 2, !dbg !838
  %conv11 = zext i16 %14 to i32, !dbg !839
  %mul12 = mul nsw i32 %13, %conv11, !dbg !840
  store i32 %mul12, i32* %s32Temp2, align 4, !dbg !841
  %15 = load i32, i32* %mmv.addr, align 4, !dbg !842
  %16 = load i32, i32* %s32Temp2, align 4, !dbg !843
  %add = add nsw i32 %15, %16, !dbg !844
  store i32 %add, i32* %retval, align 4, !dbg !845
  br label %return, !dbg !845

if.else13:                                        ; preds = %entry
  %17 = load i32, i32* %mmv.addr, align 4, !dbg !846
  %and = and i32 %17, -65536, !dbg !848
  store i32 %and, i32* %s32Temp2, align 4, !dbg !849
  %18 = load i32, i32* %s32Temp2, align 4, !dbg !850
  %or = or i32 %18, 32768, !dbg !851
  store i32 %or, i32* %retval, align 4, !dbg !852
  br label %return, !dbg !852

return:                                           ; preds = %if.else13, %if.else, %if.then5
  %19 = load i32, i32* %retval, align 4, !dbg !853
  ret i32 %19, !dbg !853
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_calc_av_u16_u16(i16 zeroext %x_val, i16 zeroext %y_val) #0 !dbg !854 {
entry:
  %retval = alloca i16, align 2
  %x_val.addr = alloca i16, align 2
  %y_val.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %x_val, i16* %x_val.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_val.addr, metadata !857, metadata !DIExpression()), !dbg !858
  store i16 %y_val, i16* %y_val.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_val.addr, metadata !859, metadata !DIExpression()), !dbg !860
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !861, metadata !DIExpression()), !dbg !862
  %0 = load i16, i16* %x_val.addr, align 2, !dbg !863
  %conv = zext i16 %0 to i32, !dbg !863
  store i32 %conv, i32* %u32Temp1, align 4, !dbg !862
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !864, metadata !DIExpression()), !dbg !865
  %1 = load i16, i16* %y_val.addr, align 2, !dbg !866
  %conv1 = zext i16 %1 to i32, !dbg !866
  store i32 %conv1, i32* %u32Temp2, align 4, !dbg !865
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !867, metadata !DIExpression()), !dbg !868
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !869
  %3 = load i32, i32* %u32Temp2, align 4, !dbg !870
  %add = add i32 %2, %3, !dbg !871
  store i32 %add, i32* %u32Temp1, align 4, !dbg !872
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !873
  %add2 = add i32 %4, 1, !dbg !874
  store i32 %add2, i32* %u32Temp2, align 4, !dbg !875
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !876
  %and = and i32 %5, 1, !dbg !877
  store i32 %and, i32* %u32Temp3, align 4, !dbg !878
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !879
  %cmp = icmp eq i32 %6, 0, !dbg !881
  br i1 %cmp, label %if.then, label %if.else, !dbg !882

if.then:                                          ; preds = %entry
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !883
  %call = call i32 @rotateRight(i32 %7, i32 1), !dbg !885
  %and4 = and i32 %call, 65535, !dbg !886
  %conv5 = trunc i32 %and4 to i16, !dbg !887
  store i16 %conv5, i16* %retval, align 2, !dbg !888
  br label %return, !dbg !888

if.else:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !889
  store i32 %8, i32* %u32Temp1, align 4, !dbg !891
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !892
  %call6 = call i32 @rotateRight(i32 %9, i32 1), !dbg !893
  %and7 = and i32 %call6, 65535, !dbg !894
  %conv8 = trunc i32 %and7 to i16, !dbg !895
  store i16 %conv8, i16* %retval, align 2, !dbg !896
  br label %return, !dbg !896

return:                                           ; preds = %if.else, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !897
  ret i16 %10, !dbg !897
}

declare dso_local i32 @rotateRight(i32, i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mmv_u16_u16_u16_fac1(i16 zeroext %mmv, i16 zeroext %measure, i16 zeroext %crlc) #0 !dbg !898 {
entry:
  %retval = alloca i16, align 2
  %mmv.addr = alloca i16, align 2
  %measure.addr = alloca i16, align 2
  %crlc.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %mmv, i16* %mmv.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %mmv.addr, metadata !899, metadata !DIExpression()), !dbg !900
  store i16 %measure, i16* %measure.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %measure.addr, metadata !901, metadata !DIExpression()), !dbg !902
  store i16 %crlc, i16* %crlc.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %crlc.addr, metadata !903, metadata !DIExpression()), !dbg !904
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !905, metadata !DIExpression()), !dbg !906
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !907, metadata !DIExpression()), !dbg !908
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !909, metadata !DIExpression()), !dbg !910
  %0 = load i16, i16* %measure.addr, align 2, !dbg !911
  %conv = zext i16 %0 to i32, !dbg !911
  %1 = load i16, i16* %mmv.addr, align 2, !dbg !913
  %conv1 = zext i16 %1 to i32, !dbg !913
  %cmp = icmp slt i32 %conv, %conv1, !dbg !914
  br i1 %cmp, label %if.then, label %if.else28, !dbg !915

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %mmv.addr, align 2, !dbg !916
  %conv3 = zext i16 %2 to i32, !dbg !916
  %3 = load i16, i16* %measure.addr, align 2, !dbg !918
  %conv4 = zext i16 %3 to i32, !dbg !918
  %sub = sub nsw i32 %conv3, %conv4, !dbg !919
  %conv5 = trunc i32 %sub to i16, !dbg !916
  store i16 %conv5, i16* %measure.addr, align 2, !dbg !920
  %4 = load i16, i16* %measure.addr, align 2, !dbg !921
  %conv6 = zext i16 %4 to i32, !dbg !921
  %5 = load i16, i16* %crlc.addr, align 2, !dbg !922
  %conv7 = zext i16 %5 to i32, !dbg !922
  %mul = mul nsw i32 %conv6, %conv7, !dbg !923
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !924
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !925
  %shr = lshr i32 %6, 16, !dbg !926
  %conv8 = trunc i32 %shr to i16, !dbg !927
  %conv9 = zext i16 %conv8 to i32, !dbg !927
  store i32 %conv9, i32* %u32Temp2, align 4, !dbg !928
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !929
  %and = and i32 %7, 32768, !dbg !930
  %shr10 = lshr i32 %and, 15, !dbg !931
  store i32 %shr10, i32* %u32Temp3, align 4, !dbg !932
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !933
  %9 = load i32, i32* %u32Temp3, align 4, !dbg !934
  %add = add i32 %8, %9, !dbg !935
  store i32 %add, i32* %u32Temp2, align 4, !dbg !936
  %10 = load i32, i32* %u32Temp2, align 4, !dbg !937
  %cmp11 = icmp ne i32 %10, 0, !dbg !939
  br i1 %cmp11, label %if.then13, label %if.else, !dbg !940

if.then13:                                        ; preds = %if.then
  %11 = load i16, i16* %mmv.addr, align 2, !dbg !941
  %conv14 = zext i16 %11 to i32, !dbg !941
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !943
  %sub15 = sub i32 %conv14, %12, !dbg !944
  %conv16 = trunc i32 %sub15 to i16, !dbg !945
  store i16 %conv16, i16* %retval, align 2, !dbg !946
  br label %return, !dbg !946

if.else:                                          ; preds = %if.then
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !947
  %cmp17 = icmp eq i32 %13, 0, !dbg !950
  br i1 %cmp17, label %if.then19, label %if.else23, !dbg !951

if.then19:                                        ; preds = %if.else
  %14 = load i16, i16* %mmv.addr, align 2, !dbg !952
  %conv20 = zext i16 %14 to i32, !dbg !952
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !954
  %sub21 = sub i32 %conv20, %15, !dbg !955
  %conv22 = trunc i32 %sub21 to i16, !dbg !956
  store i16 %conv22, i16* %retval, align 2, !dbg !957
  br label %return, !dbg !957

if.else23:                                        ; preds = %if.else
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !958
  %mul24 = mul i32 %16, 65535, !dbg !960
  store i32 %mul24, i32* %u32Temp2, align 4, !dbg !961
  %17 = load i16, i16* %mmv.addr, align 2, !dbg !962
  %conv25 = zext i16 %17 to i32, !dbg !962
  %18 = load i32, i32* %u32Temp2, align 4, !dbg !963
  %add26 = add i32 %conv25, %18, !dbg !964
  %conv27 = trunc i32 %add26 to i16, !dbg !965
  store i16 %conv27, i16* %retval, align 2, !dbg !966
  br label %return, !dbg !966

if.else28:                                        ; preds = %entry
  %19 = load i16, i16* %measure.addr, align 2, !dbg !967
  %conv29 = zext i16 %19 to i32, !dbg !967
  %20 = load i16, i16* %mmv.addr, align 2, !dbg !969
  %conv30 = zext i16 %20 to i32, !dbg !969
  %sub31 = sub nsw i32 %conv29, %conv30, !dbg !970
  %conv32 = trunc i32 %sub31 to i16, !dbg !967
  store i16 %conv32, i16* %measure.addr, align 2, !dbg !971
  %21 = load i16, i16* %measure.addr, align 2, !dbg !972
  %conv33 = zext i16 %21 to i32, !dbg !972
  %22 = load i16, i16* %crlc.addr, align 2, !dbg !973
  %conv34 = zext i16 %22 to i32, !dbg !973
  %mul35 = mul nsw i32 %conv33, %conv34, !dbg !974
  store i32 %mul35, i32* %u32Temp1, align 4, !dbg !975
  %23 = load i32, i32* %u32Temp1, align 4, !dbg !976
  %shr36 = lshr i32 %23, 16, !dbg !977
  store i32 %shr36, i32* %u32Temp2, align 4, !dbg !978
  %24 = load i32, i32* %u32Temp1, align 4, !dbg !979
  %and37 = and i32 %24, 32768, !dbg !980
  %shr38 = lshr i32 %and37, 15, !dbg !981
  store i32 %shr38, i32* %u32Temp3, align 4, !dbg !982
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !983
  %26 = load i32, i32* %u32Temp3, align 4, !dbg !984
  %add39 = add i32 %25, %26, !dbg !985
  store i32 %add39, i32* %u32Temp2, align 4, !dbg !986
  %27 = load i32, i32* %u32Temp2, align 4, !dbg !987
  %cmp40 = icmp ne i32 %27, 0, !dbg !989
  br i1 %cmp40, label %if.then42, label %if.else46, !dbg !990

if.then42:                                        ; preds = %if.else28
  %28 = load i16, i16* %mmv.addr, align 2, !dbg !991
  %conv43 = zext i16 %28 to i32, !dbg !991
  %29 = load i32, i32* %u32Temp2, align 4, !dbg !993
  %add44 = add i32 %conv43, %29, !dbg !994
  %conv45 = trunc i32 %add44 to i16, !dbg !995
  store i16 %conv45, i16* %retval, align 2, !dbg !996
  br label %return, !dbg !996

if.else46:                                        ; preds = %if.else28
  %30 = load i32, i32* %u32Temp1, align 4, !dbg !997
  %cmp47 = icmp eq i32 %30, 0, !dbg !1000
  br i1 %cmp47, label %if.then49, label %if.else53, !dbg !1001

if.then49:                                        ; preds = %if.else46
  %31 = load i16, i16* %mmv.addr, align 2, !dbg !1002
  %conv50 = zext i16 %31 to i32, !dbg !1002
  %32 = load i32, i32* %u32Temp2, align 4, !dbg !1004
  %add51 = add i32 %conv50, %32, !dbg !1005
  %conv52 = trunc i32 %add51 to i16, !dbg !1006
  store i16 %conv52, i16* %retval, align 2, !dbg !1007
  br label %return, !dbg !1007

if.else53:                                        ; preds = %if.else46
  %33 = load i16, i16* %mmv.addr, align 2, !dbg !1008
  %conv54 = zext i16 %33 to i32, !dbg !1008
  %add55 = add nsw i32 %conv54, 1, !dbg !1010
  %conv56 = trunc i32 %add55 to i16, !dbg !1011
  store i16 %conv56, i16* %retval, align 2, !dbg !1012
  br label %return, !dbg !1012

return:                                           ; preds = %if.else53, %if.then49, %if.then42, %if.else23, %if.then19, %if.then13
  %34 = load i16, i16* %retval, align 2, !dbg !1013
  ret i16 %34, !dbg !1013
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mmv_u32_u32_u32_fac1(i32 %mmv, i32 %measure, i32 %crlc) #0 !dbg !1014 {
entry:
  %retval = alloca i32, align 4
  %mmv.addr = alloca i32, align 4
  %measure.addr = alloca i32, align 4
  %crlc.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32Result1 = alloca i32, align 4
  %u32Result2 = alloca i32, align 4
  store i32 %mmv, i32* %mmv.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %mmv.addr, metadata !1017, metadata !DIExpression()), !dbg !1018
  store i32 %measure, i32* %measure.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %measure.addr, metadata !1019, metadata !DIExpression()), !dbg !1020
  store i32 %crlc, i32* %crlc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %crlc.addr, metadata !1021, metadata !DIExpression()), !dbg !1022
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1023, metadata !DIExpression()), !dbg !1024
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1025, metadata !DIExpression()), !dbg !1026
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1027, metadata !DIExpression()), !dbg !1028
  call void @llvm.dbg.declare(metadata i32* %u32Result1, metadata !1029, metadata !DIExpression()), !dbg !1030
  call void @llvm.dbg.declare(metadata i32* %u32Result2, metadata !1031, metadata !DIExpression()), !dbg !1032
  %0 = load i32, i32* %measure.addr, align 4, !dbg !1033
  %1 = load i32, i32* %mmv.addr, align 4, !dbg !1035
  %cmp = icmp ult i32 %0, %1, !dbg !1036
  br i1 %cmp, label %if.then, label %if.else9, !dbg !1037

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %mmv.addr, align 4, !dbg !1038
  %3 = load i32, i32* %measure.addr, align 4, !dbg !1040
  %sub = sub i32 %2, %3, !dbg !1041
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1042
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1043
  %5 = load i32, i32* %crlc.addr, align 4, !dbg !1044
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !1045
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1046
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1047
  %7 = load i32, i32* %crlc.addr, align 4, !dbg !1048
  %call1 = call i32 @MulLowWord(i32 %6, i32 %7), !dbg !1049
  store i32 %call1, i32* %u32Temp3, align 4, !dbg !1050
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1051
  %cmp2 = icmp ule i32 %8, 2147483647, !dbg !1053
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !1054

if.then3:                                         ; preds = %if.then
  %9 = load i32, i32* %mmv.addr, align 4, !dbg !1055
  %10 = load i32, i32* %u32Temp2, align 4, !dbg !1057
  %sub4 = sub i32 %9, %10, !dbg !1058
  store i32 %sub4, i32* %u32Result1, align 4, !dbg !1059
  br label %if.end, !dbg !1060

if.else:                                          ; preds = %if.then
  %11 = load i32, i32* %mmv.addr, align 4, !dbg !1061
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1063
  %add = add i32 %12, 1, !dbg !1064
  %sub5 = sub i32 %11, %add, !dbg !1065
  store i32 %sub5, i32* %u32Result1, align 4, !dbg !1066
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then3
  %13 = load i32, i32* %u32Result1, align 4, !dbg !1067
  %14 = load i32, i32* %mmv.addr, align 4, !dbg !1069
  %cmp6 = icmp eq i32 %13, %14, !dbg !1070
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1071

if.then7:                                         ; preds = %if.end
  %15 = load i32, i32* %u32Result1, align 4, !dbg !1072
  store i32 %15, i32* %retval, align 4, !dbg !1074
  br label %return, !dbg !1074

if.else8:                                         ; preds = %if.end
  %16 = load i32, i32* %u32Result1, align 4, !dbg !1075
  store i32 %16, i32* %retval, align 4, !dbg !1077
  br label %return, !dbg !1077

if.else9:                                         ; preds = %entry
  %17 = load i32, i32* %measure.addr, align 4, !dbg !1078
  %18 = load i32, i32* %mmv.addr, align 4, !dbg !1080
  %sub10 = sub i32 %17, %18, !dbg !1081
  store i32 %sub10, i32* %u32Temp1, align 4, !dbg !1082
  %19 = load i32, i32* %u32Temp1, align 4, !dbg !1083
  %20 = load i32, i32* %crlc.addr, align 4, !dbg !1084
  %call11 = call i32 @MulHighWord(i32 %19, i32 %20), !dbg !1085
  %neg = xor i32 %call11, -1, !dbg !1086
  %add12 = add i32 %neg, 1, !dbg !1087
  store i32 %add12, i32* %u32Temp2, align 4, !dbg !1088
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1089
  %22 = load i32, i32* %crlc.addr, align 4, !dbg !1090
  %call13 = call i32 @MulLowWord(i32 %21, i32 %22), !dbg !1091
  store i32 %call13, i32* %u32Temp3, align 4, !dbg !1092
  %23 = load i32, i32* %u32Temp2, align 4, !dbg !1093
  %24 = load i32, i32* %mmv.addr, align 4, !dbg !1094
  %sub14 = sub i32 %23, %24, !dbg !1095
  store i32 %sub14, i32* %u32Result1, align 4, !dbg !1096
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !1097
  %cmp15 = icmp ule i32 %25, 2147483647, !dbg !1099
  br i1 %cmp15, label %if.then16, label %if.else21, !dbg !1100

if.then16:                                        ; preds = %if.else9
  %26 = load i32, i32* %mmv.addr, align 4, !dbg !1101
  %neg17 = xor i32 %26, -1, !dbg !1103
  %add18 = add i32 %neg17, 1, !dbg !1104
  %27 = load i32, i32* %u32Temp2, align 4, !dbg !1105
  %add19 = add i32 %27, 1, !dbg !1106
  %add20 = add i32 %add18, %add19, !dbg !1107
  store i32 %add20, i32* %u32Result1, align 4, !dbg !1108
  br label %if.end25, !dbg !1109

if.else21:                                        ; preds = %if.else9
  %28 = load i32, i32* %mmv.addr, align 4, !dbg !1110
  %sub22 = sub i32 0, %28, !dbg !1112
  %29 = load i32, i32* %u32Temp2, align 4, !dbg !1113
  %sub23 = sub i32 %29, 1, !dbg !1114
  %add24 = add i32 %sub22, %sub23, !dbg !1115
  store i32 %add24, i32* %u32Result1, align 4, !dbg !1116
  br label %if.end25

if.end25:                                         ; preds = %if.else21, %if.then16
  %30 = load i32, i32* %u32Result1, align 4, !dbg !1117
  %neg26 = xor i32 %30, -1, !dbg !1118
  %add27 = add i32 %neg26, 1, !dbg !1119
  store i32 %add27, i32* %retval, align 4, !dbg !1120
  br label %return, !dbg !1120

return:                                           ; preds = %if.end25, %if.else8, %if.then7
  %31 = load i32, i32* %retval, align 4, !dbg !1121
  ret i32 %31, !dbg !1121
}

declare dso_local i32 @MulHighWord(i32, i32) #2

declare dso_local i32 @MulLowWord(i32, i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mmv_u32_u32_u16_fac1(i32 %mmv, i32 %measure, i16 zeroext %crlc) #0 !dbg !1122 {
entry:
  %retval = alloca i32, align 4
  %mmv.addr = alloca i32, align 4
  %measure.addr = alloca i32, align 4
  %crlc.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32crlc = alloca i32, align 4
  %u32Result1 = alloca i32, align 4
  store i32 %mmv, i32* %mmv.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %mmv.addr, metadata !1125, metadata !DIExpression()), !dbg !1126
  store i32 %measure, i32* %measure.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %measure.addr, metadata !1127, metadata !DIExpression()), !dbg !1128
  store i16 %crlc, i16* %crlc.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %crlc.addr, metadata !1129, metadata !DIExpression()), !dbg !1130
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1131, metadata !DIExpression()), !dbg !1132
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1133, metadata !DIExpression()), !dbg !1134
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1135, metadata !DIExpression()), !dbg !1136
  call void @llvm.dbg.declare(metadata i32* %u32crlc, metadata !1137, metadata !DIExpression()), !dbg !1138
  call void @llvm.dbg.declare(metadata i32* %u32Result1, metadata !1139, metadata !DIExpression()), !dbg !1140
  %0 = load i16, i16* %crlc.addr, align 2, !dbg !1141
  %conv = zext i16 %0 to i32, !dbg !1142
  store i32 %conv, i32* %u32crlc, align 4, !dbg !1143
  %1 = load i32, i32* %mmv.addr, align 4, !dbg !1144
  %2 = load i32, i32* %measure.addr, align 4, !dbg !1146
  %cmp = icmp uge i32 %1, %2, !dbg !1147
  br i1 %cmp, label %if.then, label %if.else14, !dbg !1148

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %mmv.addr, align 4, !dbg !1149
  %4 = load i32, i32* %measure.addr, align 4, !dbg !1151
  %sub = sub i32 %3, %4, !dbg !1152
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1153
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1154
  %6 = load i32, i32* %u32crlc, align 4, !dbg !1155
  %call = call i32 @MulHighWord(i32 %5, i32 %6), !dbg !1156
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1157
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1158
  %8 = load i32, i32* %u32crlc, align 4, !dbg !1159
  %call2 = call i32 @MulLowWord(i32 %7, i32 %8), !dbg !1160
  store i32 %call2, i32* %u32Temp3, align 4, !dbg !1161
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1162
  %shl = shl i32 %9, 16, !dbg !1163
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !1164
  %and = and i32 %10, -65536, !dbg !1165
  %shr = lshr i32 %and, 16, !dbg !1166
  %or = or i32 %shl, %shr, !dbg !1167
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1168
  %11 = load i32, i32* %u32Temp3, align 4, !dbg !1169
  %and3 = and i32 %11, 65535, !dbg !1171
  %cmp4 = icmp ule i32 %and3, 32767, !dbg !1172
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1173

if.then6:                                         ; preds = %if.then
  %12 = load i32, i32* %mmv.addr, align 4, !dbg !1174
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1176
  %sub7 = sub i32 %12, %13, !dbg !1177
  store i32 %sub7, i32* %u32Result1, align 4, !dbg !1178
  br label %if.end, !dbg !1179

if.else:                                          ; preds = %if.then
  %14 = load i32, i32* %mmv.addr, align 4, !dbg !1180
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !1182
  %add = add i32 %15, 1, !dbg !1183
  %sub8 = sub i32 %14, %add, !dbg !1184
  store i32 %sub8, i32* %u32Result1, align 4, !dbg !1185
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then6
  %16 = load i32, i32* %u32Result1, align 4, !dbg !1186
  %17 = load i32, i32* %mmv.addr, align 4, !dbg !1188
  %cmp9 = icmp eq i32 %16, %17, !dbg !1189
  br i1 %cmp9, label %if.then11, label %if.else13, !dbg !1190

if.then11:                                        ; preds = %if.end
  %18 = load i32, i32* %u32Result1, align 4, !dbg !1191
  %sub12 = sub i32 %18, 1, !dbg !1193
  store i32 %sub12, i32* %retval, align 4, !dbg !1194
  br label %return, !dbg !1194

if.else13:                                        ; preds = %if.end
  %19 = load i32, i32* %u32Result1, align 4, !dbg !1195
  store i32 %19, i32* %retval, align 4, !dbg !1197
  br label %return, !dbg !1197

if.else14:                                        ; preds = %entry
  %20 = load i32, i32* %measure.addr, align 4, !dbg !1198
  %21 = load i32, i32* %mmv.addr, align 4, !dbg !1200
  %sub15 = sub i32 %20, %21, !dbg !1201
  store i32 %sub15, i32* %u32Temp1, align 4, !dbg !1202
  %22 = load i32, i32* %u32Temp1, align 4, !dbg !1203
  %23 = load i16, i16* %crlc.addr, align 2, !dbg !1204
  %conv16 = zext i16 %23 to i32, !dbg !1204
  %call17 = call i32 @MulHighWord(i32 %22, i32 %conv16), !dbg !1205
  store i32 %call17, i32* %u32Temp2, align 4, !dbg !1206
  %24 = load i32, i32* %u32Temp1, align 4, !dbg !1207
  %25 = load i16, i16* %crlc.addr, align 2, !dbg !1208
  %conv18 = zext i16 %25 to i32, !dbg !1208
  %call19 = call i32 @MulLowWord(i32 %24, i32 %conv18), !dbg !1209
  store i32 %call19, i32* %u32Temp3, align 4, !dbg !1210
  %26 = load i32, i32* %u32Temp2, align 4, !dbg !1211
  %shl20 = shl i32 %26, 16, !dbg !1212
  %27 = load i32, i32* %u32Temp3, align 4, !dbg !1213
  %and21 = and i32 %27, -65536, !dbg !1214
  %shr22 = lshr i32 %and21, 16, !dbg !1215
  %or23 = or i32 %shl20, %shr22, !dbg !1216
  %neg = xor i32 %or23, -1, !dbg !1217
  %add24 = add i32 %neg, 1, !dbg !1218
  store i32 %add24, i32* %u32Temp2, align 4, !dbg !1219
  %28 = load i32, i32* %mmv.addr, align 4, !dbg !1220
  %29 = load i32, i32* %u32Temp2, align 4, !dbg !1221
  %sub25 = sub i32 %28, %29, !dbg !1222
  %add26 = add i32 %sub25, 1, !dbg !1223
  store i32 %add26, i32* %u32Result1, align 4, !dbg !1224
  %30 = load i32, i32* %u32Temp3, align 4, !dbg !1225
  %and27 = and i32 %30, 65535, !dbg !1227
  %cmp28 = icmp ule i32 %and27, 32767, !dbg !1228
  %conv29 = zext i1 %cmp28 to i32, !dbg !1228
  %31 = load i32, i32* %u32Temp2, align 4, !dbg !1229
  %and30 = and i32 %31, 65535, !dbg !1230
  %cmp31 = icmp ule i32 %and30, 32767, !dbg !1231
  %conv32 = zext i1 %cmp31 to i32, !dbg !1231
  %or33 = or i32 %conv29, %conv32, !dbg !1232
  %tobool = icmp ne i32 %or33, 0, !dbg !1232
  br i1 %tobool, label %if.then34, label %if.else36, !dbg !1233

if.then34:                                        ; preds = %if.else14
  %32 = load i32, i32* %mmv.addr, align 4, !dbg !1234
  %33 = load i32, i32* %u32Temp2, align 4, !dbg !1236
  %sub35 = sub i32 %32, %33, !dbg !1237
  store i32 %sub35, i32* %u32Result1, align 4, !dbg !1238
  br label %if.end39, !dbg !1239

if.else36:                                        ; preds = %if.else14
  %34 = load i32, i32* %mmv.addr, align 4, !dbg !1240
  %35 = load i32, i32* %u32Temp2, align 4, !dbg !1242
  %sub37 = sub i32 %34, %35, !dbg !1243
  %add38 = add i32 %sub37, 1, !dbg !1244
  store i32 %add38, i32* %u32Result1, align 4, !dbg !1245
  br label %if.end39

if.end39:                                         ; preds = %if.else36, %if.then34
  %36 = load i32, i32* %u32Result1, align 4, !dbg !1246
  store i32 %36, i32* %retval, align 4, !dbg !1247
  br label %return, !dbg !1247

return:                                           ; preds = %if.end39, %if.else13, %if.then11
  %37 = load i32, i32* %retval, align 4, !dbg !1248
  ret i32 %37, !dbg !1248
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mmv_u32_u32_s32_fac1(i32 %mmv, i32 %measure, i32 %crlc) #0 !dbg !1249 {
entry:
  %retval = alloca i32, align 4
  %mmv.addr = alloca i32, align 4
  %measure.addr = alloca i32, align 4
  %crlc.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u32crlc = alloca i32, align 4
  %u32Result1 = alloca i32, align 4
  store i32 %mmv, i32* %mmv.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %mmv.addr, metadata !1252, metadata !DIExpression()), !dbg !1253
  store i32 %measure, i32* %measure.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %measure.addr, metadata !1254, metadata !DIExpression()), !dbg !1255
  store i32 %crlc, i32* %crlc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %crlc.addr, metadata !1256, metadata !DIExpression()), !dbg !1257
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1258, metadata !DIExpression()), !dbg !1259
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1260, metadata !DIExpression()), !dbg !1261
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1262, metadata !DIExpression()), !dbg !1263
  call void @llvm.dbg.declare(metadata i32* %u32crlc, metadata !1264, metadata !DIExpression()), !dbg !1265
  call void @llvm.dbg.declare(metadata i32* %u32Result1, metadata !1266, metadata !DIExpression()), !dbg !1267
  %0 = load i32, i32* %retval, align 4, !dbg !1268
  ret i32 %0, !dbg !1268
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!28, !2}
!llvm.ident = !{!30, !30}
!llvm.module.flags = !{!31, !32, !33, !34, !35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !26, line: 21, type: !27, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !25, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mmv_u16_u16_s16_fac1/alarm_0125/avrg_Ccode_alarm_0125.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mmv_u16_u16_s16_fac1/alarm_0125")
!4 = !{}
!5 = !{!6, !13, !17, !21}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !7, line: 8, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mmv_u16_u16_s16_fac1/alarm_0125")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !9, line: 25, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 40, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!12 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !14, line: 27, baseType: !15)
!14 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 44, baseType: !16)
!16 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !9, line: 26, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !20)
!20 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !14, line: 26, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !24)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !{!0}
!26 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mmv_u16_u16_s16_fac1/alarm_0125")
!27 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!28 = distinct !DICompileUnit(language: DW_LANG_C99, file: !29, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!29 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mmv_u16_u16_s16_fac1/alarm_0125/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mmv_u16_u16_s16_fac1/alarm_0125")
!30 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!31 = !{i32 7, !"Dwarf Version", i32 4}
!32 = !{i32 2, !"Debug Info Version", i32 3}
!33 = !{i32 1, !"wchar_size", i32 4}
!34 = !{i32 7, !"uwtable", i32 1}
!35 = !{i32 7, !"frame-pointer", i32 2}
!36 = distinct !DISubprogram(name: "main", scope: !37, file: !37, line: 7, type: !38, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !28, retainedNodes: !4)
!37 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mmv_u16_u16_s16_fac1/alarm_0125")
!38 = !DISubroutineType(types: !39)
!39 = !{!24}
!40 = !DILocalVariable(name: "mmv", scope: !36, file: !37, line: 9, type: !8)
!41 = !DILocation(line: 9, column: 14, scope: !36)
!42 = !DILocalVariable(name: "measure", scope: !36, file: !37, line: 10, type: !8)
!43 = !DILocation(line: 10, column: 14, scope: !36)
!44 = !DILocalVariable(name: "crlc", scope: !36, file: !37, line: 11, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !14, line: 25, baseType: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !11, line: 39, baseType: !47)
!47 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!48 = !DILocation(line: 11, column: 13, scope: !36)
!49 = !DILocalVariable(name: "result", scope: !36, file: !37, line: 12, type: !8)
!50 = !DILocation(line: 12, column: 14, scope: !36)
!51 = !DILocation(line: 14, column: 24, scope: !36)
!52 = !DILocation(line: 14, column: 5, scope: !36)
!53 = !DILocation(line: 15, column: 24, scope: !36)
!54 = !DILocation(line: 15, column: 5, scope: !36)
!55 = !DILocation(line: 16, column: 24, scope: !36)
!56 = !DILocation(line: 16, column: 5, scope: !36)
!57 = !DILocation(line: 18, column: 39, scope: !36)
!58 = !DILocation(line: 18, column: 44, scope: !36)
!59 = !DILocation(line: 18, column: 53, scope: !36)
!60 = !DILocation(line: 18, column: 14, scope: !36)
!61 = !DILocation(line: 18, column: 12, scope: !36)
!62 = !DILocation(line: 20, column: 11, scope: !36)
!63 = !DILocation(line: 21, column: 5, scope: !36)
!64 = distinct !DISubprogram(name: "s16_mmv_s16_s16_s16_fac1", scope: !65, file: !65, line: 52, type: !66, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DIFile(filename: "src_analysis/sources/avrg_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_mmv_u16_u16_s16_fac1/alarm_0125")
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !68, !68}
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !45)
!69 = !DILocalVariable(name: "mmv", arg: 1, scope: !64, file: !65, line: 52, type: !68)
!70 = !DILocation(line: 52, column: 43, scope: !64)
!71 = !DILocalVariable(name: "measure", arg: 2, scope: !64, file: !65, line: 52, type: !68)
!72 = !DILocation(line: 52, column: 61, scope: !64)
!73 = !DILocalVariable(name: "crlc", arg: 3, scope: !64, file: !65, line: 52, type: !68)
!74 = !DILocation(line: 52, column: 83, scope: !64)
!75 = !DILocalVariable(name: "s16mmv", scope: !64, file: !65, line: 54, type: !21)
!76 = !DILocation(line: 54, column: 6, scope: !64)
!77 = !DILocalVariable(name: "s32mmv", scope: !64, file: !65, line: 55, type: !21)
!78 = !DILocation(line: 55, column: 6, scope: !64)
!79 = !DILocalVariable(name: "result", scope: !64, file: !65, line: 55, type: !21)
!80 = !DILocation(line: 55, column: 18, scope: !64)
!81 = !DILocation(line: 56, column: 11, scope: !64)
!82 = !DILocation(line: 56, column: 21, scope: !64)
!83 = !DILocation(line: 56, column: 19, scope: !64)
!84 = !DILocation(line: 56, column: 9, scope: !64)
!85 = !DILocation(line: 57, column: 11, scope: !64)
!86 = !DILocation(line: 57, column: 20, scope: !64)
!87 = !DILocation(line: 57, column: 18, scope: !64)
!88 = !DILocation(line: 57, column: 9, scope: !64)
!89 = !DILocation(line: 58, column: 5, scope: !90)
!90 = distinct !DILexicalBlock(scope: !64, file: !65, line: 58, column: 5)
!91 = !DILocation(line: 58, column: 12, scope: !90)
!92 = !DILocation(line: 58, column: 5, scope: !64)
!93 = !DILocation(line: 60, column: 6, scope: !94)
!94 = distinct !DILexicalBlock(scope: !95, file: !65, line: 60, column: 6)
!95 = distinct !DILexicalBlock(scope: !90, file: !65, line: 59, column: 2)
!96 = !DILocation(line: 60, column: 13, scope: !94)
!97 = !DILocation(line: 60, column: 6, scope: !95)
!98 = !DILocation(line: 62, column: 11, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !65, line: 61, column: 3)
!100 = !DILocation(line: 64, column: 13, scope: !99)
!101 = !DILocation(line: 64, column: 19, scope: !99)
!102 = !DILocation(line: 64, column: 17, scope: !99)
!103 = !DILocation(line: 64, column: 11, scope: !99)
!104 = !DILocation(line: 65, column: 7, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !65, line: 65, column: 7)
!106 = !DILocation(line: 65, column: 14, scope: !105)
!107 = !DILocation(line: 65, column: 7, scope: !99)
!108 = !DILocation(line: 67, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !110, file: !65, line: 67, column: 8)
!110 = distinct !DILexicalBlock(scope: !105, file: !65, line: 66, column: 4)
!111 = !DILocation(line: 67, column: 15, scope: !109)
!112 = !DILocation(line: 67, column: 8, scope: !110)
!113 = !DILocation(line: 69, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !109, file: !65, line: 68, column: 5)
!115 = !DILocation(line: 69, column: 6, scope: !114)
!116 = !DILocation(line: 73, column: 6, scope: !117)
!117 = distinct !DILexicalBlock(scope: !109, file: !65, line: 72, column: 5)
!118 = !DILocation(line: 78, column: 5, scope: !119)
!119 = distinct !DILexicalBlock(scope: !105, file: !65, line: 77, column: 4)
!120 = !DILocation(line: 84, column: 14, scope: !121)
!121 = distinct !DILexicalBlock(scope: !94, file: !65, line: 83, column: 3)
!122 = !DILocation(line: 84, column: 13, scope: !121)
!123 = !DILocation(line: 84, column: 11, scope: !121)
!124 = !DILocation(line: 85, column: 13, scope: !121)
!125 = !DILocation(line: 85, column: 20, scope: !121)
!126 = !DILocation(line: 85, column: 11, scope: !121)
!127 = !DILocation(line: 86, column: 12, scope: !121)
!128 = !DILocation(line: 86, column: 19, scope: !121)
!129 = !DILocation(line: 86, column: 29, scope: !121)
!130 = !DILocation(line: 86, column: 11, scope: !121)
!131 = !DILocation(line: 86, column: 9, scope: !121)
!132 = !DILocation(line: 87, column: 13, scope: !121)
!133 = !DILocation(line: 87, column: 22, scope: !121)
!134 = !DILocation(line: 87, column: 20, scope: !121)
!135 = !DILocation(line: 87, column: 11, scope: !121)
!136 = !DILocation(line: 88, column: 7, scope: !137)
!137 = distinct !DILexicalBlock(scope: !121, file: !65, line: 88, column: 7)
!138 = !DILocation(line: 88, column: 14, scope: !137)
!139 = !DILocation(line: 88, column: 7, scope: !121)
!140 = !DILocation(line: 90, column: 15, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !65, line: 89, column: 4)
!142 = !DILocation(line: 90, column: 14, scope: !141)
!143 = !DILocation(line: 90, column: 12, scope: !141)
!144 = !DILocation(line: 92, column: 14, scope: !141)
!145 = !DILocation(line: 92, column: 20, scope: !141)
!146 = !DILocation(line: 92, column: 18, scope: !141)
!147 = !DILocation(line: 92, column: 12, scope: !141)
!148 = !DILocation(line: 93, column: 8, scope: !149)
!149 = distinct !DILexicalBlock(scope: !141, file: !65, line: 93, column: 8)
!150 = !DILocation(line: 93, column: 15, scope: !149)
!151 = !DILocation(line: 93, column: 8, scope: !141)
!152 = !DILocation(line: 95, column: 9, scope: !153)
!153 = distinct !DILexicalBlock(scope: !154, file: !65, line: 95, column: 9)
!154 = distinct !DILexicalBlock(scope: !149, file: !65, line: 94, column: 5)
!155 = !DILocation(line: 95, column: 16, scope: !153)
!156 = !DILocation(line: 95, column: 9, scope: !154)
!157 = !DILocation(line: 97, column: 14, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !65, line: 96, column: 6)
!159 = !DILocation(line: 97, column: 7, scope: !158)
!160 = !DILocation(line: 101, column: 7, scope: !161)
!161 = distinct !DILexicalBlock(scope: !153, file: !65, line: 100, column: 6)
!162 = !DILocation(line: 106, column: 6, scope: !163)
!163 = distinct !DILexicalBlock(scope: !149, file: !65, line: 105, column: 5)
!164 = !DILocation(line: 112, column: 14, scope: !165)
!165 = distinct !DILexicalBlock(scope: !137, file: !65, line: 111, column: 4)
!166 = !DILocation(line: 112, column: 21, scope: !165)
!167 = !DILocation(line: 112, column: 12, scope: !165)
!168 = !DILocation(line: 114, column: 14, scope: !165)
!169 = !DILocation(line: 114, column: 20, scope: !165)
!170 = !DILocation(line: 114, column: 18, scope: !165)
!171 = !DILocation(line: 114, column: 12, scope: !165)
!172 = !DILocation(line: 115, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !165, file: !65, line: 115, column: 8)
!174 = !DILocation(line: 115, column: 15, scope: !173)
!175 = !DILocation(line: 115, column: 8, scope: !165)
!176 = !DILocation(line: 117, column: 9, scope: !177)
!177 = distinct !DILexicalBlock(scope: !178, file: !65, line: 117, column: 9)
!178 = distinct !DILexicalBlock(scope: !173, file: !65, line: 116, column: 5)
!179 = !DILocation(line: 117, column: 16, scope: !177)
!180 = !DILocation(line: 117, column: 9, scope: !178)
!181 = !DILocation(line: 119, column: 14, scope: !182)
!182 = distinct !DILexicalBlock(scope: !177, file: !65, line: 118, column: 6)
!183 = !DILocation(line: 119, column: 7, scope: !182)
!184 = !DILocation(line: 123, column: 7, scope: !185)
!185 = distinct !DILexicalBlock(scope: !177, file: !65, line: 122, column: 6)
!186 = !DILocation(line: 128, column: 6, scope: !187)
!187 = distinct !DILexicalBlock(scope: !173, file: !65, line: 127, column: 5)
!188 = !DILocation(line: 137, column: 12, scope: !189)
!189 = distinct !DILexicalBlock(scope: !90, file: !65, line: 136, column: 2)
!190 = !DILocation(line: 137, column: 19, scope: !189)
!191 = !DILocation(line: 137, column: 10, scope: !189)
!192 = !DILocation(line: 138, column: 11, scope: !189)
!193 = !DILocation(line: 138, column: 18, scope: !189)
!194 = !DILocation(line: 138, column: 28, scope: !189)
!195 = !DILocation(line: 138, column: 10, scope: !189)
!196 = !DILocation(line: 138, column: 8, scope: !189)
!197 = !DILocation(line: 139, column: 12, scope: !189)
!198 = !DILocation(line: 139, column: 21, scope: !189)
!199 = !DILocation(line: 139, column: 19, scope: !189)
!200 = !DILocation(line: 139, column: 10, scope: !189)
!201 = !DILocation(line: 140, column: 6, scope: !202)
!202 = distinct !DILexicalBlock(scope: !189, file: !65, line: 140, column: 6)
!203 = !DILocation(line: 140, column: 13, scope: !202)
!204 = !DILocation(line: 140, column: 6, scope: !189)
!205 = !DILocation(line: 143, column: 13, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !65, line: 141, column: 3)
!207 = !DILocation(line: 143, column: 19, scope: !206)
!208 = !DILocation(line: 143, column: 17, scope: !206)
!209 = !DILocation(line: 143, column: 11, scope: !206)
!210 = !DILocation(line: 144, column: 7, scope: !211)
!211 = distinct !DILexicalBlock(scope: !206, file: !65, line: 144, column: 7)
!212 = !DILocation(line: 144, column: 14, scope: !211)
!213 = !DILocation(line: 144, column: 7, scope: !206)
!214 = !DILocation(line: 146, column: 8, scope: !215)
!215 = distinct !DILexicalBlock(scope: !216, file: !65, line: 146, column: 8)
!216 = distinct !DILexicalBlock(scope: !211, file: !65, line: 145, column: 4)
!217 = !DILocation(line: 146, column: 15, scope: !215)
!218 = !DILocation(line: 146, column: 8, scope: !216)
!219 = !DILocation(line: 148, column: 13, scope: !220)
!220 = distinct !DILexicalBlock(scope: !215, file: !65, line: 147, column: 5)
!221 = !DILocation(line: 148, column: 6, scope: !220)
!222 = !DILocation(line: 152, column: 6, scope: !223)
!223 = distinct !DILexicalBlock(scope: !215, file: !65, line: 151, column: 5)
!224 = !DILocation(line: 157, column: 5, scope: !225)
!225 = distinct !DILexicalBlock(scope: !211, file: !65, line: 156, column: 4)
!226 = !DILocation(line: 163, column: 13, scope: !227)
!227 = distinct !DILexicalBlock(scope: !202, file: !65, line: 162, column: 3)
!228 = !DILocation(line: 163, column: 20, scope: !227)
!229 = !DILocation(line: 163, column: 11, scope: !227)
!230 = !DILocation(line: 165, column: 13, scope: !227)
!231 = !DILocation(line: 165, column: 19, scope: !227)
!232 = !DILocation(line: 165, column: 17, scope: !227)
!233 = !DILocation(line: 165, column: 11, scope: !227)
!234 = !DILocation(line: 166, column: 7, scope: !235)
!235 = distinct !DILexicalBlock(scope: !227, file: !65, line: 166, column: 7)
!236 = !DILocation(line: 166, column: 14, scope: !235)
!237 = !DILocation(line: 166, column: 7, scope: !227)
!238 = !DILocation(line: 168, column: 8, scope: !239)
!239 = distinct !DILexicalBlock(scope: !240, file: !65, line: 168, column: 8)
!240 = distinct !DILexicalBlock(scope: !235, file: !65, line: 167, column: 4)
!241 = !DILocation(line: 168, column: 15, scope: !239)
!242 = !DILocation(line: 168, column: 8, scope: !240)
!243 = !DILocation(line: 170, column: 13, scope: !244)
!244 = distinct !DILexicalBlock(scope: !239, file: !65, line: 169, column: 5)
!245 = !DILocation(line: 170, column: 6, scope: !244)
!246 = !DILocation(line: 174, column: 6, scope: !247)
!247 = distinct !DILexicalBlock(scope: !239, file: !65, line: 173, column: 5)
!248 = !DILocation(line: 179, column: 5, scope: !249)
!249 = distinct !DILexicalBlock(scope: !235, file: !65, line: 178, column: 4)
!250 = !DILocation(line: 184, column: 1, scope: !64)
!251 = distinct !DISubprogram(name: "u16_mmv_u16_u16_s16_fac1", scope: !65, file: !65, line: 211, type: !252, scopeLine: 212, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!252 = !DISubroutineType(types: !253)
!253 = !{!6, !6, !6, !68}
!254 = !DILocalVariable(name: "mmv", arg: 1, scope: !251, file: !65, line: 211, type: !6)
!255 = !DILocation(line: 211, column: 43, scope: !251)
!256 = !DILocalVariable(name: "measure", arg: 2, scope: !251, file: !65, line: 211, type: !6)
!257 = !DILocation(line: 211, column: 61, scope: !251)
!258 = !DILocalVariable(name: "crlc", arg: 3, scope: !251, file: !65, line: 211, type: !68)
!259 = !DILocation(line: 211, column: 83, scope: !251)
!260 = !DILocalVariable(name: "s32mmv", scope: !251, file: !65, line: 214, type: !21)
!261 = !DILocation(line: 214, column: 6, scope: !251)
!262 = !DILocalVariable(name: "u16mmv", scope: !251, file: !65, line: 215, type: !17)
!263 = !DILocation(line: 215, column: 6, scope: !251)
!264 = !DILocalVariable(name: "result", scope: !251, file: !65, line: 215, type: !17)
!265 = !DILocation(line: 215, column: 14, scope: !251)
!266 = !DILocation(line: 217, column: 9, scope: !251)
!267 = !DILocation(line: 218, column: 9, scope: !251)
!268 = !DILocation(line: 219, column: 9, scope: !251)
!269 = !DILocation(line: 220, column: 12, scope: !251)
!270 = !DILocation(line: 220, column: 22, scope: !251)
!271 = !DILocation(line: 220, column: 20, scope: !251)
!272 = !DILocation(line: 220, column: 9, scope: !251)
!273 = !DILocation(line: 221, column: 12, scope: !251)
!274 = !DILocation(line: 221, column: 21, scope: !251)
!275 = !DILocation(line: 221, column: 19, scope: !251)
!276 = !DILocation(line: 221, column: 9, scope: !251)
!277 = !DILocation(line: 222, column: 5, scope: !278)
!278 = distinct !DILexicalBlock(scope: !251, file: !65, line: 222, column: 5)
!279 = !DILocation(line: 222, column: 12, scope: !278)
!280 = !DILocation(line: 222, column: 5, scope: !251)
!281 = !DILocation(line: 224, column: 6, scope: !282)
!282 = distinct !DILexicalBlock(scope: !283, file: !65, line: 224, column: 6)
!283 = distinct !DILexicalBlock(scope: !278, file: !65, line: 223, column: 2)
!284 = !DILocation(line: 224, column: 13, scope: !282)
!285 = !DILocation(line: 224, column: 6, scope: !283)
!286 = !DILocation(line: 228, column: 13, scope: !287)
!287 = distinct !DILexicalBlock(scope: !282, file: !65, line: 225, column: 3)
!288 = !DILocation(line: 228, column: 19, scope: !287)
!289 = !DILocation(line: 228, column: 17, scope: !287)
!290 = !DILocation(line: 228, column: 11, scope: !287)
!291 = !DILocation(line: 230, column: 7, scope: !292)
!292 = distinct !DILexicalBlock(scope: !287, file: !65, line: 230, column: 7)
!293 = !DILocation(line: 230, column: 14, scope: !292)
!294 = !DILocation(line: 230, column: 7, scope: !287)
!295 = !DILocation(line: 232, column: 8, scope: !296)
!296 = distinct !DILexicalBlock(scope: !297, file: !65, line: 232, column: 8)
!297 = distinct !DILexicalBlock(scope: !292, file: !65, line: 231, column: 4)
!298 = !DILocation(line: 232, column: 15, scope: !296)
!299 = !DILocation(line: 232, column: 8, scope: !297)
!300 = !DILocation(line: 234, column: 18, scope: !301)
!301 = distinct !DILexicalBlock(scope: !296, file: !65, line: 233, column: 5)
!302 = !DILocation(line: 234, column: 13, scope: !301)
!303 = !DILocation(line: 234, column: 6, scope: !301)
!304 = !DILocation(line: 238, column: 6, scope: !305)
!305 = distinct !DILexicalBlock(scope: !296, file: !65, line: 237, column: 5)
!306 = !DILocation(line: 243, column: 5, scope: !307)
!307 = distinct !DILexicalBlock(scope: !292, file: !65, line: 242, column: 4)
!308 = !DILocation(line: 250, column: 45, scope: !309)
!309 = distinct !DILexicalBlock(scope: !310, file: !65, line: 250, column: 8)
!310 = distinct !DILexicalBlock(scope: !282, file: !65, line: 248, column: 3)
!311 = !DILocation(line: 250, column: 35, scope: !309)
!312 = !DILocation(line: 250, column: 10, scope: !309)
!313 = !DILocation(line: 250, column: 8, scope: !310)
!314 = !DILocation(line: 251, column: 8, scope: !315)
!315 = distinct !DILexicalBlock(scope: !309, file: !65, line: 250, column: 56)
!316 = !DILocation(line: 258, column: 37, scope: !310)
!317 = !DILocation(line: 258, column: 36, scope: !310)
!318 = !DILocation(line: 258, column: 26, scope: !310)
!319 = !DILocation(line: 258, column: 24, scope: !310)
!320 = !DILocation(line: 259, column: 4, scope: !310)
!321 = !DILocation(line: 313, column: 12, scope: !322)
!322 = distinct !DILexicalBlock(scope: !278, file: !65, line: 312, column: 2)
!323 = !DILocation(line: 313, column: 10, scope: !322)
!324 = !DILocation(line: 314, column: 12, scope: !322)
!325 = !DILocation(line: 314, column: 19, scope: !322)
!326 = !DILocation(line: 314, column: 10, scope: !322)
!327 = !DILocation(line: 315, column: 11, scope: !322)
!328 = !DILocation(line: 315, column: 18, scope: !322)
!329 = !DILocation(line: 315, column: 28, scope: !322)
!330 = !DILocation(line: 315, column: 10, scope: !322)
!331 = !DILocation(line: 315, column: 8, scope: !322)
!332 = !DILocation(line: 316, column: 12, scope: !322)
!333 = !DILocation(line: 316, column: 21, scope: !322)
!334 = !DILocation(line: 316, column: 19, scope: !322)
!335 = !DILocation(line: 316, column: 10, scope: !322)
!336 = !DILocation(line: 317, column: 6, scope: !337)
!337 = distinct !DILexicalBlock(scope: !322, file: !65, line: 317, column: 6)
!338 = !DILocation(line: 317, column: 13, scope: !337)
!339 = !DILocation(line: 317, column: 6, scope: !322)
!340 = !DILocation(line: 320, column: 13, scope: !341)
!341 = distinct !DILexicalBlock(scope: !337, file: !65, line: 318, column: 3)
!342 = !DILocation(line: 320, column: 19, scope: !341)
!343 = !DILocation(line: 320, column: 17, scope: !341)
!344 = !DILocation(line: 320, column: 11, scope: !341)
!345 = !DILocation(line: 322, column: 7, scope: !346)
!346 = distinct !DILexicalBlock(scope: !341, file: !65, line: 322, column: 7)
!347 = !DILocation(line: 322, column: 14, scope: !346)
!348 = !DILocation(line: 322, column: 7, scope: !341)
!349 = !DILocation(line: 324, column: 8, scope: !350)
!350 = distinct !DILexicalBlock(scope: !351, file: !65, line: 324, column: 8)
!351 = distinct !DILexicalBlock(scope: !346, file: !65, line: 323, column: 4)
!352 = !DILocation(line: 324, column: 15, scope: !350)
!353 = !DILocation(line: 324, column: 8, scope: !351)
!354 = !DILocation(line: 326, column: 18, scope: !355)
!355 = distinct !DILexicalBlock(scope: !350, file: !65, line: 325, column: 5)
!356 = !DILocation(line: 326, column: 13, scope: !355)
!357 = !DILocation(line: 326, column: 6, scope: !355)
!358 = !DILocation(line: 330, column: 6, scope: !359)
!359 = distinct !DILexicalBlock(scope: !350, file: !65, line: 329, column: 5)
!360 = !DILocation(line: 335, column: 5, scope: !361)
!361 = distinct !DILexicalBlock(scope: !346, file: !65, line: 334, column: 4)
!362 = !DILocation(line: 341, column: 13, scope: !363)
!363 = distinct !DILexicalBlock(scope: !337, file: !65, line: 340, column: 3)
!364 = !DILocation(line: 341, column: 20, scope: !363)
!365 = !DILocation(line: 341, column: 11, scope: !363)
!366 = !DILocation(line: 343, column: 13, scope: !363)
!367 = !DILocation(line: 343, column: 19, scope: !363)
!368 = !DILocation(line: 343, column: 17, scope: !363)
!369 = !DILocation(line: 343, column: 11, scope: !363)
!370 = !DILocation(line: 345, column: 7, scope: !371)
!371 = distinct !DILexicalBlock(scope: !363, file: !65, line: 345, column: 7)
!372 = !DILocation(line: 345, column: 14, scope: !371)
!373 = !DILocation(line: 345, column: 7, scope: !363)
!374 = !DILocation(line: 347, column: 8, scope: !375)
!375 = distinct !DILexicalBlock(scope: !376, file: !65, line: 347, column: 8)
!376 = distinct !DILexicalBlock(scope: !371, file: !65, line: 346, column: 4)
!377 = !DILocation(line: 347, column: 15, scope: !375)
!378 = !DILocation(line: 347, column: 8, scope: !376)
!379 = !DILocation(line: 349, column: 18, scope: !380)
!380 = distinct !DILexicalBlock(scope: !375, file: !65, line: 348, column: 5)
!381 = !DILocation(line: 349, column: 13, scope: !380)
!382 = !DILocation(line: 349, column: 6, scope: !380)
!383 = !DILocation(line: 353, column: 6, scope: !384)
!384 = distinct !DILexicalBlock(scope: !375, file: !65, line: 352, column: 5)
!385 = !DILocation(line: 358, column: 5, scope: !386)
!386 = distinct !DILexicalBlock(scope: !371, file: !65, line: 357, column: 4)
!387 = !DILocation(line: 364, column: 1, scope: !251)
!388 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !26, file: !26, line: 42, type: !389, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!389 = !DISubroutineType(types: !390)
!390 = !{!24, !13}
!391 = !DILocalVariable(name: "value", arg: 1, scope: !388, file: !26, line: 42, type: !13)
!392 = !DILocation(line: 42, column: 38, scope: !388)
!393 = !DILocation(line: 44, column: 12, scope: !388)
!394 = !DILocation(line: 44, column: 18, scope: !388)
!395 = !DILocation(line: 44, column: 5, scope: !388)
!396 = distinct !DISubprogram(name: "u16_mmv_u16_u16_u16_fac2", scope: !65, file: !65, line: 390, type: !397, scopeLine: 391, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!397 = !DISubroutineType(types: !398)
!398 = !{!6, !6, !6, !6}
!399 = !DILocalVariable(name: "mmv", arg: 1, scope: !396, file: !65, line: 390, type: !6)
!400 = !DILocation(line: 390, column: 34, scope: !396)
!401 = !DILocalVariable(name: "measure", arg: 2, scope: !396, file: !65, line: 390, type: !6)
!402 = !DILocation(line: 390, column: 43, scope: !396)
!403 = !DILocalVariable(name: "crlc", arg: 3, scope: !396, file: !65, line: 390, type: !6)
!404 = !DILocation(line: 390, column: 56, scope: !396)
!405 = !DILocalVariable(name: "Temp", scope: !396, file: !65, line: 392, type: !21)
!406 = !DILocation(line: 392, column: 6, scope: !396)
!407 = !DILocalVariable(name: "result", scope: !396, file: !65, line: 392, type: !21)
!408 = !DILocation(line: 392, column: 13, scope: !396)
!409 = !DILocalVariable(name: "measure32", scope: !396, file: !65, line: 393, type: !21)
!410 = !DILocation(line: 393, column: 6, scope: !396)
!411 = !DILocation(line: 394, column: 11, scope: !396)
!412 = !DILocation(line: 394, column: 9, scope: !396)
!413 = !DILocation(line: 395, column: 5, scope: !414)
!414 = distinct !DILexicalBlock(scope: !396, file: !65, line: 395, column: 5)
!415 = !DILocation(line: 395, column: 11, scope: !414)
!416 = !DILocation(line: 395, column: 9, scope: !414)
!417 = !DILocation(line: 395, column: 5, scope: !396)
!418 = !DILocation(line: 397, column: 15, scope: !419)
!419 = distinct !DILexicalBlock(scope: !414, file: !65, line: 396, column: 2)
!420 = !DILocation(line: 397, column: 21, scope: !419)
!421 = !DILocation(line: 397, column: 19, scope: !419)
!422 = !DILocation(line: 397, column: 13, scope: !419)
!423 = !DILocation(line: 398, column: 15, scope: !419)
!424 = !DILocation(line: 398, column: 27, scope: !419)
!425 = !DILocation(line: 398, column: 25, scope: !419)
!426 = !DILocation(line: 398, column: 13, scope: !419)
!427 = !DILocation(line: 399, column: 11, scope: !419)
!428 = !DILocation(line: 399, column: 21, scope: !419)
!429 = !DILocation(line: 399, column: 8, scope: !419)
!430 = !DILocation(line: 400, column: 11, scope: !419)
!431 = !DILocation(line: 400, column: 21, scope: !419)
!432 = !DILocation(line: 400, column: 31, scope: !419)
!433 = !DILocation(line: 400, column: 10, scope: !419)
!434 = !DILocation(line: 400, column: 8, scope: !419)
!435 = !DILocation(line: 401, column: 10, scope: !419)
!436 = !DILocation(line: 401, column: 17, scope: !419)
!437 = !DILocation(line: 401, column: 15, scope: !419)
!438 = !DILocation(line: 401, column: 8, scope: !419)
!439 = !DILocation(line: 402, column: 6, scope: !440)
!440 = distinct !DILexicalBlock(scope: !419, file: !65, line: 402, column: 6)
!441 = !DILocation(line: 402, column: 11, scope: !440)
!442 = !DILocation(line: 402, column: 6, scope: !419)
!443 = !DILocation(line: 404, column: 13, scope: !444)
!444 = distinct !DILexicalBlock(scope: !440, file: !65, line: 403, column: 3)
!445 = !DILocation(line: 404, column: 22, scope: !444)
!446 = !DILocation(line: 404, column: 20, scope: !444)
!447 = !DILocation(line: 404, column: 11, scope: !444)
!448 = !DILocation(line: 406, column: 7, scope: !449)
!449 = distinct !DILexicalBlock(scope: !444, file: !65, line: 406, column: 7)
!450 = !DILocation(line: 406, column: 14, scope: !449)
!451 = !DILocation(line: 406, column: 7, scope: !444)
!452 = !DILocation(line: 408, column: 8, scope: !453)
!453 = distinct !DILexicalBlock(scope: !454, file: !65, line: 408, column: 8)
!454 = distinct !DILexicalBlock(scope: !449, file: !65, line: 407, column: 4)
!455 = !DILocation(line: 408, column: 15, scope: !453)
!456 = !DILocation(line: 408, column: 8, scope: !454)
!457 = !DILocation(line: 410, column: 13, scope: !458)
!458 = distinct !DILexicalBlock(scope: !453, file: !65, line: 409, column: 5)
!459 = !DILocation(line: 410, column: 20, scope: !458)
!460 = !DILocation(line: 410, column: 6, scope: !458)
!461 = !DILocation(line: 414, column: 6, scope: !462)
!462 = distinct !DILexicalBlock(scope: !453, file: !65, line: 413, column: 5)
!463 = !DILocation(line: 419, column: 5, scope: !464)
!464 = distinct !DILexicalBlock(scope: !449, file: !65, line: 418, column: 4)
!465 = !DILocation(line: 425, column: 7, scope: !466)
!466 = distinct !DILexicalBlock(scope: !467, file: !65, line: 425, column: 7)
!467 = distinct !DILexicalBlock(scope: !440, file: !65, line: 424, column: 3)
!468 = !DILocation(line: 425, column: 15, scope: !466)
!469 = !DILocation(line: 425, column: 7, scope: !467)
!470 = !DILocation(line: 427, column: 14, scope: !471)
!471 = distinct !DILexicalBlock(scope: !466, file: !65, line: 426, column: 4)
!472 = !DILocation(line: 427, column: 23, scope: !471)
!473 = !DILocation(line: 427, column: 21, scope: !471)
!474 = !DILocation(line: 427, column: 12, scope: !471)
!475 = !DILocation(line: 429, column: 8, scope: !476)
!476 = distinct !DILexicalBlock(scope: !471, file: !65, line: 429, column: 8)
!477 = !DILocation(line: 429, column: 15, scope: !476)
!478 = !DILocation(line: 429, column: 8, scope: !471)
!479 = !DILocation(line: 431, column: 9, scope: !480)
!480 = distinct !DILexicalBlock(scope: !481, file: !65, line: 431, column: 9)
!481 = distinct !DILexicalBlock(scope: !476, file: !65, line: 430, column: 5)
!482 = !DILocation(line: 431, column: 16, scope: !480)
!483 = !DILocation(line: 431, column: 9, scope: !481)
!484 = !DILocation(line: 433, column: 14, scope: !485)
!485 = distinct !DILexicalBlock(scope: !480, file: !65, line: 432, column: 6)
!486 = !DILocation(line: 433, column: 21, scope: !485)
!487 = !DILocation(line: 433, column: 7, scope: !485)
!488 = !DILocation(line: 437, column: 7, scope: !489)
!489 = distinct !DILexicalBlock(scope: !480, file: !65, line: 436, column: 6)
!490 = !DILocation(line: 442, column: 6, scope: !491)
!491 = distinct !DILexicalBlock(scope: !476, file: !65, line: 441, column: 5)
!492 = !DILocation(line: 448, column: 14, scope: !493)
!493 = distinct !DILexicalBlock(scope: !466, file: !65, line: 447, column: 4)
!494 = !DILocation(line: 448, column: 18, scope: !493)
!495 = !DILocation(line: 448, column: 12, scope: !493)
!496 = !DILocation(line: 450, column: 8, scope: !497)
!497 = distinct !DILexicalBlock(scope: !493, file: !65, line: 450, column: 8)
!498 = !DILocation(line: 450, column: 15, scope: !497)
!499 = !DILocation(line: 450, column: 8, scope: !493)
!500 = !DILocation(line: 452, column: 9, scope: !501)
!501 = distinct !DILexicalBlock(scope: !502, file: !65, line: 452, column: 9)
!502 = distinct !DILexicalBlock(scope: !497, file: !65, line: 451, column: 5)
!503 = !DILocation(line: 452, column: 16, scope: !501)
!504 = !DILocation(line: 452, column: 9, scope: !502)
!505 = !DILocation(line: 454, column: 15, scope: !506)
!506 = distinct !DILexicalBlock(scope: !501, file: !65, line: 453, column: 6)
!507 = !DILocation(line: 454, column: 22, scope: !506)
!508 = !DILocation(line: 454, column: 14, scope: !506)
!509 = !DILocation(line: 454, column: 7, scope: !506)
!510 = !DILocation(line: 458, column: 7, scope: !511)
!511 = distinct !DILexicalBlock(scope: !501, file: !65, line: 457, column: 6)
!512 = !DILocation(line: 463, column: 6, scope: !513)
!513 = distinct !DILexicalBlock(scope: !497, file: !65, line: 462, column: 5)
!514 = !DILocation(line: 471, column: 15, scope: !515)
!515 = distinct !DILexicalBlock(scope: !414, file: !65, line: 470, column: 2)
!516 = !DILocation(line: 471, column: 25, scope: !515)
!517 = !DILocation(line: 471, column: 23, scope: !515)
!518 = !DILocation(line: 471, column: 13, scope: !515)
!519 = !DILocation(line: 472, column: 15, scope: !515)
!520 = !DILocation(line: 472, column: 27, scope: !515)
!521 = !DILocation(line: 472, column: 25, scope: !515)
!522 = !DILocation(line: 472, column: 13, scope: !515)
!523 = !DILocation(line: 473, column: 11, scope: !515)
!524 = !DILocation(line: 473, column: 21, scope: !515)
!525 = !DILocation(line: 473, column: 8, scope: !515)
!526 = !DILocation(line: 474, column: 11, scope: !515)
!527 = !DILocation(line: 474, column: 21, scope: !515)
!528 = !DILocation(line: 474, column: 31, scope: !515)
!529 = !DILocation(line: 474, column: 10, scope: !515)
!530 = !DILocation(line: 474, column: 8, scope: !515)
!531 = !DILocation(line: 475, column: 10, scope: !515)
!532 = !DILocation(line: 475, column: 17, scope: !515)
!533 = !DILocation(line: 475, column: 15, scope: !515)
!534 = !DILocation(line: 475, column: 8, scope: !515)
!535 = !DILocation(line: 476, column: 6, scope: !536)
!536 = distinct !DILexicalBlock(scope: !515, file: !65, line: 476, column: 6)
!537 = !DILocation(line: 476, column: 11, scope: !536)
!538 = !DILocation(line: 476, column: 6, scope: !515)
!539 = !DILocation(line: 478, column: 13, scope: !540)
!540 = distinct !DILexicalBlock(scope: !536, file: !65, line: 477, column: 3)
!541 = !DILocation(line: 478, column: 20, scope: !540)
!542 = !DILocation(line: 478, column: 18, scope: !540)
!543 = !DILocation(line: 478, column: 11, scope: !540)
!544 = !DILocation(line: 480, column: 7, scope: !545)
!545 = distinct !DILexicalBlock(scope: !540, file: !65, line: 480, column: 7)
!546 = !DILocation(line: 480, column: 14, scope: !545)
!547 = !DILocation(line: 480, column: 7, scope: !540)
!548 = !DILocation(line: 482, column: 8, scope: !549)
!549 = distinct !DILexicalBlock(scope: !550, file: !65, line: 482, column: 8)
!550 = distinct !DILexicalBlock(scope: !545, file: !65, line: 481, column: 4)
!551 = !DILocation(line: 482, column: 15, scope: !549)
!552 = !DILocation(line: 482, column: 8, scope: !550)
!553 = !DILocation(line: 484, column: 13, scope: !554)
!554 = distinct !DILexicalBlock(scope: !549, file: !65, line: 483, column: 5)
!555 = !DILocation(line: 484, column: 20, scope: !554)
!556 = !DILocation(line: 484, column: 6, scope: !554)
!557 = !DILocation(line: 488, column: 6, scope: !558)
!558 = distinct !DILexicalBlock(scope: !549, file: !65, line: 487, column: 5)
!559 = !DILocation(line: 493, column: 5, scope: !560)
!560 = distinct !DILexicalBlock(scope: !545, file: !65, line: 492, column: 4)
!561 = !DILocation(line: 500, column: 7, scope: !562)
!562 = distinct !DILexicalBlock(scope: !563, file: !65, line: 500, column: 7)
!563 = distinct !DILexicalBlock(scope: !536, file: !65, line: 499, column: 3)
!564 = !DILocation(line: 500, column: 14, scope: !562)
!565 = !DILocation(line: 500, column: 7, scope: !563)
!566 = !DILocation(line: 502, column: 14, scope: !567)
!567 = distinct !DILexicalBlock(scope: !562, file: !65, line: 501, column: 4)
!568 = !DILocation(line: 502, column: 21, scope: !567)
!569 = !DILocation(line: 502, column: 19, scope: !567)
!570 = !DILocation(line: 502, column: 12, scope: !567)
!571 = !DILocation(line: 504, column: 8, scope: !572)
!572 = distinct !DILexicalBlock(scope: !567, file: !65, line: 504, column: 8)
!573 = !DILocation(line: 504, column: 15, scope: !572)
!574 = !DILocation(line: 504, column: 8, scope: !567)
!575 = !DILocation(line: 506, column: 9, scope: !576)
!576 = distinct !DILexicalBlock(scope: !577, file: !65, line: 506, column: 9)
!577 = distinct !DILexicalBlock(scope: !572, file: !65, line: 505, column: 5)
!578 = !DILocation(line: 506, column: 16, scope: !576)
!579 = !DILocation(line: 506, column: 9, scope: !577)
!580 = !DILocation(line: 508, column: 14, scope: !581)
!581 = distinct !DILexicalBlock(scope: !576, file: !65, line: 507, column: 6)
!582 = !DILocation(line: 508, column: 21, scope: !581)
!583 = !DILocation(line: 508, column: 7, scope: !581)
!584 = !DILocation(line: 512, column: 7, scope: !585)
!585 = distinct !DILexicalBlock(scope: !576, file: !65, line: 511, column: 6)
!586 = !DILocation(line: 517, column: 6, scope: !587)
!587 = distinct !DILexicalBlock(scope: !572, file: !65, line: 516, column: 5)
!588 = !DILocation(line: 523, column: 14, scope: !589)
!589 = distinct !DILexicalBlock(scope: !562, file: !65, line: 522, column: 4)
!590 = !DILocation(line: 523, column: 18, scope: !589)
!591 = !DILocation(line: 523, column: 12, scope: !589)
!592 = !DILocation(line: 525, column: 8, scope: !593)
!593 = distinct !DILexicalBlock(scope: !589, file: !65, line: 525, column: 8)
!594 = !DILocation(line: 525, column: 15, scope: !593)
!595 = !DILocation(line: 525, column: 8, scope: !589)
!596 = !DILocation(line: 527, column: 9, scope: !597)
!597 = distinct !DILexicalBlock(scope: !598, file: !65, line: 527, column: 9)
!598 = distinct !DILexicalBlock(scope: !593, file: !65, line: 526, column: 5)
!599 = !DILocation(line: 527, column: 16, scope: !597)
!600 = !DILocation(line: 527, column: 9, scope: !598)
!601 = !DILocation(line: 529, column: 14, scope: !602)
!602 = distinct !DILexicalBlock(scope: !597, file: !65, line: 528, column: 6)
!603 = !DILocation(line: 529, column: 21, scope: !602)
!604 = !DILocation(line: 529, column: 7, scope: !602)
!605 = !DILocation(line: 533, column: 7, scope: !606)
!606 = distinct !DILexicalBlock(scope: !597, file: !65, line: 532, column: 6)
!607 = !DILocation(line: 538, column: 6, scope: !608)
!608 = distinct !DILexicalBlock(scope: !593, file: !65, line: 537, column: 5)
!609 = !DILocation(line: 544, column: 1, scope: !396)
!610 = distinct !DISubprogram(name: "u32_mmv_u32_u16_u16_fac1", scope: !65, file: !65, line: 568, type: !611, scopeLine: 569, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!611 = !DISubroutineType(types: !612)
!612 = !{!17, !17, !6, !6}
!613 = !DILocalVariable(name: "mmv", arg: 1, scope: !610, file: !65, line: 568, type: !17)
!614 = !DILocation(line: 568, column: 43, scope: !610)
!615 = !DILocalVariable(name: "measure", arg: 2, scope: !610, file: !65, line: 568, type: !6)
!616 = !DILocation(line: 568, column: 60, scope: !610)
!617 = !DILocalVariable(name: "crlc", arg: 3, scope: !610, file: !65, line: 568, type: !6)
!618 = !DILocation(line: 568, column: 81, scope: !610)
!619 = !DILocalVariable(name: "u32Temp1", scope: !610, file: !65, line: 570, type: !17)
!620 = !DILocation(line: 570, column: 6, scope: !610)
!621 = !DILocalVariable(name: "u32Temp2", scope: !610, file: !65, line: 570, type: !17)
!622 = !DILocation(line: 570, column: 27, scope: !610)
!623 = !DILocation(line: 571, column: 13, scope: !610)
!624 = !DILocation(line: 571, column: 17, scope: !610)
!625 = !DILocation(line: 571, column: 11, scope: !610)
!626 = !DILocation(line: 573, column: 18, scope: !610)
!627 = !DILocation(line: 573, column: 28, scope: !610)
!628 = !DILocation(line: 573, column: 26, scope: !610)
!629 = !DILocation(line: 573, column: 11, scope: !610)
!630 = !DILocation(line: 574, column: 5, scope: !631)
!631 = distinct !DILexicalBlock(scope: !610, file: !65, line: 574, column: 5)
!632 = !DILocation(line: 574, column: 14, scope: !631)
!633 = !DILocation(line: 574, column: 5, scope: !610)
!634 = !DILocation(line: 576, column: 6, scope: !635)
!635 = distinct !DILexicalBlock(scope: !636, file: !65, line: 576, column: 6)
!636 = distinct !DILexicalBlock(scope: !631, file: !65, line: 575, column: 2)
!637 = !DILocation(line: 576, column: 16, scope: !635)
!638 = !DILocation(line: 576, column: 14, scope: !635)
!639 = !DILocation(line: 576, column: 6, scope: !636)
!640 = !DILocation(line: 578, column: 16, scope: !641)
!641 = distinct !DILexicalBlock(scope: !635, file: !65, line: 577, column: 3)
!642 = !DILocation(line: 578, column: 32, scope: !641)
!643 = !DILocation(line: 578, column: 27, scope: !641)
!644 = !DILocation(line: 578, column: 25, scope: !641)
!645 = !DILocation(line: 578, column: 13, scope: !641)
!646 = !DILocation(line: 579, column: 15, scope: !641)
!647 = !DILocation(line: 579, column: 26, scope: !641)
!648 = !DILocation(line: 579, column: 24, scope: !641)
!649 = !DILocation(line: 579, column: 13, scope: !641)
!650 = !DILocation(line: 580, column: 20, scope: !641)
!651 = !DILocation(line: 580, column: 26, scope: !641)
!652 = !DILocation(line: 580, column: 24, scope: !641)
!653 = !DILocation(line: 580, column: 13, scope: !641)
!654 = !DILocation(line: 581, column: 16, scope: !641)
!655 = !DILocation(line: 581, column: 4, scope: !641)
!656 = !DILocation(line: 585, column: 15, scope: !657)
!657 = distinct !DILexicalBlock(scope: !635, file: !65, line: 584, column: 3)
!658 = !DILocation(line: 585, column: 31, scope: !657)
!659 = !DILocation(line: 585, column: 26, scope: !657)
!660 = !DILocation(line: 585, column: 24, scope: !657)
!661 = !DILocation(line: 585, column: 13, scope: !657)
!662 = !DILocation(line: 586, column: 15, scope: !657)
!663 = !DILocation(line: 586, column: 31, scope: !657)
!664 = !DILocation(line: 586, column: 24, scope: !657)
!665 = !DILocation(line: 586, column: 13, scope: !657)
!666 = !DILocation(line: 587, column: 16, scope: !657)
!667 = !DILocation(line: 587, column: 4, scope: !657)
!668 = !DILocation(line: 593, column: 20, scope: !669)
!669 = distinct !DILexicalBlock(scope: !631, file: !65, line: 592, column: 2)
!670 = !DILocation(line: 593, column: 24, scope: !669)
!671 = !DILocation(line: 593, column: 38, scope: !669)
!672 = !DILocation(line: 593, column: 12, scope: !669)
!673 = !DILocation(line: 594, column: 16, scope: !669)
!674 = !DILocation(line: 594, column: 3, scope: !669)
!675 = !DILocation(line: 597, column: 1, scope: !610)
!676 = distinct !DISubprogram(name: "s16_mmv_s16_s16_u16_fac1", scope: !65, file: !65, line: 623, type: !677, scopeLine: 624, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!677 = !DISubroutineType(types: !678)
!678 = !{!68, !68, !68, !6}
!679 = !DILocalVariable(name: "mmv", arg: 1, scope: !676, file: !65, line: 623, type: !68)
!680 = !DILocation(line: 623, column: 34, scope: !676)
!681 = !DILocalVariable(name: "measure", arg: 2, scope: !676, file: !65, line: 623, type: !68)
!682 = !DILocation(line: 623, column: 42, scope: !676)
!683 = !DILocalVariable(name: "crlc", arg: 3, scope: !676, file: !65, line: 623, type: !6)
!684 = !DILocation(line: 623, column: 54, scope: !676)
!685 = !DILocalVariable(name: "s32measure", scope: !676, file: !65, line: 625, type: !17)
!686 = !DILocation(line: 625, column: 6, scope: !676)
!687 = !DILocalVariable(name: "s32Temp1", scope: !676, file: !65, line: 625, type: !17)
!688 = !DILocation(line: 625, column: 22, scope: !676)
!689 = !DILocation(line: 626, column: 5, scope: !690)
!690 = distinct !DILexicalBlock(scope: !676, file: !65, line: 626, column: 5)
!691 = !DILocation(line: 626, column: 15, scope: !690)
!692 = !DILocation(line: 626, column: 13, scope: !690)
!693 = !DILocation(line: 626, column: 5, scope: !676)
!694 = !DILocation(line: 628, column: 16, scope: !695)
!695 = distinct !DILexicalBlock(scope: !690, file: !65, line: 627, column: 2)
!696 = !DILocation(line: 628, column: 22, scope: !695)
!697 = !DILocation(line: 628, column: 20, scope: !695)
!698 = !DILocation(line: 628, column: 14, scope: !695)
!699 = !DILocation(line: 629, column: 16, scope: !695)
!700 = !DILocation(line: 629, column: 29, scope: !695)
!701 = !DILocation(line: 629, column: 27, scope: !695)
!702 = !DILocation(line: 629, column: 14, scope: !695)
!703 = !DILocation(line: 630, column: 15, scope: !695)
!704 = !DILocation(line: 630, column: 27, scope: !695)
!705 = !DILocation(line: 630, column: 12, scope: !695)
!706 = !DILocation(line: 631, column: 11, scope: !695)
!707 = !DILocation(line: 631, column: 22, scope: !695)
!708 = !DILocation(line: 631, column: 32, scope: !695)
!709 = !DILocation(line: 631, column: 10, scope: !695)
!710 = !DILocation(line: 631, column: 8, scope: !695)
!711 = !DILocation(line: 633, column: 6, scope: !712)
!712 = distinct !DILexicalBlock(scope: !695, file: !65, line: 633, column: 6)
!713 = !DILocation(line: 633, column: 17, scope: !712)
!714 = !DILocation(line: 633, column: 6, scope: !695)
!715 = !DILocation(line: 635, column: 12, scope: !716)
!716 = distinct !DILexicalBlock(scope: !712, file: !65, line: 634, column: 3)
!717 = !DILocation(line: 635, column: 19, scope: !716)
!718 = !DILocation(line: 635, column: 30, scope: !716)
!719 = !DILocation(line: 635, column: 28, scope: !716)
!720 = !DILocation(line: 635, column: 16, scope: !716)
!721 = !DILocation(line: 635, column: 11, scope: !716)
!722 = !DILocation(line: 635, column: 4, scope: !716)
!723 = !DILocation(line: 639, column: 7, scope: !724)
!724 = distinct !DILexicalBlock(scope: !725, file: !65, line: 639, column: 7)
!725 = distinct !DILexicalBlock(scope: !712, file: !65, line: 638, column: 3)
!726 = !DILocation(line: 639, column: 18, scope: !724)
!727 = !DILocation(line: 639, column: 7, scope: !725)
!728 = !DILocation(line: 641, column: 13, scope: !729)
!729 = distinct !DILexicalBlock(scope: !724, file: !65, line: 640, column: 4)
!730 = !DILocation(line: 641, column: 20, scope: !729)
!731 = !DILocation(line: 641, column: 31, scope: !729)
!732 = !DILocation(line: 641, column: 29, scope: !729)
!733 = !DILocation(line: 641, column: 17, scope: !729)
!734 = !DILocation(line: 641, column: 12, scope: !729)
!735 = !DILocation(line: 641, column: 5, scope: !729)
!736 = !DILocation(line: 645, column: 13, scope: !737)
!737 = distinct !DILexicalBlock(scope: !724, file: !65, line: 644, column: 4)
!738 = !DILocation(line: 645, column: 17, scope: !737)
!739 = !DILocation(line: 645, column: 12, scope: !737)
!740 = !DILocation(line: 645, column: 5, scope: !737)
!741 = !DILocation(line: 651, column: 16, scope: !742)
!742 = distinct !DILexicalBlock(scope: !690, file: !65, line: 650, column: 2)
!743 = !DILocation(line: 651, column: 26, scope: !742)
!744 = !DILocation(line: 651, column: 24, scope: !742)
!745 = !DILocation(line: 651, column: 14, scope: !742)
!746 = !DILocation(line: 652, column: 16, scope: !742)
!747 = !DILocation(line: 652, column: 29, scope: !742)
!748 = !DILocation(line: 652, column: 27, scope: !742)
!749 = !DILocation(line: 652, column: 14, scope: !742)
!750 = !DILocation(line: 653, column: 15, scope: !742)
!751 = !DILocation(line: 653, column: 27, scope: !742)
!752 = !DILocation(line: 653, column: 12, scope: !742)
!753 = !DILocation(line: 654, column: 11, scope: !742)
!754 = !DILocation(line: 654, column: 22, scope: !742)
!755 = !DILocation(line: 654, column: 32, scope: !742)
!756 = !DILocation(line: 654, column: 10, scope: !742)
!757 = !DILocation(line: 654, column: 8, scope: !742)
!758 = !DILocation(line: 655, column: 7, scope: !759)
!759 = distinct !DILexicalBlock(scope: !742, file: !65, line: 655, column: 6)
!760 = !DILocation(line: 655, column: 18, scope: !759)
!761 = !DILocation(line: 655, column: 16, scope: !759)
!762 = !DILocation(line: 655, column: 24, scope: !759)
!763 = !DILocation(line: 655, column: 6, scope: !742)
!764 = !DILocation(line: 657, column: 12, scope: !765)
!765 = distinct !DILexicalBlock(scope: !759, file: !65, line: 656, column: 3)
!766 = !DILocation(line: 657, column: 19, scope: !765)
!767 = !DILocation(line: 657, column: 30, scope: !765)
!768 = !DILocation(line: 657, column: 28, scope: !765)
!769 = !DILocation(line: 657, column: 16, scope: !765)
!770 = !DILocation(line: 657, column: 11, scope: !765)
!771 = !DILocation(line: 657, column: 4, scope: !765)
!772 = !DILocation(line: 661, column: 7, scope: !773)
!773 = distinct !DILexicalBlock(scope: !774, file: !65, line: 661, column: 7)
!774 = distinct !DILexicalBlock(scope: !759, file: !65, line: 660, column: 3)
!775 = !DILocation(line: 661, column: 18, scope: !773)
!776 = !DILocation(line: 661, column: 7, scope: !774)
!777 = !DILocation(line: 663, column: 13, scope: !778)
!778 = distinct !DILexicalBlock(scope: !773, file: !65, line: 662, column: 4)
!779 = !DILocation(line: 663, column: 20, scope: !778)
!780 = !DILocation(line: 663, column: 31, scope: !778)
!781 = !DILocation(line: 663, column: 29, scope: !778)
!782 = !DILocation(line: 663, column: 17, scope: !778)
!783 = !DILocation(line: 663, column: 12, scope: !778)
!784 = !DILocation(line: 663, column: 5, scope: !778)
!785 = !DILocation(line: 667, column: 13, scope: !786)
!786 = distinct !DILexicalBlock(scope: !773, file: !65, line: 666, column: 4)
!787 = !DILocation(line: 667, column: 17, scope: !786)
!788 = !DILocation(line: 667, column: 12, scope: !786)
!789 = !DILocation(line: 667, column: 5, scope: !786)
!790 = !DILocation(line: 671, column: 1, scope: !676)
!791 = distinct !DISubprogram(name: "s32_mmv_s32_s16_u16_fac1", scope: !65, file: !65, line: 697, type: !792, scopeLine: 698, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!792 = !DISubroutineType(types: !793)
!793 = !{!21, !21, !68, !6}
!794 = !DILocalVariable(name: "mmv", arg: 1, scope: !791, file: !65, line: 697, type: !21)
!795 = !DILocation(line: 697, column: 43, scope: !791)
!796 = !DILocalVariable(name: "measure", arg: 2, scope: !791, file: !65, line: 697, type: !68)
!797 = !DILocation(line: 697, column: 61, scope: !791)
!798 = !DILocalVariable(name: "crlc", arg: 3, scope: !791, file: !65, line: 697, type: !6)
!799 = !DILocation(line: 697, column: 83, scope: !791)
!800 = !DILocalVariable(name: "s32Temp1", scope: !791, file: !65, line: 699, type: !21)
!801 = !DILocation(line: 699, column: 6, scope: !791)
!802 = !DILocalVariable(name: "s32Temp2", scope: !791, file: !65, line: 699, type: !21)
!803 = !DILocation(line: 699, column: 15, scope: !791)
!804 = !DILocation(line: 700, column: 19, scope: !791)
!805 = !DILocation(line: 700, column: 22, scope: !791)
!806 = !DILocation(line: 700, column: 11, scope: !791)
!807 = !DILocation(line: 701, column: 5, scope: !808)
!808 = distinct !DILexicalBlock(scope: !791, file: !65, line: 701, column: 5)
!809 = !DILocation(line: 701, column: 17, scope: !808)
!810 = !DILocation(line: 701, column: 14, scope: !808)
!811 = !DILocation(line: 701, column: 5, scope: !791)
!812 = !DILocation(line: 703, column: 6, scope: !813)
!813 = distinct !DILexicalBlock(scope: !814, file: !65, line: 703, column: 6)
!814 = distinct !DILexicalBlock(scope: !808, file: !65, line: 702, column: 2)
!815 = !DILocation(line: 703, column: 18, scope: !813)
!816 = !DILocation(line: 703, column: 15, scope: !813)
!817 = !DILocation(line: 703, column: 6, scope: !814)
!818 = !DILocation(line: 705, column: 15, scope: !819)
!819 = distinct !DILexicalBlock(scope: !813, file: !65, line: 704, column: 3)
!820 = !DILocation(line: 705, column: 26, scope: !819)
!821 = !DILocation(line: 705, column: 24, scope: !819)
!822 = !DILocation(line: 705, column: 13, scope: !819)
!823 = !DILocation(line: 706, column: 15, scope: !819)
!824 = !DILocation(line: 706, column: 31, scope: !819)
!825 = !DILocation(line: 706, column: 26, scope: !819)
!826 = !DILocation(line: 706, column: 24, scope: !819)
!827 = !DILocation(line: 706, column: 13, scope: !819)
!828 = !DILocation(line: 707, column: 12, scope: !819)
!829 = !DILocation(line: 707, column: 18, scope: !819)
!830 = !DILocation(line: 707, column: 16, scope: !819)
!831 = !DILocation(line: 707, column: 4, scope: !819)
!832 = !DILocation(line: 711, column: 16, scope: !833)
!833 = distinct !DILexicalBlock(scope: !813, file: !65, line: 710, column: 3)
!834 = !DILocation(line: 711, column: 26, scope: !833)
!835 = !DILocation(line: 711, column: 24, scope: !833)
!836 = !DILocation(line: 711, column: 13, scope: !833)
!837 = !DILocation(line: 712, column: 15, scope: !833)
!838 = !DILocation(line: 712, column: 31, scope: !833)
!839 = !DILocation(line: 712, column: 26, scope: !833)
!840 = !DILocation(line: 712, column: 24, scope: !833)
!841 = !DILocation(line: 712, column: 13, scope: !833)
!842 = !DILocation(line: 713, column: 12, scope: !833)
!843 = !DILocation(line: 713, column: 18, scope: !833)
!844 = !DILocation(line: 713, column: 16, scope: !833)
!845 = !DILocation(line: 713, column: 4, scope: !833)
!846 = !DILocation(line: 718, column: 14, scope: !847)
!847 = distinct !DILexicalBlock(scope: !808, file: !65, line: 717, column: 2)
!848 = !DILocation(line: 718, column: 18, scope: !847)
!849 = !DILocation(line: 718, column: 12, scope: !847)
!850 = !DILocation(line: 719, column: 11, scope: !847)
!851 = !DILocation(line: 719, column: 20, scope: !847)
!852 = !DILocation(line: 719, column: 3, scope: !847)
!853 = !DILocation(line: 721, column: 1, scope: !791)
!854 = distinct !DISubprogram(name: "u16_calc_av_u16_u16", scope: !65, file: !65, line: 740, type: !855, scopeLine: 741, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!855 = !DISubroutineType(types: !856)
!856 = !{!6, !6, !6}
!857 = !DILocalVariable(name: "x_val", arg: 1, scope: !854, file: !65, line: 740, type: !6)
!858 = !DILocation(line: 740, column: 30, scope: !854)
!859 = !DILocalVariable(name: "y_val", arg: 2, scope: !854, file: !65, line: 740, type: !6)
!860 = !DILocation(line: 740, column: 41, scope: !854)
!861 = !DILocalVariable(name: "u32Temp1", scope: !854, file: !65, line: 742, type: !17)
!862 = !DILocation(line: 742, column: 6, scope: !854)
!863 = !DILocation(line: 742, column: 17, scope: !854)
!864 = !DILocalVariable(name: "u32Temp2", scope: !854, file: !65, line: 742, type: !17)
!865 = !DILocation(line: 742, column: 25, scope: !854)
!866 = !DILocation(line: 742, column: 36, scope: !854)
!867 = !DILocalVariable(name: "u32Temp3", scope: !854, file: !65, line: 742, type: !17)
!868 = !DILocation(line: 742, column: 43, scope: !854)
!869 = !DILocation(line: 743, column: 13, scope: !854)
!870 = !DILocation(line: 743, column: 24, scope: !854)
!871 = !DILocation(line: 743, column: 22, scope: !854)
!872 = !DILocation(line: 743, column: 11, scope: !854)
!873 = !DILocation(line: 745, column: 14, scope: !854)
!874 = !DILocation(line: 745, column: 23, scope: !854)
!875 = !DILocation(line: 745, column: 11, scope: !854)
!876 = !DILocation(line: 746, column: 13, scope: !854)
!877 = !DILocation(line: 746, column: 22, scope: !854)
!878 = !DILocation(line: 746, column: 11, scope: !854)
!879 = !DILocation(line: 747, column: 5, scope: !880)
!880 = distinct !DILexicalBlock(scope: !854, file: !65, line: 747, column: 5)
!881 = !DILocation(line: 747, column: 14, scope: !880)
!882 = !DILocation(line: 747, column: 5, scope: !854)
!883 = !DILocation(line: 749, column: 23, scope: !884)
!884 = distinct !DILexicalBlock(scope: !880, file: !65, line: 748, column: 2)
!885 = !DILocation(line: 749, column: 11, scope: !884)
!886 = !DILocation(line: 749, column: 37, scope: !884)
!887 = !DILocation(line: 749, column: 10, scope: !884)
!888 = !DILocation(line: 749, column: 3, scope: !884)
!889 = !DILocation(line: 755, column: 14, scope: !890)
!890 = distinct !DILexicalBlock(scope: !880, file: !65, line: 754, column: 2)
!891 = !DILocation(line: 755, column: 12, scope: !890)
!892 = !DILocation(line: 756, column: 23, scope: !890)
!893 = !DILocation(line: 756, column: 11, scope: !890)
!894 = !DILocation(line: 756, column: 37, scope: !890)
!895 = !DILocation(line: 756, column: 10, scope: !890)
!896 = !DILocation(line: 756, column: 3, scope: !890)
!897 = !DILocation(line: 759, column: 1, scope: !854)
!898 = distinct !DISubprogram(name: "u16_mmv_u16_u16_u16_fac1", scope: !65, file: !65, line: 784, type: !397, scopeLine: 785, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!899 = !DILocalVariable(name: "mmv", arg: 1, scope: !898, file: !65, line: 784, type: !6)
!900 = !DILocation(line: 784, column: 43, scope: !898)
!901 = !DILocalVariable(name: "measure", arg: 2, scope: !898, file: !65, line: 784, type: !6)
!902 = !DILocation(line: 784, column: 61, scope: !898)
!903 = !DILocalVariable(name: "crlc", arg: 3, scope: !898, file: !65, line: 784, type: !6)
!904 = !DILocation(line: 784, column: 83, scope: !898)
!905 = !DILocalVariable(name: "u32Temp1", scope: !898, file: !65, line: 786, type: !17)
!906 = !DILocation(line: 786, column: 6, scope: !898)
!907 = !DILocalVariable(name: "u32Temp2", scope: !898, file: !65, line: 786, type: !17)
!908 = !DILocation(line: 786, column: 15, scope: !898)
!909 = !DILocalVariable(name: "u32Temp3", scope: !898, file: !65, line: 786, type: !17)
!910 = !DILocation(line: 786, column: 25, scope: !898)
!911 = !DILocation(line: 787, column: 5, scope: !912)
!912 = distinct !DILexicalBlock(scope: !898, file: !65, line: 787, column: 5)
!913 = !DILocation(line: 787, column: 15, scope: !912)
!914 = !DILocation(line: 787, column: 13, scope: !912)
!915 = !DILocation(line: 787, column: 5, scope: !898)
!916 = !DILocation(line: 789, column: 13, scope: !917)
!917 = distinct !DILexicalBlock(scope: !912, file: !65, line: 788, column: 2)
!918 = !DILocation(line: 789, column: 19, scope: !917)
!919 = !DILocation(line: 789, column: 17, scope: !917)
!920 = !DILocation(line: 789, column: 11, scope: !917)
!921 = !DILocation(line: 790, column: 14, scope: !917)
!922 = !DILocation(line: 790, column: 24, scope: !917)
!923 = !DILocation(line: 790, column: 22, scope: !917)
!924 = !DILocation(line: 790, column: 12, scope: !917)
!925 = !DILocation(line: 791, column: 20, scope: !917)
!926 = !DILocation(line: 791, column: 29, scope: !917)
!927 = !DILocation(line: 791, column: 14, scope: !917)
!928 = !DILocation(line: 791, column: 12, scope: !917)
!929 = !DILocation(line: 792, column: 15, scope: !917)
!930 = !DILocation(line: 792, column: 24, scope: !917)
!931 = !DILocation(line: 792, column: 34, scope: !917)
!932 = !DILocation(line: 792, column: 12, scope: !917)
!933 = !DILocation(line: 793, column: 14, scope: !917)
!934 = !DILocation(line: 793, column: 25, scope: !917)
!935 = !DILocation(line: 793, column: 23, scope: !917)
!936 = !DILocation(line: 793, column: 12, scope: !917)
!937 = !DILocation(line: 794, column: 6, scope: !938)
!938 = distinct !DILexicalBlock(scope: !917, file: !65, line: 794, column: 6)
!939 = !DILocation(line: 794, column: 15, scope: !938)
!940 = !DILocation(line: 794, column: 6, scope: !917)
!941 = !DILocation(line: 796, column: 12, scope: !942)
!942 = distinct !DILexicalBlock(scope: !938, file: !65, line: 795, column: 3)
!943 = !DILocation(line: 796, column: 18, scope: !942)
!944 = !DILocation(line: 796, column: 16, scope: !942)
!945 = !DILocation(line: 796, column: 11, scope: !942)
!946 = !DILocation(line: 796, column: 4, scope: !942)
!947 = !DILocation(line: 800, column: 7, scope: !948)
!948 = distinct !DILexicalBlock(scope: !949, file: !65, line: 800, column: 7)
!949 = distinct !DILexicalBlock(scope: !938, file: !65, line: 799, column: 3)
!950 = !DILocation(line: 800, column: 16, scope: !948)
!951 = !DILocation(line: 800, column: 7, scope: !949)
!952 = !DILocation(line: 802, column: 13, scope: !953)
!953 = distinct !DILexicalBlock(scope: !948, file: !65, line: 801, column: 4)
!954 = !DILocation(line: 802, column: 19, scope: !953)
!955 = !DILocation(line: 802, column: 17, scope: !953)
!956 = !DILocation(line: 802, column: 12, scope: !953)
!957 = !DILocation(line: 802, column: 5, scope: !953)
!958 = !DILocation(line: 806, column: 16, scope: !959)
!959 = distinct !DILexicalBlock(scope: !948, file: !65, line: 805, column: 4)
!960 = !DILocation(line: 806, column: 25, scope: !959)
!961 = !DILocation(line: 806, column: 14, scope: !959)
!962 = !DILocation(line: 807, column: 13, scope: !959)
!963 = !DILocation(line: 807, column: 19, scope: !959)
!964 = !DILocation(line: 807, column: 17, scope: !959)
!965 = !DILocation(line: 807, column: 12, scope: !959)
!966 = !DILocation(line: 807, column: 5, scope: !959)
!967 = !DILocation(line: 813, column: 13, scope: !968)
!968 = distinct !DILexicalBlock(scope: !912, file: !65, line: 812, column: 2)
!969 = !DILocation(line: 813, column: 23, scope: !968)
!970 = !DILocation(line: 813, column: 21, scope: !968)
!971 = !DILocation(line: 813, column: 11, scope: !968)
!972 = !DILocation(line: 814, column: 14, scope: !968)
!973 = !DILocation(line: 814, column: 24, scope: !968)
!974 = !DILocation(line: 814, column: 22, scope: !968)
!975 = !DILocation(line: 814, column: 12, scope: !968)
!976 = !DILocation(line: 815, column: 14, scope: !968)
!977 = !DILocation(line: 815, column: 23, scope: !968)
!978 = !DILocation(line: 815, column: 12, scope: !968)
!979 = !DILocation(line: 816, column: 15, scope: !968)
!980 = !DILocation(line: 816, column: 24, scope: !968)
!981 = !DILocation(line: 816, column: 34, scope: !968)
!982 = !DILocation(line: 816, column: 12, scope: !968)
!983 = !DILocation(line: 817, column: 14, scope: !968)
!984 = !DILocation(line: 817, column: 25, scope: !968)
!985 = !DILocation(line: 817, column: 23, scope: !968)
!986 = !DILocation(line: 817, column: 12, scope: !968)
!987 = !DILocation(line: 818, column: 6, scope: !988)
!988 = distinct !DILexicalBlock(scope: !968, file: !65, line: 818, column: 6)
!989 = !DILocation(line: 818, column: 15, scope: !988)
!990 = !DILocation(line: 818, column: 6, scope: !968)
!991 = !DILocation(line: 820, column: 12, scope: !992)
!992 = distinct !DILexicalBlock(scope: !988, file: !65, line: 819, column: 3)
!993 = !DILocation(line: 820, column: 18, scope: !992)
!994 = !DILocation(line: 820, column: 16, scope: !992)
!995 = !DILocation(line: 820, column: 11, scope: !992)
!996 = !DILocation(line: 820, column: 4, scope: !992)
!997 = !DILocation(line: 824, column: 7, scope: !998)
!998 = distinct !DILexicalBlock(scope: !999, file: !65, line: 824, column: 7)
!999 = distinct !DILexicalBlock(scope: !988, file: !65, line: 823, column: 3)
!1000 = !DILocation(line: 824, column: 16, scope: !998)
!1001 = !DILocation(line: 824, column: 7, scope: !999)
!1002 = !DILocation(line: 826, column: 13, scope: !1003)
!1003 = distinct !DILexicalBlock(scope: !998, file: !65, line: 825, column: 4)
!1004 = !DILocation(line: 826, column: 19, scope: !1003)
!1005 = !DILocation(line: 826, column: 17, scope: !1003)
!1006 = !DILocation(line: 826, column: 12, scope: !1003)
!1007 = !DILocation(line: 826, column: 5, scope: !1003)
!1008 = !DILocation(line: 830, column: 13, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !998, file: !65, line: 829, column: 4)
!1010 = !DILocation(line: 830, column: 16, scope: !1009)
!1011 = !DILocation(line: 830, column: 12, scope: !1009)
!1012 = !DILocation(line: 830, column: 5, scope: !1009)
!1013 = !DILocation(line: 835, column: 1, scope: !898)
!1014 = distinct !DISubprogram(name: "u32_mmv_u32_u32_u32_fac1", scope: !65, file: !65, line: 859, type: !1015, scopeLine: 860, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{!17, !17, !17, !17}
!1017 = !DILocalVariable(name: "mmv", arg: 1, scope: !1014, file: !65, line: 859, type: !17)
!1018 = !DILocation(line: 859, column: 43, scope: !1014)
!1019 = !DILocalVariable(name: "measure", arg: 2, scope: !1014, file: !65, line: 859, type: !17)
!1020 = !DILocation(line: 859, column: 60, scope: !1014)
!1021 = !DILocalVariable(name: "crlc", arg: 3, scope: !1014, file: !65, line: 859, type: !17)
!1022 = !DILocation(line: 859, column: 81, scope: !1014)
!1023 = !DILocalVariable(name: "u32Temp1", scope: !1014, file: !65, line: 862, type: !17)
!1024 = !DILocation(line: 862, column: 6, scope: !1014)
!1025 = !DILocalVariable(name: "u32Temp2", scope: !1014, file: !65, line: 862, type: !17)
!1026 = !DILocation(line: 862, column: 16, scope: !1014)
!1027 = !DILocalVariable(name: "u32Temp3", scope: !1014, file: !65, line: 862, type: !17)
!1028 = !DILocation(line: 862, column: 26, scope: !1014)
!1029 = !DILocalVariable(name: "u32Result1", scope: !1014, file: !65, line: 862, type: !17)
!1030 = !DILocation(line: 862, column: 36, scope: !1014)
!1031 = !DILocalVariable(name: "u32Result2", scope: !1014, file: !65, line: 862, type: !17)
!1032 = !DILocation(line: 862, column: 47, scope: !1014)
!1033 = !DILocation(line: 863, column: 5, scope: !1034)
!1034 = distinct !DILexicalBlock(scope: !1014, file: !65, line: 863, column: 5)
!1035 = !DILocation(line: 863, column: 15, scope: !1034)
!1036 = !DILocation(line: 863, column: 13, scope: !1034)
!1037 = !DILocation(line: 863, column: 5, scope: !1014)
!1038 = !DILocation(line: 865, column: 14, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1034, file: !65, line: 864, column: 2)
!1040 = !DILocation(line: 865, column: 20, scope: !1039)
!1041 = !DILocation(line: 865, column: 18, scope: !1039)
!1042 = !DILocation(line: 865, column: 12, scope: !1039)
!1043 = !DILocation(line: 866, column: 26, scope: !1039)
!1044 = !DILocation(line: 866, column: 35, scope: !1039)
!1045 = !DILocation(line: 866, column: 14, scope: !1039)
!1046 = !DILocation(line: 866, column: 12, scope: !1039)
!1047 = !DILocation(line: 867, column: 25, scope: !1039)
!1048 = !DILocation(line: 867, column: 34, scope: !1039)
!1049 = !DILocation(line: 867, column: 14, scope: !1039)
!1050 = !DILocation(line: 867, column: 12, scope: !1039)
!1051 = !DILocation(line: 868, column: 6, scope: !1052)
!1052 = distinct !DILexicalBlock(scope: !1039, file: !65, line: 868, column: 6)
!1053 = !DILocation(line: 868, column: 15, scope: !1052)
!1054 = !DILocation(line: 868, column: 6, scope: !1039)
!1055 = !DILocation(line: 870, column: 17, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !1052, file: !65, line: 869, column: 3)
!1057 = !DILocation(line: 870, column: 23, scope: !1056)
!1058 = !DILocation(line: 870, column: 21, scope: !1056)
!1059 = !DILocation(line: 870, column: 15, scope: !1056)
!1060 = !DILocation(line: 871, column: 3, scope: !1056)
!1061 = !DILocation(line: 874, column: 17, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1052, file: !65, line: 873, column: 3)
!1063 = !DILocation(line: 874, column: 24, scope: !1062)
!1064 = !DILocation(line: 874, column: 32, scope: !1062)
!1065 = !DILocation(line: 874, column: 21, scope: !1062)
!1066 = !DILocation(line: 874, column: 15, scope: !1062)
!1067 = !DILocation(line: 876, column: 6, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1039, file: !65, line: 876, column: 6)
!1069 = !DILocation(line: 876, column: 20, scope: !1068)
!1070 = !DILocation(line: 876, column: 17, scope: !1068)
!1071 = !DILocation(line: 876, column: 6, scope: !1039)
!1072 = !DILocation(line: 878, column: 12, scope: !1073)
!1073 = distinct !DILexicalBlock(scope: !1068, file: !65, line: 877, column: 3)
!1074 = !DILocation(line: 878, column: 4, scope: !1073)
!1075 = !DILocation(line: 882, column: 11, scope: !1076)
!1076 = distinct !DILexicalBlock(scope: !1068, file: !65, line: 881, column: 3)
!1077 = !DILocation(line: 882, column: 4, scope: !1076)
!1078 = !DILocation(line: 889, column: 14, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1034, file: !65, line: 888, column: 2)
!1080 = !DILocation(line: 889, column: 24, scope: !1079)
!1081 = !DILocation(line: 889, column: 22, scope: !1079)
!1082 = !DILocation(line: 889, column: 12, scope: !1079)
!1083 = !DILocation(line: 890, column: 28, scope: !1079)
!1084 = !DILocation(line: 890, column: 37, scope: !1079)
!1085 = !DILocation(line: 890, column: 16, scope: !1079)
!1086 = !DILocation(line: 890, column: 14, scope: !1079)
!1087 = !DILocation(line: 890, column: 43, scope: !1079)
!1088 = !DILocation(line: 890, column: 12, scope: !1079)
!1089 = !DILocation(line: 891, column: 25, scope: !1079)
!1090 = !DILocation(line: 891, column: 34, scope: !1079)
!1091 = !DILocation(line: 891, column: 14, scope: !1079)
!1092 = !DILocation(line: 891, column: 12, scope: !1079)
!1093 = !DILocation(line: 892, column: 16, scope: !1079)
!1094 = !DILocation(line: 892, column: 27, scope: !1079)
!1095 = !DILocation(line: 892, column: 25, scope: !1079)
!1096 = !DILocation(line: 892, column: 14, scope: !1079)
!1097 = !DILocation(line: 893, column: 6, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1079, file: !65, line: 893, column: 6)
!1099 = !DILocation(line: 893, column: 15, scope: !1098)
!1100 = !DILocation(line: 893, column: 6, scope: !1079)
!1101 = !DILocation(line: 895, column: 19, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1098, file: !65, line: 894, column: 3)
!1103 = !DILocation(line: 895, column: 18, scope: !1102)
!1104 = !DILocation(line: 895, column: 23, scope: !1102)
!1105 = !DILocation(line: 895, column: 30, scope: !1102)
!1106 = !DILocation(line: 895, column: 38, scope: !1102)
!1107 = !DILocation(line: 895, column: 27, scope: !1102)
!1108 = !DILocation(line: 895, column: 15, scope: !1102)
!1109 = !DILocation(line: 896, column: 3, scope: !1102)
!1110 = !DILocation(line: 899, column: 18, scope: !1111)
!1111 = distinct !DILexicalBlock(scope: !1098, file: !65, line: 898, column: 3)
!1112 = !DILocation(line: 899, column: 17, scope: !1111)
!1113 = !DILocation(line: 899, column: 25, scope: !1111)
!1114 = !DILocation(line: 899, column: 33, scope: !1111)
!1115 = !DILocation(line: 899, column: 22, scope: !1111)
!1116 = !DILocation(line: 899, column: 15, scope: !1111)
!1117 = !DILocation(line: 902, column: 13, scope: !1079)
!1118 = !DILocation(line: 902, column: 11, scope: !1079)
!1119 = !DILocation(line: 902, column: 24, scope: !1079)
!1120 = !DILocation(line: 902, column: 3, scope: !1079)
!1121 = !DILocation(line: 905, column: 1, scope: !1014)
!1122 = distinct !DISubprogram(name: "u32_mmv_u32_u32_u16_fac1", scope: !65, file: !65, line: 930, type: !1123, scopeLine: 931, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1123 = !DISubroutineType(types: !1124)
!1124 = !{!17, !17, !17, !6}
!1125 = !DILocalVariable(name: "mmv", arg: 1, scope: !1122, file: !65, line: 930, type: !17)
!1126 = !DILocation(line: 930, column: 34, scope: !1122)
!1127 = !DILocalVariable(name: "measure", arg: 2, scope: !1122, file: !65, line: 930, type: !17)
!1128 = !DILocation(line: 930, column: 43, scope: !1122)
!1129 = !DILocalVariable(name: "crlc", arg: 3, scope: !1122, file: !65, line: 930, type: !6)
!1130 = !DILocation(line: 930, column: 56, scope: !1122)
!1131 = !DILocalVariable(name: "u32Temp1", scope: !1122, file: !65, line: 932, type: !17)
!1132 = !DILocation(line: 932, column: 6, scope: !1122)
!1133 = !DILocalVariable(name: "u32Temp2", scope: !1122, file: !65, line: 932, type: !17)
!1134 = !DILocation(line: 932, column: 16, scope: !1122)
!1135 = !DILocalVariable(name: "u32Temp3", scope: !1122, file: !65, line: 932, type: !17)
!1136 = !DILocation(line: 932, column: 26, scope: !1122)
!1137 = !DILocalVariable(name: "u32crlc", scope: !1122, file: !65, line: 932, type: !17)
!1138 = !DILocation(line: 932, column: 36, scope: !1122)
!1139 = !DILocalVariable(name: "u32Result1", scope: !1122, file: !65, line: 933, type: !17)
!1140 = !DILocation(line: 933, column: 6, scope: !1122)
!1141 = !DILocation(line: 934, column: 17, scope: !1122)
!1142 = !DILocation(line: 934, column: 12, scope: !1122)
!1143 = !DILocation(line: 934, column: 10, scope: !1122)
!1144 = !DILocation(line: 935, column: 6, scope: !1145)
!1145 = distinct !DILexicalBlock(scope: !1122, file: !65, line: 935, column: 6)
!1146 = !DILocation(line: 935, column: 13, scope: !1145)
!1147 = !DILocation(line: 935, column: 10, scope: !1145)
!1148 = !DILocation(line: 935, column: 6, scope: !1122)
!1149 = !DILocation(line: 937, column: 15, scope: !1150)
!1150 = distinct !DILexicalBlock(scope: !1145, file: !65, line: 936, column: 2)
!1151 = !DILocation(line: 937, column: 21, scope: !1150)
!1152 = !DILocation(line: 937, column: 19, scope: !1150)
!1153 = !DILocation(line: 937, column: 12, scope: !1150)
!1154 = !DILocation(line: 938, column: 26, scope: !1150)
!1155 = !DILocation(line: 938, column: 36, scope: !1150)
!1156 = !DILocation(line: 938, column: 14, scope: !1150)
!1157 = !DILocation(line: 938, column: 12, scope: !1150)
!1158 = !DILocation(line: 939, column: 25, scope: !1150)
!1159 = !DILocation(line: 939, column: 35, scope: !1150)
!1160 = !DILocation(line: 939, column: 14, scope: !1150)
!1161 = !DILocation(line: 939, column: 12, scope: !1150)
!1162 = !DILocation(line: 940, column: 15, scope: !1150)
!1163 = !DILocation(line: 940, column: 23, scope: !1150)
!1164 = !DILocation(line: 940, column: 31, scope: !1150)
!1165 = !DILocation(line: 940, column: 40, scope: !1150)
!1166 = !DILocation(line: 940, column: 53, scope: !1150)
!1167 = !DILocation(line: 940, column: 28, scope: !1150)
!1168 = !DILocation(line: 940, column: 12, scope: !1150)
!1169 = !DILocation(line: 944, column: 8, scope: !1170)
!1170 = distinct !DILexicalBlock(scope: !1150, file: !65, line: 944, column: 7)
!1171 = !DILocation(line: 944, column: 17, scope: !1170)
!1172 = !DILocation(line: 944, column: 27, scope: !1170)
!1173 = !DILocation(line: 944, column: 7, scope: !1150)
!1174 = !DILocation(line: 946, column: 18, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !1170, file: !65, line: 945, column: 4)
!1176 = !DILocation(line: 946, column: 24, scope: !1175)
!1177 = !DILocation(line: 946, column: 22, scope: !1175)
!1178 = !DILocation(line: 946, column: 16, scope: !1175)
!1179 = !DILocation(line: 947, column: 4, scope: !1175)
!1180 = !DILocation(line: 950, column: 18, scope: !1181)
!1181 = distinct !DILexicalBlock(scope: !1170, file: !65, line: 949, column: 4)
!1182 = !DILocation(line: 950, column: 25, scope: !1181)
!1183 = !DILocation(line: 950, column: 33, scope: !1181)
!1184 = !DILocation(line: 950, column: 22, scope: !1181)
!1185 = !DILocation(line: 950, column: 16, scope: !1181)
!1186 = !DILocation(line: 953, column: 7, scope: !1187)
!1187 = distinct !DILexicalBlock(scope: !1150, file: !65, line: 953, column: 7)
!1188 = !DILocation(line: 953, column: 21, scope: !1187)
!1189 = !DILocation(line: 953, column: 18, scope: !1187)
!1190 = !DILocation(line: 953, column: 7, scope: !1150)
!1191 = !DILocation(line: 955, column: 13, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1187, file: !65, line: 954, column: 4)
!1193 = !DILocation(line: 955, column: 23, scope: !1192)
!1194 = !DILocation(line: 955, column: 5, scope: !1192)
!1195 = !DILocation(line: 959, column: 12, scope: !1196)
!1196 = distinct !DILexicalBlock(scope: !1187, file: !65, line: 958, column: 4)
!1197 = !DILocation(line: 959, column: 5, scope: !1196)
!1198 = !DILocation(line: 965, column: 14, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1145, file: !65, line: 964, column: 2)
!1200 = !DILocation(line: 965, column: 24, scope: !1199)
!1201 = !DILocation(line: 965, column: 22, scope: !1199)
!1202 = !DILocation(line: 965, column: 12, scope: !1199)
!1203 = !DILocation(line: 966, column: 26, scope: !1199)
!1204 = !DILocation(line: 966, column: 35, scope: !1199)
!1205 = !DILocation(line: 966, column: 14, scope: !1199)
!1206 = !DILocation(line: 966, column: 12, scope: !1199)
!1207 = !DILocation(line: 967, column: 25, scope: !1199)
!1208 = !DILocation(line: 967, column: 34, scope: !1199)
!1209 = !DILocation(line: 967, column: 14, scope: !1199)
!1210 = !DILocation(line: 967, column: 12, scope: !1199)
!1211 = !DILocation(line: 968, column: 17, scope: !1199)
!1212 = !DILocation(line: 968, column: 25, scope: !1199)
!1213 = !DILocation(line: 968, column: 33, scope: !1199)
!1214 = !DILocation(line: 968, column: 42, scope: !1199)
!1215 = !DILocation(line: 968, column: 55, scope: !1199)
!1216 = !DILocation(line: 968, column: 30, scope: !1199)
!1217 = !DILocation(line: 968, column: 14, scope: !1199)
!1218 = !DILocation(line: 968, column: 61, scope: !1199)
!1219 = !DILocation(line: 968, column: 12, scope: !1199)
!1220 = !DILocation(line: 969, column: 16, scope: !1199)
!1221 = !DILocation(line: 969, column: 22, scope: !1199)
!1222 = !DILocation(line: 969, column: 20, scope: !1199)
!1223 = !DILocation(line: 969, column: 31, scope: !1199)
!1224 = !DILocation(line: 969, column: 14, scope: !1199)
!1225 = !DILocation(line: 970, column: 8, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1199, file: !65, line: 970, column: 6)
!1227 = !DILocation(line: 970, column: 17, scope: !1226)
!1228 = !DILocation(line: 970, column: 27, scope: !1226)
!1229 = !DILocation(line: 970, column: 42, scope: !1226)
!1230 = !DILocation(line: 970, column: 51, scope: !1226)
!1231 = !DILocation(line: 970, column: 61, scope: !1226)
!1232 = !DILocation(line: 970, column: 38, scope: !1226)
!1233 = !DILocation(line: 970, column: 6, scope: !1199)
!1234 = !DILocation(line: 972, column: 17, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1226, file: !65, line: 971, column: 3)
!1236 = !DILocation(line: 972, column: 24, scope: !1235)
!1237 = !DILocation(line: 972, column: 22, scope: !1235)
!1238 = !DILocation(line: 972, column: 15, scope: !1235)
!1239 = !DILocation(line: 973, column: 3, scope: !1235)
!1240 = !DILocation(line: 976, column: 17, scope: !1241)
!1241 = distinct !DILexicalBlock(scope: !1226, file: !65, line: 975, column: 3)
!1242 = !DILocation(line: 976, column: 23, scope: !1241)
!1243 = !DILocation(line: 976, column: 21, scope: !1241)
!1244 = !DILocation(line: 976, column: 32, scope: !1241)
!1245 = !DILocation(line: 976, column: 15, scope: !1241)
!1246 = !DILocation(line: 979, column: 11, scope: !1199)
!1247 = !DILocation(line: 979, column: 3, scope: !1199)
!1248 = !DILocation(line: 981, column: 1, scope: !1122)
!1249 = distinct !DISubprogram(name: "u32_mmv_u32_u32_s32_fac1", scope: !65, file: !65, line: 1005, type: !1250, scopeLine: 1006, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1250 = !DISubroutineType(types: !1251)
!1251 = !{!17, !17, !17, !21}
!1252 = !DILocalVariable(name: "mmv", arg: 1, scope: !1249, file: !65, line: 1005, type: !17)
!1253 = !DILocation(line: 1005, column: 34, scope: !1249)
!1254 = !DILocalVariable(name: "measure", arg: 2, scope: !1249, file: !65, line: 1005, type: !17)
!1255 = !DILocation(line: 1005, column: 43, scope: !1249)
!1256 = !DILocalVariable(name: "crlc", arg: 3, scope: !1249, file: !65, line: 1005, type: !21)
!1257 = !DILocation(line: 1005, column: 56, scope: !1249)
!1258 = !DILocalVariable(name: "u32Temp1", scope: !1249, file: !65, line: 1007, type: !17)
!1259 = !DILocation(line: 1007, column: 6, scope: !1249)
!1260 = !DILocalVariable(name: "u32Temp2", scope: !1249, file: !65, line: 1007, type: !17)
!1261 = !DILocation(line: 1007, column: 16, scope: !1249)
!1262 = !DILocalVariable(name: "u32Temp3", scope: !1249, file: !65, line: 1007, type: !17)
!1263 = !DILocation(line: 1007, column: 26, scope: !1249)
!1264 = !DILocalVariable(name: "u32crlc", scope: !1249, file: !65, line: 1007, type: !17)
!1265 = !DILocation(line: 1007, column: 36, scope: !1249)
!1266 = !DILocalVariable(name: "u32Result1", scope: !1249, file: !65, line: 1008, type: !17)
!1267 = !DILocation(line: 1008, column: 6, scope: !1249)
!1268 = !DILocation(line: 1010, column: 1, scope: !1249)
