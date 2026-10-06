; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/rotateRight/alarm_0022/build/rotateRight_alarm_0022.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"num\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"rotation\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"src_analysis/sources/rotatefunc.c\00", align 1
@.str.1.4 = private unnamed_addr constant [70 x i8] c"KLEE-ALARM-0022: signed overflow. assert 1 << INT_BITS <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0022.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str.1.10 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str.2.11 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !31 {
entry:
  %retval = alloca i32, align 4
  %num = alloca i32, align 4
  %rotation = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %num, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %rotation, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %result, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = bitcast i32* %num to i8*, !dbg !42
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)), !dbg !43
  %1 = bitcast i32* %rotation to i8*, !dbg !44
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0)), !dbg !45
  %2 = load i32, i32* %num, align 4, !dbg !46
  %3 = load i32, i32* %rotation, align 4, !dbg !47
  %call = call i32 @rotateRight(i32 %2, i32 %3), !dbg !48
  store i32 %call, i32* %result, align 4, !dbg !49
  %4 = load i32, i32* %result, align 4, !dbg !50
  ret i32 0, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rotateLeft(i32 %num, i32 %rotation) #0 !dbg !52 {
entry:
  %num.addr = alloca i32, align 4
  %rotation.addr = alloca i32, align 4
  %DROPPED_MSB = alloca i32, align 4
  %INT_SIZE = alloca i32, align 4
  %INT_BITS = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i32 %rotation, i32* %rotation.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rotation.addr, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i32* %DROPPED_MSB, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i32* %INT_SIZE, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %INT_BITS, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 4, i32* %INT_SIZE, align 4, !dbg !68
  %0 = load i32, i32* %INT_SIZE, align 4, !dbg !69
  %mul = mul i32 %0, 8, !dbg !70
  %sub = sub i32 %mul, 1, !dbg !71
  store i32 %sub, i32* %INT_BITS, align 4, !dbg !72
  %1 = load i32, i32* %INT_BITS, align 4, !dbg !73
  %2 = load i32, i32* %rotation.addr, align 4, !dbg !74
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !74
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !74
  %rem = urem i32 %2, %1, !dbg !74, !klee.check.div !75
  store i32 %rem, i32* %rotation.addr, align 4, !dbg !74
  br label %while.cond, !dbg !76

while.cond:                                       ; preds = %while.body, %entry
  %3 = load i32, i32* %rotation.addr, align 4, !dbg !77
  %dec = add i32 %3, -1, !dbg !77
  store i32 %dec, i32* %rotation.addr, align 4, !dbg !77
  %tobool = icmp ne i32 %3, 0, !dbg !76
  br i1 %tobool, label %while.body, label %while.end, !dbg !76

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* %num.addr, align 4, !dbg !78
  %5 = load i32, i32* %INT_BITS, align 4, !dbg !80
  %int_cast_to_i641 = zext i32 %5 to i64, !dbg !81
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !81
  %shr = lshr i32 %4, %5, !dbg !81, !klee.check.shift !75
  %and = and i32 %shr, 1, !dbg !82
  store i32 %and, i32* %DROPPED_MSB, align 4, !dbg !83
  %6 = load i32, i32* %num.addr, align 4, !dbg !84
  %shl = shl i32 %6, 1, !dbg !85
  %7 = load i32, i32* %DROPPED_MSB, align 4, !dbg !86
  %or = or i32 %shl, %7, !dbg !87
  store i32 %or, i32* %num.addr, align 4, !dbg !88
  br label %while.cond, !dbg !76, !llvm.loop !89

while.end:                                        ; preds = %while.cond
  %8 = load i32, i32* %num.addr, align 4, !dbg !92
  ret i32 %8, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rotateRight(i32 %num, i32 %rotation) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %num.addr = alloca i32, align 4
  %rotation.addr = alloca i32, align 4
  %DROPPED_LSB = alloca i32, align 4
  %INT_SIZE = alloca i32, align 4
  %INT_BITS = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i32 %rotation, i32* %rotation.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rotation.addr, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32* %DROPPED_LSB, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32* %INT_SIZE, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32* %INT_BITS, metadata !103, metadata !DIExpression()), !dbg !104
  store i32 4, i32* %INT_SIZE, align 4, !dbg !105
  %0 = load i32, i32* %INT_SIZE, align 4, !dbg !106
  %mul = mul i32 %0, 8, !dbg !107
  %sub = sub i32 %mul, 1, !dbg !108
  store i32 %sub, i32* %INT_BITS, align 4, !dbg !109
  %1 = load i32, i32* %INT_BITS, align 4, !dbg !110
  %2 = load i32, i32* %rotation.addr, align 4, !dbg !111
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !111
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !111
  %rem = urem i32 %2, %1, !dbg !111, !klee.check.div !75
  store i32 %rem, i32* %rotation.addr, align 4, !dbg !111
  %3 = load i32, i32* %rotation.addr, align 4, !dbg !112
  %dec = add i32 %3, -1, !dbg !112
  store i32 %dec, i32* %rotation.addr, align 4, !dbg !112
  %tobool = icmp ne i32 %3, 0, !dbg !113
  br i1 %tobool, label %while.body, label %while.end, !dbg !113

while.body:                                       ; preds = %entry
  %4 = load i32, i32* %num.addr, align 4, !dbg !114
  %and = and i32 %4, 1, !dbg !116
  store i32 %and, i32* %DROPPED_LSB, align 4, !dbg !117
  %5 = load i32, i32* %INT_BITS, align 4, !dbg !118
  %call = call i32 @klee_alarm_s32_lshift_upper(i64 1, i32 %5), !dbg !120
  %tobool1 = icmp ne i32 %call, 0, !dbg !120
  br i1 %tobool1, label %if.end, label %if.then, !dbg !121

if.then:                                          ; preds = %while.body
  call void @klee_report_error(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0), i32 118, i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %while.body
  %6 = load i32, i32* %INT_BITS, align 4, !dbg !124
  %int_cast_to_i641 = zext i32 %6 to i64, !dbg !125
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !125
  %shl = shl i32 1, %6, !dbg !125, !klee.check.shift !75
  %conv = sext i32 %shl to i64, !dbg !126
  store volatile i64 %conv, i64* @klee_alarm_sink_s64, align 8, !dbg !127
  store i32 0, i32* %retval, align 4, !dbg !128
  br label %return, !dbg !128

while.end:                                        ; preds = %entry
  %7 = load i32, i32* %num.addr, align 4, !dbg !129
  store i32 %7, i32* %retval, align 4, !dbg !130
  br label %return, !dbg !130

return:                                           ; preds = %while.end, %if.end
  %8 = load i32, i32* %retval, align 4, !dbg !131
  ret i32 %8, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_upper(i64 %left, i32 %count) #0 !dbg !132 {
entry:
  %retval = alloca i32, align 4
  %left.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !135, metadata !DIExpression()), !dbg !136
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !137, metadata !DIExpression()), !dbg !138
  %0 = load i32, i32* %count.addr, align 4, !dbg !139
  %cmp = icmp uge i32 %0, 63, !dbg !141
  br i1 %cmp, label %if.then, label %if.end, !dbg !142

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !143
  br label %return, !dbg !143

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %left.addr, align 8, !dbg !145
  %2 = load i32, i32* %count.addr, align 4, !dbg !146
  %sh_prom = zext i32 %2 to i64, !dbg !147
  call void @klee_overshift_check(i64 64, i64 %sh_prom), !dbg !147
  %shl = shl i64 1, %sh_prom, !dbg !147, !klee.check.shift !75
  %mul = mul nsw i64 %1, %shl, !dbg !148
  %cmp1 = icmp sle i64 %mul, 2147483647, !dbg !149
  %conv = zext i1 %cmp1 to i32, !dbg !149
  store i32 %conv, i32* %retval, align 4, !dbg !150
  br label %return, !dbg !150

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !151
  ret i32 %3, !dbg !151
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !152 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !158, metadata !DIExpression()), !dbg !159
  %2 = icmp eq i64 %0, 0, !dbg !160
  br i1 %2, label %3, label %4, !dbg !162

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !163
  unreachable, !dbg !163

4:                                                ; preds = %1
  ret void, !dbg !164
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !165 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !171, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.value(metadata i64 %1, metadata !172, metadata !DIExpression()), !dbg !173
  %3 = icmp ult i64 %1, %0, !dbg !174
  br i1 %3, label %5, label %4, !dbg !176

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !177
  unreachable, !dbg !177

5:                                                ; preds = %2
  ret void, !dbg !179
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!18, !2, !20, !22}
!llvm.ident = !{!24, !24, !25, !25}
!llvm.module.flags = !{!26, !27, !28, !29, !30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !16, line: 21, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !15, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/rotateRight/alarm_0022/rotatefunc_alarm_0022.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/rotateRight/alarm_0022")
!4 = !{}
!5 = !{!6, !11}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !12, line: 26, baseType: !13)
!12 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 42, baseType: !14)
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !{!0}
!16 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/rotateRight/alarm_0022")
!17 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!18 = distinct !DICompileUnit(language: DW_LANG_C99, file: !19, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!19 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/rotateRight/alarm_0022/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/rotateRight/alarm_0022")
!20 = distinct !DICompileUnit(language: DW_LANG_C89, file: !21, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!21 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!22 = distinct !DICompileUnit(language: DW_LANG_C89, file: !23, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!23 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!24 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!25 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!26 = !{i32 7, !"Dwarf Version", i32 4}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{i32 7, !"uwtable", i32 1}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 7, type: !33, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !18, retainedNodes: !4)
!32 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/rotateRight/alarm_0022")
!33 = !DISubroutineType(types: !34)
!34 = !{!35}
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DILocalVariable(name: "num", scope: !31, file: !32, line: 9, type: !11)
!37 = !DILocation(line: 9, column: 14, scope: !31)
!38 = !DILocalVariable(name: "rotation", scope: !31, file: !32, line: 10, type: !11)
!39 = !DILocation(line: 10, column: 14, scope: !31)
!40 = !DILocalVariable(name: "result", scope: !31, file: !32, line: 11, type: !11)
!41 = !DILocation(line: 11, column: 14, scope: !31)
!42 = !DILocation(line: 13, column: 24, scope: !31)
!43 = !DILocation(line: 13, column: 5, scope: !31)
!44 = !DILocation(line: 14, column: 24, scope: !31)
!45 = !DILocation(line: 14, column: 5, scope: !31)
!46 = !DILocation(line: 16, column: 26, scope: !31)
!47 = !DILocation(line: 16, column: 31, scope: !31)
!48 = !DILocation(line: 16, column: 14, scope: !31)
!49 = !DILocation(line: 16, column: 12, scope: !31)
!50 = !DILocation(line: 18, column: 11, scope: !31)
!51 = !DILocation(line: 19, column: 5, scope: !31)
!52 = distinct !DISubprogram(name: "rotateLeft", scope: !53, file: !53, line: 51, type: !54, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DIFile(filename: "src_analysis/sources/rotatefunc.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/rotateRight/alarm_0022")
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !56}
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !57, line: 10, baseType: !11)
!57 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/rotateRight/alarm_0022")
!58 = !DILocalVariable(name: "num", arg: 1, scope: !52, file: !53, line: 51, type: !56)
!59 = !DILocation(line: 51, column: 21, scope: !52)
!60 = !DILocalVariable(name: "rotation", arg: 2, scope: !52, file: !53, line: 51, type: !56)
!61 = !DILocation(line: 51, column: 30, scope: !52)
!62 = !DILocalVariable(name: "DROPPED_MSB", scope: !52, file: !53, line: 53, type: !56)
!63 = !DILocation(line: 53, column: 9, scope: !52)
!64 = !DILocalVariable(name: "INT_SIZE", scope: !52, file: !53, line: 53, type: !56)
!65 = !DILocation(line: 53, column: 22, scope: !52)
!66 = !DILocalVariable(name: "INT_BITS", scope: !52, file: !53, line: 53, type: !56)
!67 = !DILocation(line: 53, column: 32, scope: !52)
!68 = !DILocation(line: 54, column: 14, scope: !52)
!69 = !DILocation(line: 55, column: 16, scope: !52)
!70 = !DILocation(line: 55, column: 25, scope: !52)
!71 = !DILocation(line: 55, column: 29, scope: !52)
!72 = !DILocation(line: 55, column: 14, scope: !52)
!73 = !DILocation(line: 58, column: 17, scope: !52)
!74 = !DILocation(line: 58, column: 14, scope: !52)
!75 = !{!"True"}
!76 = !DILocation(line: 62, column: 5, scope: !52)
!77 = !DILocation(line: 62, column: 19, scope: !52)
!78 = !DILocation(line: 65, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !52, file: !53, line: 63, column: 5)
!80 = !DILocation(line: 65, column: 31, scope: !79)
!81 = !DILocation(line: 65, column: 28, scope: !79)
!82 = !DILocation(line: 65, column: 41, scope: !79)
!83 = !DILocation(line: 65, column: 21, scope: !79)
!84 = !DILocation(line: 69, column: 16, scope: !79)
!85 = !DILocation(line: 69, column: 20, scope: !79)
!86 = !DILocation(line: 69, column: 28, scope: !79)
!87 = !DILocation(line: 69, column: 26, scope: !79)
!88 = !DILocation(line: 69, column: 13, scope: !79)
!89 = distinct !{!89, !76, !90, !91}
!90 = !DILocation(line: 70, column: 5, scope: !52)
!91 = !{!"llvm.loop.mustprogress"}
!92 = !DILocation(line: 72, column: 12, scope: !52)
!93 = !DILocation(line: 72, column: 5, scope: !52)
!94 = distinct !DISubprogram(name: "rotateRight", scope: !53, file: !53, line: 96, type: !54, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocalVariable(name: "num", arg: 1, scope: !94, file: !53, line: 96, type: !56)
!96 = !DILocation(line: 96, column: 21, scope: !94)
!97 = !DILocalVariable(name: "rotation", arg: 2, scope: !94, file: !53, line: 96, type: !56)
!98 = !DILocation(line: 96, column: 30, scope: !94)
!99 = !DILocalVariable(name: "DROPPED_LSB", scope: !94, file: !53, line: 98, type: !56)
!100 = !DILocation(line: 98, column: 9, scope: !94)
!101 = !DILocalVariable(name: "INT_SIZE", scope: !94, file: !53, line: 98, type: !56)
!102 = !DILocation(line: 98, column: 22, scope: !94)
!103 = !DILocalVariable(name: "INT_BITS", scope: !94, file: !53, line: 98, type: !56)
!104 = !DILocation(line: 98, column: 32, scope: !94)
!105 = !DILocation(line: 99, column: 14, scope: !94)
!106 = !DILocation(line: 100, column: 16, scope: !94)
!107 = !DILocation(line: 100, column: 25, scope: !94)
!108 = !DILocation(line: 100, column: 29, scope: !94)
!109 = !DILocation(line: 100, column: 14, scope: !94)
!110 = !DILocation(line: 103, column: 17, scope: !94)
!111 = !DILocation(line: 103, column: 14, scope: !94)
!112 = !DILocation(line: 107, column: 19, scope: !94)
!113 = !DILocation(line: 107, column: 5, scope: !94)
!114 = !DILocation(line: 110, column: 23, scope: !115)
!115 = distinct !DILexicalBlock(scope: !94, file: !53, line: 108, column: 5)
!116 = !DILocation(line: 110, column: 27, scope: !115)
!117 = !DILocation(line: 110, column: 21, scope: !115)
!118 = !DILocation(line: 115, column: 68, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !53, line: 115, column: 13)
!120 = !DILocation(line: 115, column: 15, scope: !119)
!121 = !DILocation(line: 115, column: 13, scope: !115)
!122 = !DILocation(line: 116, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !53, line: 115, column: 81)
!124 = !DILocation(line: 123, column: 46, scope: !115)
!125 = !DILocation(line: 123, column: 43, scope: !115)
!126 = !DILocation(line: 123, column: 31, scope: !115)
!127 = !DILocation(line: 123, column: 29, scope: !115)
!128 = !DILocation(line: 124, column: 9, scope: !115)
!129 = !DILocation(line: 129, column: 12, scope: !94)
!130 = !DILocation(line: 129, column: 5, scope: !94)
!131 = !DILocation(line: 130, column: 1, scope: !94)
!132 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_upper", scope: !16, file: !16, line: 90, type: !133, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!133 = !DISubroutineType(types: !134)
!134 = !{!35, !6, !11}
!135 = !DILocalVariable(name: "left", arg: 1, scope: !132, file: !16, line: 90, type: !6)
!136 = !DILocation(line: 90, column: 41, scope: !132)
!137 = !DILocalVariable(name: "count", arg: 2, scope: !132, file: !16, line: 90, type: !11)
!138 = !DILocation(line: 90, column: 56, scope: !132)
!139 = !DILocation(line: 92, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !132, file: !16, line: 92, column: 9)
!141 = !DILocation(line: 92, column: 15, scope: !140)
!142 = !DILocation(line: 92, column: 9, scope: !132)
!143 = !DILocation(line: 93, column: 9, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !16, line: 92, column: 32)
!145 = !DILocation(line: 95, column: 12, scope: !132)
!146 = !DILocation(line: 95, column: 34, scope: !132)
!147 = !DILocation(line: 95, column: 31, scope: !132)
!148 = !DILocation(line: 95, column: 17, scope: !132)
!149 = !DILocation(line: 95, column: 41, scope: !132)
!150 = !DILocation(line: 95, column: 5, scope: !132)
!151 = !DILocation(line: 96, column: 1, scope: !132)
!152 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !153, file: !153, line: 12, type: !154, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !20, retainedNodes: !157)
!153 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!154 = !DISubroutineType(types: !155)
!155 = !{null, !156}
!156 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!157 = !{!158}
!158 = !DILocalVariable(name: "z", arg: 1, scope: !152, file: !153, line: 12, type: !156)
!159 = !DILocation(line: 0, scope: !152)
!160 = !DILocation(line: 13, column: 9, scope: !161)
!161 = distinct !DILexicalBlock(scope: !152, file: !153, line: 13, column: 7)
!162 = !DILocation(line: 13, column: 7, scope: !152)
!163 = !DILocation(line: 14, column: 5, scope: !161)
!164 = !DILocation(line: 15, column: 1, scope: !152)
!165 = distinct !DISubprogram(name: "klee_overshift_check", scope: !166, file: !166, line: 20, type: !167, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !22, retainedNodes: !170)
!166 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!167 = !DISubroutineType(types: !168)
!168 = !{null, !169, !169}
!169 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!170 = !{!171, !172}
!171 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !165, file: !166, line: 20, type: !169)
!172 = !DILocalVariable(name: "shift", arg: 2, scope: !165, file: !166, line: 20, type: !169)
!173 = !DILocation(line: 0, scope: !165)
!174 = !DILocation(line: 21, column: 13, scope: !175)
!175 = distinct !DILexicalBlock(scope: !165, file: !166, line: 21, column: 7)
!176 = !DILocation(line: 21, column: 7, scope: !165)
!177 = !DILocation(line: 27, column: 5, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !166, line: 21, column: 26)
!179 = !DILocation(line: 29, column: 1, scope: !165)
