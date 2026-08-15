; ModuleID = 'generated/ubsan_and_solver_probe/optimization_O0.bc'
source_filename = "optimization_ub_probe.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"optimization_ub_probe.c\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"overflow-dependent branch\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"optimization.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %value = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %value, metadata !13, metadata !DIExpression()), !dbg !14
  %0 = bitcast i32* %value to i8*, !dbg !15
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !16
  %1 = load i32, i32* %value, align 4, !dbg !17
  %add = add nsw i32 %1, 1, !dbg !19
  %2 = load i32, i32* %value, align 4, !dbg !20
  %cmp = icmp slt i32 %add, %2, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0), i32 18, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)) #4, !dbg !23
  unreachable, !dbg !23

if.end:                                           ; preds = %entry
  ret i32 0, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "optimization_ub_probe.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_a/microtests")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 11, type: !10, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "value", scope: !9, file: !1, line: 13, type: !12)
!14 = !DILocation(line: 13, column: 9, scope: !9)
!15 = !DILocation(line: 15, column: 24, scope: !9)
!16 = !DILocation(line: 15, column: 5, scope: !9)
!17 = !DILocation(line: 16, column: 9, scope: !18)
!18 = distinct !DILexicalBlock(scope: !9, file: !1, line: 16, column: 9)
!19 = !DILocation(line: 16, column: 15, scope: !18)
!20 = !DILocation(line: 16, column: 21, scope: !18)
!21 = !DILocation(line: 16, column: 19, scope: !18)
!22 = !DILocation(line: 16, column: 9, scope: !9)
!23 = !DILocation(line: 17, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !18, file: !1, line: 16, column: 28)
!25 = !DILocation(line: 21, column: 5, scope: !9)
