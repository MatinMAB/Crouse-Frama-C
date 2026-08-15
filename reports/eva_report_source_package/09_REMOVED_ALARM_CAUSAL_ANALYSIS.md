# Removed Alarm Causal Analysis

There are 22 entries. Each section separates log/source observations from mechanism interpretation. Context excerpts are from the frozen source and include line numbers.

## RA-001 — s16_div_s32_s16

- Function: `s16_div_s32_s16`
- Source: `src_analysis/sources/div_Ccode.c:274`
- Category: integer overflow
- Expression: `s32Temp1 - ((s32Temp1 / denominator) * denominator)`
- Operand types: s32 signed long; denominator s16 promoted/converted to signed long
- Control guard: `denominator != 0; numerator != INT32_MIN`

### Code Context

```c
   264			}
   265			else
   266			{
   267				return 0x7FFF;
   268			}
   269		}
   270		else
   271		{
   272			if(numerator != 0x80000000)
   273			{
   274				s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;
   275				s32Temp1 = s32Temp2/denominator;
   276				s32Temp1 = s32Temp1 +((numerator)/denominator);
   277				if(s32Temp1 < 0x7FFF)
   278				{
   279					if(s32Temp1 > -0x8000)
   280					{
   281						return (s16)s32Temp1;
   282					}
   283					else
   284					{
```

### Baseline Evidence

Baseline reports the lower-bound subtraction alarm at line 274.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the lower-bound subtraction alarm at line 274; High Precision does not; s32Temp1 is copied from numerator and both runs reach the same statements.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the lower-bound subtraction alarm at line 274; High Precision does not; s32Temp1 is copied from numerator and both runs reach the same statements.

### TECHNICAL INTERPRETATION

The stronger nonlinear subdivision and relational profile plausibly bounds the quotient-product remainder more tightly; an individual option cannot be isolated.

## RA-002 — s16_div_s32_s16

- Function: `s16_div_s32_s16`
- Source: `src_analysis/sources/div_Ccode.c:274`
- Category: integer overflow
- Expression: `s32Temp1 - ((s32Temp1 / denominator) * denominator)`
- Operand types: s32 signed long; denominator s16 promoted/converted to signed long
- Control guard: `denominator != 0; numerator != INT32_MIN`

### Code Context

```c
   264			}
   265			else
   266			{
   267				return 0x7FFF;
   268			}
   269		}
   270		else
   271		{
   272			if(numerator != 0x80000000)
   273			{
   274				s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;
   275				s32Temp1 = s32Temp2/denominator;
   276				s32Temp1 = s32Temp1 +((numerator)/denominator);
   277				if(s32Temp1 < 0x7FFF)
   278				{
   279					if(s32Temp1 > -0x8000)
   280					{
   281						return (s16)s32Temp1;
   282					}
   283					else
   284					{
```

### Baseline Evidence

Baseline reports the upper-bound subtraction alarm at line 274.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the upper-bound subtraction alarm at line 274; High Precision does not; source, harness, parse diagnostics, reachability, and target final state are unchanged.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the upper-bound subtraction alarm at line 274; High Precision does not; source, harness, parse diagnostics, reachability, and target final state are unchanged.

### TECHNICAL INTERPRETATION

The combined nonlinear and relational precision plausibly preserves the mathematical remainder bound across division, multiplication, and subtraction.

## RA-003 — s16_div_s32_s16

- Function: `s16_div_s32_s16`
- Source: `src_analysis/sources/div_Ccode.c:274`
- Category: integer overflow
- Expression: `s32Temp1 / denominator`
- Operand types: s32 signed long division after conversion of s16 denominator
- Control guard: `denominator != 0; numerator != INT32_MIN`

### Code Context

```c
   264			}
   265			else
   266			{
   267				return 0x7FFF;
   268			}
   269		}
   270		else
   271		{
   272			if(numerator != 0x80000000)
   273			{
   274				s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;
   275				s32Temp1 = s32Temp2/denominator;
   276				s32Temp1 = s32Temp1 +((numerator)/denominator);
   277				if(s32Temp1 < 0x7FFF)
   278				{
   279					if(s32Temp1 > -0x8000)
   280					{
   281						return (s16)s32Temp1;
   282					}
   283					else
   284					{
```

### Baseline Evidence

The source excludes denominator zero and enters line 274 only when numerator is not INT32_MIN; Baseline reports the quotient upper-bound alarm and High Precision does not..

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. The source excludes denominator zero and enters line 274 only when numerator is not INT32_MIN; Baseline reports the quotient upper-bound alarm and High Precision does not.

### Candidate Mechanism

`BRANCH_PARTITIONING` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

The source excludes denominator zero and enters line 274 only when numerator is not INT32_MIN; Baseline reports the quotient upper-bound alarm and High Precision does not.

### TECHNICAL INTERPRETATION

Stronger branch history and relational domains likely keep the INT32_MIN exclusion associated with the division state, excluding the exceptional INT32_MIN/-1 quotient.

## RA-004 — s16_div_s32_s16

- Function: `s16_div_s32_s16`
- Source: `src_analysis/sources/div_Ccode.c:297`
- Category: integer overflow
- Expression: `s32Temp1 - ((s32Temp1 / denominator) * denominator)`
- Operand types: s32 signed long; denominator s16 promoted/converted to signed long
- Control guard: `numerator == INT32_MIN; denominator != 0; denominator != -1`

### Code Context

```c
   287				}
   288				else
   289				{
   290					return 0x7FFF;
   291				}
   292			}
   293			else
   294			{
   295				if(denominator != -1)
   296				{
   297					s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;
   298					s32Temp1 = s32Temp2/denominator;
   299					s32Temp1 = s32Temp1 +((numerator)/denominator);
   300					if(s32Temp1 < 0x7FFF)
   301					{
   302						if(s32Temp1 > -0x8000)
   303						{
   304							return (s16)s32Temp1;
   305						}
   306						else
   307						{
```

### Baseline Evidence

Line 297 is reached in the numerator-equals-INT32_MIN branch after denominator -1 is excluded; Baseline has the lower-bound alarm and High Precision does not..

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Line 297 is reached in the numerator-equals-INT32_MIN branch after denominator -1 is excluded; Baseline has the lower-bound alarm and High Precision does not.

### Candidate Mechanism

`BRANCH_PARTITIONING` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Line 297 is reached in the numerator-equals-INT32_MIN branch after denominator -1 is excluded; Baseline has the lower-bound alarm and High Precision does not.

### TECHNICAL INTERPRETATION

Stronger path partitioning likely preserves the conjunction of the exceptional numerator branch and the denominator exclusion through the remainder expression.

## RA-005 — s16_div_s32_s16

- Function: `s16_div_s32_s16`
- Source: `src_analysis/sources/div_Ccode.c:297`
- Category: integer overflow
- Expression: `s32Temp1 - ((s32Temp1 / denominator) * denominator)`
- Operand types: s32 signed long; denominator s16 promoted/converted to signed long
- Control guard: `numerator == INT32_MIN; denominator != 0; denominator != -1`

### Code Context

```c
   287				}
   288				else
   289				{
   290					return 0x7FFF;
   291				}
   292			}
   293			else
   294			{
   295				if(denominator != -1)
   296				{
   297					s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;
   298					s32Temp1 = s32Temp2/denominator;
   299					s32Temp1 = s32Temp1 +((numerator)/denominator);
   300					if(s32Temp1 < 0x7FFF)
   301					{
   302						if(s32Temp1 > -0x8000)
   303						{
   304							return (s16)s32Temp1;
   305						}
   306						else
   307						{
```

### Baseline Evidence

Line 297 is guarded by the explicit denominator -1 exclusion in the INT32_MIN path; Baseline reports the upper-bound alarm and High Precision does not..

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Line 297 is guarded by the explicit denominator -1 exclusion in the INT32_MIN path; Baseline reports the upper-bound alarm and High Precision does not.

### Candidate Mechanism

`BRANCH_PARTITIONING` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Line 297 is guarded by the explicit denominator -1 exclusion in the INT32_MIN path; Baseline reports the upper-bound alarm and High Precision does not.

### TECHNICAL INTERPRETATION

Branch-history retention combined with relational domains plausibly keeps the nested guard precise enough to bound the remainder subtraction.

## RA-006 — s16_fac05_div_s16_s16

- Function: `s16_fac05_div_s16_s16`
- Source: `src_analysis/sources/div_Ccode.c:190`
- Category: integer overflow
- Expression: `(s32Temp1 / denominator) * denominator`
- Operand types: s32 signed long quotient and product after s16 denominator conversion
- Control guard: `denominator != 0; s32Temp1 != INT32_MIN`

### Code Context

```c
   180			}
   181			else
   182			{
   183				return 0x7FFF;
   184			}
   185		}
   186		else
   187		{
   188			if (s32Temp1 != 0x80000000)
   189			{
   190				s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;
   191				s32Temp1 = s32Temp2/denominator;
   192				s32Temp1 = s32Temp1 +((numerator<<16)/denominator);
   193				if(s32Temp1 < 0x7FFF)
   194				{
   195					if(s32Temp1 > -0x8000)
   196					{
   197						return (s16)s32Temp1;
   198					}
   199					else
   200					{
```

### Baseline Evidence

Baseline reports the product lower-bound alarm at line 190.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the product lower-bound alarm at line 190; High Precision does not; the expression computes a quotient-product inside a guarded branch.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the product lower-bound alarm at line 190; High Precision does not; the expression computes a quotient-product inside a guarded branch.

### TECHNICAL INTERPRETATION

Nonlinear subdivision is the most plausible primary aid for the product, with branch and relational precision contributing to operand bounds.

## RA-007 — s16_fac05_div_s16_s16

- Function: `s16_fac05_div_s16_s16`
- Source: `src_analysis/sources/div_Ccode.c:190`
- Category: integer overflow
- Expression: `s32Temp1 - ((s32Temp1 / denominator) * denominator)`
- Operand types: s32 signed long remainder-style expression
- Control guard: `denominator != 0; s32Temp1 != INT32_MIN`

### Code Context

```c
   180			}
   181			else
   182			{
   183				return 0x7FFF;
   184			}
   185		}
   186		else
   187		{
   188			if (s32Temp1 != 0x80000000)
   189			{
   190				s32Temp2 = (s32Temp1 -((s32Temp1/denominator) * denominator))<< 1;
   191				s32Temp1 = s32Temp2/denominator;
   192				s32Temp1 = s32Temp1 +((numerator<<16)/denominator);
   193				if(s32Temp1 < 0x7FFF)
   194				{
   195					if(s32Temp1 > -0x8000)
   196					{
   197						return (s16)s32Temp1;
   198					}
   199					else
   200					{
```

### Baseline Evidence

Baseline reports the subtraction upper-bound alarm at line 190.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the subtraction upper-bound alarm at line 190; High Precision does not; the target final state and reached-statement count are unchanged.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the subtraction upper-bound alarm at line 190; High Precision does not; the target final state and reached-statement count are unchanged.

### TECHNICAL INTERPRETATION

The explicit nonlinear subdivision and larger integer-set precision plausibly improve the quotient-product remainder enclosure.

## RA-008 — s16_mul_s16_s16_div_s16

- Function: `s16_mul_s16_s16_div_s16`
- Source: `src_analysis/sources/div_Ccode.c:964`
- Category: integer overflow
- Expression: `s32Temp1 - ((s32Temp1 / div) * div)`
- Operand types: s32 signed long remainder-style expression; div s16 converted to signed long
- Control guard: `div != 0`

### Code Context

```c
   954			{
   955				return -0x8000;
   956			}
   957			else
   958			{
   959				return 0x7FFF;
   960			}
   961		}
   962		else
   963		{
   964			s32Temp2 = (s32Temp1 - ((s32Temp1 / div) * div)) << 1;
   965			s32Temp3 = (s32Temp2/div) + (s32Temp1/div);
   966			if(s32Temp3 < 0x7FFF)
   967			{
   968				if(s32Temp3 > -0x8000)
   969				{
   970					return (s16)s32Temp3;
   971				}
   972				else
   973				{
   974					return -0x8000;
```

### Baseline Evidence

Baseline reports the lower-bound subtraction alarm at line 964.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the lower-bound subtraction alarm at line 964; High Precision does not; the product input state flows into a guarded quotient-product expression.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the lower-bound subtraction alarm at line 964; High Precision does not; the product input state flows into a guarded quotient-product expression.

### TECHNICAL INTERPRETATION

Nonlinear subdivision most plausibly tightens the dependent product and remainder computation, aided by the preserved nonzero branch.

## RA-009 — s16_mul_s16_s16_div_s16

- Function: `s16_mul_s16_s16_div_s16`
- Source: `src_analysis/sources/div_Ccode.c:964`
- Category: integer overflow
- Expression: `s32Temp1 - ((s32Temp1 / div) * div)`
- Operand types: s32 signed long remainder-style expression; div s16 converted to signed long
- Control guard: `div != 0`

### Code Context

```c
   954			{
   955				return -0x8000;
   956			}
   957			else
   958			{
   959				return 0x7FFF;
   960			}
   961		}
   962		else
   963		{
   964			s32Temp2 = (s32Temp1 - ((s32Temp1 / div) * div)) << 1;
   965			s32Temp3 = (s32Temp2/div) + (s32Temp1/div);
   966			if(s32Temp3 < 0x7FFF)
   967			{
   968				if(s32Temp3 > -0x8000)
   969				{
   970					return (s16)s32Temp3;
   971				}
   972				else
   973				{
   974					return -0x8000;
```

### Baseline Evidence

Baseline reports the upper-bound subtraction alarm at line 964.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the upper-bound subtraction alarm at line 964; High Precision does not; source and parse diagnostics are identical.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the upper-bound subtraction alarm at line 964; High Precision does not; source and parse diagnostics are identical.

### TECHNICAL INTERPRETATION

The high-precision nonlinear/relational profile plausibly derives a tighter remainder interval than the Baseline configuration.

## RA-010 — s16_mul_s16_s16_div_s16

- Function: `s16_mul_s16_s16_div_s16`
- Source: `src_analysis/sources/div_Ccode.c:965`
- Category: division by zero
- Expression: `s32Temp1 / div and s32Temp2 / div`
- Operand types: s32 signed long division after conversion of s16 div
- Control guard: `div != 0`

### Code Context

```c
   955				return -0x8000;
   956			}
   957			else
   958			{
   959				return 0x7FFF;
   960			}
   961		}
   962		else
   963		{
   964			s32Temp2 = (s32Temp1 - ((s32Temp1 / div) * div)) << 1;
   965			s32Temp3 = (s32Temp2/div) + (s32Temp1/div);
   966			if(s32Temp3 < 0x7FFF)
   967			{
   968				if(s32Temp3 > -0x8000)
   969				{
   970					return (s16)s32Temp3;
   971				}
   972				else
   973				{
   974					return -0x8000;
   975				}
```

### Baseline Evidence

The two divisions are in the else branch of div == 0; Baseline reports the nonzero assertion and High Precision does not..

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. The two divisions are in the else branch of div == 0; Baseline reports the nonzero assertion and High Precision does not.

### Candidate Mechanism

`BRANCH_PARTITIONING` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

The two divisions are in the else branch of div == 0; Baseline reports the nonzero assertion and High Precision does not.

### TECHNICAL INTERPRETATION

Stronger partition history and relational state retention likely preserve the direct guard across the preceding remainder assignment.

## RA-011 — s16_mul_s16_s16_div_u16

- Function: `s16_mul_s16_s16_div_u16`
- Source: `src_analysis/sources/div_Ccode.c:1022`
- Category: integer overflow
- Expression: `s32Temp1 - ((s32Temp1 / denominator) * denominator)`
- Operand types: s32 signed long remainder-style expression; u16 denominator converted to signed long
- Control guard: `denominator != 0`

### Code Context

```c
  1012			{
  1013				return 0x0000U;
  1014			}
  1015			else
  1016			{
  1017				return -0x8000;
  1018			}
  1019		}
  1020		else
  1021		{
  1022			s32Temp1 = (s32Result - (s32Result/denominator)*denominator) << 1;
  1023			s32Result = (s32Temp1/denominator) + (s32Result/denominator);
  1024			if(s32Result < 0x7FFF)
  1025			{
  1026				if(s32Result > -0x8000)
  1027				{
  1028					return (s16)s32Result ;
  1029				}
  1030				else
  1031				{
  1032					return -0x8000;
```

### Baseline Evidence

Baseline reports the lower-bound subtraction alarm at line 1022.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the lower-bound subtraction alarm at line 1022; High Precision does not; both analyses reach all 36 normalized statements.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the lower-bound subtraction alarm at line 1022; High Precision does not; both analyses reach all 36 normalized statements.

### TECHNICAL INTERPRETATION

Higher nonlinear subdivision and integer-set precision plausibly improve the quotient-product remainder enclosure.

## RA-012 — s16_mul_s16_s16_div_u16

- Function: `s16_mul_s16_s16_div_u16`
- Source: `src_analysis/sources/div_Ccode.c:1022`
- Category: integer overflow
- Expression: `s32Temp1 - ((s32Temp1 / denominator) * denominator)`
- Operand types: s32 signed long remainder-style expression; u16 denominator converted to signed long
- Control guard: `denominator != 0`

### Code Context

```c
  1012			{
  1013				return 0x0000U;
  1014			}
  1015			else
  1016			{
  1017				return -0x8000;
  1018			}
  1019		}
  1020		else
  1021		{
  1022			s32Temp1 = (s32Result - (s32Result/denominator)*denominator) << 1;
  1023			s32Result = (s32Temp1/denominator) + (s32Result/denominator);
  1024			if(s32Result < 0x7FFF)
  1025			{
  1026				if(s32Result > -0x8000)
  1027				{
  1028					return (s16)s32Result ;
  1029				}
  1030				else
  1031				{
  1032					return -0x8000;
```

### Baseline Evidence

Baseline reports the upper-bound subtraction alarm at line 1022.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the upper-bound subtraction alarm at line 1022; High Precision does not; the parse stage and final state are unchanged.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the upper-bound subtraction alarm at line 1022; High Precision does not; the parse stage and final state are unchanged.

### TECHNICAL INTERPRETATION

The combined nonlinear and relational profile most plausibly proves a tighter upper bound for the remainder.

## RA-013 — s16_mul_s16_u16_div_s16

- Function: `s16_mul_s16_u16_div_s16`
- Source: `src_analysis/sources/div_Ccode.c:628`
- Category: integer overflow
- Expression: `s32Result - ((s32Result / denominator) * denominator)`
- Operand types: s32 signed long remainder-style expression; denominator s16 converted to signed long
- Control guard: `denominator != 0`

### Code Context

```c
   618			{
   619				return -0x8000;
   620			}
   621			else
   622			{
   623				return 0x7FFF;
   624			}
   625		}
   626		else
   627		{
   628			s32Temp1 = s32Result -((s32Result/denominator)*denominator);
   629			s32Temp1 = s32Temp1 << 1;
   630			s32Result = (s32Temp1/denominator) + (s32Result/denominator);
   631			if(s32Result < 0x7FFF)
   632			{
   633				if(s32Result > -0x8000)
   634				{
   635					return (s16)s32Result;
   636
   637				}
   638				else
```

### Baseline Evidence

Baseline reports the lower-bound subtraction alarm at line 628.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the lower-bound subtraction alarm at line 628; High Precision does not; the guarded expression follows a promoted s16-by-u16 product.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the lower-bound subtraction alarm at line 628; High Precision does not; the guarded expression follows a promoted s16-by-u16 product.

### TECHNICAL INTERPRETATION

Nonlinear subdivision most plausibly tracks dependencies through the input product and quotient-product remainder.

## RA-014 — s16_mul_s16_u16_div_s16

- Function: `s16_mul_s16_u16_div_s16`
- Source: `src_analysis/sources/div_Ccode.c:628`
- Category: integer overflow
- Expression: `s32Result - ((s32Result / denominator) * denominator)`
- Operand types: s32 signed long remainder-style expression; denominator s16 converted to signed long
- Control guard: `denominator != 0`

### Code Context

```c
   618			{
   619				return -0x8000;
   620			}
   621			else
   622			{
   623				return 0x7FFF;
   624			}
   625		}
   626		else
   627		{
   628			s32Temp1 = s32Result -((s32Result/denominator)*denominator);
   629			s32Temp1 = s32Temp1 << 1;
   630			s32Result = (s32Temp1/denominator) + (s32Result/denominator);
   631			if(s32Result < 0x7FFF)
   632			{
   633				if(s32Result > -0x8000)
   634				{
   635					return (s16)s32Result;
   636
   637				}
   638				else
```

### Baseline Evidence

Baseline reports the upper-bound subtraction alarm at line 628.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the upper-bound subtraction alarm at line 628; High Precision does not; statement coverage remains 33/33.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the upper-bound subtraction alarm at line 628; High Precision does not; statement coverage remains 33/33.

### TECHNICAL INTERPRETATION

The explicit nonlinear subdivision and stronger relational domains plausibly reduce dependency loss in the remainder expression.

## RA-015 — s16_mul_s16_u16_div_s16

- Function: `s16_mul_s16_u16_div_s16`
- Source: `src_analysis/sources/div_Ccode.c:630`
- Category: division by zero
- Expression: `s32Result / denominator and s32Temp / denominator`
- Operand types: s32 signed long division after conversion of s16 denominator
- Control guard: `denominator != 0`

### Code Context

```c
   620			}
   621			else
   622			{
   623				return 0x7FFF;
   624			}
   625		}
   626		else
   627		{
   628			s32Temp1 = s32Result -((s32Result/denominator)*denominator);
   629			s32Temp1 = s32Temp1 << 1;
   630			s32Result = (s32Temp1/denominator) + (s32Result/denominator);
   631			if(s32Result < 0x7FFF)
   632			{
   633				if(s32Result > -0x8000)
   634				{
   635					return (s16)s32Result;
   636
   637				}
   638				else
   639				{
   640					return -0x8000;
```

### Baseline Evidence

The divisions at line 630 execute only in the else branch of denominator == 0; Baseline reports the assertion and High Precision does not..

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. The divisions at line 630 execute only in the else branch of denominator == 0; Baseline reports the assertion and High Precision does not.

### Candidate Mechanism

`BRANCH_PARTITIONING` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

The divisions at line 630 execute only in the else branch of denominator == 0; Baseline reports the assertion and High Precision does not.

### TECHNICAL INTERPRETATION

Stronger path partitioning likely retains the direct nonzero guard across the intermediate remainder and shift operations.

## RA-016 — s16_mul_u16_s16_div_u16

- Function: `s16_mul_u16_s16_div_u16`
- Source: `src_analysis/sources/div_Ccode.c:684`
- Category: integer overflow
- Expression: `s32Result - ((s32Result / denominator) * denominator)`
- Operand types: s32 signed long remainder-style expression; u16 denominator converted to signed long
- Control guard: `denominator != 0`

### Code Context

```c
   674			{
   675				return -0x8000;
   676			}
   677			else
   678			{
   679				return 0x7FFF;
   680			}
   681		}
   682		else
   683		{
   684			s32Temp1 = s32Result - ((s32Result/denominator) * denominator) << 1;
   685			s32Result = (s32Temp1/denominator) + (s32Result/denominator);
   686			if(s32Result < 0x7FFF)
   687			{
   688				if(s32Result > -0x8000)
   689				{
   690					return (s16)s32Result;
   691				}
   692				else
   693				{
   694					return -0x8000;
```

### Baseline Evidence

Baseline reports the upper-bound subtraction alarm at line 684.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the upper-bound subtraction alarm at line 684; High Precision does not; all 32 normalized statements remain reachable.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the upper-bound subtraction alarm at line 684; High Precision does not; all 32 normalized statements remain reachable.

### TECHNICAL INTERPRETATION

Nonlinear subdivision and the larger integer-set threshold plausibly tighten the remainder range after the mixed unsigned/signed product.

## RA-017 — s32_mul_s32_u16

- Function: `s32_mul_s32_u16`
- Source: `src_analysis/sources/mul_Ccode.c:760`
- Category: division by zero
- Expression: `s32Temp2 / s32Factor`
- Operand types: s32 signed long division
- Control guard: `factor != 0; s32Factor = factor`

### Code Context

```c
   750	 * @ingroup ecmath_mul
   751	 */
   752	s32 s32_mul_s32_u16(s32 value, u16 factor)
   753	{
   754		s32 s32Temp1 = 0, s32Temp2 = -2147483648, s32Factor=0;
   755		s32Factor = factor;
   756		if(factor != 0)
   757		{
   758			if(value < 0)
   759			{
   760				s32Temp1 = s32Temp2 / s32Factor;
   761				if(s32Temp1 >= value)
   762				{
   763					return 0x80000000;
   764				}
   765				else
   766				{
   767					return (value*factor);
   768				}
   769			}
   770			else
```

### Baseline Evidence

Source assigns s32Factor from factor before testing factor != 0; Baseline reports the divisor assertion at line 760 and High Precision does not; source, parse diagnostics, coverage, and final state are unchanged..

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Source assigns s32Factor from factor before testing factor != 0; Baseline reports the divisor assertion at line 760 and High Precision does not; source, parse diagnostics, coverage, and final state are unchanged.

### Candidate Mechanism

`EQUALITY_RELATION` — confidence `HIGH`.

### DIRECT REPOSITORY EVIDENCE

Source assigns s32Factor from factor before testing factor != 0; Baseline reports the divisor assertion at line 760 and High Precision does not; source, parse diagnostics, coverage, and final state are unchanged.

### TECHNICAL INTERPRETATION

The equality domain most plausibly preserves s32Factor == factor through the branch, allowing the guard on factor to establish that the copied divisor is nonzero.

## RA-018 — u16_div_s32_u16

- Function: `u16_div_s32_u16`
- Source: `src_analysis/sources/div_Ccode.c:495`
- Category: integer overflow
- Expression: `x_value - ((x_value / y_value) * y_value)`
- Operand types: s32 signed long remainder-style expression; masked u32-compatible divisor value
- Control guard: `(y_value & 0xFFFF) != 0`

### Code Context

```c
   485			{
   486				return 0xFFFF;
   487			}
   488			else
   489			{
   490				return 0;
   491			}
   492		}
   493		else
   494		{
   495			s32Temp1 = (x_value - ((x_value/y_value) * y_value)) << 1;
   496			s32Temp1 = (s32Temp1/y_value) + (x_value/y_value);
   497			if(s32Temp1 < 0xFFFF)
   498			{
   499				if(s32Temp1 > 0)
   500				{
   501					return (u16)s32Temp1;
   502				}
   503				else
   504				{
   505					return 0;
```

### Baseline Evidence

Baseline reports the lower-bound subtraction alarm at line 495.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the lower-bound subtraction alarm at line 495; High Precision does not; y_value is masked to 16 bits before the nonzero branch.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the lower-bound subtraction alarm at line 495; High Precision does not; y_value is masked to 16 bits before the nonzero branch.

### TECHNICAL INTERPRETATION

Nonlinear subdivision, integer-set precision, and bitwise-domain information plausibly tighten the masked divisor and remainder relation.

## RA-019 — u16_div_s32_u16

- Function: `u16_div_s32_u16`
- Source: `src_analysis/sources/div_Ccode.c:495`
- Category: integer overflow
- Expression: `x_value - ((x_value / y_value) * y_value)`
- Operand types: s32 signed long remainder-style expression; masked divisor value
- Control guard: `(y_value & 0xFFFF) != 0`

### Code Context

```c
   485			{
   486				return 0xFFFF;
   487			}
   488			else
   489			{
   490				return 0;
   491			}
   492		}
   493		else
   494		{
   495			s32Temp1 = (x_value - ((x_value/y_value) * y_value)) << 1;
   496			s32Temp1 = (s32Temp1/y_value) + (x_value/y_value);
   497			if(s32Temp1 < 0xFFFF)
   498			{
   499				if(s32Temp1 > 0)
   500				{
   501					return (u16)s32Temp1;
   502				}
   503				else
   504				{
   505					return 0;
```

### Baseline Evidence

Baseline reports the upper-bound subtraction alarm at line 495.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the upper-bound subtraction alarm at line 495; High Precision does not; source and target final state are unchanged.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the upper-bound subtraction alarm at line 495; High Precision does not; source and target final state are unchanged.

### TECHNICAL INTERPRETATION

The combined nonlinear and bitwise-aware profile plausibly preserves a tighter bound for the quotient-product remainder.

## RA-020 — u16_mul_s16_u16_div_s16

- Function: `u16_mul_s16_u16_div_s16`
- Source: `src_analysis/sources/div_Ccode.c:740`
- Category: integer overflow
- Expression: `s32Result - ((s32Result / denominator) * denominator)`
- Operand types: s32 signed long remainder-style expression; s16 denominator converted to signed long
- Control guard: `denominator != 0`

### Code Context

```c
   730			{
   731				return 0xFFFFU;
   732			}
   733			else
   734			{
   735				return 0;
   736			}
   737		}
   738		else
   739		{
   740			s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;
   741			s32Result = (s32Temp1/denominator) + (s32Result/denominator);
   742			if(s32Result < 0x0000FFFF)
   743			{
   744				if(s32Result > 0)
   745				{
   746					return (u16)s32Result;
   747				}
   748				else
   749				{
   750					return 0;
```

### Baseline Evidence

Baseline reports the upper-bound subtraction alarm at line 740.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the upper-bound subtraction alarm at line 740; High Precision does not; all 34 normalized statements remain reachable.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the upper-bound subtraction alarm at line 740; High Precision does not; all 34 normalized statements remain reachable.

### TECHNICAL INTERPRETATION

Nonlinear subdivision most plausibly improves the dependent remainder bound following the mixed signed/unsigned product.

## RA-021 — u16_mul_s16_u16_div_s16

- Function: `u16_mul_s16_u16_div_s16`
- Source: `src_analysis/sources/div_Ccode.c:741`
- Category: division by zero
- Expression: `s32Result / denominator and s32Temp / denominator`
- Operand types: s32 signed long division after conversion of s16 denominator
- Control guard: `denominator != 0`

### Code Context

```c
   731				return 0xFFFFU;
   732			}
   733			else
   734			{
   735				return 0;
   736			}
   737		}
   738		else
   739		{
   740			s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;
   741			s32Result = (s32Temp1/denominator) + (s32Result/denominator);
   742			if(s32Result < 0x0000FFFF)
   743			{
   744				if(s32Result > 0)
   745				{
   746					return (u16)s32Result;
   747				}
   748				else
   749				{
   750					return 0;
   751				}
```

### Baseline Evidence

The divisions at line 741 are in the nonzero branch of denominator; Baseline reports the assertion and High Precision does not..

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. The divisions at line 741 are in the nonzero branch of denominator; Baseline reports the assertion and High Precision does not.

### Candidate Mechanism

`BRANCH_PARTITIONING` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

The divisions at line 741 are in the nonzero branch of denominator; Baseline reports the assertion and High Precision does not.

### TECHNICAL INTERPRETATION

Stronger branch-history retention plausibly carries the direct guard through the intermediate remainder assignment.

## RA-022 — u16_mul_s16_u16_div_u16

- Function: `u16_mul_s16_u16_div_u16`
- Source: `src_analysis/sources/div_Ccode.c:795`
- Category: integer overflow
- Expression: `s32Result - ((s32Result / denominator) * denominator)`
- Operand types: s32 signed long remainder-style expression; u16 denominator converted to signed long
- Control guard: `denominator != 0`

### Code Context

```c
   785			{
   786				return 0xFFFFU;
   787			}
   788			else
   789			{
   790				return 0;
   791			}
   792		}
   793		else
   794		{
   795			s32Temp1 = (s32Result - ((s32Result/denominator) * denominator)) << 1;
   796			s32Result = (s32Temp1/denominator) + (s32Result/denominator);
   797			if(s32Result < 0x0000FFFF)
   798			{
   799				if(s32Result > 0)
   800				{
   801					return (u16)s32Result;
   802				}
   803				else
   804				{
   805					return 0;
```

### Baseline Evidence

Baseline reports the upper-bound subtraction alarm at line 795.

### High Precision Evidence

The canonical Baseline occurrence is absent in High Precision. Baseline reports the upper-bound subtraction alarm at line 795; High Precision does not; all 32 normalized statements remain reachable.

### Candidate Mechanism

`NONLINEAR_SUBDIVISION` — confidence `MEDIUM`.

### DIRECT REPOSITORY EVIDENCE

Baseline reports the upper-bound subtraction alarm at line 795; High Precision does not; all 32 normalized statements remain reachable.

### TECHNICAL INTERPRETATION

Nonlinear subdivision and stronger integer-set precision plausibly tighten the quotient-product remainder enclosure.

## Mechanism totals

| Mechanism | Count |
| --- | --- |
| BRANCH_PARTITIONING | 6 |
| EQUALITY_RELATION | 1 |
| NONLINEAR_SUBDIVISION | 15 |
