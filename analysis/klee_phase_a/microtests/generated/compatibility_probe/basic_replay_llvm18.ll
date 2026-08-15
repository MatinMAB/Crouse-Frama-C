; ModuleID = 'generated/compatibility_probe/basic_replay_llvm18.bc'
source_filename = "basic_replay.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"value\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !17 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !22, metadata !DIExpression()), !dbg !23
  call void @klee_make_symbolic(ptr noundef %2, i64 noundef 4, ptr noundef @.str), !dbg !24
  %3 = load i32, ptr %2, align 4, !dbg !25
  %4 = icmp eq i32 %3, 42, !dbg !27
  br i1 %4, label %5, label %6, !dbg !28

5:                                                ; preds = %0
  store i32 42, ptr %1, align 4, !dbg !29
  br label %7, !dbg !29

6:                                                ; preds = %0
  store i32 0, ptr %1, align 4, !dbg !31
  br label %7, !dbg !31

7:                                                ; preds = %6, %5
  %8 = load i32, ptr %1, align 4, !dbg !32
  ret i32 %8, !dbg !32
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @klee_make_symbolic(ptr noundef, i64 noundef, ptr noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 10, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "basic_replay.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_a/microtests", checksumkind: CSK_MD5, checksum: "1df9651dd4e6ab0672390286593bebf6")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 48, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 6)
!7 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !8, splitDebugInlining: false, nameTableKind: None)
!8 = !{!0}
!9 = !{i32 7, !"Dwarf Version", i32 5}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 8, !"PIC Level", i32 2}
!13 = !{i32 7, !"PIE Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 2}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!17 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 6, type: !18, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!18 = !DISubroutineType(types: !19)
!19 = !{!20}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{}
!22 = !DILocalVariable(name: "value", scope: !17, file: !2, line: 8, type: !20)
!23 = !DILocation(line: 8, column: 9, scope: !17)
!24 = !DILocation(line: 10, column: 5, scope: !17)
!25 = !DILocation(line: 11, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !17, file: !2, line: 11, column: 9)
!27 = !DILocation(line: 11, column: 15, scope: !26)
!28 = !DILocation(line: 11, column: 9, scope: !17)
!29 = !DILocation(line: 12, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !2, line: 11, column: 22)
!31 = !DILocation(line: 15, column: 5, scope: !17)
!32 = !DILocation(line: 16, column: 1, scope: !17)
