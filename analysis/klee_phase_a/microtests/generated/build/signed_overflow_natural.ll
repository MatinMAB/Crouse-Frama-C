; ModuleID = 'generated/build/signed_overflow_natural.bc'
source_filename = "signed_overflow_natural.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"value\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %value = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %value, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !15, metadata !DIExpression()), !dbg !17
  %0 = bitcast i32* %value to i8*, !dbg !18
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !19
  %1 = load i32, i32* %value, align 4, !dbg !20
  %add = add nsw i32 %1, 1, !dbg !21
  store volatile i32 %add, i32* %sum, align 4, !dbg !22
  %2 = load volatile i32, i32* %sum, align 4, !dbg !23
  %cmp = icmp eq i32 %2, 7, !dbg !24
  %conv = zext i1 %cmp to i32, !dbg !24
  ret i32 %conv, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "signed_overflow_natural.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_a/microtests")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !10, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "value", scope: !9, file: !1, line: 8, type: !12)
!14 = !DILocation(line: 8, column: 9, scope: !9)
!15 = !DILocalVariable(name: "sum", scope: !9, file: !1, line: 9, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !12)
!17 = !DILocation(line: 9, column: 18, scope: !9)
!18 = !DILocation(line: 11, column: 24, scope: !9)
!19 = !DILocation(line: 11, column: 5, scope: !9)
!20 = !DILocation(line: 12, column: 11, scope: !9)
!21 = !DILocation(line: 12, column: 17, scope: !9)
!22 = !DILocation(line: 12, column: 9, scope: !9)
!23 = !DILocation(line: 14, column: 12, scope: !9)
!24 = !DILocation(line: 14, column: 16, scope: !9)
!25 = !DILocation(line: 14, column: 5, scope: !9)
