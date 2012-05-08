;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.3.1 *
;* Date/Time created: Fri Mar 09 00:58:26 2012                                *
;******************************************************************************
	.compiler_opts --abi=eabi --c64p_l1d_workaround=off --endian=little --hll_source=on --long_precision_bits=32 --mem_model:code=near --mem_model:const=data --mem_model:data=far_aggregates --object_format=elf --silicon_version=6600 --symdebug:none 

;******************************************************************************
;* GLOBAL FILE PARAMETERS                                                     *
;*                                                                            *
;*   Architecture      : TMS320C66xx                                          *
;*   Optimization      : Enabled at level 3                                   *
;*   Optimizing for    : Speed                                                *
;*                       Based on options: -o3, no -ms                        *
;*   Endian            : Little                                               *
;*   Interrupt Thrshld : Disabled                                             *
;*   Data Access Model : Far Aggregate Data                                   *
;*   Pipelining        : Enabled                                              *
;*   Speculate Loads   : Enabled with threshold = 0                           *
;*   Memory Aliases    : Presume are aliases (pessimistic)                    *
;*   Debug Info        : No Debug Info                                        *
;*                                                                            *
;******************************************************************************

	.asg	A15, FP
	.asg	B14, DP
	.asg	B15, SP
	.global	$bss

	.global	inputComplex
inputComplex:	.usect	".L2",262144,32768
	.global	outputEnergy1
outputEnergy1:	.usect	".DDR",16,16
	.global	outputEnergy2
outputEnergy2:	.usect	".DDR",16,16
;	C:\ti\ccs\ccsv5\tools\compiler\c6000\bin\opt6x.exe C:\\Users\\a0270985\\AppData\\Local\\Temp\\051962 C:\\Users\\a0270985\\AppData\\Local\\Temp\\051964 
	.sect	".text"
	.clink
	.global	main

;******************************************************************************
;* FUNCTION NAME: main                                                        *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,B0,*
;*                           B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,SP,   *
;*                           A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,A26,A27, *
;*                           A28,A29,A30,A31,B16,B17,B18,B19,B20,B21,B22,B23, *
;*                           B24,B25,B26,B27,B28,B29,B30,B31                  *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,B0,*
;*                           B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,DP,SP,*
;*                           A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,A26,A27, *
;*                           A28,A29,A30,A31,B16,B17,B18,B19,B20,B21,B22,B23, *
;*                           B24,B25,B26,B27,B28,B29,B30,B31                  *
;*   Local Frame Size  : 16 Args + 0 Auto + 48 Save = 64 byte                 *
;******************************************************************************
main:
;** --------------------------------------------------------------------------*
           STW     .D2T1   A14,*SP--(8)      ; |41| 
           STDW    .D2T2   B13:B12,*SP--     ; |41| 
           STDW    .D2T2   B11:B10,*SP--     ; |41| 
           STDW    .D2T1   A13:A12,*SP--     ; |41| 
           STDW    .D2T1   A11:A10,*SP--     ; |41| 

           MV      .L2     B3,B13            ; |41| 
||         CALLP   .S2     clock,B3
||         SUB     .D2     SP,16,SP          ; |41| 

$C$RL0:    ; CALL OCCURS {clock} {0}         ; |45| 
;** --------------------------------------------------------------------------*

           CALLP   .S2     clock,B3
||         MV      .L1     A4,A14            ; |45| 

$C$RL1:    ; CALL OCCURS {clock} {0}         ; |46| 

           MV      .L1     A4,A11            ; |46| 
||         MVKL    .S1     0x1840040,A4

           MVKH    .S1     0x1840040,A4
           LDW     .D1T1   *A4,A3            ; |247| 
           MVKL    .S1     inputComplex,A13
           ZERO    .L2     B4
           MVKH    .S1     inputComplex,A13
           SET     .S2     B4,0x10,0x10,B4
           AND     .L1     -4,A3,A3          ; |247| 
           OR      .L1     4,A3,A3           ; |247| 

           CALLP   .S2     generateData,B3
||         STW     .D1T1   A3,*A4            ; |247| 
||         MV      .L1     A13,A4            ; |56| 

$C$RL2:    ; CALL OCCURS {generateData} {0}  ; |56| 
           CALLP   .S2     clock,B3
$C$RL3:    ; CALL OCCURS {clock} {0}         ; |62| 

           MVKL    .S1     outputEnergy1,A12
||         ZERO    .L2     B4

           MVKH    .S1     outputEnergy1,A12
||         SET     .S2     B4,0xf,0xf,B4

           CALLP   .S2     naturalC_filters,B3
||         MV      .L1     A12,A6            ; |63| 
||         MV      .S1     A4,A10            ; |62| 
||         MV      .D1     A13,A4            ; |63| 

$C$RL4:    ; CALL OCCURS {naturalC_filters} {0}  ; |63| 
           CALLP   .S2     clock,B3
$C$RL5:    ; CALL OCCURS {clock} {0}         ; |64| 
           MVKL    .S2     $C$SL1+0,B4

           ZERO    .L2     B12
||         MVKH    .S2     $C$SL1+0,B4

           SUB     .L1     A4,A10,A3         ; |66| 
||         SUB     .S1     A11,A14,A10       ; |47| 
||         SET     .S2     B12,0xf,0xf,B12
||         STW     .D2T2   B4,*+SP(4)        ; |66| 

           SUB     .L1     A3,A10,A3         ; |66| 
||         STW     .D2T2   B12,*+SP(8)       ; |66| 

           CALLP   .S2     printf,B3
||         STW     .D2T1   A3,*+SP(12)       ; |66| 

$C$RL6:    ; CALL OCCURS {printf} {0}        ; |66| 
           CALLP   .S2     clock,B3
$C$RL7:    ; CALL OCCURS {clock} {0}         ; |73| 
           MVKL    .S2     outputEnergy2,B10
           MVKH    .S2     outputEnergy2,B10
           MV      .L2X    A4,B11            ; |73| 

           MV      .L1     A13,A4            ; |74| 
||         MV      .L2     B12,B4            ; |74| 
||         CALLP   .S2     intrinsicC_filters,B3
||         MV      .S1X    B10,A6            ; |74| 

$C$RL8:    ; CALL OCCURS {intrinsicC_filters} {0}  ; |74| 
           CALLP   .S2     clock,B3
$C$RL9:    ; CALL OCCURS {clock} {0}         ; |75| 

           MV      .L2     B12,B4            ; |77| 
||         MVKL    .S2     $C$SL2+0,B5

           STW     .D2T2   B4,*+SP(8)        ; |77| 
||         SUB     .L2X    A4,B11,B4         ; |77| 
||         MVKH    .S2     $C$SL2+0,B5

           SUB     .L2X    B4,A10,B4         ; |77| 
||         STW     .D2T2   B5,*+SP(4)        ; |77| 

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(12)       ; |77| 

$C$RL10:   ; CALL OCCURS {printf} {0}        ; |77| 
;** --------------------------------------------------------------------------*

           MV      .L2     B10,B4            ; |74| 
||         MV      .L1     A12,A4            ; |63| 

;** --------------------------------------------------------------------------*

           CALLP   .S2     compareValues,B3
||         MVK     .L1     0x4,A6            ; |83| 

$C$RL11:   ; CALL OCCURS {compareValues} {0}  ; |83| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |84| 

$C$RL12:   ; CALL OCCURS {printf} {0}        ; |84| 
;** --------------------------------------------------------------------------*
           ADDK    .S2     16,SP             ; |88| 
           LDDW    .D2T1   *++SP,A11:A10     ; |88| 
           LDDW    .D2T1   *++SP,A13:A12     ; |88| 

           LDDW    .D2T2   *++SP,B11:B10     ; |88| 
||         MV      .L2     B13,B3            ; |88| 

           LDDW    .D2T2   *++SP,B13:B12     ; |88| 
||         RET     .S2     B3                ; |88| 

           LDW     .D2T1   *++SP(8),A14      ; |88| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |88| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
$C$SL1:	.string	"natural C code size   %d  time %d ",10,0
$C$SL2:	.string	"intrinsic C code size   %d  time %d ",10,0
$C$SL3:	.string	"   ",10,10,"    DONE    ",10,10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	clock
	.global	generateData
	.global	naturalC_filters
	.global	intrinsicC_filters
	.global	compareValues

;******************************************************************************
;* BUILD ATTRIBUTES                                                           *
;******************************************************************************
	.battr "TI", Tag_File, 1, Tag_Long_Precision_Bits(2)
	.battr "TI", Tag_File, 1, Tag_Bitfield_layout(2)
	.battr "TI", Tag_File, 1, Tag_ABI_enum_size(2)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_wchar_t(1)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_array_object_alignment(2)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_array_object_align_expected(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_PIC(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_PID(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_DSBT(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_stack_align_needed(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_stack_align_preserved(1)
	.battr "TI", Tag_File, 1, Tag_Tramps_Use_SOC(1)
