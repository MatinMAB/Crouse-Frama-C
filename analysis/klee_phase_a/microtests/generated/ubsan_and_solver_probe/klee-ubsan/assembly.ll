; ModuleID = 'generated/ubsan_and_solver_probe/signed_overflow_ubsan.bc'
source_filename = "signed_overflow_ubsan.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.TypeMismatchData = type <{ %"class.__ubsan::SourceLocation", %"class.__ubsan::TypeDescriptor"*, i8, i8, [6 x i8] }>
%"class.__ubsan::SourceLocation" = type { i8*, i32, i32 }
%"class.__ubsan::TypeDescriptor" = type <{ i16, i16, [1 x i8], i8 }>
%struct.AlignmentAssumptionData = type { %"class.__ubsan::SourceLocation", %"class.__ubsan::SourceLocation", %"class.__ubsan::TypeDescriptor"* }
%struct.OverflowData = type { %"class.__ubsan::SourceLocation", %"class.__ubsan::TypeDescriptor"* }
%struct.ShiftOutOfBoundsData = type { %"class.__ubsan::SourceLocation", %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"* }
%struct.UnreachableData = type { %"class.__ubsan::SourceLocation" }
%struct.ImplicitConversionData = type <{ %"class.__ubsan::SourceLocation", %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"*, i8, [7 x i8] }>
%struct.InvalidBuiltinData = type <{ %"class.__ubsan::SourceLocation", i8, [7 x i8] }>
%struct.NonNullArgData = type <{ %"class.__ubsan::SourceLocation", %"class.__ubsan::SourceLocation", i32, [4 x i8] }>

@.str = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.src = private unnamed_addr constant [24 x i8] c"signed_overflow_ubsan.c\00", align 1
@0 = private unnamed_addr constant { i16, i16, [6 x i8] } { i16 0, i16 11, [6 x i8] c"'int'\00" }
@1 = private unnamed_addr global { { [24 x i8]*, i32, i32 }, { i16, i16, [6 x i8] }* } { { [24 x i8]*, i32, i32 } { [24 x i8]* @.src, i32 12, i32 17 }, { i16, i16, [6 x i8] }* @0 }
@.str.3 = private unnamed_addr constant [70 x i8] c"/build/klee/parts/klee/src/runtime/Sanitizer/ubsan/ubsan_handlers.cpp\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"undefined-behavior\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"null-pointer-use\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"nullptr-with-offset\00", align 1
@.str.7 = private unnamed_addr constant [28 x i8] c"nullptr-with-nonzero-offset\00", align 1
@.str.8 = private unnamed_addr constant [29 x i8] c"nullptr-after-nonzero-offset\00", align 1
@.str.9 = private unnamed_addr constant [17 x i8] c"pointer-overflow\00", align 1
@.str.10 = private unnamed_addr constant [23 x i8] c"misaligned-pointer-use\00", align 1
@.str.11 = private unnamed_addr constant [21 x i8] c"alignment-assumption\00", align 1
@.str.12 = private unnamed_addr constant [25 x i8] c"insufficient-object-size\00", align 1
@.str.13 = private unnamed_addr constant [24 x i8] c"signed-integer-overflow\00", align 1
@.str.14 = private unnamed_addr constant [26 x i8] c"unsigned-integer-overflow\00", align 1
@.str.15 = private unnamed_addr constant [23 x i8] c"integer-divide-by-zero\00", align 1
@.str.16 = private unnamed_addr constant [21 x i8] c"float-divide-by-zero\00", align 1
@.str.17 = private unnamed_addr constant [20 x i8] c"invalid-builtin-use\00", align 1
@.str.18 = private unnamed_addr constant [18 x i8] c"invalid-objc-cast\00", align 1
@.str.19 = private unnamed_addr constant [37 x i8] c"implicit-unsigned-integer-truncation\00", align 1
@.str.20 = private unnamed_addr constant [35 x i8] c"implicit-signed-integer-truncation\00", align 1
@.str.21 = private unnamed_addr constant [29 x i8] c"implicit-integer-sign-change\00", align 1
@.str.22 = private unnamed_addr constant [50 x i8] c"implicit-signed-integer-truncation-or-sign-change\00", align 1
@.str.23 = private unnamed_addr constant [19 x i8] c"invalid-shift-base\00", align 1
@.str.24 = private unnamed_addr constant [23 x i8] c"invalid-shift-exponent\00", align 1
@.str.25 = private unnamed_addr constant [20 x i8] c"out-of-bounds-index\00", align 1
@.str.26 = private unnamed_addr constant [17 x i8] c"unreachable-call\00", align 1
@.str.27 = private unnamed_addr constant [15 x i8] c"missing-return\00", align 1
@.str.28 = private unnamed_addr constant [23 x i8] c"non-positive-vla-index\00", align 1
@.str.29 = private unnamed_addr constant [20 x i8] c"float-cast-overflow\00", align 1
@.str.30 = private unnamed_addr constant [18 x i8] c"invalid-bool-load\00", align 1
@.str.31 = private unnamed_addr constant [18 x i8] c"invalid-enum-load\00", align 1
@.str.32 = private unnamed_addr constant [23 x i8] c"function-type-mismatch\00", align 1
@.str.33 = private unnamed_addr constant [20 x i8] c"invalid-null-return\00", align 1
@.str.34 = private unnamed_addr constant [22 x i8] c"invalid-null-argument\00", align 1
@.str.37 = private unnamed_addr constant [9 x i8] c"exec.err\00", align 1
@.str.38 = private unnamed_addr constant [8 x i8] c"ptr.err\00", align 1
@.str.39 = private unnamed_addr constant [13 x i8] c"overflow.err\00", align 1
@.str.40 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str.41 = private unnamed_addr constant [24 x i8] c"invalid_builtin_use.err\00", align 1
@.str.42 = private unnamed_addr constant [24 x i8] c"implicit_truncation.err\00", align 1
@.str.43 = private unnamed_addr constant [24 x i8] c"implicit_conversion.err\00", align 1
@.str.44 = private unnamed_addr constant [21 x i8] c"unreachable_call.err\00", align 1
@.str.45 = private unnamed_addr constant [19 x i8] c"missing_return.err\00", align 1
@.str.46 = private unnamed_addr constant [17 x i8] c"invalid_load.err\00", align 1
@.str.47 = private unnamed_addr constant [23 x i8] c"nullable_attribute.err\00", align 1
@.str.48 = private unnamed_addr constant [26 x i8] c"integer division overflow\00", align 1
@.str.49 = private unnamed_addr constant [20 x i8] c"shift out of bounds\00", align 1
@.str.50 = private unnamed_addr constant [19 x i8] c"load invalid value\00", align 1
@switch.table._ZN7__ubsanL19ConvertTypeToStringENS_9ErrorTypeE = private unnamed_addr constant [34 x i8*] [i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.15, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.16, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.17, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.18, i64 0, i64 0), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.19, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.20, i64 0, i64 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.21, i64 0, i64 0), i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.22, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.23, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.24, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.25, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.26, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.27, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.28, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.29, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.30, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.31, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.32, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.33, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.33, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.34, i64 0, i64 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.34, i64 0, i64 0)], align 8
@switch.table._ZN7__ubsanL10get_suffixENS_9ErrorTypeE = private unnamed_addr constant [33 x i8*] [i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.38, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.38, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.38, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.38, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.38, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.38, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.38, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.38, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.38, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.39, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.39, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.40, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.40, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.41, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.37, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.42, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.42, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.43, i64 0, i64 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.43, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.39, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.39, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.38, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.44, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.45, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.38, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.39, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.46, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.46, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.37, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.47, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.47, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.47, i64 0, i64 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.47, i64 0, i64 0)], align 8
@.str.35 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !114 {
entry:
  %retval = alloca i32, align 4
  %value = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %value, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !119, metadata !DIExpression()), !dbg !121
  %0 = bitcast i32* %value to i8*, !dbg !122
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !123
  %1 = load i32, i32* %value, align 4, !dbg !124
  %2 = sext i32 %1 to i64, !dbg !125
  %3 = add i64 %2, 1, !dbg !125
  %4 = icmp slt i64 %3, -2147483648, !dbg !125
  %5 = icmp sgt i64 %3, 2147483647, !dbg !125
  %6 = or i1 %5, %4, !dbg !125
  %7 = trunc i64 %3 to i32, !dbg !125
  %8 = insertvalue { i32, i1 } undef, i32 %7, 0, !dbg !125
  %9 = insertvalue { i32, i1 } %8, i1 %6, 1, !dbg !125
  %10 = extractvalue { i32, i1 } %9, 0, !dbg !125, !nosanitize !2
  %11 = extractvalue { i32, i1 } %9, 1, !dbg !125, !nosanitize !2
  %12 = xor i1 %11, true, !dbg !125, !nosanitize !2
  br i1 %12, label %cont, label %handler.add_overflow, !dbg !125, !prof !126, !nosanitize !2

handler.add_overflow:                             ; preds = %entry
  %13 = zext i32 %1 to i64, !dbg !125, !nosanitize !2
  call void bitcast (void (%struct.OverflowData*, i64, i64)* @__ubsan_handle_add_overflow_abort to void (i8*, i64, i64)*)(i8* bitcast ({ { [24 x i8]*, i32, i32 }, { i16, i16, [6 x i8] }* }* @1 to i8*), i64 %13, i64 1) #8, !dbg !125, !nosanitize !2
  unreachable, !dbg !125, !nosanitize !2

cont:                                             ; preds = %entry
  store volatile i32 %10, i32* %sum, align 4, !dbg !127
  %14 = load volatile i32, i32* %sum, align 4, !dbg !128
  %cmp = icmp eq i32 %14, 7, !dbg !129
  %conv = zext i1 %cmp to i32, !dbg !129
  ret i32 %conv, !dbg !130
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #1

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_type_mismatch_v1(%struct.TypeMismatchData* nocapture readonly %0, i64 %1) local_unnamed_addr #3 !dbg !131 {
  call void @llvm.dbg.value(metadata %struct.TypeMismatchData* %0, metadata !146, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata i64 %1, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.value(metadata %struct.TypeMismatchData* %0, metadata !149, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.value(metadata i64 %1, metadata !152, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i8 undef), metadata !153, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_stack_value)), !dbg !155
  %3 = icmp eq i64 %1, 0, !dbg !157
  br i1 %3, label %4, label %9, !dbg !159

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.TypeMismatchData, %struct.TypeMismatchData* %0, i64 0, i32 3, !dbg !160
  %6 = load i8, i8* %5, align 1, !dbg !160, !tbaa !161
  %7 = icmp eq i8 %6, 10, !dbg !168
  %8 = select i1 %7, i32 2, i32 1, !dbg !169
  call void @llvm.dbg.value(metadata i32 %8, metadata !154, metadata !DIExpression()), !dbg !155
  br label %18, !dbg !170

9:                                                ; preds = %2
  %10 = getelementptr inbounds %struct.TypeMismatchData, %struct.TypeMismatchData* %0, i64 0, i32 2, !dbg !171
  %11 = load i8, i8* %10, align 8, !dbg !171, !tbaa !172
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i8 undef), metadata !153, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_stack_value)), !dbg !155
  %12 = zext i8 %11 to i64, !dbg !173
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i64 undef), metadata !153, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shl, DW_OP_stack_value)), !dbg !155
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i64 undef), metadata !153, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shl, DW_OP_stack_value)), !dbg !155
  call void @klee_overshift_check(i64 64, i64 %12), !dbg !174
  %13 = shl nsw i64 -1, %12, !dbg !174, !klee.check.shift !176
  %14 = xor i64 %13, -1, !dbg !174
  %15 = and i64 %14, %1, !dbg !177
  %16 = icmp eq i64 %15, 0, !dbg !178
  %17 = select i1 %16, i32 9, i32 7
  br label %18

18:                                               ; preds = %9, %4
  %19 = phi i32 [ %8, %4 ], [ %17, %9 ], !dbg !179
  call void @llvm.dbg.value(metadata i32 %19, metadata !154, metadata !DIExpression()), !dbg !155
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %19) #9, !dbg !180
  unreachable, !dbg !180
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: mustprogress noreturn uwtable
define internal fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %0) unnamed_addr #4 !dbg !181 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !185, metadata !DIExpression()), !dbg !186
  %2 = tail call fastcc i8* @_ZN7__ubsanL19ConvertTypeToStringENS_9ErrorTypeE(i32 %0), !dbg !187
  %3 = tail call fastcc i8* @_ZN7__ubsanL10get_suffixENS_9ErrorTypeE(i32 %0), !dbg !188
  tail call fastcc void @_ZN7__ubsanL12report_errorEPKcS1_(i8* %2, i8* %3) #9, !dbg !189
  unreachable, !dbg !189
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn
define internal fastcc i8* @_ZN7__ubsanL19ConvertTypeToStringENS_9ErrorTypeE(i32 %0) unnamed_addr #5 !dbg !190 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !194, metadata !DIExpression()), !dbg !195
  %2 = sext i32 %0 to i64, !dbg !196
  %3 = getelementptr inbounds [34 x i8*], [34 x i8*]* @switch.table._ZN7__ubsanL19ConvertTypeToStringENS_9ErrorTypeE, i64 0, i64 %2, !dbg !196
  %4 = load i8*, i8** %3, align 8, !dbg !196
  ret i8* %4, !dbg !197
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn
define internal fastcc i8* @_ZN7__ubsanL10get_suffixENS_9ErrorTypeE(i32 %0) unnamed_addr #5 !dbg !198 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !200, metadata !DIExpression()), !dbg !201
  %2 = add i32 %0, -1, !dbg !202
  %3 = icmp ult i32 %2, 33, !dbg !202
  br i1 %3, label %4, label %8, !dbg !202

4:                                                ; preds = %1
  %5 = sext i32 %2 to i64, !dbg !202
  %6 = getelementptr inbounds [33 x i8*], [33 x i8*]* @switch.table._ZN7__ubsanL10get_suffixENS_9ErrorTypeE, i64 0, i64 %5, !dbg !202
  %7 = load i8*, i8** %6, align 8, !dbg !202
  br label %8, !dbg !202

8:                                                ; preds = %4, %1
  %9 = phi i8* [ getelementptr inbounds ([9 x i8], [9 x i8]* @.str.37, i64 0, i64 0), %1 ], [ %7, %4 ], !dbg !203
  ret i8* %9, !dbg !205
}

; Function Attrs: mustprogress noreturn uwtable
define internal fastcc void @_ZN7__ubsanL12report_errorEPKcS1_(i8* %0, i8* %1) unnamed_addr #4 !dbg !206 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !210, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.value(metadata i8* %1, metadata !211, metadata !DIExpression()), !dbg !212
  tail call void @klee_report_error(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.3, i64 0, i64 0), i32 37, i8* %0, i8* %1) #9, !dbg !213
  unreachable, !dbg !213
}

; Function Attrs: noreturn
declare !dbg !214 dso_local void @klee_report_error(i8*, i32, i8*, i8*) local_unnamed_addr #6

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_type_mismatch_v1_abort(%struct.TypeMismatchData* nocapture readonly %0, i64 %1) local_unnamed_addr #3 !dbg !217 {
  call void @llvm.dbg.value(metadata %struct.TypeMismatchData* %0, metadata !219, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata i64 %1, metadata !220, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.value(metadata %struct.TypeMismatchData* %0, metadata !149, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.value(metadata i64 %1, metadata !152, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i8 undef), metadata !153, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_stack_value)), !dbg !222
  %3 = icmp eq i64 %1, 0, !dbg !224
  br i1 %3, label %4, label %9, !dbg !225

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.TypeMismatchData, %struct.TypeMismatchData* %0, i64 0, i32 3, !dbg !226
  %6 = load i8, i8* %5, align 1, !dbg !226, !tbaa !161
  %7 = icmp eq i8 %6, 10, !dbg !227
  %8 = select i1 %7, i32 2, i32 1, !dbg !228
  call void @llvm.dbg.value(metadata i32 %8, metadata !154, metadata !DIExpression()), !dbg !222
  br label %18, !dbg !229

9:                                                ; preds = %2
  %10 = getelementptr inbounds %struct.TypeMismatchData, %struct.TypeMismatchData* %0, i64 0, i32 2, !dbg !230
  %11 = load i8, i8* %10, align 8, !dbg !230, !tbaa !172
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i8 undef), metadata !153, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_shl, DW_OP_stack_value)), !dbg !222
  %12 = zext i8 %11 to i64, !dbg !231
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i64 undef), metadata !153, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shl, DW_OP_stack_value)), !dbg !222
  call void @llvm.dbg.value(metadata !DIArgList(i64 1, i64 undef), metadata !153, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_shl, DW_OP_stack_value)), !dbg !222
  call void @klee_overshift_check(i64 64, i64 %12), !dbg !232
  %13 = shl nsw i64 -1, %12, !dbg !232, !klee.check.shift !176
  %14 = xor i64 %13, -1, !dbg !232
  %15 = and i64 %14, %1, !dbg !233
  %16 = icmp eq i64 %15, 0, !dbg !234
  %17 = select i1 %16, i32 9, i32 7
  br label %18

18:                                               ; preds = %9, %4
  %19 = phi i32 [ %8, %4 ], [ %17, %9 ], !dbg !235
  call void @llvm.dbg.value(metadata i32 %19, metadata !154, metadata !DIExpression()), !dbg !222
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %19) #9, !dbg !236
  unreachable, !dbg !236
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_alignment_assumption(%struct.AlignmentAssumptionData* nocapture readnone %0, i64 %1, i64 %2, i64 %3) local_unnamed_addr #3 !dbg !237 {
  call void @llvm.dbg.value(metadata %struct.AlignmentAssumptionData* %0, metadata !243, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i64 %1, metadata !244, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i64 %2, metadata !245, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i64 %3, metadata !246, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata %struct.AlignmentAssumptionData* undef, metadata !248, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata i64 undef, metadata !251, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata i64 undef, metadata !252, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata i64 undef, metadata !253, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.value(metadata i32 8, metadata !254, metadata !DIExpression()), !dbg !255
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 8) #9, !dbg !257
  unreachable, !dbg !257
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_alignment_assumption_abort(%struct.AlignmentAssumptionData* nocapture readnone %0, i64 %1, i64 %2, i64 %3) local_unnamed_addr #3 !dbg !258 {
  call void @llvm.dbg.value(metadata %struct.AlignmentAssumptionData* %0, metadata !260, metadata !DIExpression()), !dbg !264
  call void @llvm.dbg.value(metadata i64 %1, metadata !261, metadata !DIExpression()), !dbg !264
  call void @llvm.dbg.value(metadata i64 %2, metadata !262, metadata !DIExpression()), !dbg !264
  call void @llvm.dbg.value(metadata i64 %3, metadata !263, metadata !DIExpression()), !dbg !264
  call void @llvm.dbg.value(metadata %struct.AlignmentAssumptionData* undef, metadata !248, metadata !DIExpression()), !dbg !265
  call void @llvm.dbg.value(metadata i64 undef, metadata !251, metadata !DIExpression()), !dbg !265
  call void @llvm.dbg.value(metadata i64 undef, metadata !252, metadata !DIExpression()), !dbg !265
  call void @llvm.dbg.value(metadata i64 undef, metadata !253, metadata !DIExpression()), !dbg !265
  call void @llvm.dbg.value(metadata i32 8, metadata !254, metadata !DIExpression()), !dbg !265
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 8) #9, !dbg !267
  unreachable, !dbg !267
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_add_overflow(%struct.OverflowData* nocapture readonly %0, i64 %1, i64 %2) local_unnamed_addr #3 !dbg !268 {
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !277, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.value(metadata i64 %1, metadata !278, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.value(metadata i64 %2, metadata !279, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !281, metadata !DIExpression()), !dbg !290
  call void @llvm.dbg.value(metadata i64 undef, metadata !286, metadata !DIExpression()), !dbg !290
  call void @llvm.dbg.value(metadata i8* undef, metadata !287, metadata !DIExpression()), !dbg !290
  %4 = getelementptr inbounds %struct.OverflowData, %struct.OverflowData* %0, i64 0, i32 1, !dbg !292
  %5 = load %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"** %4, align 8, !dbg !292, !tbaa !293
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !295, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !301, metadata !DIExpression()), !dbg !304
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !306, metadata !DIExpression()), !dbg !309
  %6 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 0, !dbg !311
  %7 = load i16, i16* %6, align 2, !dbg !311, !tbaa !312
  %8 = icmp eq i16 %7, 0, !dbg !315
  %9 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 1, !dbg !316
  %10 = load i16, i16* %9, align 2, !dbg !316
  %11 = and i16 %10, 1, !dbg !316
  %12 = icmp ne i16 %11, 0, !dbg !316
  %13 = select i1 %8, i1 %12, i1 false, !dbg !316
  call void @llvm.dbg.value(metadata i1 %13, metadata !288, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !290
  %14 = select i1 %13, i32 10, i32 11, !dbg !317
  call void @llvm.dbg.value(metadata i32 %14, metadata !289, metadata !DIExpression()), !dbg !290
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %14) #9, !dbg !318
  unreachable, !dbg !318
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_add_overflow_abort(%struct.OverflowData* nocapture readonly %0, i64 %1, i64 %2) #3 !dbg !319 {
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !321, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata i64 %1, metadata !322, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata i64 %2, metadata !323, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !281, metadata !DIExpression()), !dbg !325
  call void @llvm.dbg.value(metadata i64 undef, metadata !286, metadata !DIExpression()), !dbg !325
  call void @llvm.dbg.value(metadata i8* undef, metadata !287, metadata !DIExpression()), !dbg !325
  %4 = getelementptr inbounds %struct.OverflowData, %struct.OverflowData* %0, i64 0, i32 1, !dbg !327
  %5 = load %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"** %4, align 8, !dbg !327, !tbaa !293
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !295, metadata !DIExpression()), !dbg !328
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !301, metadata !DIExpression()), !dbg !330
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !306, metadata !DIExpression()), !dbg !332
  %6 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 0, !dbg !334
  %7 = load i16, i16* %6, align 2, !dbg !334, !tbaa !312
  %8 = icmp eq i16 %7, 0, !dbg !335
  %9 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 1, !dbg !336
  %10 = load i16, i16* %9, align 2, !dbg !336
  %11 = and i16 %10, 1, !dbg !336
  %12 = icmp ne i16 %11, 0, !dbg !336
  %13 = select i1 %8, i1 %12, i1 false, !dbg !336
  call void @llvm.dbg.value(metadata i1 %13, metadata !288, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !325
  %14 = select i1 %13, i32 10, i32 11, !dbg !337
  call void @llvm.dbg.value(metadata i32 %14, metadata !289, metadata !DIExpression()), !dbg !325
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %14) #9, !dbg !338
  unreachable, !dbg !338
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_sub_overflow(%struct.OverflowData* nocapture readonly %0, i64 %1, i64 %2) local_unnamed_addr #3 !dbg !339 {
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !341, metadata !DIExpression()), !dbg !344
  call void @llvm.dbg.value(metadata i64 %1, metadata !342, metadata !DIExpression()), !dbg !344
  call void @llvm.dbg.value(metadata i64 %2, metadata !343, metadata !DIExpression()), !dbg !344
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !281, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata i64 undef, metadata !286, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata i8* undef, metadata !287, metadata !DIExpression()), !dbg !345
  %4 = getelementptr inbounds %struct.OverflowData, %struct.OverflowData* %0, i64 0, i32 1, !dbg !347
  %5 = load %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"** %4, align 8, !dbg !347, !tbaa !293
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !295, metadata !DIExpression()), !dbg !348
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !301, metadata !DIExpression()), !dbg !350
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !306, metadata !DIExpression()), !dbg !352
  %6 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 0, !dbg !354
  %7 = load i16, i16* %6, align 2, !dbg !354, !tbaa !312
  %8 = icmp eq i16 %7, 0, !dbg !355
  %9 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 1, !dbg !356
  %10 = load i16, i16* %9, align 2, !dbg !356
  %11 = and i16 %10, 1, !dbg !356
  %12 = icmp ne i16 %11, 0, !dbg !356
  %13 = select i1 %8, i1 %12, i1 false, !dbg !356
  call void @llvm.dbg.value(metadata i1 %13, metadata !288, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !345
  %14 = select i1 %13, i32 10, i32 11, !dbg !357
  call void @llvm.dbg.value(metadata i32 %14, metadata !289, metadata !DIExpression()), !dbg !345
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %14) #9, !dbg !358
  unreachable, !dbg !358
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_sub_overflow_abort(%struct.OverflowData* nocapture readonly %0, i64 %1, i64 %2) local_unnamed_addr #3 !dbg !359 {
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !361, metadata !DIExpression()), !dbg !364
  call void @llvm.dbg.value(metadata i64 %1, metadata !362, metadata !DIExpression()), !dbg !364
  call void @llvm.dbg.value(metadata i64 %2, metadata !363, metadata !DIExpression()), !dbg !364
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !281, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.value(metadata i64 undef, metadata !286, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.value(metadata i8* undef, metadata !287, metadata !DIExpression()), !dbg !365
  %4 = getelementptr inbounds %struct.OverflowData, %struct.OverflowData* %0, i64 0, i32 1, !dbg !367
  %5 = load %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"** %4, align 8, !dbg !367, !tbaa !293
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !295, metadata !DIExpression()), !dbg !368
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !301, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !306, metadata !DIExpression()), !dbg !372
  %6 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 0, !dbg !374
  %7 = load i16, i16* %6, align 2, !dbg !374, !tbaa !312
  %8 = icmp eq i16 %7, 0, !dbg !375
  %9 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 1, !dbg !376
  %10 = load i16, i16* %9, align 2, !dbg !376
  %11 = and i16 %10, 1, !dbg !376
  %12 = icmp ne i16 %11, 0, !dbg !376
  %13 = select i1 %8, i1 %12, i1 false, !dbg !376
  call void @llvm.dbg.value(metadata i1 %13, metadata !288, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !365
  %14 = select i1 %13, i32 10, i32 11, !dbg !377
  call void @llvm.dbg.value(metadata i32 %14, metadata !289, metadata !DIExpression()), !dbg !365
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %14) #9, !dbg !378
  unreachable, !dbg !378
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_mul_overflow(%struct.OverflowData* nocapture readonly %0, i64 %1, i64 %2) local_unnamed_addr #3 !dbg !379 {
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !381, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.value(metadata i64 %1, metadata !382, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.value(metadata i64 %2, metadata !383, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !281, metadata !DIExpression()), !dbg !385
  call void @llvm.dbg.value(metadata i64 undef, metadata !286, metadata !DIExpression()), !dbg !385
  call void @llvm.dbg.value(metadata i8* undef, metadata !287, metadata !DIExpression()), !dbg !385
  %4 = getelementptr inbounds %struct.OverflowData, %struct.OverflowData* %0, i64 0, i32 1, !dbg !387
  %5 = load %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"** %4, align 8, !dbg !387, !tbaa !293
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !295, metadata !DIExpression()), !dbg !388
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !301, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !306, metadata !DIExpression()), !dbg !392
  %6 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 0, !dbg !394
  %7 = load i16, i16* %6, align 2, !dbg !394, !tbaa !312
  %8 = icmp eq i16 %7, 0, !dbg !395
  %9 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 1, !dbg !396
  %10 = load i16, i16* %9, align 2, !dbg !396
  %11 = and i16 %10, 1, !dbg !396
  %12 = icmp ne i16 %11, 0, !dbg !396
  %13 = select i1 %8, i1 %12, i1 false, !dbg !396
  call void @llvm.dbg.value(metadata i1 %13, metadata !288, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !385
  %14 = select i1 %13, i32 10, i32 11, !dbg !397
  call void @llvm.dbg.value(metadata i32 %14, metadata !289, metadata !DIExpression()), !dbg !385
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %14) #9, !dbg !398
  unreachable, !dbg !398
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_mul_overflow_abort(%struct.OverflowData* nocapture readonly %0, i64 %1, i64 %2) local_unnamed_addr #3 !dbg !399 {
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !401, metadata !DIExpression()), !dbg !404
  call void @llvm.dbg.value(metadata i64 %1, metadata !402, metadata !DIExpression()), !dbg !404
  call void @llvm.dbg.value(metadata i64 %2, metadata !403, metadata !DIExpression()), !dbg !404
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !281, metadata !DIExpression()), !dbg !405
  call void @llvm.dbg.value(metadata i64 undef, metadata !286, metadata !DIExpression()), !dbg !405
  call void @llvm.dbg.value(metadata i8* undef, metadata !287, metadata !DIExpression()), !dbg !405
  %4 = getelementptr inbounds %struct.OverflowData, %struct.OverflowData* %0, i64 0, i32 1, !dbg !407
  %5 = load %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"** %4, align 8, !dbg !407, !tbaa !293
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !295, metadata !DIExpression()), !dbg !408
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !301, metadata !DIExpression()), !dbg !410
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !306, metadata !DIExpression()), !dbg !412
  %6 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 0, !dbg !414
  %7 = load i16, i16* %6, align 2, !dbg !414, !tbaa !312
  %8 = icmp eq i16 %7, 0, !dbg !415
  %9 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 1, !dbg !416
  %10 = load i16, i16* %9, align 2, !dbg !416
  %11 = and i16 %10, 1, !dbg !416
  %12 = icmp ne i16 %11, 0, !dbg !416
  %13 = select i1 %8, i1 %12, i1 false, !dbg !416
  call void @llvm.dbg.value(metadata i1 %13, metadata !288, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !405
  %14 = select i1 %13, i32 10, i32 11, !dbg !417
  call void @llvm.dbg.value(metadata i32 %14, metadata !289, metadata !DIExpression()), !dbg !405
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %14) #9, !dbg !418
  unreachable, !dbg !418
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_negate_overflow(%struct.OverflowData* nocapture readonly %0, i64 %1) local_unnamed_addr #3 !dbg !419 {
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !423, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata i64 %1, metadata !424, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !426, metadata !DIExpression()), !dbg !432
  call void @llvm.dbg.value(metadata i64 undef, metadata !429, metadata !DIExpression()), !dbg !432
  %3 = getelementptr inbounds %struct.OverflowData, %struct.OverflowData* %0, i64 0, i32 1, !dbg !434
  %4 = load %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"** %3, align 8, !dbg !434, !tbaa !293
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %4, metadata !295, metadata !DIExpression()), !dbg !435
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %4, metadata !301, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %4, metadata !306, metadata !DIExpression()), !dbg !439
  %5 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %4, i64 0, i32 0, !dbg !441
  %6 = load i16, i16* %5, align 2, !dbg !441, !tbaa !312
  %7 = icmp eq i16 %6, 0, !dbg !442
  %8 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %4, i64 0, i32 1, !dbg !443
  %9 = load i16, i16* %8, align 2, !dbg !443
  %10 = and i16 %9, 1, !dbg !443
  %11 = icmp ne i16 %10, 0, !dbg !443
  %12 = select i1 %7, i1 %11, i1 false, !dbg !443
  call void @llvm.dbg.value(metadata i1 %12, metadata !430, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !432
  %13 = select i1 %12, i32 10, i32 11, !dbg !444
  call void @llvm.dbg.value(metadata i32 %13, metadata !431, metadata !DIExpression()), !dbg !432
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %13) #9, !dbg !445
  unreachable, !dbg !445
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_negate_overflow_abort(%struct.OverflowData* nocapture readonly %0, i64 %1) local_unnamed_addr #3 !dbg !446 {
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !448, metadata !DIExpression()), !dbg !450
  call void @llvm.dbg.value(metadata i64 %1, metadata !449, metadata !DIExpression()), !dbg !450
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !426, metadata !DIExpression()), !dbg !451
  call void @llvm.dbg.value(metadata i64 undef, metadata !429, metadata !DIExpression()), !dbg !451
  %3 = getelementptr inbounds %struct.OverflowData, %struct.OverflowData* %0, i64 0, i32 1, !dbg !453
  %4 = load %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"** %3, align 8, !dbg !453, !tbaa !293
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %4, metadata !295, metadata !DIExpression()), !dbg !454
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %4, metadata !301, metadata !DIExpression()), !dbg !456
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %4, metadata !306, metadata !DIExpression()), !dbg !458
  %5 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %4, i64 0, i32 0, !dbg !460
  %6 = load i16, i16* %5, align 2, !dbg !460, !tbaa !312
  %7 = icmp eq i16 %6, 0, !dbg !461
  %8 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %4, i64 0, i32 1, !dbg !462
  %9 = load i16, i16* %8, align 2, !dbg !462
  %10 = and i16 %9, 1, !dbg !462
  %11 = icmp ne i16 %10, 0, !dbg !462
  %12 = select i1 %7, i1 %11, i1 false, !dbg !462
  call void @llvm.dbg.value(metadata i1 %12, metadata !430, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !451
  %13 = select i1 %12, i32 10, i32 11, !dbg !463
  call void @llvm.dbg.value(metadata i32 %13, metadata !431, metadata !DIExpression()), !dbg !451
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %13) #9, !dbg !464
  unreachable, !dbg !464
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_divrem_overflow(%struct.OverflowData* nocapture readonly %0, i64 %1, i64 %2) local_unnamed_addr #3 !dbg !465 {
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !467, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata i64 %1, metadata !468, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata i64 %2, metadata !469, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !471, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i64 undef, metadata !474, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i64 undef, metadata !475, metadata !DIExpression()), !dbg !479
  %4 = getelementptr inbounds %struct.OverflowData, %struct.OverflowData* %0, i64 0, i32 1, !dbg !481
  %5 = load %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"** %4, align 8, !dbg !481, !tbaa !293
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !301, metadata !DIExpression()), !dbg !482
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !306, metadata !DIExpression()), !dbg !484
  %6 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 0, !dbg !486
  %7 = load i16, i16* %6, align 2, !dbg !486, !tbaa !312
  %8 = icmp eq i16 %7, 0, !dbg !487
  br i1 %8, label %9, label %10, !dbg !488

9:                                                ; preds = %3
  tail call fastcc void @_ZN7__ubsanL12report_errorEPKcS1_(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.48, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.39, i64 0, i64 0)) #9, !dbg !489
  unreachable, !dbg !489

10:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i32 13, metadata !476, metadata !DIExpression()), !dbg !490
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 13) #9, !dbg !491
  unreachable, !dbg !491
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_divrem_overflow_abort(%struct.OverflowData* nocapture readonly %0, i64 %1, i64 %2) local_unnamed_addr #3 !dbg !492 {
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !494, metadata !DIExpression()), !dbg !497
  call void @llvm.dbg.value(metadata i64 %1, metadata !495, metadata !DIExpression()), !dbg !497
  call void @llvm.dbg.value(metadata i64 %2, metadata !496, metadata !DIExpression()), !dbg !497
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !471, metadata !DIExpression()), !dbg !498
  call void @llvm.dbg.value(metadata i64 undef, metadata !474, metadata !DIExpression()), !dbg !498
  call void @llvm.dbg.value(metadata i64 undef, metadata !475, metadata !DIExpression()), !dbg !498
  %4 = getelementptr inbounds %struct.OverflowData, %struct.OverflowData* %0, i64 0, i32 1, !dbg !500
  %5 = load %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"** %4, align 8, !dbg !500, !tbaa !293
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !301, metadata !DIExpression()), !dbg !501
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !306, metadata !DIExpression()), !dbg !503
  %6 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 0, !dbg !505
  %7 = load i16, i16* %6, align 2, !dbg !505, !tbaa !312
  %8 = icmp eq i16 %7, 0, !dbg !506
  br i1 %8, label %9, label %10, !dbg !507

9:                                                ; preds = %3
  tail call fastcc void @_ZN7__ubsanL12report_errorEPKcS1_(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.48, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.39, i64 0, i64 0)) #9, !dbg !508
  unreachable, !dbg !508

10:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i32 13, metadata !476, metadata !DIExpression()), !dbg !509
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 13) #9, !dbg !510
  unreachable, !dbg !510
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_shift_out_of_bounds(%struct.ShiftOutOfBoundsData* nocapture readnone %0, i64 %1, i64 %2) local_unnamed_addr #3 !dbg !511 {
  call void @llvm.dbg.value(metadata %struct.ShiftOutOfBoundsData* %0, metadata !517, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i64 %1, metadata !518, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i64 %2, metadata !519, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata %struct.ShiftOutOfBoundsData* undef, metadata !521, metadata !DIExpression()), !dbg !526
  call void @llvm.dbg.value(metadata i64 undef, metadata !524, metadata !DIExpression()), !dbg !526
  call void @llvm.dbg.value(metadata i64 undef, metadata !525, metadata !DIExpression()), !dbg !526
  tail call fastcc void @_ZN7__ubsanL12report_errorEPKcS1_(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.49, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.39, i64 0, i64 0)) #9, !dbg !528
  unreachable, !dbg !528
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_shift_out_of_bounds_abort(%struct.ShiftOutOfBoundsData* nocapture readnone %0, i64 %1, i64 %2) local_unnamed_addr #3 !dbg !529 {
  call void @llvm.dbg.value(metadata %struct.ShiftOutOfBoundsData* %0, metadata !531, metadata !DIExpression()), !dbg !534
  call void @llvm.dbg.value(metadata i64 %1, metadata !532, metadata !DIExpression()), !dbg !534
  call void @llvm.dbg.value(metadata i64 %2, metadata !533, metadata !DIExpression()), !dbg !534
  call void @llvm.dbg.value(metadata %struct.ShiftOutOfBoundsData* undef, metadata !521, metadata !DIExpression()), !dbg !535
  call void @llvm.dbg.value(metadata i64 undef, metadata !524, metadata !DIExpression()), !dbg !535
  call void @llvm.dbg.value(metadata i64 undef, metadata !525, metadata !DIExpression()), !dbg !535
  tail call fastcc void @_ZN7__ubsanL12report_errorEPKcS1_(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.49, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.39, i64 0, i64 0)) #9, !dbg !537
  unreachable, !dbg !537
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_out_of_bounds(%struct.ShiftOutOfBoundsData* nocapture readnone %0, i64 %1) local_unnamed_addr #3 !dbg !538 {
  call void @llvm.dbg.value(metadata %struct.ShiftOutOfBoundsData* %0, metadata !544, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata i64 %1, metadata !545, metadata !DIExpression()), !dbg !546
  call void @llvm.dbg.value(metadata %struct.ShiftOutOfBoundsData* undef, metadata !547, metadata !DIExpression()), !dbg !552
  call void @llvm.dbg.value(metadata i64 undef, metadata !550, metadata !DIExpression()), !dbg !552
  call void @llvm.dbg.value(metadata i32 22, metadata !551, metadata !DIExpression()), !dbg !552
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 22) #9, !dbg !554
  unreachable, !dbg !554
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_out_of_bounds_abort(%struct.ShiftOutOfBoundsData* nocapture readnone %0, i64 %1) local_unnamed_addr #3 !dbg !555 {
  call void @llvm.dbg.value(metadata %struct.ShiftOutOfBoundsData* %0, metadata !557, metadata !DIExpression()), !dbg !559
  call void @llvm.dbg.value(metadata i64 %1, metadata !558, metadata !DIExpression()), !dbg !559
  call void @llvm.dbg.value(metadata %struct.ShiftOutOfBoundsData* undef, metadata !547, metadata !DIExpression()), !dbg !560
  call void @llvm.dbg.value(metadata i64 undef, metadata !550, metadata !DIExpression()), !dbg !560
  call void @llvm.dbg.value(metadata i32 22, metadata !551, metadata !DIExpression()), !dbg !560
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 22) #9, !dbg !562
  unreachable, !dbg !562
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_builtin_unreachable(%struct.UnreachableData* nocapture readnone %0) local_unnamed_addr #3 !dbg !563 {
  call void @llvm.dbg.value(metadata %struct.UnreachableData* %0, metadata !569, metadata !DIExpression()), !dbg !570
  call void @llvm.dbg.value(metadata %struct.UnreachableData* undef, metadata !571, metadata !DIExpression()), !dbg !575
  call void @llvm.dbg.value(metadata i32 23, metadata !574, metadata !DIExpression()), !dbg !575
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 23) #9, !dbg !577
  unreachable, !dbg !577
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_missing_return(%struct.UnreachableData* nocapture readnone %0) local_unnamed_addr #3 !dbg !578 {
  call void @llvm.dbg.value(metadata %struct.UnreachableData* %0, metadata !580, metadata !DIExpression()), !dbg !581
  call void @llvm.dbg.value(metadata %struct.UnreachableData* undef, metadata !582, metadata !DIExpression()), !dbg !586
  call void @llvm.dbg.value(metadata i32 24, metadata !585, metadata !DIExpression()), !dbg !586
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 24) #9, !dbg !588
  unreachable, !dbg !588
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_vla_bound_not_positive(%struct.OverflowData* nocapture readnone %0, i64 %1) local_unnamed_addr #3 !dbg !589 {
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !595, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i64 %1, metadata !596, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata %struct.OverflowData* undef, metadata !598, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 undef, metadata !601, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 25, metadata !602, metadata !DIExpression()), !dbg !603
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 25) #9, !dbg !605
  unreachable, !dbg !605
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_vla_bound_not_positive_abort(%struct.OverflowData* nocapture readnone %0, i64 %1) local_unnamed_addr #3 !dbg !606 {
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !608, metadata !DIExpression()), !dbg !610
  call void @llvm.dbg.value(metadata i64 %1, metadata !609, metadata !DIExpression()), !dbg !610
  call void @llvm.dbg.value(metadata %struct.OverflowData* undef, metadata !598, metadata !DIExpression()), !dbg !611
  call void @llvm.dbg.value(metadata i64 undef, metadata !601, metadata !DIExpression()), !dbg !611
  call void @llvm.dbg.value(metadata i32 25, metadata !602, metadata !DIExpression()), !dbg !611
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 25) #9, !dbg !613
  unreachable, !dbg !613
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_float_cast_overflow(i8* nocapture readnone %0, i64 %1) local_unnamed_addr #3 !dbg !614 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !619, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i64 %1, metadata !620, metadata !DIExpression()), !dbg !621
  call void @llvm.dbg.value(metadata i8* undef, metadata !622, metadata !DIExpression()), !dbg !627
  call void @llvm.dbg.value(metadata i64 undef, metadata !625, metadata !DIExpression()), !dbg !627
  call void @llvm.dbg.value(metadata i32 26, metadata !626, metadata !DIExpression()), !dbg !627
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 26) #9, !dbg !629
  unreachable, !dbg !629
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_float_cast_overflow_abort(i8* nocapture readnone %0, i64 %1) local_unnamed_addr #3 !dbg !630 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !632, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.value(metadata i64 %1, metadata !633, metadata !DIExpression()), !dbg !634
  call void @llvm.dbg.value(metadata i8* undef, metadata !622, metadata !DIExpression()), !dbg !635
  call void @llvm.dbg.value(metadata i64 undef, metadata !625, metadata !DIExpression()), !dbg !635
  call void @llvm.dbg.value(metadata i32 26, metadata !626, metadata !DIExpression()), !dbg !635
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 26) #9, !dbg !637
  unreachable, !dbg !637
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_load_invalid_value(%struct.OverflowData* nocapture readnone %0, i64 %1) local_unnamed_addr #3 !dbg !638 {
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !644, metadata !DIExpression()), !dbg !646
  call void @llvm.dbg.value(metadata i64 %1, metadata !645, metadata !DIExpression()), !dbg !646
  call void @llvm.dbg.value(metadata %struct.OverflowData* undef, metadata !647, metadata !DIExpression()), !dbg !651
  call void @llvm.dbg.value(metadata i64 undef, metadata !650, metadata !DIExpression()), !dbg !651
  tail call fastcc void @_ZN7__ubsanL12report_errorEPKcS1_(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.50, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.46, i64 0, i64 0)) #9, !dbg !653
  unreachable, !dbg !653
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_load_invalid_value_abort(%struct.OverflowData* nocapture readnone %0, i64 %1) local_unnamed_addr #3 !dbg !654 {
  call void @llvm.dbg.value(metadata %struct.OverflowData* %0, metadata !656, metadata !DIExpression()), !dbg !658
  call void @llvm.dbg.value(metadata i64 %1, metadata !657, metadata !DIExpression()), !dbg !658
  call void @llvm.dbg.value(metadata %struct.OverflowData* undef, metadata !647, metadata !DIExpression()), !dbg !659
  call void @llvm.dbg.value(metadata i64 undef, metadata !650, metadata !DIExpression()), !dbg !659
  tail call fastcc void @_ZN7__ubsanL12report_errorEPKcS1_(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.50, i64 0, i64 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.46, i64 0, i64 0)) #9, !dbg !661
  unreachable, !dbg !661
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_implicit_conversion(%struct.ImplicitConversionData* nocapture readonly %0, i64 %1, i64 %2) local_unnamed_addr #3 !dbg !662 {
  call void @llvm.dbg.value(metadata %struct.ImplicitConversionData* %0, metadata !673, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 %1, metadata !674, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata i64 %2, metadata !675, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.value(metadata %struct.ImplicitConversionData* %0, metadata !677, metadata !DIExpression()), !dbg !687
  call void @llvm.dbg.value(metadata i64 undef, metadata !680, metadata !DIExpression()), !dbg !687
  call void @llvm.dbg.value(metadata i64 undef, metadata !681, metadata !DIExpression()), !dbg !687
  call void @llvm.dbg.value(metadata i32 0, metadata !682, metadata !DIExpression()), !dbg !687
  %4 = getelementptr inbounds %struct.ImplicitConversionData, %struct.ImplicitConversionData* %0, i64 0, i32 1, !dbg !689
  %5 = load %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"** %4, align 8, !dbg !689, !tbaa !690
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !683, metadata !DIExpression()), !dbg !687
  %6 = getelementptr inbounds %struct.ImplicitConversionData, %struct.ImplicitConversionData* %0, i64 0, i32 2, !dbg !692
  %7 = load %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"** %6, align 8, !dbg !692, !tbaa !693
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %7, metadata !684, metadata !DIExpression()), !dbg !687
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !295, metadata !DIExpression()), !dbg !694
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !301, metadata !DIExpression()), !dbg !696
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !306, metadata !DIExpression()), !dbg !698
  call void @llvm.dbg.value(metadata i1 undef, metadata !685, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !687
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %7, metadata !295, metadata !DIExpression()), !dbg !700
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %7, metadata !301, metadata !DIExpression()), !dbg !702
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %7, metadata !306, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.value(metadata i1 undef, metadata !686, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !687
  %8 = getelementptr inbounds %struct.ImplicitConversionData, %struct.ImplicitConversionData* %0, i64 0, i32 3, !dbg !706
  %9 = load i8, i8* %8, align 8, !dbg !706, !tbaa !707
  switch i8 %9, label %33 [
    i8 0, label %10
    i8 1, label %29
    i8 2, label %30
    i8 3, label %31
    i8 4, label %32
  ], !dbg !708

10:                                               ; preds = %3
  %11 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %7, i64 0, i32 0, !dbg !709
  %12 = load i16, i16* %11, align 2, !dbg !709, !tbaa !312
  %13 = icmp eq i16 %12, 0, !dbg !710
  %14 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %7, i64 0, i32 1, !dbg !711
  %15 = load i16, i16* %14, align 2, !dbg !711
  %16 = and i16 %15, 1, !dbg !711
  %17 = icmp ne i16 %16, 0, !dbg !711
  %18 = select i1 %13, i1 %17, i1 false, !dbg !711
  call void @llvm.dbg.value(metadata i1 %18, metadata !686, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !687
  %19 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 0, !dbg !712
  %20 = load i16, i16* %19, align 2, !dbg !712, !tbaa !312
  %21 = icmp eq i16 %20, 0, !dbg !713
  %22 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 1, !dbg !714
  %23 = load i16, i16* %22, align 2, !dbg !714
  %24 = and i16 %23, 1, !dbg !714
  %25 = icmp ne i16 %24, 0, !dbg !714
  %26 = select i1 %21, i1 %25, i1 false, !dbg !714
  call void @llvm.dbg.value(metadata i1 %26, metadata !685, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !687
  %27 = select i1 %26, i1 true, i1 %18, !dbg !715
  %28 = select i1 %27, i32 17, i32 16, !dbg !715
  br label %33, !dbg !715

29:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i32 16, metadata !682, metadata !DIExpression()), !dbg !687
  br label %33, !dbg !719

30:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i32 17, metadata !682, metadata !DIExpression()), !dbg !687
  br label %33, !dbg !720

31:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i32 18, metadata !682, metadata !DIExpression()), !dbg !687
  br label %33, !dbg !721

32:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i32 19, metadata !682, metadata !DIExpression()), !dbg !687
  br label %33, !dbg !722

33:                                               ; preds = %32, %31, %30, %29, %10, %3
  %34 = phi i32 [ 0, %3 ], [ 19, %32 ], [ 18, %31 ], [ 17, %30 ], [ 16, %29 ], [ %28, %10 ], !dbg !687
  call void @llvm.dbg.value(metadata i32 %34, metadata !682, metadata !DIExpression()), !dbg !687
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %34) #9, !dbg !723
  unreachable, !dbg !723
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_implicit_conversion_abort(%struct.ImplicitConversionData* nocapture readonly %0, i64 %1, i64 %2) local_unnamed_addr #3 !dbg !724 {
  call void @llvm.dbg.value(metadata %struct.ImplicitConversionData* %0, metadata !726, metadata !DIExpression()), !dbg !729
  call void @llvm.dbg.value(metadata i64 %1, metadata !727, metadata !DIExpression()), !dbg !729
  call void @llvm.dbg.value(metadata i64 %2, metadata !728, metadata !DIExpression()), !dbg !729
  call void @llvm.dbg.value(metadata %struct.ImplicitConversionData* %0, metadata !677, metadata !DIExpression()), !dbg !730
  call void @llvm.dbg.value(metadata i64 undef, metadata !680, metadata !DIExpression()), !dbg !730
  call void @llvm.dbg.value(metadata i64 undef, metadata !681, metadata !DIExpression()), !dbg !730
  call void @llvm.dbg.value(metadata i32 0, metadata !682, metadata !DIExpression()), !dbg !730
  %4 = getelementptr inbounds %struct.ImplicitConversionData, %struct.ImplicitConversionData* %0, i64 0, i32 1, !dbg !732
  %5 = load %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"** %4, align 8, !dbg !732, !tbaa !690
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !683, metadata !DIExpression()), !dbg !730
  %6 = getelementptr inbounds %struct.ImplicitConversionData, %struct.ImplicitConversionData* %0, i64 0, i32 2, !dbg !733
  %7 = load %"class.__ubsan::TypeDescriptor"*, %"class.__ubsan::TypeDescriptor"** %6, align 8, !dbg !733, !tbaa !693
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %7, metadata !684, metadata !DIExpression()), !dbg !730
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !295, metadata !DIExpression()), !dbg !734
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !301, metadata !DIExpression()), !dbg !736
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %5, metadata !306, metadata !DIExpression()), !dbg !738
  call void @llvm.dbg.value(metadata i1 undef, metadata !685, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !730
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %7, metadata !295, metadata !DIExpression()), !dbg !740
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %7, metadata !301, metadata !DIExpression()), !dbg !742
  call void @llvm.dbg.value(metadata %"class.__ubsan::TypeDescriptor"* %7, metadata !306, metadata !DIExpression()), !dbg !744
  call void @llvm.dbg.value(metadata i1 undef, metadata !686, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !730
  %8 = getelementptr inbounds %struct.ImplicitConversionData, %struct.ImplicitConversionData* %0, i64 0, i32 3, !dbg !746
  %9 = load i8, i8* %8, align 8, !dbg !746, !tbaa !707
  switch i8 %9, label %33 [
    i8 0, label %10
    i8 1, label %29
    i8 2, label %30
    i8 3, label %31
    i8 4, label %32
  ], !dbg !747

10:                                               ; preds = %3
  %11 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %7, i64 0, i32 0, !dbg !748
  %12 = load i16, i16* %11, align 2, !dbg !748, !tbaa !312
  %13 = icmp eq i16 %12, 0, !dbg !749
  %14 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %7, i64 0, i32 1, !dbg !750
  %15 = load i16, i16* %14, align 2, !dbg !750
  %16 = and i16 %15, 1, !dbg !750
  %17 = icmp ne i16 %16, 0, !dbg !750
  %18 = select i1 %13, i1 %17, i1 false, !dbg !750
  call void @llvm.dbg.value(metadata i1 %18, metadata !686, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !730
  %19 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 0, !dbg !751
  %20 = load i16, i16* %19, align 2, !dbg !751, !tbaa !312
  %21 = icmp eq i16 %20, 0, !dbg !752
  %22 = getelementptr inbounds %"class.__ubsan::TypeDescriptor", %"class.__ubsan::TypeDescriptor"* %5, i64 0, i32 1, !dbg !753
  %23 = load i16, i16* %22, align 2, !dbg !753
  %24 = and i16 %23, 1, !dbg !753
  %25 = icmp ne i16 %24, 0, !dbg !753
  %26 = select i1 %21, i1 %25, i1 false, !dbg !753
  call void @llvm.dbg.value(metadata i1 %26, metadata !685, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !730
  %27 = select i1 %26, i1 true, i1 %18, !dbg !754
  %28 = select i1 %27, i32 17, i32 16, !dbg !754
  br label %33, !dbg !754

29:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i32 16, metadata !682, metadata !DIExpression()), !dbg !730
  br label %33, !dbg !755

30:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i32 17, metadata !682, metadata !DIExpression()), !dbg !730
  br label %33, !dbg !756

31:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i32 18, metadata !682, metadata !DIExpression()), !dbg !730
  br label %33, !dbg !757

32:                                               ; preds = %3
  call void @llvm.dbg.value(metadata i32 19, metadata !682, metadata !DIExpression()), !dbg !730
  br label %33, !dbg !758

33:                                               ; preds = %32, %31, %30, %29, %10, %3
  %34 = phi i32 [ 0, %3 ], [ 19, %32 ], [ 18, %31 ], [ 17, %30 ], [ 16, %29 ], [ %28, %10 ], !dbg !730
  call void @llvm.dbg.value(metadata i32 %34, metadata !682, metadata !DIExpression()), !dbg !730
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %34) #9, !dbg !759
  unreachable, !dbg !759
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_invalid_builtin(%struct.InvalidBuiltinData* nocapture readnone %0) local_unnamed_addr #3 !dbg !760 {
  call void @llvm.dbg.value(metadata %struct.InvalidBuiltinData* %0, metadata !766, metadata !DIExpression()), !dbg !767
  call void @llvm.dbg.value(metadata %struct.InvalidBuiltinData* undef, metadata !768, metadata !DIExpression()), !dbg !772
  call void @llvm.dbg.value(metadata i32 14, metadata !771, metadata !DIExpression()), !dbg !772
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 14) #9, !dbg !774
  unreachable, !dbg !774
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_invalid_builtin_abort(%struct.InvalidBuiltinData* nocapture readnone %0) local_unnamed_addr #3 !dbg !775 {
  call void @llvm.dbg.value(metadata %struct.InvalidBuiltinData* %0, metadata !777, metadata !DIExpression()), !dbg !778
  call void @llvm.dbg.value(metadata %struct.InvalidBuiltinData* undef, metadata !768, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.value(metadata i32 14, metadata !771, metadata !DIExpression()), !dbg !779
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 14) #9, !dbg !781
  unreachable, !dbg !781
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_nonnull_return_v1(%struct.UnreachableData* nocapture readnone %0, %"class.__ubsan::SourceLocation"* nocapture readnone %1) local_unnamed_addr #3 !dbg !782 {
  call void @llvm.dbg.value(metadata %struct.UnreachableData* %0, metadata !789, metadata !DIExpression()), !dbg !791
  call void @llvm.dbg.value(metadata %"class.__ubsan::SourceLocation"* %1, metadata !790, metadata !DIExpression()), !dbg !791
  call void @llvm.dbg.value(metadata %struct.UnreachableData* undef, metadata !792, metadata !DIExpression()), !dbg !800
  call void @llvm.dbg.value(metadata %"class.__ubsan::SourceLocation"* undef, metadata !797, metadata !DIExpression()), !dbg !800
  call void @llvm.dbg.value(metadata i1 true, metadata !798, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !800
  call void @llvm.dbg.value(metadata i32 30, metadata !799, metadata !DIExpression()), !dbg !800
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 30) #9, !dbg !802
  unreachable, !dbg !802
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_nonnull_return_v1_abort(%struct.UnreachableData* nocapture readnone %0, %"class.__ubsan::SourceLocation"* nocapture readnone %1) local_unnamed_addr #3 !dbg !803 {
  call void @llvm.dbg.value(metadata %struct.UnreachableData* %0, metadata !805, metadata !DIExpression()), !dbg !807
  call void @llvm.dbg.value(metadata %"class.__ubsan::SourceLocation"* %1, metadata !806, metadata !DIExpression()), !dbg !807
  call void @llvm.dbg.value(metadata %struct.UnreachableData* undef, metadata !792, metadata !DIExpression()), !dbg !808
  call void @llvm.dbg.value(metadata %"class.__ubsan::SourceLocation"* undef, metadata !797, metadata !DIExpression()), !dbg !808
  call void @llvm.dbg.value(metadata i1 true, metadata !798, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !808
  call void @llvm.dbg.value(metadata i32 30, metadata !799, metadata !DIExpression()), !dbg !808
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 30) #9, !dbg !810
  unreachable, !dbg !810
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_nullability_return_v1(%struct.UnreachableData* nocapture readnone %0, %"class.__ubsan::SourceLocation"* nocapture readnone %1) local_unnamed_addr #3 !dbg !811 {
  call void @llvm.dbg.value(metadata %struct.UnreachableData* %0, metadata !813, metadata !DIExpression()), !dbg !815
  call void @llvm.dbg.value(metadata %"class.__ubsan::SourceLocation"* %1, metadata !814, metadata !DIExpression()), !dbg !815
  call void @llvm.dbg.value(metadata %struct.UnreachableData* undef, metadata !792, metadata !DIExpression()), !dbg !816
  call void @llvm.dbg.value(metadata %"class.__ubsan::SourceLocation"* undef, metadata !797, metadata !DIExpression()), !dbg !816
  call void @llvm.dbg.value(metadata i1 false, metadata !798, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !816
  call void @llvm.dbg.value(metadata i32 31, metadata !799, metadata !DIExpression()), !dbg !816
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 31) #9, !dbg !818
  unreachable, !dbg !818
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_nullability_return_v1_abort(%struct.UnreachableData* nocapture readnone %0, %"class.__ubsan::SourceLocation"* nocapture readnone %1) local_unnamed_addr #3 !dbg !819 {
  call void @llvm.dbg.value(metadata %struct.UnreachableData* %0, metadata !821, metadata !DIExpression()), !dbg !823
  call void @llvm.dbg.value(metadata %"class.__ubsan::SourceLocation"* %1, metadata !822, metadata !DIExpression()), !dbg !823
  call void @llvm.dbg.value(metadata %struct.UnreachableData* undef, metadata !792, metadata !DIExpression()), !dbg !824
  call void @llvm.dbg.value(metadata %"class.__ubsan::SourceLocation"* undef, metadata !797, metadata !DIExpression()), !dbg !824
  call void @llvm.dbg.value(metadata i1 false, metadata !798, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !824
  call void @llvm.dbg.value(metadata i32 31, metadata !799, metadata !DIExpression()), !dbg !824
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 31) #9, !dbg !826
  unreachable, !dbg !826
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_nonnull_arg(%struct.NonNullArgData* nocapture readnone %0) local_unnamed_addr #3 !dbg !827 {
  call void @llvm.dbg.value(metadata %struct.NonNullArgData* %0, metadata !833, metadata !DIExpression()), !dbg !834
  call void @llvm.dbg.value(metadata %struct.NonNullArgData* undef, metadata !835, metadata !DIExpression()), !dbg !842
  call void @llvm.dbg.value(metadata i1 true, metadata !840, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !842
  call void @llvm.dbg.value(metadata i32 32, metadata !841, metadata !DIExpression()), !dbg !842
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 32) #9, !dbg !844
  unreachable, !dbg !844
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_nonnull_arg_abort(%struct.NonNullArgData* nocapture readnone %0) local_unnamed_addr #3 !dbg !845 {
  call void @llvm.dbg.value(metadata %struct.NonNullArgData* %0, metadata !847, metadata !DIExpression()), !dbg !848
  call void @llvm.dbg.value(metadata %struct.NonNullArgData* undef, metadata !835, metadata !DIExpression()), !dbg !849
  call void @llvm.dbg.value(metadata i1 true, metadata !840, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !849
  call void @llvm.dbg.value(metadata i32 32, metadata !841, metadata !DIExpression()), !dbg !849
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 32) #9, !dbg !851
  unreachable, !dbg !851
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_nullability_arg(%struct.NonNullArgData* nocapture readnone %0) local_unnamed_addr #3 !dbg !852 {
  call void @llvm.dbg.value(metadata %struct.NonNullArgData* %0, metadata !854, metadata !DIExpression()), !dbg !855
  call void @llvm.dbg.value(metadata %struct.NonNullArgData* undef, metadata !835, metadata !DIExpression()), !dbg !856
  call void @llvm.dbg.value(metadata i1 false, metadata !840, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !856
  call void @llvm.dbg.value(metadata i32 33, metadata !841, metadata !DIExpression()), !dbg !856
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 33) #9, !dbg !858
  unreachable, !dbg !858
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_nullability_arg_abort(%struct.NonNullArgData* nocapture readnone %0) local_unnamed_addr #3 !dbg !859 {
  call void @llvm.dbg.value(metadata %struct.NonNullArgData* %0, metadata !861, metadata !DIExpression()), !dbg !862
  call void @llvm.dbg.value(metadata %struct.NonNullArgData* undef, metadata !835, metadata !DIExpression()), !dbg !863
  call void @llvm.dbg.value(metadata i1 false, metadata !840, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !863
  call void @llvm.dbg.value(metadata i32 33, metadata !841, metadata !DIExpression()), !dbg !863
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 33) #9, !dbg !865
  unreachable, !dbg !865
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_pointer_overflow(%struct.UnreachableData* nocapture readnone %0, i64 %1, i64 %2) local_unnamed_addr #3 !dbg !866 {
  call void @llvm.dbg.value(metadata %struct.UnreachableData* %0, metadata !872, metadata !DIExpression()), !dbg !875
  call void @llvm.dbg.value(metadata i64 %1, metadata !873, metadata !DIExpression()), !dbg !875
  call void @llvm.dbg.value(metadata i64 %2, metadata !874, metadata !DIExpression()), !dbg !875
  call void @llvm.dbg.value(metadata %struct.UnreachableData* undef, metadata !876, metadata !DIExpression()), !dbg !882
  call void @llvm.dbg.value(metadata i64 %1, metadata !879, metadata !DIExpression()), !dbg !882
  call void @llvm.dbg.value(metadata i64 %2, metadata !880, metadata !DIExpression()), !dbg !882
  %4 = icmp eq i64 %1, 0, !dbg !884
  %5 = icmp eq i64 %2, 0
  %6 = select i1 %4, i1 %5, i1 false, !dbg !886
  br i1 %6, label %14, label %7, !dbg !886

7:                                                ; preds = %3
  %8 = icmp ne i64 %2, 0
  %9 = select i1 %4, i1 %8, i1 false, !dbg !887
  br i1 %9, label %14, label %10, !dbg !887

10:                                               ; preds = %7
  %11 = icmp ne i64 %1, 0, !dbg !889
  %12 = select i1 %11, i1 %5, i1 false, !dbg !891
  %13 = select i1 %12, i32 5, i32 6
  br label %14

14:                                               ; preds = %10, %7, %3
  %15 = phi i32 [ 3, %3 ], [ 4, %7 ], [ %13, %10 ], !dbg !892
  call void @llvm.dbg.value(metadata i32 %15, metadata !881, metadata !DIExpression()), !dbg !882
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %15) #9, !dbg !893
  unreachable, !dbg !893
}

; Function Attrs: mustprogress uwtable
define dso_local void @__ubsan_handle_pointer_overflow_abort(%struct.UnreachableData* nocapture readnone %0, i64 %1, i64 %2) local_unnamed_addr #3 !dbg !894 {
  call void @llvm.dbg.value(metadata %struct.UnreachableData* %0, metadata !896, metadata !DIExpression()), !dbg !899
  call void @llvm.dbg.value(metadata i64 %1, metadata !897, metadata !DIExpression()), !dbg !899
  call void @llvm.dbg.value(metadata i64 %2, metadata !898, metadata !DIExpression()), !dbg !899
  call void @llvm.dbg.value(metadata %struct.UnreachableData* undef, metadata !876, metadata !DIExpression()), !dbg !900
  call void @llvm.dbg.value(metadata i64 %1, metadata !879, metadata !DIExpression()), !dbg !900
  call void @llvm.dbg.value(metadata i64 %2, metadata !880, metadata !DIExpression()), !dbg !900
  %4 = icmp eq i64 %1, 0, !dbg !902
  %5 = icmp eq i64 %2, 0
  %6 = select i1 %4, i1 %5, i1 false, !dbg !903
  br i1 %6, label %14, label %7, !dbg !903

7:                                                ; preds = %3
  %8 = icmp ne i64 %2, 0
  %9 = select i1 %4, i1 %8, i1 false, !dbg !904
  br i1 %9, label %14, label %10, !dbg !904

10:                                               ; preds = %7
  %11 = icmp ne i64 %1, 0, !dbg !905
  %12 = select i1 %11, i1 %5, i1 false, !dbg !906
  %13 = select i1 %12, i32 5, i32 6
  br label %14

14:                                               ; preds = %10, %7, %3
  %15 = phi i32 [ 3, %3 ], [ 4, %7 ], [ %13, %10 ], !dbg !907
  call void @llvm.dbg.value(metadata i32 %15, metadata !881, metadata !DIExpression()), !dbg !900
  tail call fastcc void @_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE(i32 %15) #9, !dbg !908
  unreachable, !dbg !908
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #7 !dbg !909 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !915, metadata !DIExpression()), !dbg !917
  call void @llvm.dbg.value(metadata i64 %1, metadata !916, metadata !DIExpression()), !dbg !917
  %3 = icmp ult i64 %1, %0, !dbg !918
  br i1 %3, label %5, label %4, !dbg !920

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.35, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0)) #8, !dbg !921
  unreachable, !dbg !921

5:                                                ; preds = %2
  ret void, !dbg !923
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress noreturn uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noreturn nounwind }
attributes #9 = { noreturn }

!llvm.dbg.cu = !{!0, !3, !105}
!llvm.module.flags = !{!107, !108, !109, !110, !111}
!llvm.ident = !{!112, !113, !113}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "signed_overflow_ubsan.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_a/microtests")
!2 = !{}
!3 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !4, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !5, retainedTypes: !98, imports: !101, splitDebugInlining: false, nameTableKind: None)
!4 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Sanitizer/ubsan/ubsan_handlers.cpp", directory: "/build/klee/parts/klee/build/runtime/Sanitizer")
!5 = !{!6, !43, !83}
!6 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "Kind", scope: !8, file: !7, line: 54, baseType: !38, size: 32, elements: !39, identifier: "_ZTSN7__ubsan14TypeDescriptor4KindE")
!7 = !DIFile(filename: "src/runtime/Sanitizer/ubsan/ubsan_value.h", directory: "/build/klee/parts/klee")
!8 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "TypeDescriptor", scope: !9, file: !7, line: 40, size: 48, flags: DIFlagTypePassByValue, elements: !10, identifier: "_ZTSN7__ubsan14TypeDescriptorE")
!9 = !DINamespace(name: "__ubsan", scope: null)
!10 = !{!11, !16, !17, !22, !29, !32, !36, !37}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "TypeKind", scope: !8, file: !7, line: 43, baseType: !12, size: 16)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", scope: !14, file: !13, line: 42, baseType: !15)
!13 = !DIFile(filename: "src/runtime/Sanitizer/ubsan/../sanitizer_common/sanitizer_internal_defs.h", directory: "/build/klee/parts/klee")
!14 = !DINamespace(name: "__sanitizer", scope: null)
!15 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "TypeInfo", scope: !8, file: !7, line: 47, baseType: !12, size: 16, offset: 16)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "TypeName", scope: !8, file: !7, line: 51, baseType: !18, size: 8, offset: 32)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 8, elements: !20)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !{!21}
!21 = !DISubrange(count: 1)
!22 = !DISubprogram(name: "getTypeName", linkageName: "_ZNK7__ubsan14TypeDescriptor11getTypeNameEv", scope: !8, file: !7, line: 68, type: !23, scopeLine: 68, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!23 = !DISubroutineType(types: !24)
!24 = !{!25, !27}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !19)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!28 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!29 = !DISubprogram(name: "getKind", linkageName: "_ZNK7__ubsan14TypeDescriptor7getKindEv", scope: !8, file: !7, line: 70, type: !30, scopeLine: 70, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!30 = !DISubroutineType(types: !31)
!31 = !{!6, !27}
!32 = !DISubprogram(name: "isIntegerTy", linkageName: "_ZNK7__ubsan14TypeDescriptor11isIntegerTyEv", scope: !8, file: !7, line: 72, type: !33, scopeLine: 72, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!33 = !DISubroutineType(types: !34)
!34 = !{!35, !27}
!35 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!36 = !DISubprogram(name: "isSignedIntegerTy", linkageName: "_ZNK7__ubsan14TypeDescriptor17isSignedIntegerTyEv", scope: !8, file: !7, line: 73, type: !33, scopeLine: 73, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!37 = !DISubprogram(name: "isUnsignedIntegerTy", linkageName: "_ZNK7__ubsan14TypeDescriptor19isUnsignedIntegerTyEv", scope: !8, file: !7, line: 74, type: !33, scopeLine: 74, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!38 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!39 = !{!40, !41, !42}
!40 = !DIEnumerator(name: "TK_Integer", value: 0, isUnsigned: true)
!41 = !DIEnumerator(name: "TK_Float", value: 1, isUnsigned: true)
!42 = !DIEnumerator(name: "TK_Unknown", value: 65535, isUnsigned: true)
!43 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "ErrorType", scope: !9, file: !44, line: 34, baseType: !45, size: 32, flags: DIFlagEnumClass, elements: !46, identifier: "_ZTSN7__ubsan9ErrorTypeE")
!44 = !DIFile(filename: "src/runtime/Sanitizer/ubsan/ubsan_diag.h", directory: "/build/klee/parts/klee")
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !{!47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82}
!47 = !DIEnumerator(name: "GenericUB", value: 0)
!48 = !DIEnumerator(name: "NullPointerUse", value: 1)
!49 = !DIEnumerator(name: "NullPointerUseWithNullability", value: 2)
!50 = !DIEnumerator(name: "NullptrWithOffset", value: 3)
!51 = !DIEnumerator(name: "NullptrWithNonZeroOffset", value: 4)
!52 = !DIEnumerator(name: "NullptrAfterNonZeroOffset", value: 5)
!53 = !DIEnumerator(name: "PointerOverflow", value: 6)
!54 = !DIEnumerator(name: "MisalignedPointerUse", value: 7)
!55 = !DIEnumerator(name: "AlignmentAssumption", value: 8)
!56 = !DIEnumerator(name: "InsufficientObjectSize", value: 9)
!57 = !DIEnumerator(name: "SignedIntegerOverflow", value: 10)
!58 = !DIEnumerator(name: "UnsignedIntegerOverflow", value: 11)
!59 = !DIEnumerator(name: "IntegerDivideByZero", value: 12)
!60 = !DIEnumerator(name: "FloatDivideByZero", value: 13)
!61 = !DIEnumerator(name: "InvalidBuiltin", value: 14)
!62 = !DIEnumerator(name: "InvalidObjCCast", value: 15)
!63 = !DIEnumerator(name: "ImplicitUnsignedIntegerTruncation", value: 16)
!64 = !DIEnumerator(name: "ImplicitSignedIntegerTruncation", value: 17)
!65 = !DIEnumerator(name: "ImplicitIntegerSignChange", value: 18)
!66 = !DIEnumerator(name: "ImplicitSignedIntegerTruncationOrSignChange", value: 19)
!67 = !DIEnumerator(name: "InvalidShiftBase", value: 20)
!68 = !DIEnumerator(name: "InvalidShiftExponent", value: 21)
!69 = !DIEnumerator(name: "OutOfBoundsIndex", value: 22)
!70 = !DIEnumerator(name: "UnreachableCall", value: 23)
!71 = !DIEnumerator(name: "MissingReturn", value: 24)
!72 = !DIEnumerator(name: "NonPositiveVLAIndex", value: 25)
!73 = !DIEnumerator(name: "FloatCastOverflow", value: 26)
!74 = !DIEnumerator(name: "InvalidBoolLoad", value: 27)
!75 = !DIEnumerator(name: "InvalidEnumLoad", value: 28)
!76 = !DIEnumerator(name: "FunctionTypeMismatch", value: 29)
!77 = !DIEnumerator(name: "InvalidNullReturn", value: 30)
!78 = !DIEnumerator(name: "InvalidNullReturnWithNullability", value: 31)
!79 = !DIEnumerator(name: "InvalidNullArgument", value: 32)
!80 = !DIEnumerator(name: "InvalidNullArgumentWithNullability", value: 33)
!81 = !DIEnumerator(name: "DynamicTypeMismatch", value: 34)
!82 = !DIEnumerator(name: "CFIBadType", value: 35)
!83 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "TypeCheckKind", scope: !9, file: !84, line: 118, baseType: !38, size: 32, elements: !85, identifier: "_ZTSN7__ubsan13TypeCheckKindE")
!84 = !DIFile(filename: "src/runtime/Sanitizer/ubsan/ubsan_handlers.cpp", directory: "/build/klee/parts/klee")
!85 = !{!86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97}
!86 = !DIEnumerator(name: "TCK_Load", value: 0, isUnsigned: true)
!87 = !DIEnumerator(name: "TCK_Store", value: 1, isUnsigned: true)
!88 = !DIEnumerator(name: "TCK_ReferenceBinding", value: 2, isUnsigned: true)
!89 = !DIEnumerator(name: "TCK_MemberAccess", value: 3, isUnsigned: true)
!90 = !DIEnumerator(name: "TCK_MemberCall", value: 4, isUnsigned: true)
!91 = !DIEnumerator(name: "TCK_ConstructorCall", value: 5, isUnsigned: true)
!92 = !DIEnumerator(name: "TCK_DowncastPointer", value: 6, isUnsigned: true)
!93 = !DIEnumerator(name: "TCK_DowncastReference", value: 7, isUnsigned: true)
!94 = !DIEnumerator(name: "TCK_Upcast", value: 8, isUnsigned: true)
!95 = !DIEnumerator(name: "TCK_UpcastToVirtualBase", value: 9, isUnsigned: true)
!96 = !DIEnumerator(name: "TCK_NonnullAssign", value: 10, isUnsigned: true)
!97 = !DIEnumerator(name: "TCK_DynamicOperation", value: 11, isUnsigned: true)
!98 = !{!99, !6}
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "uptr", scope: !14, file: !13, line: 33, baseType: !100)
!100 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!101 = !{!102, !103}
!102 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !9, entity: !14, file: !13, line: 53)
!103 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !3, entity: !9, file: !104, line: 23)
!104 = !DIFile(filename: "src/runtime/Sanitizer/ubsan/ubsan_handlers.h", directory: "/build/klee/parts/klee")
!105 = distinct !DICompileUnit(language: DW_LANG_C89, file: !106, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!106 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!107 = !{i32 7, !"Dwarf Version", i32 4}
!108 = !{i32 2, !"Debug Info Version", i32 3}
!109 = !{i32 1, !"wchar_size", i32 4}
!110 = !{i32 7, !"uwtable", i32 1}
!111 = !{i32 7, !"frame-pointer", i32 2}
!112 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!113 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!114 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !115, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DISubroutineType(types: !116)
!116 = !{!45}
!117 = !DILocalVariable(name: "value", scope: !114, file: !1, line: 8, type: !45)
!118 = !DILocation(line: 8, column: 9, scope: !114)
!119 = !DILocalVariable(name: "sum", scope: !114, file: !1, line: 9, type: !120)
!120 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !45)
!121 = !DILocation(line: 9, column: 18, scope: !114)
!122 = !DILocation(line: 11, column: 24, scope: !114)
!123 = !DILocation(line: 11, column: 5, scope: !114)
!124 = !DILocation(line: 12, column: 11, scope: !114)
!125 = !DILocation(line: 12, column: 17, scope: !114)
!126 = !{!"branch_weights", i32 1048575, i32 1}
!127 = !DILocation(line: 12, column: 9, scope: !114)
!128 = !DILocation(line: 14, column: 12, scope: !114)
!129 = !DILocation(line: 14, column: 16, scope: !114)
!130 = !DILocation(line: 14, column: 5, scope: !114)
!131 = distinct !DISubprogram(name: "__ubsan_handle_type_mismatch_v1", scope: !84, file: !84, line: 170, type: !132, scopeLine: 171, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !145)
!132 = !DISubroutineType(types: !133)
!133 = !{null, !134, !144}
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !135, size: 64)
!135 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "TypeMismatchData", file: !104, line: 25, size: 256, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !136, identifier: "_ZTS16TypeMismatchData")
!136 = !{!137, !139, !141, !143}
!137 = !DIDerivedType(tag: DW_TAG_member, name: "Loc", scope: !135, file: !104, line: 26, baseType: !138, size: 128)
!138 = !DICompositeType(tag: DW_TAG_class_type, name: "SourceLocation", scope: !9, file: !7, line: 28, size: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSN7__ubsan14SourceLocationE")
!139 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !135, file: !104, line: 27, baseType: !140, size: 64, offset: 128)
!140 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !28, size: 64)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "LogAlignment", scope: !135, file: !104, line: 28, baseType: !142, size: 8, offset: 192)
!142 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "TypeCheckKind", scope: !135, file: !104, line: 29, baseType: !142, size: 8, offset: 200)
!144 = !DIDerivedType(tag: DW_TAG_typedef, name: "ValueHandle", scope: !9, file: !7, line: 78, baseType: !99)
!145 = !{!146, !147}
!146 = !DILocalVariable(name: "Data", arg: 1, scope: !131, file: !84, line: 170, type: !134)
!147 = !DILocalVariable(name: "Pointer", arg: 2, scope: !131, file: !84, line: 171, type: !144)
!148 = !DILocation(line: 0, scope: !131)
!149 = !DILocalVariable(name: "Data", arg: 1, scope: !150, file: !84, line: 154, type: !134)
!150 = distinct !DISubprogram(name: "handleTypeMismatchImpl", linkageName: "_ZN7__ubsanL22handleTypeMismatchImplEP16TypeMismatchDatam", scope: !9, file: !84, line: 154, type: !132, scopeLine: 155, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !151)
!151 = !{!149, !152, !153, !154}
!152 = !DILocalVariable(name: "Pointer", arg: 2, scope: !150, file: !84, line: 155, type: !144)
!153 = !DILocalVariable(name: "Alignment", scope: !150, file: !84, line: 156, type: !99)
!154 = !DILocalVariable(name: "ET", scope: !150, file: !84, line: 157, type: !43)
!155 = !DILocation(line: 0, scope: !150, inlinedAt: !156)
!156 = distinct !DILocation(line: 173, column: 3, scope: !131)
!157 = !DILocation(line: 158, column: 8, scope: !158, inlinedAt: !156)
!158 = distinct !DILexicalBlock(scope: !150, file: !84, line: 158, column: 7)
!159 = !DILocation(line: 158, column: 7, scope: !150, inlinedAt: !156)
!160 = !DILocation(line: 159, column: 17, scope: !158, inlinedAt: !156)
!161 = !{!162, !165, i64 25}
!162 = !{!"_ZTS16TypeMismatchData", !163, i64 0, !164, i64 16, !165, i64 24, !165, i64 25}
!163 = !{!"_ZTSN7__ubsan14SourceLocationE", !164, i64 0, !167, i64 8, !167, i64 12}
!164 = !{!"any pointer", !165, i64 0}
!165 = !{!"omnipotent char", !166, i64 0}
!166 = !{!"Simple C++ TBAA"}
!167 = !{!"int", !165, i64 0}
!168 = !DILocation(line: 159, column: 31, scope: !158, inlinedAt: !156)
!169 = !DILocation(line: 159, column: 10, scope: !158, inlinedAt: !156)
!170 = !DILocation(line: 159, column: 5, scope: !158, inlinedAt: !156)
!171 = !DILocation(line: 156, column: 37, scope: !150, inlinedAt: !156)
!172 = !{!162, !165, i64 24}
!173 = !DILocation(line: 156, column: 28, scope: !150, inlinedAt: !156)
!174 = !DILocation(line: 162, column: 33, scope: !175, inlinedAt: !156)
!175 = distinct !DILexicalBlock(scope: !158, file: !84, line: 162, column: 12)
!176 = !{!"True"}
!177 = !DILocation(line: 162, column: 20, scope: !175, inlinedAt: !156)
!178 = !DILocation(line: 162, column: 12, scope: !175, inlinedAt: !156)
!179 = !DILocation(line: 0, scope: !158, inlinedAt: !156)
!180 = !DILocation(line: 167, column: 3, scope: !150, inlinedAt: !156)
!181 = distinct !DISubprogram(name: "report_error_type", linkageName: "_ZN7__ubsanL17report_error_typeENS_9ErrorTypeE", scope: !9, file: !84, line: 111, type: !182, scopeLine: 111, flags: DIFlagPrototyped | DIFlagNoReturn | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !184)
!182 = !DISubroutineType(types: !183)
!183 = !{null, !43}
!184 = !{!185}
!185 = !DILocalVariable(name: "ET", arg: 1, scope: !181, file: !84, line: 111, type: !43)
!186 = !DILocation(line: 0, scope: !181)
!187 = !DILocation(line: 112, column: 16, scope: !181)
!188 = !DILocation(line: 112, column: 41, scope: !181)
!189 = !DILocation(line: 112, column: 3, scope: !181)
!190 = distinct !DISubprogram(name: "ConvertTypeToString", linkageName: "_ZN7__ubsanL19ConvertTypeToStringENS_9ErrorTypeE", scope: !9, file: !84, line: 25, type: !191, scopeLine: 25, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !193)
!191 = !DISubroutineType(types: !192)
!192 = !{!25, !43}
!193 = !{!194}
!194 = !DILocalVariable(name: "Type", arg: 1, scope: !190, file: !84, line: 25, type: !43)
!195 = !DILocation(line: 0, scope: !190)
!196 = !DILocation(line: 26, column: 3, scope: !190)
!197 = !DILocation(line: 33, column: 1, scope: !190)
!198 = distinct !DISubprogram(name: "get_suffix", linkageName: "_ZN7__ubsanL10get_suffixENS_9ErrorTypeE", scope: !9, file: !84, line: 40, type: !191, scopeLine: 40, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !199)
!199 = !{!200}
!200 = !DILocalVariable(name: "ET", arg: 1, scope: !198, file: !84, line: 40, type: !43)
!201 = !DILocation(line: 0, scope: !198)
!202 = !DILocation(line: 41, column: 3, scope: !198)
!203 = !DILocation(line: 0, scope: !204)
!204 = distinct !DILexicalBlock(scope: !198, file: !84, line: 41, column: 15)
!205 = !DILocation(line: 110, column: 1, scope: !198)
!206 = distinct !DISubprogram(name: "report_error", linkageName: "_ZN7__ubsanL12report_errorEPKcS1_", scope: !9, file: !84, line: 35, type: !207, scopeLine: 36, flags: DIFlagPrototyped | DIFlagNoReturn | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !209)
!207 = !DISubroutineType(types: !208)
!208 = !{null, !25, !25}
!209 = !{!210, !211}
!210 = !DILocalVariable(name: "msg", arg: 1, scope: !206, file: !84, line: 35, type: !25)
!211 = !DILocalVariable(name: "suffix", arg: 2, scope: !206, file: !84, line: 36, type: !25)
!212 = !DILocation(line: 0, scope: !206)
!213 = !DILocation(line: 37, column: 3, scope: !206)
!214 = !DISubprogram(name: "klee_report_error", scope: !84, file: !84, line: 19, type: !215, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized, retainedNodes: !2)
!215 = !DISubroutineType(types: !216)
!216 = !{null, !25, !45, !25, !25}
!217 = distinct !DISubprogram(name: "__ubsan_handle_type_mismatch_v1_abort", scope: !84, file: !84, line: 176, type: !132, scopeLine: 177, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !218)
!218 = !{!219, !220}
!219 = !DILocalVariable(name: "Data", arg: 1, scope: !217, file: !84, line: 176, type: !134)
!220 = !DILocalVariable(name: "Pointer", arg: 2, scope: !217, file: !84, line: 177, type: !144)
!221 = !DILocation(line: 0, scope: !217)
!222 = !DILocation(line: 0, scope: !150, inlinedAt: !223)
!223 = distinct !DILocation(line: 179, column: 3, scope: !217)
!224 = !DILocation(line: 158, column: 8, scope: !158, inlinedAt: !223)
!225 = !DILocation(line: 158, column: 7, scope: !150, inlinedAt: !223)
!226 = !DILocation(line: 159, column: 17, scope: !158, inlinedAt: !223)
!227 = !DILocation(line: 159, column: 31, scope: !158, inlinedAt: !223)
!228 = !DILocation(line: 159, column: 10, scope: !158, inlinedAt: !223)
!229 = !DILocation(line: 159, column: 5, scope: !158, inlinedAt: !223)
!230 = !DILocation(line: 156, column: 37, scope: !150, inlinedAt: !223)
!231 = !DILocation(line: 156, column: 28, scope: !150, inlinedAt: !223)
!232 = !DILocation(line: 162, column: 33, scope: !175, inlinedAt: !223)
!233 = !DILocation(line: 162, column: 20, scope: !175, inlinedAt: !223)
!234 = !DILocation(line: 162, column: 12, scope: !175, inlinedAt: !223)
!235 = !DILocation(line: 0, scope: !158, inlinedAt: !223)
!236 = !DILocation(line: 167, column: 3, scope: !150, inlinedAt: !223)
!237 = distinct !DISubprogram(name: "__ubsan_handle_alignment_assumption", scope: !84, file: !84, line: 191, type: !238, scopeLine: 193, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !242)
!238 = !DISubroutineType(types: !239)
!239 = !{null, !240, !144, !144, !144}
!240 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !241, size: 64)
!241 = !DICompositeType(tag: DW_TAG_structure_type, name: "AlignmentAssumptionData", file: !104, line: 32, size: 320, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS23AlignmentAssumptionData")
!242 = !{!243, !244, !245, !246}
!243 = !DILocalVariable(name: "Data", arg: 1, scope: !237, file: !84, line: 191, type: !240)
!244 = !DILocalVariable(name: "Pointer", arg: 2, scope: !237, file: !84, line: 192, type: !144)
!245 = !DILocalVariable(name: "Alignment", arg: 3, scope: !237, file: !84, line: 192, type: !144)
!246 = !DILocalVariable(name: "Offset", arg: 4, scope: !237, file: !84, line: 193, type: !144)
!247 = !DILocation(line: 0, scope: !237)
!248 = !DILocalVariable(arg: 1, scope: !249, file: !84, line: 182, type: !240)
!249 = distinct !DISubprogram(name: "handleAlignmentAssumptionImpl", linkageName: "_ZN7__ubsanL29handleAlignmentAssumptionImplEP23AlignmentAssumptionDatammm", scope: !9, file: !84, line: 182, type: !238, scopeLine: 185, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !250)
!250 = !{!248, !251, !252, !253, !254}
!251 = !DILocalVariable(arg: 2, scope: !249, file: !84, line: 183, type: !144)
!252 = !DILocalVariable(arg: 3, scope: !249, file: !84, line: 184, type: !144)
!253 = !DILocalVariable(arg: 4, scope: !249, file: !84, line: 185, type: !144)
!254 = !DILocalVariable(name: "ET", scope: !249, file: !84, line: 186, type: !43)
!255 = !DILocation(line: 0, scope: !249, inlinedAt: !256)
!256 = distinct !DILocation(line: 194, column: 3, scope: !237)
!257 = !DILocation(line: 187, column: 3, scope: !249, inlinedAt: !256)
!258 = distinct !DISubprogram(name: "__ubsan_handle_alignment_assumption_abort", scope: !84, file: !84, line: 197, type: !238, scopeLine: 199, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !259)
!259 = !{!260, !261, !262, !263}
!260 = !DILocalVariable(name: "Data", arg: 1, scope: !258, file: !84, line: 198, type: !240)
!261 = !DILocalVariable(name: "Pointer", arg: 2, scope: !258, file: !84, line: 198, type: !144)
!262 = !DILocalVariable(name: "Alignment", arg: 3, scope: !258, file: !84, line: 198, type: !144)
!263 = !DILocalVariable(name: "Offset", arg: 4, scope: !258, file: !84, line: 199, type: !144)
!264 = !DILocation(line: 0, scope: !258)
!265 = !DILocation(line: 0, scope: !249, inlinedAt: !266)
!266 = distinct !DILocation(line: 200, column: 3, scope: !258)
!267 = !DILocation(line: 187, column: 3, scope: !249, inlinedAt: !266)
!268 = distinct !DISubprogram(name: "__ubsan_handle_add_overflow", scope: !84, file: !84, line: 218, type: !269, scopeLine: 218, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !276)
!269 = !DISubroutineType(types: !270)
!270 = !{null, !271, !144, !144}
!271 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !272, size: 64)
!272 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "OverflowData", file: !104, line: 38, size: 192, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !273, identifier: "_ZTS12OverflowData")
!273 = !{!274, !275}
!274 = !DIDerivedType(tag: DW_TAG_member, name: "Loc", scope: !272, file: !104, line: 39, baseType: !138, size: 128)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !272, file: !104, line: 40, baseType: !140, size: 64, offset: 128)
!276 = !{!277, !278, !279}
!277 = !DILocalVariable(name: "Data", arg: 1, scope: !268, file: !84, line: 218, type: !271)
!278 = !DILocalVariable(name: "LHS", arg: 2, scope: !268, file: !84, line: 218, type: !144)
!279 = !DILocalVariable(name: "RHS", arg: 3, scope: !268, file: !84, line: 218, type: !144)
!280 = !DILocation(line: 0, scope: !268)
!281 = !DILocalVariable(name: "Data", arg: 1, scope: !282, file: !84, line: 204, type: !271)
!282 = distinct !DISubprogram(name: "handleIntegerOverflowImpl", linkageName: "_ZN7__ubsanL25handleIntegerOverflowImplEP12OverflowDatamPKc", scope: !9, file: !84, line: 204, type: !283, scopeLine: 205, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !285)
!283 = !DISubroutineType(types: !284)
!284 = !{null, !271, !144, !25}
!285 = !{!281, !286, !287, !288, !289}
!286 = !DILocalVariable(arg: 2, scope: !282, file: !84, line: 204, type: !144)
!287 = !DILocalVariable(arg: 3, scope: !282, file: !84, line: 205, type: !25)
!288 = !DILocalVariable(name: "IsSigned", scope: !282, file: !84, line: 206, type: !35)
!289 = !DILocalVariable(name: "ET", scope: !282, file: !84, line: 207, type: !43)
!290 = !DILocation(line: 0, scope: !282, inlinedAt: !291)
!291 = distinct !DILocation(line: 218, column: 1, scope: !268)
!292 = !DILocation(line: 206, column: 25, scope: !282, inlinedAt: !291)
!293 = !{!294, !164, i64 16}
!294 = !{!"_ZTS12OverflowData", !163, i64 0, !164, i64 16}
!295 = !DILocalVariable(name: "this", arg: 1, scope: !296, type: !298, flags: DIFlagArtificial | DIFlagObjectPointer)
!296 = distinct !DISubprogram(name: "isSignedIntegerTy", linkageName: "_ZNK7__ubsan14TypeDescriptor17isSignedIntegerTyEv", scope: !8, file: !7, line: 73, type: !33, scopeLine: 73, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, declaration: !36, retainedNodes: !297)
!297 = !{!295}
!298 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!299 = !DILocation(line: 0, scope: !296, inlinedAt: !300)
!300 = distinct !DILocation(line: 206, column: 30, scope: !282, inlinedAt: !291)
!301 = !DILocalVariable(name: "this", arg: 1, scope: !302, type: !298, flags: DIFlagArtificial | DIFlagObjectPointer)
!302 = distinct !DISubprogram(name: "isIntegerTy", linkageName: "_ZNK7__ubsan14TypeDescriptor11isIntegerTyEv", scope: !8, file: !7, line: 72, type: !33, scopeLine: 72, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, declaration: !32, retainedNodes: !303)
!303 = !{!301}
!304 = !DILocation(line: 0, scope: !302, inlinedAt: !305)
!305 = distinct !DILocation(line: 73, column: 43, scope: !296, inlinedAt: !300)
!306 = !DILocalVariable(name: "this", arg: 1, scope: !307, type: !298, flags: DIFlagArtificial | DIFlagObjectPointer)
!307 = distinct !DISubprogram(name: "getKind", linkageName: "_ZNK7__ubsan14TypeDescriptor7getKindEv", scope: !8, file: !7, line: 70, type: !30, scopeLine: 70, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, declaration: !29, retainedNodes: !308)
!308 = !{!306}
!309 = !DILocation(line: 0, scope: !307, inlinedAt: !310)
!310 = distinct !DILocation(line: 72, column: 37, scope: !302, inlinedAt: !305)
!311 = !DILocation(line: 70, column: 51, scope: !307, inlinedAt: !310)
!312 = !{!313, !314, i64 0}
!313 = !{!"_ZTSN7__ubsan14TypeDescriptorE", !314, i64 0, !314, i64 2, !165, i64 4}
!314 = !{!"short", !165, i64 0}
!315 = !DILocation(line: 72, column: 47, scope: !302, inlinedAt: !305)
!316 = !DILocation(line: 73, column: 57, scope: !296, inlinedAt: !300)
!317 = !DILocation(line: 207, column: 18, scope: !282, inlinedAt: !291)
!318 = !DILocation(line: 209, column: 3, scope: !282, inlinedAt: !291)
!319 = distinct !DISubprogram(name: "__ubsan_handle_add_overflow_abort", scope: !84, file: !84, line: 219, type: !269, scopeLine: 219, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !320)
!320 = !{!321, !322, !323}
!321 = !DILocalVariable(name: "Data", arg: 1, scope: !319, file: !84, line: 219, type: !271)
!322 = !DILocalVariable(name: "LHS", arg: 2, scope: !319, file: !84, line: 219, type: !144)
!323 = !DILocalVariable(name: "RHS", arg: 3, scope: !319, file: !84, line: 219, type: !144)
!324 = !DILocation(line: 0, scope: !319)
!325 = !DILocation(line: 0, scope: !282, inlinedAt: !326)
!326 = distinct !DILocation(line: 219, column: 1, scope: !319)
!327 = !DILocation(line: 206, column: 25, scope: !282, inlinedAt: !326)
!328 = !DILocation(line: 0, scope: !296, inlinedAt: !329)
!329 = distinct !DILocation(line: 206, column: 30, scope: !282, inlinedAt: !326)
!330 = !DILocation(line: 0, scope: !302, inlinedAt: !331)
!331 = distinct !DILocation(line: 73, column: 43, scope: !296, inlinedAt: !329)
!332 = !DILocation(line: 0, scope: !307, inlinedAt: !333)
!333 = distinct !DILocation(line: 72, column: 37, scope: !302, inlinedAt: !331)
!334 = !DILocation(line: 70, column: 51, scope: !307, inlinedAt: !333)
!335 = !DILocation(line: 72, column: 47, scope: !302, inlinedAt: !331)
!336 = !DILocation(line: 73, column: 57, scope: !296, inlinedAt: !329)
!337 = !DILocation(line: 207, column: 18, scope: !282, inlinedAt: !326)
!338 = !DILocation(line: 209, column: 3, scope: !282, inlinedAt: !326)
!339 = distinct !DISubprogram(name: "__ubsan_handle_sub_overflow", scope: !84, file: !84, line: 220, type: !269, scopeLine: 220, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !340)
!340 = !{!341, !342, !343}
!341 = !DILocalVariable(name: "Data", arg: 1, scope: !339, file: !84, line: 220, type: !271)
!342 = !DILocalVariable(name: "LHS", arg: 2, scope: !339, file: !84, line: 220, type: !144)
!343 = !DILocalVariable(name: "RHS", arg: 3, scope: !339, file: !84, line: 220, type: !144)
!344 = !DILocation(line: 0, scope: !339)
!345 = !DILocation(line: 0, scope: !282, inlinedAt: !346)
!346 = distinct !DILocation(line: 220, column: 1, scope: !339)
!347 = !DILocation(line: 206, column: 25, scope: !282, inlinedAt: !346)
!348 = !DILocation(line: 0, scope: !296, inlinedAt: !349)
!349 = distinct !DILocation(line: 206, column: 30, scope: !282, inlinedAt: !346)
!350 = !DILocation(line: 0, scope: !302, inlinedAt: !351)
!351 = distinct !DILocation(line: 73, column: 43, scope: !296, inlinedAt: !349)
!352 = !DILocation(line: 0, scope: !307, inlinedAt: !353)
!353 = distinct !DILocation(line: 72, column: 37, scope: !302, inlinedAt: !351)
!354 = !DILocation(line: 70, column: 51, scope: !307, inlinedAt: !353)
!355 = !DILocation(line: 72, column: 47, scope: !302, inlinedAt: !351)
!356 = !DILocation(line: 73, column: 57, scope: !296, inlinedAt: !349)
!357 = !DILocation(line: 207, column: 18, scope: !282, inlinedAt: !346)
!358 = !DILocation(line: 209, column: 3, scope: !282, inlinedAt: !346)
!359 = distinct !DISubprogram(name: "__ubsan_handle_sub_overflow_abort", scope: !84, file: !84, line: 221, type: !269, scopeLine: 221, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !360)
!360 = !{!361, !362, !363}
!361 = !DILocalVariable(name: "Data", arg: 1, scope: !359, file: !84, line: 221, type: !271)
!362 = !DILocalVariable(name: "LHS", arg: 2, scope: !359, file: !84, line: 221, type: !144)
!363 = !DILocalVariable(name: "RHS", arg: 3, scope: !359, file: !84, line: 221, type: !144)
!364 = !DILocation(line: 0, scope: !359)
!365 = !DILocation(line: 0, scope: !282, inlinedAt: !366)
!366 = distinct !DILocation(line: 221, column: 1, scope: !359)
!367 = !DILocation(line: 206, column: 25, scope: !282, inlinedAt: !366)
!368 = !DILocation(line: 0, scope: !296, inlinedAt: !369)
!369 = distinct !DILocation(line: 206, column: 30, scope: !282, inlinedAt: !366)
!370 = !DILocation(line: 0, scope: !302, inlinedAt: !371)
!371 = distinct !DILocation(line: 73, column: 43, scope: !296, inlinedAt: !369)
!372 = !DILocation(line: 0, scope: !307, inlinedAt: !373)
!373 = distinct !DILocation(line: 72, column: 37, scope: !302, inlinedAt: !371)
!374 = !DILocation(line: 70, column: 51, scope: !307, inlinedAt: !373)
!375 = !DILocation(line: 72, column: 47, scope: !302, inlinedAt: !371)
!376 = !DILocation(line: 73, column: 57, scope: !296, inlinedAt: !369)
!377 = !DILocation(line: 207, column: 18, scope: !282, inlinedAt: !366)
!378 = !DILocation(line: 209, column: 3, scope: !282, inlinedAt: !366)
!379 = distinct !DISubprogram(name: "__ubsan_handle_mul_overflow", scope: !84, file: !84, line: 222, type: !269, scopeLine: 222, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !380)
!380 = !{!381, !382, !383}
!381 = !DILocalVariable(name: "Data", arg: 1, scope: !379, file: !84, line: 222, type: !271)
!382 = !DILocalVariable(name: "LHS", arg: 2, scope: !379, file: !84, line: 222, type: !144)
!383 = !DILocalVariable(name: "RHS", arg: 3, scope: !379, file: !84, line: 222, type: !144)
!384 = !DILocation(line: 0, scope: !379)
!385 = !DILocation(line: 0, scope: !282, inlinedAt: !386)
!386 = distinct !DILocation(line: 222, column: 1, scope: !379)
!387 = !DILocation(line: 206, column: 25, scope: !282, inlinedAt: !386)
!388 = !DILocation(line: 0, scope: !296, inlinedAt: !389)
!389 = distinct !DILocation(line: 206, column: 30, scope: !282, inlinedAt: !386)
!390 = !DILocation(line: 0, scope: !302, inlinedAt: !391)
!391 = distinct !DILocation(line: 73, column: 43, scope: !296, inlinedAt: !389)
!392 = !DILocation(line: 0, scope: !307, inlinedAt: !393)
!393 = distinct !DILocation(line: 72, column: 37, scope: !302, inlinedAt: !391)
!394 = !DILocation(line: 70, column: 51, scope: !307, inlinedAt: !393)
!395 = !DILocation(line: 72, column: 47, scope: !302, inlinedAt: !391)
!396 = !DILocation(line: 73, column: 57, scope: !296, inlinedAt: !389)
!397 = !DILocation(line: 207, column: 18, scope: !282, inlinedAt: !386)
!398 = !DILocation(line: 209, column: 3, scope: !282, inlinedAt: !386)
!399 = distinct !DISubprogram(name: "__ubsan_handle_mul_overflow_abort", scope: !84, file: !84, line: 223, type: !269, scopeLine: 223, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !400)
!400 = !{!401, !402, !403}
!401 = !DILocalVariable(name: "Data", arg: 1, scope: !399, file: !84, line: 223, type: !271)
!402 = !DILocalVariable(name: "LHS", arg: 2, scope: !399, file: !84, line: 223, type: !144)
!403 = !DILocalVariable(name: "RHS", arg: 3, scope: !399, file: !84, line: 223, type: !144)
!404 = !DILocation(line: 0, scope: !399)
!405 = !DILocation(line: 0, scope: !282, inlinedAt: !406)
!406 = distinct !DILocation(line: 223, column: 1, scope: !399)
!407 = !DILocation(line: 206, column: 25, scope: !282, inlinedAt: !406)
!408 = !DILocation(line: 0, scope: !296, inlinedAt: !409)
!409 = distinct !DILocation(line: 206, column: 30, scope: !282, inlinedAt: !406)
!410 = !DILocation(line: 0, scope: !302, inlinedAt: !411)
!411 = distinct !DILocation(line: 73, column: 43, scope: !296, inlinedAt: !409)
!412 = !DILocation(line: 0, scope: !307, inlinedAt: !413)
!413 = distinct !DILocation(line: 72, column: 37, scope: !302, inlinedAt: !411)
!414 = !DILocation(line: 70, column: 51, scope: !307, inlinedAt: !413)
!415 = !DILocation(line: 72, column: 47, scope: !302, inlinedAt: !411)
!416 = !DILocation(line: 73, column: 57, scope: !296, inlinedAt: !409)
!417 = !DILocation(line: 207, column: 18, scope: !282, inlinedAt: !406)
!418 = !DILocation(line: 209, column: 3, scope: !282, inlinedAt: !406)
!419 = distinct !DISubprogram(name: "__ubsan_handle_negate_overflow", scope: !84, file: !84, line: 233, type: !420, scopeLine: 234, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !422)
!420 = !DISubroutineType(types: !421)
!421 = !{null, !271, !144}
!422 = !{!423, !424}
!423 = !DILocalVariable(name: "Data", arg: 1, scope: !419, file: !84, line: 233, type: !271)
!424 = !DILocalVariable(name: "OldVal", arg: 2, scope: !419, file: !84, line: 234, type: !144)
!425 = !DILocation(line: 0, scope: !419)
!426 = !DILocalVariable(name: "Data", arg: 1, scope: !427, file: !84, line: 225, type: !271)
!427 = distinct !DISubprogram(name: "handleNegateOverflowImpl", linkageName: "_ZN7__ubsanL24handleNegateOverflowImplEP12OverflowDatam", scope: !9, file: !84, line: 225, type: !420, scopeLine: 226, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !428)
!428 = !{!426, !429, !430, !431}
!429 = !DILocalVariable(arg: 2, scope: !427, file: !84, line: 226, type: !144)
!430 = !DILocalVariable(name: "IsSigned", scope: !427, file: !84, line: 227, type: !35)
!431 = !DILocalVariable(name: "ET", scope: !427, file: !84, line: 228, type: !43)
!432 = !DILocation(line: 0, scope: !427, inlinedAt: !433)
!433 = distinct !DILocation(line: 235, column: 3, scope: !419)
!434 = !DILocation(line: 227, column: 25, scope: !427, inlinedAt: !433)
!435 = !DILocation(line: 0, scope: !296, inlinedAt: !436)
!436 = distinct !DILocation(line: 227, column: 30, scope: !427, inlinedAt: !433)
!437 = !DILocation(line: 0, scope: !302, inlinedAt: !438)
!438 = distinct !DILocation(line: 73, column: 43, scope: !296, inlinedAt: !436)
!439 = !DILocation(line: 0, scope: !307, inlinedAt: !440)
!440 = distinct !DILocation(line: 72, column: 37, scope: !302, inlinedAt: !438)
!441 = !DILocation(line: 70, column: 51, scope: !307, inlinedAt: !440)
!442 = !DILocation(line: 72, column: 47, scope: !302, inlinedAt: !438)
!443 = !DILocation(line: 73, column: 57, scope: !296, inlinedAt: !436)
!444 = !DILocation(line: 228, column: 18, scope: !427, inlinedAt: !433)
!445 = !DILocation(line: 230, column: 3, scope: !427, inlinedAt: !433)
!446 = distinct !DISubprogram(name: "__ubsan_handle_negate_overflow_abort", scope: !84, file: !84, line: 238, type: !420, scopeLine: 239, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !447)
!447 = !{!448, !449}
!448 = !DILocalVariable(name: "Data", arg: 1, scope: !446, file: !84, line: 238, type: !271)
!449 = !DILocalVariable(name: "OldVal", arg: 2, scope: !446, file: !84, line: 239, type: !144)
!450 = !DILocation(line: 0, scope: !446)
!451 = !DILocation(line: 0, scope: !427, inlinedAt: !452)
!452 = distinct !DILocation(line: 240, column: 3, scope: !446)
!453 = !DILocation(line: 227, column: 25, scope: !427, inlinedAt: !452)
!454 = !DILocation(line: 0, scope: !296, inlinedAt: !455)
!455 = distinct !DILocation(line: 227, column: 30, scope: !427, inlinedAt: !452)
!456 = !DILocation(line: 0, scope: !302, inlinedAt: !457)
!457 = distinct !DILocation(line: 73, column: 43, scope: !296, inlinedAt: !455)
!458 = !DILocation(line: 0, scope: !307, inlinedAt: !459)
!459 = distinct !DILocation(line: 72, column: 37, scope: !302, inlinedAt: !457)
!460 = !DILocation(line: 70, column: 51, scope: !307, inlinedAt: !459)
!461 = !DILocation(line: 72, column: 47, scope: !302, inlinedAt: !457)
!462 = !DILocation(line: 73, column: 57, scope: !296, inlinedAt: !455)
!463 = !DILocation(line: 228, column: 18, scope: !427, inlinedAt: !452)
!464 = !DILocation(line: 230, column: 3, scope: !427, inlinedAt: !452)
!465 = distinct !DISubprogram(name: "__ubsan_handle_divrem_overflow", scope: !84, file: !84, line: 253, type: !269, scopeLine: 255, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !466)
!466 = !{!467, !468, !469}
!467 = !DILocalVariable(name: "Data", arg: 1, scope: !465, file: !84, line: 253, type: !271)
!468 = !DILocalVariable(name: "LHS", arg: 2, scope: !465, file: !84, line: 254, type: !144)
!469 = !DILocalVariable(name: "RHS", arg: 3, scope: !465, file: !84, line: 255, type: !144)
!470 = !DILocation(line: 0, scope: !465)
!471 = !DILocalVariable(name: "Data", arg: 1, scope: !472, file: !84, line: 243, type: !271)
!472 = distinct !DISubprogram(name: "handleDivremOverflowImpl", linkageName: "_ZN7__ubsanL24handleDivremOverflowImplEP12OverflowDatamm", scope: !9, file: !84, line: 243, type: !269, scopeLine: 244, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !473)
!473 = !{!471, !474, !475, !476}
!474 = !DILocalVariable(arg: 2, scope: !472, file: !84, line: 243, type: !144)
!475 = !DILocalVariable(arg: 3, scope: !472, file: !84, line: 244, type: !144)
!476 = !DILocalVariable(name: "ET", scope: !477, file: !84, line: 248, type: !43)
!477 = distinct !DILexicalBlock(scope: !478, file: !84, line: 247, column: 8)
!478 = distinct !DILexicalBlock(scope: !472, file: !84, line: 245, column: 7)
!479 = !DILocation(line: 0, scope: !472, inlinedAt: !480)
!480 = distinct !DILocation(line: 256, column: 3, scope: !465)
!481 = !DILocation(line: 245, column: 13, scope: !478, inlinedAt: !480)
!482 = !DILocation(line: 0, scope: !302, inlinedAt: !483)
!483 = distinct !DILocation(line: 245, column: 18, scope: !478, inlinedAt: !480)
!484 = !DILocation(line: 0, scope: !307, inlinedAt: !485)
!485 = distinct !DILocation(line: 72, column: 37, scope: !302, inlinedAt: !483)
!486 = !DILocation(line: 70, column: 51, scope: !307, inlinedAt: !485)
!487 = !DILocation(line: 72, column: 47, scope: !302, inlinedAt: !483)
!488 = !DILocation(line: 245, column: 7, scope: !472, inlinedAt: !480)
!489 = !DILocation(line: 246, column: 5, scope: !478, inlinedAt: !480)
!490 = !DILocation(line: 0, scope: !477, inlinedAt: !480)
!491 = !DILocation(line: 249, column: 5, scope: !477, inlinedAt: !480)
!492 = distinct !DISubprogram(name: "__ubsan_handle_divrem_overflow_abort", scope: !84, file: !84, line: 259, type: !269, scopeLine: 261, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !493)
!493 = !{!494, !495, !496}
!494 = !DILocalVariable(name: "Data", arg: 1, scope: !492, file: !84, line: 259, type: !271)
!495 = !DILocalVariable(name: "LHS", arg: 2, scope: !492, file: !84, line: 260, type: !144)
!496 = !DILocalVariable(name: "RHS", arg: 3, scope: !492, file: !84, line: 261, type: !144)
!497 = !DILocation(line: 0, scope: !492)
!498 = !DILocation(line: 0, scope: !472, inlinedAt: !499)
!499 = distinct !DILocation(line: 262, column: 3, scope: !492)
!500 = !DILocation(line: 245, column: 13, scope: !478, inlinedAt: !499)
!501 = !DILocation(line: 0, scope: !302, inlinedAt: !502)
!502 = distinct !DILocation(line: 245, column: 18, scope: !478, inlinedAt: !499)
!503 = !DILocation(line: 0, scope: !307, inlinedAt: !504)
!504 = distinct !DILocation(line: 72, column: 37, scope: !302, inlinedAt: !502)
!505 = !DILocation(line: 70, column: 51, scope: !307, inlinedAt: !504)
!506 = !DILocation(line: 72, column: 47, scope: !302, inlinedAt: !502)
!507 = !DILocation(line: 245, column: 7, scope: !472, inlinedAt: !499)
!508 = !DILocation(line: 246, column: 5, scope: !478, inlinedAt: !499)
!509 = !DILocation(line: 0, scope: !477, inlinedAt: !499)
!510 = !DILocation(line: 249, column: 5, scope: !477, inlinedAt: !499)
!511 = distinct !DISubprogram(name: "__ubsan_handle_shift_out_of_bounds", scope: !84, file: !84, line: 271, type: !512, scopeLine: 273, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !516)
!512 = !DISubroutineType(types: !513)
!513 = !{null, !514, !144, !144}
!514 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !515, size: 64)
!515 = !DICompositeType(tag: DW_TAG_structure_type, name: "ShiftOutOfBoundsData", file: !104, line: 43, size: 256, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS20ShiftOutOfBoundsData")
!516 = !{!517, !518, !519}
!517 = !DILocalVariable(name: "Data", arg: 1, scope: !511, file: !84, line: 271, type: !514)
!518 = !DILocalVariable(name: "LHS", arg: 2, scope: !511, file: !84, line: 272, type: !144)
!519 = !DILocalVariable(name: "RHS", arg: 3, scope: !511, file: !84, line: 273, type: !144)
!520 = !DILocation(line: 0, scope: !511)
!521 = !DILocalVariable(arg: 1, scope: !522, file: !84, line: 265, type: !514)
!522 = distinct !DISubprogram(name: "handleShiftOutOfBoundsImpl", linkageName: "_ZN7__ubsanL26handleShiftOutOfBoundsImplEP20ShiftOutOfBoundsDatamm", scope: !9, file: !84, line: 265, type: !512, scopeLine: 267, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !523)
!523 = !{!521, !524, !525}
!524 = !DILocalVariable(arg: 2, scope: !522, file: !84, line: 266, type: !144)
!525 = !DILocalVariable(arg: 3, scope: !522, file: !84, line: 267, type: !144)
!526 = !DILocation(line: 0, scope: !522, inlinedAt: !527)
!527 = distinct !DILocation(line: 274, column: 3, scope: !511)
!528 = !DILocation(line: 268, column: 3, scope: !522, inlinedAt: !527)
!529 = distinct !DISubprogram(name: "__ubsan_handle_shift_out_of_bounds_abort", scope: !84, file: !84, line: 278, type: !512, scopeLine: 279, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !530)
!530 = !{!531, !532, !533}
!531 = !DILocalVariable(name: "Data", arg: 1, scope: !529, file: !84, line: 278, type: !514)
!532 = !DILocalVariable(name: "LHS", arg: 2, scope: !529, file: !84, line: 279, type: !144)
!533 = !DILocalVariable(name: "RHS", arg: 3, scope: !529, file: !84, line: 279, type: !144)
!534 = !DILocation(line: 0, scope: !529)
!535 = !DILocation(line: 0, scope: !522, inlinedAt: !536)
!536 = distinct !DILocation(line: 280, column: 3, scope: !529)
!537 = !DILocation(line: 268, column: 3, scope: !522, inlinedAt: !536)
!538 = distinct !DISubprogram(name: "__ubsan_handle_out_of_bounds", scope: !84, file: !84, line: 289, type: !539, scopeLine: 290, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !543)
!539 = !DISubroutineType(types: !540)
!540 = !{null, !541, !144}
!541 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !542, size: 64)
!542 = !DICompositeType(tag: DW_TAG_structure_type, name: "OutOfBoundsData", file: !104, line: 49, size: 256, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS15OutOfBoundsData")
!543 = !{!544, !545}
!544 = !DILocalVariable(name: "Data", arg: 1, scope: !538, file: !84, line: 289, type: !541)
!545 = !DILocalVariable(name: "Index", arg: 2, scope: !538, file: !84, line: 290, type: !144)
!546 = !DILocation(line: 0, scope: !538)
!547 = !DILocalVariable(arg: 1, scope: !548, file: !84, line: 283, type: !541)
!548 = distinct !DISubprogram(name: "handleOutOfBoundsImpl", linkageName: "_ZN7__ubsanL21handleOutOfBoundsImplEP15OutOfBoundsDatam", scope: !9, file: !84, line: 283, type: !539, scopeLine: 284, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !549)
!549 = !{!547, !550, !551}
!550 = !DILocalVariable(arg: 2, scope: !548, file: !84, line: 284, type: !144)
!551 = !DILocalVariable(name: "ET", scope: !548, file: !84, line: 285, type: !43)
!552 = !DILocation(line: 0, scope: !548, inlinedAt: !553)
!553 = distinct !DILocation(line: 291, column: 3, scope: !538)
!554 = !DILocation(line: 286, column: 3, scope: !548, inlinedAt: !553)
!555 = distinct !DISubprogram(name: "__ubsan_handle_out_of_bounds_abort", scope: !84, file: !84, line: 294, type: !539, scopeLine: 295, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !556)
!556 = !{!557, !558}
!557 = !DILocalVariable(name: "Data", arg: 1, scope: !555, file: !84, line: 294, type: !541)
!558 = !DILocalVariable(name: "Index", arg: 2, scope: !555, file: !84, line: 295, type: !144)
!559 = !DILocation(line: 0, scope: !555)
!560 = !DILocation(line: 0, scope: !548, inlinedAt: !561)
!561 = distinct !DILocation(line: 296, column: 3, scope: !555)
!562 = !DILocation(line: 286, column: 3, scope: !548, inlinedAt: !561)
!563 = distinct !DISubprogram(name: "__ubsan_handle_builtin_unreachable", scope: !84, file: !84, line: 304, type: !564, scopeLine: 304, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !568)
!564 = !DISubroutineType(types: !565)
!565 = !{null, !566}
!566 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !567, size: 64)
!567 = !DICompositeType(tag: DW_TAG_structure_type, name: "UnreachableData", file: !104, line: 55, size: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS15UnreachableData")
!568 = !{!569}
!569 = !DILocalVariable(name: "Data", arg: 1, scope: !563, file: !84, line: 304, type: !566)
!570 = !DILocation(line: 0, scope: !563)
!571 = !DILocalVariable(arg: 1, scope: !572, file: !84, line: 299, type: !566)
!572 = distinct !DISubprogram(name: "handleBuiltinUnreachableImpl", linkageName: "_ZN7__ubsanL28handleBuiltinUnreachableImplEP15UnreachableData", scope: !9, file: !84, line: 299, type: !564, scopeLine: 299, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !573)
!573 = !{!571, !574}
!574 = !DILocalVariable(name: "ET", scope: !572, file: !84, line: 300, type: !43)
!575 = !DILocation(line: 0, scope: !572, inlinedAt: !576)
!576 = distinct !DILocation(line: 305, column: 3, scope: !563)
!577 = !DILocation(line: 301, column: 3, scope: !572, inlinedAt: !576)
!578 = distinct !DISubprogram(name: "__ubsan_handle_missing_return", scope: !84, file: !84, line: 313, type: !564, scopeLine: 313, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !579)
!579 = !{!580}
!580 = !DILocalVariable(name: "Data", arg: 1, scope: !578, file: !84, line: 313, type: !566)
!581 = !DILocation(line: 0, scope: !578)
!582 = !DILocalVariable(arg: 1, scope: !583, file: !84, line: 308, type: !566)
!583 = distinct !DISubprogram(name: "handleMissingReturnImpl", linkageName: "_ZN7__ubsanL23handleMissingReturnImplEP15UnreachableData", scope: !9, file: !84, line: 308, type: !564, scopeLine: 308, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !584)
!584 = !{!582, !585}
!585 = !DILocalVariable(name: "ET", scope: !583, file: !84, line: 309, type: !43)
!586 = !DILocation(line: 0, scope: !583, inlinedAt: !587)
!587 = distinct !DILocation(line: 314, column: 3, scope: !578)
!588 = !DILocation(line: 310, column: 3, scope: !583, inlinedAt: !587)
!589 = distinct !DISubprogram(name: "__ubsan_handle_vla_bound_not_positive", scope: !84, file: !84, line: 323, type: !590, scopeLine: 324, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !594)
!590 = !DISubroutineType(types: !591)
!591 = !{null, !592, !144}
!592 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !593, size: 64)
!593 = !DICompositeType(tag: DW_TAG_structure_type, name: "VLABoundData", file: !104, line: 59, size: 192, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS12VLABoundData")
!594 = !{!595, !596}
!595 = !DILocalVariable(name: "Data", arg: 1, scope: !589, file: !84, line: 323, type: !592)
!596 = !DILocalVariable(name: "Bound", arg: 2, scope: !589, file: !84, line: 324, type: !144)
!597 = !DILocation(line: 0, scope: !589)
!598 = !DILocalVariable(arg: 1, scope: !599, file: !84, line: 317, type: !592)
!599 = distinct !DISubprogram(name: "handleVLABoundNotPositive", linkageName: "_ZN7__ubsanL25handleVLABoundNotPositiveEP12VLABoundDatam", scope: !9, file: !84, line: 317, type: !590, scopeLine: 318, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !600)
!600 = !{!598, !601, !602}
!601 = !DILocalVariable(arg: 2, scope: !599, file: !84, line: 318, type: !144)
!602 = !DILocalVariable(name: "ET", scope: !599, file: !84, line: 319, type: !43)
!603 = !DILocation(line: 0, scope: !599, inlinedAt: !604)
!604 = distinct !DILocation(line: 325, column: 3, scope: !589)
!605 = !DILocation(line: 320, column: 3, scope: !599, inlinedAt: !604)
!606 = distinct !DISubprogram(name: "__ubsan_handle_vla_bound_not_positive_abort", scope: !84, file: !84, line: 328, type: !590, scopeLine: 329, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !607)
!607 = !{!608, !609}
!608 = !DILocalVariable(name: "Data", arg: 1, scope: !606, file: !84, line: 328, type: !592)
!609 = !DILocalVariable(name: "Bound", arg: 2, scope: !606, file: !84, line: 329, type: !144)
!610 = !DILocation(line: 0, scope: !606)
!611 = !DILocation(line: 0, scope: !599, inlinedAt: !612)
!612 = distinct !DILocation(line: 330, column: 3, scope: !606)
!613 = !DILocation(line: 320, column: 3, scope: !599, inlinedAt: !612)
!614 = distinct !DISubprogram(name: "__ubsan_handle_float_cast_overflow", scope: !84, file: !84, line: 338, type: !615, scopeLine: 339, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !618)
!615 = !DISubroutineType(types: !616)
!616 = !{null, !617, !144}
!617 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!618 = !{!619, !620}
!619 = !DILocalVariable(name: "Data", arg: 1, scope: !614, file: !84, line: 338, type: !617)
!620 = !DILocalVariable(name: "From", arg: 2, scope: !614, file: !84, line: 339, type: !144)
!621 = !DILocation(line: 0, scope: !614)
!622 = !DILocalVariable(arg: 1, scope: !623, file: !84, line: 333, type: !617)
!623 = distinct !DISubprogram(name: "handleFloatCastOverflow", linkageName: "_ZN7__ubsanL23handleFloatCastOverflowEPvm", scope: !9, file: !84, line: 333, type: !615, scopeLine: 333, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !624)
!624 = !{!622, !625, !626}
!625 = !DILocalVariable(arg: 2, scope: !623, file: !84, line: 333, type: !144)
!626 = !DILocalVariable(name: "ET", scope: !623, file: !84, line: 334, type: !43)
!627 = !DILocation(line: 0, scope: !623, inlinedAt: !628)
!628 = distinct !DILocation(line: 340, column: 3, scope: !614)
!629 = !DILocation(line: 335, column: 3, scope: !623, inlinedAt: !628)
!630 = distinct !DISubprogram(name: "__ubsan_handle_float_cast_overflow_abort", scope: !84, file: !84, line: 343, type: !615, scopeLine: 344, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !631)
!631 = !{!632, !633}
!632 = !DILocalVariable(name: "Data", arg: 1, scope: !630, file: !84, line: 343, type: !617)
!633 = !DILocalVariable(name: "From", arg: 2, scope: !630, file: !84, line: 344, type: !144)
!634 = !DILocation(line: 0, scope: !630)
!635 = !DILocation(line: 0, scope: !623, inlinedAt: !636)
!636 = distinct !DILocation(line: 345, column: 3, scope: !630)
!637 = !DILocation(line: 335, column: 3, scope: !623, inlinedAt: !636)
!638 = distinct !DISubprogram(name: "__ubsan_handle_load_invalid_value", scope: !84, file: !84, line: 353, type: !639, scopeLine: 354, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !643)
!639 = !DISubroutineType(types: !640)
!640 = !{null, !641, !144}
!641 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !642, size: 64)
!642 = !DICompositeType(tag: DW_TAG_structure_type, name: "InvalidValueData", file: !104, line: 64, size: 192, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS16InvalidValueData")
!643 = !{!644, !645}
!644 = !DILocalVariable(name: "Data", arg: 1, scope: !638, file: !84, line: 353, type: !641)
!645 = !DILocalVariable(name: "Val", arg: 2, scope: !638, file: !84, line: 354, type: !144)
!646 = !DILocation(line: 0, scope: !638)
!647 = !DILocalVariable(arg: 1, scope: !648, file: !84, line: 348, type: !641)
!648 = distinct !DISubprogram(name: "handleLoadInvalidValue", linkageName: "_ZN7__ubsanL22handleLoadInvalidValueEP16InvalidValueDatam", scope: !9, file: !84, line: 348, type: !639, scopeLine: 349, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !649)
!649 = !{!647, !650}
!650 = !DILocalVariable(arg: 2, scope: !648, file: !84, line: 349, type: !144)
!651 = !DILocation(line: 0, scope: !648, inlinedAt: !652)
!652 = distinct !DILocation(line: 355, column: 3, scope: !638)
!653 = !DILocation(line: 350, column: 3, scope: !648, inlinedAt: !652)
!654 = distinct !DISubprogram(name: "__ubsan_handle_load_invalid_value_abort", scope: !84, file: !84, line: 357, type: !639, scopeLine: 358, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !655)
!655 = !{!656, !657}
!656 = !DILocalVariable(name: "Data", arg: 1, scope: !654, file: !84, line: 357, type: !641)
!657 = !DILocalVariable(name: "Val", arg: 2, scope: !654, file: !84, line: 358, type: !144)
!658 = !DILocation(line: 0, scope: !654)
!659 = !DILocation(line: 0, scope: !648, inlinedAt: !660)
!660 = distinct !DILocation(line: 359, column: 3, scope: !654)
!661 = !DILocation(line: 350, column: 3, scope: !648, inlinedAt: !660)
!662 = distinct !DISubprogram(name: "__ubsan_handle_implicit_conversion", scope: !84, file: !84, line: 400, type: !663, scopeLine: 402, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !672)
!663 = !DISubroutineType(types: !664)
!664 = !{null, !665, !144, !144}
!665 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !666, size: 64)
!666 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ImplicitConversionData", file: !104, line: 79, size: 320, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !667, identifier: "_ZTS22ImplicitConversionData")
!667 = !{!668, !669, !670, !671}
!668 = !DIDerivedType(tag: DW_TAG_member, name: "Loc", scope: !666, file: !104, line: 80, baseType: !138, size: 128)
!669 = !DIDerivedType(tag: DW_TAG_member, name: "FromType", scope: !666, file: !104, line: 81, baseType: !140, size: 64, offset: 128)
!670 = !DIDerivedType(tag: DW_TAG_member, name: "ToType", scope: !666, file: !104, line: 82, baseType: !140, size: 64, offset: 192)
!671 = !DIDerivedType(tag: DW_TAG_member, name: "Kind", scope: !666, file: !104, line: 83, baseType: !142, size: 8, offset: 256)
!672 = !{!673, !674, !675}
!673 = !DILocalVariable(name: "Data", arg: 1, scope: !662, file: !84, line: 400, type: !665)
!674 = !DILocalVariable(name: "Src", arg: 2, scope: !662, file: !84, line: 401, type: !144)
!675 = !DILocalVariable(name: "Dst", arg: 3, scope: !662, file: !84, line: 402, type: !144)
!676 = !DILocation(line: 0, scope: !662)
!677 = !DILocalVariable(name: "Data", arg: 1, scope: !678, file: !84, line: 362, type: !665)
!678 = distinct !DISubprogram(name: "handleImplicitConversion", linkageName: "_ZN7__ubsanL24handleImplicitConversionEP22ImplicitConversionDatamm", scope: !9, file: !84, line: 362, type: !663, scopeLine: 363, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !679)
!679 = !{!677, !680, !681, !682, !683, !684, !685, !686}
!680 = !DILocalVariable(arg: 2, scope: !678, file: !84, line: 363, type: !144)
!681 = !DILocalVariable(arg: 3, scope: !678, file: !84, line: 363, type: !144)
!682 = !DILocalVariable(name: "ET", scope: !678, file: !84, line: 364, type: !43)
!683 = !DILocalVariable(name: "SrcTy", scope: !678, file: !84, line: 366, type: !140)
!684 = !DILocalVariable(name: "DstTy", scope: !678, file: !84, line: 367, type: !140)
!685 = !DILocalVariable(name: "SrcSigned", scope: !678, file: !84, line: 369, type: !35)
!686 = !DILocalVariable(name: "DstSigned", scope: !678, file: !84, line: 370, type: !35)
!687 = !DILocation(line: 0, scope: !678, inlinedAt: !688)
!688 = distinct !DILocation(line: 403, column: 3, scope: !662)
!689 = !DILocation(line: 366, column: 39, scope: !678, inlinedAt: !688)
!690 = !{!691, !164, i64 16}
!691 = !{!"_ZTS22ImplicitConversionData", !163, i64 0, !164, i64 16, !164, i64 24, !165, i64 32}
!692 = !DILocation(line: 367, column: 39, scope: !678, inlinedAt: !688)
!693 = !{!691, !164, i64 24}
!694 = !DILocation(line: 0, scope: !296, inlinedAt: !695)
!695 = distinct !DILocation(line: 369, column: 26, scope: !678, inlinedAt: !688)
!696 = !DILocation(line: 0, scope: !302, inlinedAt: !697)
!697 = distinct !DILocation(line: 73, column: 43, scope: !296, inlinedAt: !695)
!698 = !DILocation(line: 0, scope: !307, inlinedAt: !699)
!699 = distinct !DILocation(line: 72, column: 37, scope: !302, inlinedAt: !697)
!700 = !DILocation(line: 0, scope: !296, inlinedAt: !701)
!701 = distinct !DILocation(line: 370, column: 26, scope: !678, inlinedAt: !688)
!702 = !DILocation(line: 0, scope: !302, inlinedAt: !703)
!703 = distinct !DILocation(line: 73, column: 43, scope: !296, inlinedAt: !701)
!704 = !DILocation(line: 0, scope: !307, inlinedAt: !705)
!705 = distinct !DILocation(line: 72, column: 37, scope: !302, inlinedAt: !703)
!706 = !DILocation(line: 372, column: 17, scope: !678, inlinedAt: !688)
!707 = !{!691, !165, i64 32}
!708 = !DILocation(line: 372, column: 3, scope: !678, inlinedAt: !688)
!709 = !DILocation(line: 70, column: 51, scope: !307, inlinedAt: !705)
!710 = !DILocation(line: 72, column: 47, scope: !302, inlinedAt: !703)
!711 = !DILocation(line: 73, column: 57, scope: !296, inlinedAt: !701)
!712 = !DILocation(line: 70, column: 51, scope: !307, inlinedAt: !699)
!713 = !DILocation(line: 72, column: 47, scope: !302, inlinedAt: !697)
!714 = !DILocation(line: 73, column: 57, scope: !296, inlinedAt: !695)
!715 = !DILocation(line: 377, column: 20, scope: !716, inlinedAt: !688)
!716 = distinct !DILexicalBlock(scope: !717, file: !84, line: 377, column: 9)
!717 = distinct !DILexicalBlock(scope: !718, file: !84, line: 373, column: 32)
!718 = distinct !DILexicalBlock(scope: !678, file: !84, line: 372, column: 23)
!719 = !DILocation(line: 386, column: 5, scope: !718, inlinedAt: !688)
!720 = !DILocation(line: 389, column: 5, scope: !718, inlinedAt: !688)
!721 = !DILocation(line: 392, column: 5, scope: !718, inlinedAt: !688)
!722 = !DILocation(line: 395, column: 5, scope: !718, inlinedAt: !688)
!723 = !DILocation(line: 397, column: 3, scope: !678, inlinedAt: !688)
!724 = distinct !DISubprogram(name: "__ubsan_handle_implicit_conversion_abort", scope: !84, file: !84, line: 407, type: !663, scopeLine: 408, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !725)
!725 = !{!726, !727, !728}
!726 = !DILocalVariable(name: "Data", arg: 1, scope: !724, file: !84, line: 407, type: !665)
!727 = !DILocalVariable(name: "Src", arg: 2, scope: !724, file: !84, line: 408, type: !144)
!728 = !DILocalVariable(name: "Dst", arg: 3, scope: !724, file: !84, line: 408, type: !144)
!729 = !DILocation(line: 0, scope: !724)
!730 = !DILocation(line: 0, scope: !678, inlinedAt: !731)
!731 = distinct !DILocation(line: 409, column: 3, scope: !724)
!732 = !DILocation(line: 366, column: 39, scope: !678, inlinedAt: !731)
!733 = !DILocation(line: 367, column: 39, scope: !678, inlinedAt: !731)
!734 = !DILocation(line: 0, scope: !296, inlinedAt: !735)
!735 = distinct !DILocation(line: 369, column: 26, scope: !678, inlinedAt: !731)
!736 = !DILocation(line: 0, scope: !302, inlinedAt: !737)
!737 = distinct !DILocation(line: 73, column: 43, scope: !296, inlinedAt: !735)
!738 = !DILocation(line: 0, scope: !307, inlinedAt: !739)
!739 = distinct !DILocation(line: 72, column: 37, scope: !302, inlinedAt: !737)
!740 = !DILocation(line: 0, scope: !296, inlinedAt: !741)
!741 = distinct !DILocation(line: 370, column: 26, scope: !678, inlinedAt: !731)
!742 = !DILocation(line: 0, scope: !302, inlinedAt: !743)
!743 = distinct !DILocation(line: 73, column: 43, scope: !296, inlinedAt: !741)
!744 = !DILocation(line: 0, scope: !307, inlinedAt: !745)
!745 = distinct !DILocation(line: 72, column: 37, scope: !302, inlinedAt: !743)
!746 = !DILocation(line: 372, column: 17, scope: !678, inlinedAt: !731)
!747 = !DILocation(line: 372, column: 3, scope: !678, inlinedAt: !731)
!748 = !DILocation(line: 70, column: 51, scope: !307, inlinedAt: !745)
!749 = !DILocation(line: 72, column: 47, scope: !302, inlinedAt: !743)
!750 = !DILocation(line: 73, column: 57, scope: !296, inlinedAt: !741)
!751 = !DILocation(line: 70, column: 51, scope: !307, inlinedAt: !739)
!752 = !DILocation(line: 72, column: 47, scope: !302, inlinedAt: !737)
!753 = !DILocation(line: 73, column: 57, scope: !296, inlinedAt: !735)
!754 = !DILocation(line: 377, column: 20, scope: !716, inlinedAt: !731)
!755 = !DILocation(line: 386, column: 5, scope: !718, inlinedAt: !731)
!756 = !DILocation(line: 389, column: 5, scope: !718, inlinedAt: !731)
!757 = !DILocation(line: 392, column: 5, scope: !718, inlinedAt: !731)
!758 = !DILocation(line: 395, column: 5, scope: !718, inlinedAt: !731)
!759 = !DILocation(line: 397, column: 3, scope: !678, inlinedAt: !731)
!760 = distinct !DISubprogram(name: "__ubsan_handle_invalid_builtin", scope: !84, file: !84, line: 417, type: !761, scopeLine: 417, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !765)
!761 = !DISubroutineType(types: !762)
!762 = !{null, !763}
!763 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !764, size: 64)
!764 = !DICompositeType(tag: DW_TAG_structure_type, name: "InvalidBuiltinData", file: !104, line: 86, size: 192, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS18InvalidBuiltinData")
!765 = !{!766}
!766 = !DILocalVariable(name: "Data", arg: 1, scope: !760, file: !84, line: 417, type: !763)
!767 = !DILocation(line: 0, scope: !760)
!768 = !DILocalVariable(arg: 1, scope: !769, file: !84, line: 412, type: !763)
!769 = distinct !DISubprogram(name: "handleInvalidBuiltin", linkageName: "_ZN7__ubsanL20handleInvalidBuiltinEP18InvalidBuiltinData", scope: !9, file: !84, line: 412, type: !761, scopeLine: 412, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !770)
!770 = !{!768, !771}
!771 = !DILocalVariable(name: "ET", scope: !769, file: !84, line: 413, type: !43)
!772 = !DILocation(line: 0, scope: !769, inlinedAt: !773)
!773 = distinct !DILocation(line: 418, column: 3, scope: !760)
!774 = !DILocation(line: 414, column: 3, scope: !769, inlinedAt: !773)
!775 = distinct !DISubprogram(name: "__ubsan_handle_invalid_builtin_abort", scope: !84, file: !84, line: 421, type: !761, scopeLine: 421, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !776)
!776 = !{!777}
!777 = !DILocalVariable(name: "Data", arg: 1, scope: !775, file: !84, line: 421, type: !763)
!778 = !DILocation(line: 0, scope: !775)
!779 = !DILocation(line: 0, scope: !769, inlinedAt: !780)
!780 = distinct !DILocation(line: 422, column: 3, scope: !775)
!781 = !DILocation(line: 414, column: 3, scope: !769, inlinedAt: !780)
!782 = distinct !DISubprogram(name: "__ubsan_handle_nonnull_return_v1", scope: !84, file: !84, line: 432, type: !783, scopeLine: 433, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !788)
!783 = !DISubroutineType(types: !784)
!784 = !{null, !785, !787}
!785 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !786, size: 64)
!786 = !DICompositeType(tag: DW_TAG_structure_type, name: "NonNullReturnData", file: !104, line: 91, size: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS17NonNullReturnData")
!787 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !138, size: 64)
!788 = !{!789, !790}
!789 = !DILocalVariable(name: "Data", arg: 1, scope: !782, file: !84, line: 432, type: !785)
!790 = !DILocalVariable(name: "LocPtr", arg: 2, scope: !782, file: !84, line: 433, type: !787)
!791 = !DILocation(line: 0, scope: !782)
!792 = !DILocalVariable(arg: 1, scope: !793, file: !84, line: 425, type: !785)
!793 = distinct !DISubprogram(name: "handleNonNullReturn", linkageName: "_ZN7__ubsanL19handleNonNullReturnEP17NonNullReturnDataPNS_14SourceLocationEb", scope: !9, file: !84, line: 425, type: !794, scopeLine: 426, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !796)
!794 = !DISubroutineType(types: !795)
!795 = !{null, !785, !787, !35}
!796 = !{!792, !797, !798, !799}
!797 = !DILocalVariable(arg: 2, scope: !793, file: !84, line: 426, type: !787)
!798 = !DILocalVariable(name: "IsAttr", arg: 3, scope: !793, file: !84, line: 426, type: !35)
!799 = !DILocalVariable(name: "ET", scope: !793, file: !84, line: 427, type: !43)
!800 = !DILocation(line: 0, scope: !793, inlinedAt: !801)
!801 = distinct !DILocation(line: 434, column: 3, scope: !782)
!802 = !DILocation(line: 429, column: 3, scope: !793, inlinedAt: !801)
!803 = distinct !DISubprogram(name: "__ubsan_handle_nonnull_return_v1_abort", scope: !84, file: !84, line: 437, type: !783, scopeLine: 438, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !804)
!804 = !{!805, !806}
!805 = !DILocalVariable(name: "Data", arg: 1, scope: !803, file: !84, line: 437, type: !785)
!806 = !DILocalVariable(name: "LocPtr", arg: 2, scope: !803, file: !84, line: 438, type: !787)
!807 = !DILocation(line: 0, scope: !803)
!808 = !DILocation(line: 0, scope: !793, inlinedAt: !809)
!809 = distinct !DILocation(line: 439, column: 3, scope: !803)
!810 = !DILocation(line: 429, column: 3, scope: !793, inlinedAt: !809)
!811 = distinct !DISubprogram(name: "__ubsan_handle_nullability_return_v1", scope: !84, file: !84, line: 442, type: !783, scopeLine: 443, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !812)
!812 = !{!813, !814}
!813 = !DILocalVariable(name: "Data", arg: 1, scope: !811, file: !84, line: 442, type: !785)
!814 = !DILocalVariable(name: "LocPtr", arg: 2, scope: !811, file: !84, line: 443, type: !787)
!815 = !DILocation(line: 0, scope: !811)
!816 = !DILocation(line: 0, scope: !793, inlinedAt: !817)
!817 = distinct !DILocation(line: 444, column: 3, scope: !811)
!818 = !DILocation(line: 429, column: 3, scope: !793, inlinedAt: !817)
!819 = distinct !DISubprogram(name: "__ubsan_handle_nullability_return_v1_abort", scope: !84, file: !84, line: 448, type: !783, scopeLine: 449, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !820)
!820 = !{!821, !822}
!821 = !DILocalVariable(name: "Data", arg: 1, scope: !819, file: !84, line: 448, type: !785)
!822 = !DILocalVariable(name: "LocPtr", arg: 2, scope: !819, file: !84, line: 449, type: !787)
!823 = !DILocation(line: 0, scope: !819)
!824 = !DILocation(line: 0, scope: !793, inlinedAt: !825)
!825 = distinct !DILocation(line: 450, column: 3, scope: !819)
!826 = !DILocation(line: 429, column: 3, scope: !793, inlinedAt: !825)
!827 = distinct !DISubprogram(name: "__ubsan_handle_nonnull_arg", scope: !84, file: !84, line: 459, type: !828, scopeLine: 459, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !832)
!828 = !DISubroutineType(types: !829)
!829 = !{null, !830}
!830 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !831, size: 64)
!831 = !DICompositeType(tag: DW_TAG_structure_type, name: "NonNullArgData", file: !104, line: 95, size: 320, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS14NonNullArgData")
!832 = !{!833}
!833 = !DILocalVariable(name: "Data", arg: 1, scope: !827, file: !84, line: 459, type: !830)
!834 = !DILocation(line: 0, scope: !827)
!835 = !DILocalVariable(arg: 1, scope: !836, file: !84, line: 453, type: !830)
!836 = distinct !DISubprogram(name: "handleNonNullArg", linkageName: "_ZN7__ubsanL16handleNonNullArgEP14NonNullArgDatab", scope: !9, file: !84, line: 453, type: !837, scopeLine: 453, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !839)
!837 = !DISubroutineType(types: !838)
!838 = !{null, !830, !35}
!839 = !{!835, !840, !841}
!840 = !DILocalVariable(name: "IsAttr", arg: 2, scope: !836, file: !84, line: 453, type: !35)
!841 = !DILocalVariable(name: "ET", scope: !836, file: !84, line: 454, type: !43)
!842 = !DILocation(line: 0, scope: !836, inlinedAt: !843)
!843 = distinct !DILocation(line: 460, column: 3, scope: !827)
!844 = !DILocation(line: 456, column: 3, scope: !836, inlinedAt: !843)
!845 = distinct !DISubprogram(name: "__ubsan_handle_nonnull_arg_abort", scope: !84, file: !84, line: 463, type: !828, scopeLine: 463, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !846)
!846 = !{!847}
!847 = !DILocalVariable(name: "Data", arg: 1, scope: !845, file: !84, line: 463, type: !830)
!848 = !DILocation(line: 0, scope: !845)
!849 = !DILocation(line: 0, scope: !836, inlinedAt: !850)
!850 = distinct !DILocation(line: 464, column: 3, scope: !845)
!851 = !DILocation(line: 456, column: 3, scope: !836, inlinedAt: !850)
!852 = distinct !DISubprogram(name: "__ubsan_handle_nullability_arg", scope: !84, file: !84, line: 467, type: !828, scopeLine: 467, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !853)
!853 = !{!854}
!854 = !DILocalVariable(name: "Data", arg: 1, scope: !852, file: !84, line: 467, type: !830)
!855 = !DILocation(line: 0, scope: !852)
!856 = !DILocation(line: 0, scope: !836, inlinedAt: !857)
!857 = distinct !DILocation(line: 468, column: 3, scope: !852)
!858 = !DILocation(line: 456, column: 3, scope: !836, inlinedAt: !857)
!859 = distinct !DISubprogram(name: "__ubsan_handle_nullability_arg_abort", scope: !84, file: !84, line: 471, type: !828, scopeLine: 471, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !860)
!860 = !{!861}
!861 = !DILocalVariable(name: "Data", arg: 1, scope: !859, file: !84, line: 471, type: !830)
!862 = !DILocation(line: 0, scope: !859)
!863 = !DILocation(line: 0, scope: !836, inlinedAt: !864)
!864 = distinct !DILocation(line: 473, column: 3, scope: !859)
!865 = !DILocation(line: 456, column: 3, scope: !836, inlinedAt: !864)
!866 = distinct !DISubprogram(name: "__ubsan_handle_pointer_overflow", scope: !84, file: !84, line: 490, type: !867, scopeLine: 492, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !871)
!867 = !DISubroutineType(types: !868)
!868 = !{null, !869, !144, !144}
!869 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !870, size: 64)
!870 = !DICompositeType(tag: DW_TAG_structure_type, name: "PointerOverflowData", file: !104, line: 101, size: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS19PointerOverflowData")
!871 = !{!872, !873, !874}
!872 = !DILocalVariable(name: "Data", arg: 1, scope: !866, file: !84, line: 490, type: !869)
!873 = !DILocalVariable(name: "Base", arg: 2, scope: !866, file: !84, line: 491, type: !144)
!874 = !DILocalVariable(name: "Result", arg: 3, scope: !866, file: !84, line: 492, type: !144)
!875 = !DILocation(line: 0, scope: !866)
!876 = !DILocalVariable(arg: 1, scope: !877, file: !84, line: 476, type: !869)
!877 = distinct !DISubprogram(name: "handlePointerOverflowImpl", linkageName: "_ZN7__ubsanL25handlePointerOverflowImplEP19PointerOverflowDatamm", scope: !9, file: !84, line: 476, type: !867, scopeLine: 477, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !878)
!878 = !{!876, !879, !880, !881}
!879 = !DILocalVariable(name: "Base", arg: 2, scope: !877, file: !84, line: 477, type: !144)
!880 = !DILocalVariable(name: "Result", arg: 3, scope: !877, file: !84, line: 477, type: !144)
!881 = !DILocalVariable(name: "ET", scope: !877, file: !84, line: 478, type: !43)
!882 = !DILocation(line: 0, scope: !877, inlinedAt: !883)
!883 = distinct !DILocation(line: 494, column: 3, scope: !866)
!884 = !DILocation(line: 479, column: 12, scope: !885, inlinedAt: !883)
!885 = distinct !DILexicalBlock(scope: !877, file: !84, line: 479, column: 7)
!886 = !DILocation(line: 479, column: 17, scope: !885, inlinedAt: !883)
!887 = !DILocation(line: 481, column: 22, scope: !888, inlinedAt: !883)
!888 = distinct !DILexicalBlock(scope: !885, file: !84, line: 481, column: 12)
!889 = !DILocation(line: 483, column: 17, scope: !890, inlinedAt: !883)
!890 = distinct !DILexicalBlock(scope: !888, file: !84, line: 483, column: 12)
!891 = !DILocation(line: 483, column: 22, scope: !890, inlinedAt: !883)
!892 = !DILocation(line: 0, scope: !885, inlinedAt: !883)
!893 = !DILocation(line: 487, column: 3, scope: !877, inlinedAt: !883)
!894 = distinct !DISubprogram(name: "__ubsan_handle_pointer_overflow_abort", scope: !84, file: !84, line: 497, type: !867, scopeLine: 499, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !3, retainedNodes: !895)
!895 = !{!896, !897, !898}
!896 = !DILocalVariable(name: "Data", arg: 1, scope: !894, file: !84, line: 497, type: !869)
!897 = !DILocalVariable(name: "Base", arg: 2, scope: !894, file: !84, line: 498, type: !144)
!898 = !DILocalVariable(name: "Result", arg: 3, scope: !894, file: !84, line: 499, type: !144)
!899 = !DILocation(line: 0, scope: !894)
!900 = !DILocation(line: 0, scope: !877, inlinedAt: !901)
!901 = distinct !DILocation(line: 501, column: 3, scope: !894)
!902 = !DILocation(line: 479, column: 12, scope: !885, inlinedAt: !901)
!903 = !DILocation(line: 479, column: 17, scope: !885, inlinedAt: !901)
!904 = !DILocation(line: 481, column: 22, scope: !888, inlinedAt: !901)
!905 = !DILocation(line: 483, column: 17, scope: !890, inlinedAt: !901)
!906 = !DILocation(line: 483, column: 22, scope: !890, inlinedAt: !901)
!907 = !DILocation(line: 0, scope: !885, inlinedAt: !901)
!908 = !DILocation(line: 487, column: 3, scope: !877, inlinedAt: !901)
!909 = distinct !DISubprogram(name: "klee_overshift_check", scope: !910, file: !910, line: 20, type: !911, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !105, retainedNodes: !914)
!910 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!911 = !DISubroutineType(types: !912)
!912 = !{null, !913, !913}
!913 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!914 = !{!915, !916}
!915 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !909, file: !910, line: 20, type: !913)
!916 = !DILocalVariable(name: "shift", arg: 2, scope: !909, file: !910, line: 20, type: !913)
!917 = !DILocation(line: 0, scope: !909)
!918 = !DILocation(line: 21, column: 13, scope: !919)
!919 = distinct !DILexicalBlock(scope: !909, file: !910, line: 21, column: 7)
!920 = !DILocation(line: 21, column: 7, scope: !909)
!921 = !DILocation(line: 27, column: 5, scope: !922)
!922 = distinct !DILexicalBlock(scope: !919, file: !910, line: 21, column: 26)
!923 = !DILocation(line: 29, column: 1, scope: !909)
