; ModuleID = 'generated/build/division_by_zero_natural.bc'
source_filename = "division_by_zero_natural.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !12 {
entry:
  %retval = alloca i32, align 4
  %denominator = alloca i32, align 4
  %quotient = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %quotient, metadata !18, metadata !DIExpression()), !dbg !20
  %0 = bitcast i32* %denominator to i8*, !dbg !21
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0)), !dbg !22
  %1 = load i32, i32* %denominator, align 4, !dbg !23
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !24
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !24
  %div = sdiv i32 100, %1, !dbg !24, !klee.check.div !25
  store volatile i32 %div, i32* %quotient, align 4, !dbg !26
  %2 = load volatile i32, i32* %quotient, align 4, !dbg !27
  %cmp = icmp eq i32 %2, 7, !dbg !28
  %conv = zext i1 %cmp to i32, !dbg !28
  ret i32 %conv, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #3 !dbg !30 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !36, metadata !DIExpression()), !dbg !37
  %2 = icmp eq i64 %0, 0, !dbg !38
  br i1 %2, label %3, label %4, !dbg !40

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.3, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !41
  unreachable, !dbg !41

4:                                                ; preds = %1
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: noreturn
declare !dbg !43 dso_local void @klee_report_error(i8*, i32, i8*, i8*) local_unnamed_addr #4

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
!1 = !DIFile(filename: "division_by_zero_natural.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_a/microtests")
!2 = !{}
!3 = distinct !DICompileUnit(language: DW_LANG_C89, file: !4, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!4 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
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
!16 = !DILocalVariable(name: "denominator", scope: !12, file: !1, line: 8, type: !15)
!17 = !DILocation(line: 8, column: 9, scope: !12)
!18 = !DILocalVariable(name: "quotient", scope: !12, file: !1, line: 9, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !15)
!20 = !DILocation(line: 9, column: 18, scope: !12)
!21 = !DILocation(line: 11, column: 24, scope: !12)
!22 = !DILocation(line: 11, column: 5, scope: !12)
!23 = !DILocation(line: 12, column: 22, scope: !12)
!24 = !DILocation(line: 12, column: 20, scope: !12)
!25 = !{!"True"}
!26 = !DILocation(line: 12, column: 14, scope: !12)
!27 = !DILocation(line: 14, column: 12, scope: !12)
!28 = !DILocation(line: 14, column: 21, scope: !12)
!29 = !DILocation(line: 14, column: 5, scope: !12)
!30 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !31, file: !31, line: 12, type: !32, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !35)
!31 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!32 = !DISubroutineType(types: !33)
!33 = !{null, !34}
!34 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!35 = !{!36}
!36 = !DILocalVariable(name: "z", arg: 1, scope: !30, file: !31, line: 12, type: !34)
!37 = !DILocation(line: 0, scope: !30)
!38 = !DILocation(line: 13, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !31, line: 13, column: 7)
!40 = !DILocation(line: 13, column: 7, scope: !30)
!41 = !DILocation(line: 14, column: 5, scope: !39)
!42 = !DILocation(line: 15, column: 1, scope: !30)
!43 = !DISubprogram(name: "klee_report_error", scope: !44, file: !44, line: 73, type: !45, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized, retainedNodes: !2)
!44 = !DIFile(filename: "src/include/klee/klee.h", directory: "/build/klee/parts/klee")
!45 = !DISubroutineType(types: !46)
!46 = !{null, !47, !15, !47, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !49)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
