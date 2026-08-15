; ModuleID = 'generated/build/invalid_shift_natural.bc'
source_filename = "invalid_shift_natural.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"count\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !12 {
entry:
  %retval = alloca i32, align 4
  %count = alloca i32, align 4
  %shifted = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %count, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %shifted, metadata !19, metadata !DIExpression()), !dbg !21
  %0 = bitcast i32* %count to i8*, !dbg !22
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !23
  %1 = load i32, i32* %count, align 4, !dbg !24
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !25
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !25
  %shl = shl i32 1, %1, !dbg !25, !klee.check.shift !26
  store volatile i32 %shl, i32* %shifted, align 4, !dbg !27
  %2 = load volatile i32, i32* %shifted, align 4, !dbg !28
  %cmp = icmp eq i32 %2, 7, !dbg !29
  %conv = zext i1 %cmp to i32, !dbg !29
  ret i32 %conv, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #3 !dbg !31 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !37, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.value(metadata i64 %1, metadata !38, metadata !DIExpression()), !dbg !39
  %3 = icmp ult i64 %1, %0, !dbg !40
  br i1 %3, label %5, label %4, !dbg !42

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !43
  unreachable, !dbg !43

5:                                                ; preds = %2
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: noreturn
declare !dbg !46 dso_local void @klee_report_error(i8*, i32, i8*, i8*) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind }

!llvm.dbg.cu = !{!0, !3}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10, !11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "invalid_shift_natural.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_a/microtests")
!2 = !{}
!3 = distinct !DICompileUnit(language: DW_LANG_C89, file: !4, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!4 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!11 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!12 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !13, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{!15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DILocalVariable(name: "count", scope: !12, file: !1, line: 8, type: !17)
!17 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!18 = !DILocation(line: 8, column: 14, scope: !12)
!19 = !DILocalVariable(name: "shifted", scope: !12, file: !1, line: 9, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !17)
!21 = !DILocation(line: 9, column: 23, scope: !12)
!22 = !DILocation(line: 11, column: 24, scope: !12)
!23 = !DILocation(line: 11, column: 5, scope: !12)
!24 = !DILocation(line: 12, column: 21, scope: !12)
!25 = !DILocation(line: 12, column: 18, scope: !12)
!26 = !{!"True"}
!27 = !DILocation(line: 12, column: 13, scope: !12)
!28 = !DILocation(line: 14, column: 12, scope: !12)
!29 = !DILocation(line: 14, column: 20, scope: !12)
!30 = !DILocation(line: 14, column: 5, scope: !12)
!31 = distinct !DISubprogram(name: "klee_overshift_check", scope: !32, file: !32, line: 20, type: !33, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !36)
!32 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!33 = !DISubroutineType(types: !34)
!34 = !{null, !35, !35}
!35 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !{!37, !38}
!37 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !31, file: !32, line: 20, type: !35)
!38 = !DILocalVariable(name: "shift", arg: 2, scope: !31, file: !32, line: 20, type: !35)
!39 = !DILocation(line: 0, scope: !31)
!40 = !DILocation(line: 21, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !31, file: !32, line: 21, column: 7)
!42 = !DILocation(line: 21, column: 7, scope: !31)
!43 = !DILocation(line: 27, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !32, line: 21, column: 26)
!45 = !DILocation(line: 29, column: 1, scope: !31)
!46 = !DISubprogram(name: "klee_report_error", scope: !47, file: !47, line: 73, type: !48, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized, retainedNodes: !2)
!47 = !DIFile(filename: "src/include/klee/klee.h", directory: "/build/klee/parts/klee")
!48 = !DISubroutineType(types: !49)
!49 = !{null, !50, !15, !50, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !52)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
