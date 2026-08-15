; ModuleID = 'generated/build/target_probe_x86_64.bc'
source_filename = "target_probe.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@probe_sizeof_char = dso_local constant i32 1, align 4, !dbg !0
@probe_sizeof_short = dso_local constant i32 2, align 4, !dbg !6
@probe_sizeof_int = dso_local constant i32 4, align 4, !dbg !10
@probe_sizeof_long = dso_local constant i32 8, align 4, !dbg !12
@probe_sizeof_long_long = dso_local constant i32 8, align 4, !dbg !14
@probe_sizeof_pointer = dso_local constant i32 8, align 4, !dbg !16
@probe_plain_char_is_signed = dso_local constant i32 1, align 4, !dbg !18
@probe_sizeof_struct = dso_local constant i32 24, align 4, !dbg !22
@probe_alignof_long = dso_local constant i32 8, align 4, !dbg !24
@probe_alignof_pointer = dso_local constant i32 8, align 4, !dbg !26

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !34 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  ret i32 0, !dbg !37
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!28, !29, !30, !31, !32}
!llvm.ident = !{!33}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "probe_sizeof_char", scope: !2, file: !3, line: 2, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "target_probe.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_a/microtests")
!4 = !{}
!5 = !{!0, !6, !10, !12, !14, !16, !18, !22, !24, !26}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "probe_sizeof_short", scope: !2, file: !3, line: 3, type: !8, isLocal: false, isDefinition: true)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !9)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "probe_sizeof_int", scope: !2, file: !3, line: 4, type: !8, isLocal: false, isDefinition: true)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "probe_sizeof_long", scope: !2, file: !3, line: 5, type: !8, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "probe_sizeof_long_long", scope: !2, file: !3, line: 6, type: !8, isLocal: false, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "probe_sizeof_pointer", scope: !2, file: !3, line: 7, type: !8, isLocal: false, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "probe_plain_char_is_signed", scope: !2, file: !3, line: 8, type: !20, isLocal: false, isDefinition: true)
!20 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "probe_sizeof_struct", scope: !2, file: !3, line: 16, type: !8, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "probe_alignof_long", scope: !2, file: !3, line: 17, type: !8, isLocal: false, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "probe_alignof_pointer", scope: !2, file: !3, line: 18, type: !8, isLocal: false, isDefinition: true)
!28 = !{i32 7, !"Dwarf Version", i32 4}
!29 = !{i32 2, !"Debug Info Version", i32 3}
!30 = !{i32 1, !"wchar_size", i32 4}
!31 = !{i32 7, !"uwtable", i32 1}
!32 = !{i32 7, !"frame-pointer", i32 2}
!33 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!34 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 20, type: !35, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DISubroutineType(types: !36)
!36 = !{!21}
!37 = !DILocation(line: 22, column: 5, scope: !34)
