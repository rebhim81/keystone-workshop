;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.3.1 *
;* Date/Time created: Wed Mar 07 08:57:27 2012                                *
;******************************************************************************
	.compiler_opts --abi=eabi --c64p_l1d_workaround=off --endian=little --hll_source=on --long_precision_bits=32 --mem_model:code=near --mem_model:const=data --mem_model:data=far_aggregates --object_format=elf --silicon_version=6600 --symdebug:dwarf --symdebug:dwarf_version=3 

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
;*   Debug Info        : DWARF Debug                                          *
;*                                                                            *
;******************************************************************************

	.asg	A15, FP
	.asg	B14, DP
	.asg	B15, SP
	.global	$bss


$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("../main.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI TMS320C6x C/C++ Codegen PC v7.3.1 Copyright (c) 1996-2011 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("C:\Users\a0270985\Documents\training\customer\Israel_2012\handsOnTraining\OptimizationMemoryLab2\Debug")

$C$DW$1	.dwtag  DW_TAG_subprogram, DW_AT_name("_ftod")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("_ftod")
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$17)
	.dwattr $C$DW$1, DW_AT_declaration
	.dwattr $C$DW$1, DW_AT_external
	.dwattr $C$DW$1, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/c6x.h")
	.dwattr $C$DW$1, DW_AT_decl_line(0xc5)
	.dwattr $C$DW$1, DW_AT_decl_column(0x0b)
$C$DW$2	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$16)
$C$DW$3	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$16)
	.dwendtag $C$DW$1


$C$DW$4	.dwtag  DW_TAG_subprogram, DW_AT_name("_amemd8")
	.dwattr $C$DW$4, DW_AT_TI_symbol_name("_amemd8")
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$162)
	.dwattr $C$DW$4, DW_AT_declaration
	.dwattr $C$DW$4, DW_AT_external
$C$DW$5	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$3)
	.dwendtag $C$DW$4


$C$DW$6	.dwtag  DW_TAG_subprogram, DW_AT_name("_daddsp")
	.dwattr $C$DW$6, DW_AT_TI_symbol_name("_daddsp")
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$6, DW_AT_declaration
	.dwattr $C$DW$6, DW_AT_external
	.dwattr $C$DW$6, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/c6x.h")
	.dwattr $C$DW$6, DW_AT_decl_line(0x16d)
	.dwattr $C$DW$6, DW_AT_decl_column(0x0c)
$C$DW$7	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$82)
$C$DW$8	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$82)
	.dwendtag $C$DW$6


$C$DW$9	.dwtag  DW_TAG_subprogram, DW_AT_name("_complex_mpysp")
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("_complex_mpysp")
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$17)
	.dwattr $C$DW$9, DW_AT_declaration
	.dwattr $C$DW$9, DW_AT_external
	.dwattr $C$DW$9, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/c6x.h")
	.dwattr $C$DW$9, DW_AT_decl_line(0x17d)
	.dwattr $C$DW$9, DW_AT_decl_column(0x0c)
$C$DW$10	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$17)
$C$DW$11	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$17)
	.dwendtag $C$DW$9


$C$DW$12	.dwtag  DW_TAG_subprogram, DW_AT_name("printf")
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("printf")
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$12, DW_AT_declaration
	.dwattr $C$DW$12, DW_AT_external
	.dwattr $C$DW$12, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdio.h")
	.dwattr $C$DW$12, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$12, DW_AT_decl_column(0x19)
$C$DW$13	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$117)
$C$DW$14	.dwtag  DW_TAG_unspecified_parameters
	.dwendtag $C$DW$12


$C$DW$15	.dwtag  DW_TAG_subprogram, DW_AT_name("clock")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("clock")
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$143)
	.dwattr $C$DW$15, DW_AT_declaration
	.dwattr $C$DW$15, DW_AT_external
	.dwattr $C$DW$15, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$15, DW_AT_decl_line(0x5c)
	.dwattr $C$DW$15, DW_AT_decl_column(0x19)

$C$DW$16	.dwtag  DW_TAG_subprogram, DW_AT_name("generateCoef")
	.dwattr $C$DW$16, DW_AT_TI_symbol_name("generateCoef")
	.dwattr $C$DW$16, DW_AT_declaration
	.dwattr $C$DW$16, DW_AT_external
	.dwattr $C$DW$16, DW_AT_decl_file("..\test.h")
	.dwattr $C$DW$16, DW_AT_decl_line(0x1e)
	.dwattr $C$DW$16, DW_AT_decl_column(0x0e)
$C$DW$17	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$83)
$C$DW$18	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$10)
	.dwendtag $C$DW$16


$C$DW$19	.dwtag  DW_TAG_subprogram, DW_AT_name("generateData")
	.dwattr $C$DW$19, DW_AT_TI_symbol_name("generateData")
	.dwattr $C$DW$19, DW_AT_declaration
	.dwattr $C$DW$19, DW_AT_external
	.dwattr $C$DW$19, DW_AT_decl_file("..\test.h")
	.dwattr $C$DW$19, DW_AT_decl_line(0x20)
	.dwattr $C$DW$19, DW_AT_decl_column(0x0e)
$C$DW$20	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$20, DW_AT_type(*$C$DW$T$83)
$C$DW$21	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$21, DW_AT_type(*$C$DW$T$10)
	.dwendtag $C$DW$19

	.global	inputBuffer
inputBuffer:	.usect	".L2_RAM",32768,16
$C$DW$22	.dwtag  DW_TAG_variable, DW_AT_name("inputBuffer")
	.dwattr $C$DW$22, DW_AT_TI_symbol_name("inputBuffer")
	.dwattr $C$DW$22, DW_AT_location[DW_OP_addr inputBuffer]
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$171)
	.dwattr $C$DW$22, DW_AT_external
	.dwattr $C$DW$22, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$22, DW_AT_decl_line(0x0c)
	.dwattr $C$DW$22, DW_AT_decl_column(0x0d)
	.global	outBuffer
outBuffer:	.usect	".DDR",32768,16
$C$DW$23	.dwtag  DW_TAG_variable, DW_AT_name("outBuffer")
	.dwattr $C$DW$23, DW_AT_TI_symbol_name("outBuffer")
	.dwattr $C$DW$23, DW_AT_location[DW_OP_addr outBuffer]
	.dwattr $C$DW$23, DW_AT_type(*$C$DW$T$171)
	.dwattr $C$DW$23, DW_AT_external
	.dwattr $C$DW$23, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$23, DW_AT_decl_line(0x0f)
	.dwattr $C$DW$23, DW_AT_decl_column(0x0d)
	.global	filterBuffer
filterBuffer:	.usect	".DDR",128,16
$C$DW$24	.dwtag  DW_TAG_variable, DW_AT_name("filterBuffer")
	.dwattr $C$DW$24, DW_AT_TI_symbol_name("filterBuffer")
	.dwattr $C$DW$24, DW_AT_location[DW_OP_addr filterBuffer]
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$172)
	.dwattr $C$DW$24, DW_AT_external
	.dwattr $C$DW$24, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$24, DW_AT_decl_line(0x13)
	.dwattr $C$DW$24, DW_AT_decl_column(0x0d)
;	C:\ti\ccs\ccsv5\tools\compiler\c6000\bin\opt6x.exe C:\\Users\\a0270985\\AppData\\Local\\Temp\\050802 C:\\Users\\a0270985\\AppData\\Local\\Temp\\050804 
	.sect	".text"
	.clink
	.global	DecimationFIR

$C$DW$25	.dwtag  DW_TAG_subprogram, DW_AT_name("DecimationFIR")
	.dwattr $C$DW$25, DW_AT_low_pc(DecimationFIR)
	.dwattr $C$DW$25, DW_AT_high_pc(0x00)
	.dwattr $C$DW$25, DW_AT_TI_symbol_name("DecimationFIR")
	.dwattr $C$DW$25, DW_AT_external
	.dwattr $C$DW$25, DW_AT_TI_begin_file("../main.c")
	.dwattr $C$DW$25, DW_AT_TI_begin_line(0x16)
	.dwattr $C$DW$25, DW_AT_TI_begin_column(0x07)
	.dwattr $C$DW$25, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$25, DW_AT_decl_line(0x16)
	.dwattr $C$DW$25, DW_AT_decl_column(0x07)
	.dwattr $C$DW$25, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../main.c",line 23,column 4,is_stmt,address DecimationFIR,isa 0

	.dwfde $C$DW$CIE, DecimationFIR
$C$DW$26	.dwtag  DW_TAG_formal_parameter, DW_AT_name("p_in")
	.dwattr $C$DW$26, DW_AT_TI_symbol_name("p_in")
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$26, DW_AT_location[DW_OP_reg4]
$C$DW$27	.dwtag  DW_TAG_formal_parameter, DW_AT_name("p_coef")
	.dwattr $C$DW$27, DW_AT_TI_symbol_name("p_coef")
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$27, DW_AT_location[DW_OP_reg20]
$C$DW$28	.dwtag  DW_TAG_formal_parameter, DW_AT_name("p_out")
	.dwattr $C$DW$28, DW_AT_TI_symbol_name("p_out")
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$28, DW_AT_location[DW_OP_reg6]
$C$DW$29	.dwtag  DW_TAG_formal_parameter, DW_AT_name("nn")
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("nn")
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$29, DW_AT_location[DW_OP_reg22]
$C$DW$30	.dwtag  DW_TAG_formal_parameter, DW_AT_name("f_n")
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("f_n")
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$30, DW_AT_location[DW_OP_reg8]

;******************************************************************************
;* FUNCTION NAME: DecimationFIR                                               *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A7,A8,A9,B0,B4,B5,B6,B7,B8,B9,B10, *
;*                           B11,SP,A16,A17,B16,B17,B18,B19,B20,B21,B22,B23,  *
;*                           B24,B25,B26,B27                                  *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B3,B4,B5,B6,B7,B8,  *
;*                           B9,B10,B11,SP,A16,A17,B16,B17,B18,B19,B20,B21,   *
;*                           B22,B23,B24,B25,B26,B27                          *
;*   Local Frame Size  : 0 Args + 0 Auto + 8 Save = 8 byte                    *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o3) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
DecimationFIR:
;** --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
           STW     .D2T2   B11,*SP--(16)     ; |23| 
	.dwcfi	cfa_offset, 16
	.dwcfi	save_reg_to_mem, 27, 0
           STW     .D2T2   B10,*+SP(12)      ; |23| 
	.dwcfi	save_reg_to_mem, 26, -4
$C$DW$31	.dwtag  DW_TAG_variable, DW_AT_name("p3")
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("p3")
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$31, DW_AT_location[DW_OP_reg21]
$C$DW$32	.dwtag  DW_TAG_variable, DW_AT_name("p2")
	.dwattr $C$DW$32, DW_AT_TI_symbol_name("p2")
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$83)
	.dwattr $C$DW$32, DW_AT_location[DW_OP_reg20]
$C$DW$33	.dwtag  DW_TAG_variable, DW_AT_name("p_in")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("p_in")
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$169)
	.dwattr $C$DW$33, DW_AT_location[DW_OP_reg4]
$C$DW$34	.dwtag  DW_TAG_variable, DW_AT_name("p_coef")
	.dwattr $C$DW$34, DW_AT_TI_symbol_name("p_coef")
	.dwattr $C$DW$34, DW_AT_type(*$C$DW$T$169)
	.dwattr $C$DW$34, DW_AT_location[DW_OP_reg7]
$C$DW$35	.dwtag  DW_TAG_variable, DW_AT_name("p_out")
	.dwattr $C$DW$35, DW_AT_TI_symbol_name("p_out")
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$169)
	.dwattr $C$DW$35, DW_AT_location[DW_OP_reg6]
$C$DW$36	.dwtag  DW_TAG_variable, DW_AT_name("nn")
	.dwattr $C$DW$36, DW_AT_TI_symbol_name("nn")
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$120)
	.dwattr $C$DW$36, DW_AT_location[DW_OP_reg22]
           MV      .L1X    B4,A7             ; |23| 
	.dwpsn	file "../main.c",line 30,column 5,is_stmt,isa 0
           MV      .L2X    A4,B4             ; |30| 
	.dwpsn	file "../main.c",line 31,column 5,is_stmt,isa 0
           MV      .L2X    A6,B5             ; |31| 
	.dwpsn	file "../main.c",line 33,column 15,is_stmt,isa 0
           CMPGT   .L2     B6,0,B0           ; |33| 
   [!B0]   BNOP    .S1     $C$L3,5           ; |33| 
           ; BRANCHCC OCCURS {$C$L3}         ; |33| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 36,column 11,is_stmt,isa 0

           MVK     .S2     264,B8            ; |36| 
||         SUB     .L2X    A7,B5,B7          ; |36| 
||         MVK     .S1     128,A4            ; |36| 
||         SUB     .L1X    B5,A7,A3          ; |36| 
||         ZERO    .D2     B24

           CMPLT   .L2     B7,B8,B7          ; |36| 
||         CMPLT   .L1     A3,A4,A4          ; |36| 
||         ZERO    .S1     A3                ; |36| 
||         MV      .D1X    B6,A1
||         ZERO    .S2     B25

           CMPLTU  .L2     B5,B4,B0          ; |36| 
||         MV      .L1X    B6,A0
||         ZERO    .S2     B6

           AND     .L1X    B7,A4,A4          ; |36| 
|| [!B0]   MVK     .S1     0x1,A3            ; |36| 
||         ZERO    .L2     B7

           OR      .L1     A4,A3,A2          ; |36| 
   [!A2]   BNOP    .S1     $C$L2,5           ; |36| 
           ; BRANCHCC OCCURS {$C$L2}         ; |36| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 33
;*      Loop opening brace source line   : 34
;*      Loop closing brace source line   : 50
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 61
;*      Unpartitioned Resource Bound     : 17
;*      Partitioned Resource Bound(*)    : 17
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     1        0     
;*      .D units                    17*      16     
;*      .M units                     8        8     
;*      .X cross paths              15       14     
;*      .T address paths            17*      16     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)          17       22     (.L or .S unit)
;*      Addition ops (.LSD)          0        1     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             9       11     
;*      Bound(.L .S .D .LS .LSD)    12       13     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 61 Did not find schedule
;*      Disqualified loop: Did not find schedule
;*----------------------------------------------------------------------------*
$C$L1:    
$C$DW$L$DecimationFIR$3$B:
	.dwpsn	file "../main.c",line 48,column 7,is_stmt,isa 0

           LDDW    .D1T1   *A7,A5:A4         ; |48| 
||         LDDW    .D2T2   *B4,B17:B16       ; |48| 

           LDDW    .D1T1   *+A7(8),A9:A8     ; |48| 
||         LDDW    .D2T2   *+B4(8),B9:B8     ; |48| 

           NOP             3
$C$DW$L$DecimationFIR$3$E:
;** --------------------------------------------------------------------------*
$C$DW$L$DecimationFIR$4$B:

           CMPYSP  .M2X    B17:B16,A5:A4,B19:B18:B17:B16 ; |48| 
||         LDDW    .D2T2   *+B4(16),B23:B22  ; |48| 
||         LDDW    .D1T1   *+A7(16),A5:A4    ; |48| 

           CMPYSP  .M2X    B9:B8,A9:A8,B11:B10:B9:B8 ; |48| 
           LDDW    .D2T2   *+B4(24),B21:B20  ; |48| 
           LDDW    .D1T1   *+A7(24),A9:A8    ; |48| 
           DADDSP  .L2     B19:B18,B17:B16,B25:B24 ; |48| 

           LDDW    .D1T1   *+A7(32),A5:A4    ; |48| 
||         CMPYSP  .M2X    B23:B22,A5:A4,B19:B18:B17:B16 ; |48| 

           DADDSP  .L2     B11:B10,B9:B8,B23:B22 ; |48| 

           DADDSP  .L2     B7:B6,B25:B24,B27:B26 ; |48| 
||         LDDW    .D2T2   *+B4(32),B25:B24  ; |48| 

           CMPYSP  .M2X    B21:B20,A9:A8,B11:B10:B9:B8 ; |48| 
           LDDW    .D1T1   *+A7(40),A9:A8    ; |48| 

           DADDSP  .L2     B27:B26,B23:B22,B21:B20 ; |48| 
||         DADDSP  .S2     B19:B18,B17:B16,B23:B22 ; |48| 
||         LDDW    .D2T2   *+B4(40),B27:B26  ; |48| 

           NOP             1

           CMPYSP  .M2X    B25:B24,A5:A4,B19:B18:B17:B16 ; |48| 
||         LDDW    .D1T1   *+A7(48),A5:A4    ; |48| 

           DADDSP  .L2     B21:B20,B23:B22,B25:B24 ; |48| 
||         DADDSP  .S2     B11:B10,B9:B8,B23:B22 ; |48| 
||         LDDW    .D2T2   *+B4(48),B21:B20  ; |48| 

           NOP             1

           CMPYSP  .M2X    B27:B26,A9:A8,B11:B10:B9:B8 ; |48| 
||         LDDW    .D2T2   *+B4(56),B27:B26  ; |48| 
||         LDDW    .D1T1   *+A7(56),A9:A8    ; |48| 

           DADDSP  .L2     B25:B24,B23:B22,B25:B24 ; |48| 
||         DADDSP  .S2     B19:B18,B17:B16,B23:B22 ; |48| 

           NOP             1

           CMPYSP  .M2X    B21:B20,A5:A4,B19:B18:B17:B16 ; |48| 
||         LDDW    .D2T2   *+B4(64),B21:B20  ; |48| 
||         LDDW    .D1T1   *+A7(64),A5:A4    ; |48| 

           DADDSP  .L2     B25:B24,B23:B22,B25:B24 ; |48| 
||         DADDSP  .S2     B11:B10,B9:B8,B23:B22 ; |48| 

           CMPYSP  .M2X    B27:B26,A9:A8,B11:B10:B9:B8 ; |48| 
||         LDDW    .D2T2   *+B4(72),B27:B26  ; |48| 
||         LDDW    .D1T1   *+A7(72),A9:A8    ; |48| 

           NOP             1

           DADDSP  .L2     B25:B24,B23:B22,B25:B24 ; |48| 
||         DADDSP  .S2     B19:B18,B17:B16,B23:B22 ; |48| 

           CMPYSP  .M2X    B21:B20,A5:A4,B19:B18:B17:B16 ; |48| 
||         LDDW    .D2T2   *+B4(80),B21:B20  ; |48| 
||         LDDW    .D1T1   *+A7(80),A5:A4    ; |48| 

           NOP             1

           DADDSP  .L2     B25:B24,B23:B22,B25:B24 ; |48| 
||         DADDSP  .S2     B11:B10,B9:B8,B23:B22 ; |48| 
||         CMPYSP  .M2X    B27:B26,A9:A8,B11:B10:B9:B8 ; |48| 

           LDDW    .D1T1   *+A7(88),A9:A8    ; |48| 
           LDDW    .D2T2   *+B4(88),B27:B26  ; |48| 

           LDDW    .D1T1   *+A7(96),A5:A4    ; |48| 
||         DADDSP  .L2     B25:B24,B23:B22,B25:B24 ; |48| 
||         DADDSP  .S2     B19:B18,B17:B16,B23:B22 ; |48| 
||         CMPYSP  .M2X    B21:B20,A5:A4,B19:B18:B17:B16 ; |48| 

           LDDW    .D2T2   *+B4(96),B21:B20  ; |48| 
           NOP             1

           DADDSP  .L2     B25:B24,B23:B22,B25:B24 ; |48| 
||         DADDSP  .S2     B11:B10,B9:B8,B23:B22 ; |48| 

           CMPYSP  .M2X    B27:B26,A9:A8,B11:B10:B9:B8 ; |48| 
           LDDW    .D1T1   *+A7(104),A9:A8   ; |48| 

           DADDSP  .L2     B25:B24,B23:B22,B27:B26 ; |48| 
||         DADDSP  .S2     B19:B18,B17:B16,B23:B22 ; |48| 
||         LDDW    .D2T2   *+B4(104),B25:B24 ; |48| 
||         CMPYSP  .M2X    B21:B20,A5:A4,B19:B18:B17:B16 ; |48| 

           LDDW    .D1T1   *+A7(112),A5:A4   ; |48| 
           DADDSP  .L2     B11:B10,B9:B8,B21:B20 ; |48| 

           DADDSP  .L2     B27:B26,B23:B22,B23:B22 ; |48| 
||         LDDW    .D2T2   *+B4(112),B27:B26 ; |48| 

           NOP             1

           CMPYSP  .M2X    B25:B24,A9:A8,B11:B10:B9:B8 ; |48| 
||         LDDW    .D1T1   *+A7(120),A9:A8   ; |48| 

           DADDSP  .L2     B23:B22,B21:B20,B25:B24 ; |48| 
||         DADDSP  .S2     B19:B18,B17:B16,B23:B22 ; |48| 
||         LDDW    .D2T2   *+B4(120),B21:B20 ; |48| 

           NOP             1
           CMPYSP  .M2X    B27:B26,A5:A4,B19:B18:B17:B16 ; |48| 

           DADDSP  .L2     B25:B24,B23:B22,B25:B24 ; |48| 
||         DADDSP  .S2     B11:B10,B9:B8,B23:B22 ; |48| 

           NOP             1
           CMPYSP  .M2X    B21:B20,A9:A8,B11:B10:B9:B8 ; |48| 

           DADDSP  .L2     B19:B18,B17:B16,B17:B16 ; |48| 
||         DADDSP  .S2     B25:B24,B23:B22,B19:B18 ; |48| 

           NOP             2

           DADDSP  .L2     B11:B10,B9:B8,B9:B8 ; |48| 
||         DADDSP  .S2     B19:B18,B17:B16,B17:B16 ; |48| 

           NOP             2
           DADDSP  .L2     B17:B16,B9:B8,B9:B8 ; |48| 
           NOP             2
           STDW    .D2T2   B9:B8,*B5++       ; |48| 
	.dwpsn	file "../main.c",line 41,column 6,is_stmt,isa 0
           ADDK    .S2     128,B4            ; |41| 
	.dwpsn	file "../main.c",line 33,column 15,is_stmt,isa 0
           SUB     .L1     A1,1,A1           ; |33| 
   [ A1]   B       .S1     $C$L1             ; |33| 
   [!A1]   BNOP    .S1     $C$L3,4           ; |33| 
           ; BRANCHCC OCCURS {$C$L1}         ; |33| 
$C$DW$L$DecimationFIR$4$E:
;** --------------------------------------------------------------------------*
           NOP             1
           ; BRANCH OCCURS {$C$L3}           ; |33| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 33
;*      Loop opening brace source line   : 34
;*      Loop closing brace source line   : 50
;*      Known Minimum Trip Count         : 1                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 61
;*      Unpartitioned Resource Bound     : 17
;*      Partitioned Resource Bound(*)    : 17
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     1        0     
;*      .D units                    17*      16     
;*      .M units                     8        8     
;*      .X cross paths              15       14     
;*      .T address paths            17*      16     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)          17       22     (.L or .S unit)
;*      Addition ops (.LSD)          0        1     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             9       11     
;*      Bound(.L .S .D .LS .LSD)    12       13     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 61 Did not find schedule
;*      Disqualified loop: Did not find schedule
;*----------------------------------------------------------------------------*
$C$L2:    
$C$DW$L$DecimationFIR$6$B:
	.dwpsn	file "../main.c",line 48,column 7,is_stmt,isa 0

           LDDW    .D2T2   *B4,B9:B8         ; |48| 
||         LDDW    .D1T1   *A7,A5:A4         ; |48| 

           LDDW    .D2T2   *+B4(8),B7:B6     ; |48| 
||         LDDW    .D1T1   *+A7(8),A9:A8     ; |48| 

           NOP             3
$C$DW$L$DecimationFIR$6$E:
;** --------------------------------------------------------------------------*
$C$DW$L$DecimationFIR$7$B:

           CMPYSP  .M2X    B9:B8,A5:A4,B11:B10:B9:B8 ; |48| 
||         LDDW    .D2T2   *+B4(16),B21:B20  ; |48| 
||         LDDW    .D1T1   *+A7(16),A5:A4    ; |48| 

           CMPYSP  .M2X    B7:B6,A9:A8,B19:B18:B17:B16 ; |48| 
||         LDDW    .D1T1   *+A7(24),A9:A8    ; |48| 
||         LDDW    .D2T2   *+B4(24),B7:B6    ; |48| 

           LDDW    .D2T2   *+B4(32),B27:B26  ; |48| 
           LDDW    .D1T1   *+A7(80),A17:A16  ; |48| 
           DADDSP  .L2     B11:B10,B9:B8,B23:B22 ; |48| 

           CMPYSP  .M2X    B21:B20,A5:A4,B11:B10:B9:B8 ; |48| 
||         DADDSP  .L2     B19:B18,B17:B16,B21:B20 ; |48| 
||         LDDW    .D1T1   *+A7(32),A5:A4    ; |48| 

           CMPYSP  .M2X    B7:B6,A9:A8,B19:B18:B17:B16 ; |48| 
           DADDSP  .L2     B25:B24,B23:B22,B23:B22 ; |48| 
           LDDW    .D2T2   *+B4(40),B7:B6    ; |48| 
           LDDW    .D1T1   *+A7(40),A9:A8    ; |48| 

           DADDSP  .L2     B23:B22,B21:B20,B23:B22 ; |48| 
||         DADDSP  .S2     B11:B10,B9:B8,B21:B20 ; |48| 
||         CMPYSP  .M2X    B27:B26,A5:A4,B11:B10:B9:B8 ; |48| 

           LDDW    .D2T2   *+B4(48),B27:B26  ; |48| 
           LDDW    .D1T1   *+A7(48),A5:A4    ; |48| 

           DADDSP  .L2     B23:B22,B21:B20,B23:B22 ; |48| 
||         DADDSP  .S2     B19:B18,B17:B16,B21:B20 ; |48| 

           CMPYSP  .M2X    B7:B6,A9:A8,B19:B18:B17:B16 ; |48| 
           LDDW    .D1T1   *+A7(56),A9:A8    ; |48| 

           DADDSP  .L2     B23:B22,B21:B20,B7:B6 ; |48| 
||         DADDSP  .S2     B11:B10,B9:B8,B23:B22 ; |48| 
||         LDDW    .D2T2   *+B4(56),B21:B20  ; |48| 

           CMPYSP  .M2X    B27:B26,A5:A4,B11:B10:B9:B8 ; |48| 
           LDDW    .D1T1   *+A7(64),A5:A4    ; |48| 

           DADDSP  .L2     B7:B6,B23:B22,B27:B26 ; |48| 
||         DADDSP  .S2     B19:B18,B17:B16,B7:B6 ; |48| 
||         LDDW    .D2T2   *+B4(64),B23:B22  ; |48| 

           NOP             1

           CMPYSP  .M2X    B21:B20,A9:A8,B19:B18:B17:B16 ; |48| 
||         LDDW    .D1T1   *+A7(72),A9:A8    ; |48| 

           DADDSP  .L2     B27:B26,B7:B6,B21:B20 ; |48| 
||         DADDSP  .S2     B11:B10,B9:B8,B7:B6 ; |48| 
||         LDDW    .D2T2   *+B4(72),B27:B26  ; |48| 

           NOP             1
           CMPYSP  .M2X    B23:B22,A5:A4,B11:B10:B9:B8 ; |48| 

           DADDSP  .L2     B19:B18,B17:B16,B23:B22 ; |48| 
||         DADDSP  .S2     B21:B20,B7:B6,B7:B6 ; |48| 
||         LDDW    .D2T2   *+B4(80),B21:B20  ; |48| 

           LDDW    .D1T1   *+A7(88),A5:A4    ; |48| 
           CMPYSP  .M2X    B27:B26,A9:A8,B19:B18:B17:B16 ; |48| 

           DADDSP  .L2     B7:B6,B23:B22,B27:B26 ; |48| 
||         DADDSP  .S2     B11:B10,B9:B8,B7:B6 ; |48| 
||         LDDW    .D2T2   *+B4(88),B23:B22  ; |48| 

           LDDW    .D1T1   *+A7(96),A9:A8    ; |48| 
           CMPYSP  .M2X    B21:B20,A17:A16,B11:B10:B9:B8 ; |48| 

           DADDSP  .L2     B27:B26,B7:B6,B21:B20 ; |48| 
||         DADDSP  .S2     B19:B18,B17:B16,B7:B6 ; |48| 
||         LDDW    .D2T2   *+B4(96),B27:B26  ; |48| 

           NOP             1

           CMPYSP  .M2X    B23:B22,A5:A4,B19:B18:B17:B16 ; |48| 
||         LDDW    .D1T1   *+A7(104),A5:A4   ; |48| 

           DADDSP  .L2     B21:B20,B7:B6,B23:B22 ; |48| 
||         DADDSP  .S2     B11:B10,B9:B8,B7:B6 ; |48| 
||         LDDW    .D2T2   *+B4(104),B21:B20 ; |48| 

           NOP             1

           CMPYSP  .M2X    B27:B26,A9:A8,B11:B10:B9:B8 ; |48| 
||         LDDW    .D1T1   *+A7(112),A9:A8   ; |48| 

           DADDSP  .L2     B19:B18,B17:B16,B17:B16 ; |48| 
||         LDDW    .D2T2   *+B4(112),B19:B18 ; |48| 
||         DADDSP  .S2     B23:B22,B7:B6,B7:B6 ; |48| 

           LDDW    .D2T2   *+B4(120),B27:B26 ; |48| 

           CMPYSP  .M2X    B21:B20,A5:A4,B23:B22:B21:B20 ; |48| 
||         LDDW    .D1T1   *+A7(120),A5:A4   ; |48| 

           DADDSP  .L2     B7:B6,B17:B16,B9:B8 ; |48| 
||         DADDSP  .S2     B11:B10,B9:B8,B7:B6 ; |48| 

           NOP             1
           CMPYSP  .M2X    B19:B18,A9:A8,B19:B18:B17:B16 ; |48| 

           DADDSP  .L2     B9:B8,B7:B6,B21:B20 ; |48| 
||         DADDSP  .S2     B23:B22,B21:B20,B7:B6 ; |48| 

           CMPYSP  .M2X    B27:B26,A5:A4,B11:B10:B9:B8 ; |48| 
           NOP             1

           DADDSP  .L2     B21:B20,B7:B6,B17:B16 ; |48| 
||         DADDSP  .S2     B19:B18,B17:B16,B7:B6 ; |48| 

           NOP             2

           DADDSP  .L2     B17:B16,B7:B6,B9:B8 ; |48| 
||         DADDSP  .S2     B11:B10,B9:B8,B7:B6 ; |48| 

           NOP             2
           DADDSP  .L2     B9:B8,B7:B6,B7:B6 ; |48| 
           NOP             2
           STDW    .D2T2   B7:B6,*B5++       ; |48| 
	.dwpsn	file "../main.c",line 41,column 6,is_stmt,isa 0
           ADDK    .S2     128,B4            ; |41| 
	.dwpsn	file "../main.c",line 33,column 15,is_stmt,isa 0
           SUB     .L1     A0,1,A0           ; |33| 
   [ A0]   BNOP    .S1     $C$L2,5           ; |33| 
           ; BRANCHCC OCCURS {$C$L2}         ; |33| 
$C$DW$L$DecimationFIR$7$E:
;** --------------------------------------------------------------------------*
$C$L3:    
	.dwpsn	file "../main.c",line 51,column 4,is_stmt,isa 0
           LDW     .D2T2   *+SP(12),B10      ; |51| 
	.dwcfi	restore_reg, 26
           LDW     .D2T2   *++SP(16),B11     ; |51| 
	.dwcfi	cfa_offset, 0
	.dwcfi	restore_reg, 27
	.dwcfi	cfa_offset, 0
$C$DW$37	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$37, DW_AT_low_pc(0x00)
	.dwattr $C$DW$37, DW_AT_TI_return
           RETNOP  .S2     B3,5              ; |51| 
           ; BRANCH OCCURS {B3}              ; |51| 

$C$DW$38	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$38, DW_AT_name("C:\Users\a0270985\Documents\training\customer\Israel_2012\handsOnTraining\OptimizationMemoryLab2\Debug\main.asm:$C$L2:1:1331128649")
	.dwattr $C$DW$38, DW_AT_TI_begin_file("../main.c")
	.dwattr $C$DW$38, DW_AT_TI_begin_line(0x21)
	.dwattr $C$DW$38, DW_AT_TI_end_line(0x32)
$C$DW$39	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$39, DW_AT_low_pc($C$DW$L$DecimationFIR$6$B)
	.dwattr $C$DW$39, DW_AT_high_pc($C$DW$L$DecimationFIR$6$E)
$C$DW$40	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$40, DW_AT_low_pc($C$DW$L$DecimationFIR$7$B)
	.dwattr $C$DW$40, DW_AT_high_pc($C$DW$L$DecimationFIR$7$E)
	.dwendtag $C$DW$38


$C$DW$41	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$41, DW_AT_name("C:\Users\a0270985\Documents\training\customer\Israel_2012\handsOnTraining\OptimizationMemoryLab2\Debug\main.asm:$C$L1:1:1331128649")
	.dwattr $C$DW$41, DW_AT_TI_begin_file("../main.c")
	.dwattr $C$DW$41, DW_AT_TI_begin_line(0x21)
	.dwattr $C$DW$41, DW_AT_TI_end_line(0x32)
$C$DW$42	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$42, DW_AT_low_pc($C$DW$L$DecimationFIR$3$B)
	.dwattr $C$DW$42, DW_AT_high_pc($C$DW$L$DecimationFIR$3$E)
$C$DW$43	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$43, DW_AT_low_pc($C$DW$L$DecimationFIR$4$B)
	.dwattr $C$DW$43, DW_AT_high_pc($C$DW$L$DecimationFIR$4$E)
	.dwendtag $C$DW$41

	.dwattr $C$DW$25, DW_AT_TI_end_file("../main.c")
	.dwattr $C$DW$25, DW_AT_TI_end_line(0x33)
	.dwattr $C$DW$25, DW_AT_TI_end_column(0x04)
	.dwendentry
	.dwendtag $C$DW$25

	.sect	".text"
	.clink
	.global	main

$C$DW$44	.dwtag  DW_TAG_subprogram, DW_AT_name("main")
	.dwattr $C$DW$44, DW_AT_low_pc(main)
	.dwattr $C$DW$44, DW_AT_high_pc(0x00)
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("main")
	.dwattr $C$DW$44, DW_AT_external
	.dwattr $C$DW$44, DW_AT_TI_begin_file("../main.c")
	.dwattr $C$DW$44, DW_AT_TI_begin_line(0x38)
	.dwattr $C$DW$44, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$44, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$44, DW_AT_decl_line(0x38)
	.dwattr $C$DW$44, DW_AT_decl_column(0x06)
	.dwattr $C$DW$44, DW_AT_TI_max_frame_size(0x40)
	.dwpsn	file "../main.c",line 57,column 1,is_stmt,address main,isa 0

	.dwfde $C$DW$CIE, main

;******************************************************************************
;* FUNCTION NAME: main                                                        *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,B0,B1, *
;*                           B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,SP,A16,A17,A18,  *
;*                           A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30, *
;*                           A31,B16,B17,B18,B19,B20,B21,B22,B23,B24,B25,B26, *
;*                           B27,B28,B29,B30,B31                              *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,B0,B1, *
;*                           B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,DP,SP,A16,A17,   *
;*                           A18,A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29, *
;*                           A30,A31,B16,B17,B18,B19,B20,B21,B22,B23,B24,B25, *
;*                           B26,B27,B28,B29,B30,B31                          *
;*   Local Frame Size  : 16 Args + 0 Auto + 48 Save = 64 byte                 *
;******************************************************************************

;******************************************************************************
;*                                                                            *
;* Using -g (debug) with optimization (-o3) may disable key optimizations!    *
;*                                                                            *
;******************************************************************************
main:
;** --------------------------------------------------------------------------*
	.dwcfi	cfa_offset, 0
           STW     .D2T2   B11,*SP--(8)      ; |57| 
	.dwcfi	cfa_offset, 8
	.dwcfi	save_reg_to_mem, 27, 0
           STW     .D2T2   B10,*SP--(8)      ; |57| 
	.dwcfi	cfa_offset, 16
	.dwcfi	save_reg_to_mem, 26, -8
           STW     .D2T2   B3,*SP--(8)       ; |57| 
	.dwcfi	cfa_offset, 24
	.dwcfi	save_reg_to_mem, 19, -16
           STDW    .D2T1   A13:A12,*SP--     ; |57| 
	.dwcfi	cfa_offset, 32
	.dwcfi	save_reg_to_mem, 13, -20
	.dwcfi	save_reg_to_mem, 12, -24
           STDW    .D2T1   A11:A10,*SP--     ; |57| 
	.dwcfi	cfa_offset, 40
	.dwcfi	save_reg_to_mem, 11, -28
	.dwcfi	save_reg_to_mem, 10, -32
           SUB     .D2     SP,16,SP          ; |57| 
	.dwcfi	cfa_offset, 56
$C$DW$45	.dwtag  DW_TAG_variable, DW_AT_name("t1")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("t1")
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$45, DW_AT_location[DW_OP_reg11]
$C$DW$46	.dwtag  DW_TAG_variable, DW_AT_name("t2")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("t2")
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$46, DW_AT_location[DW_OP_reg4]
$C$DW$47	.dwtag  DW_TAG_variable, DW_AT_name("t3")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("t3")
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$47, DW_AT_location[DW_OP_reg10]
$C$DW$48	.dwtag  DW_TAG_variable, DW_AT_name("t4")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("t4")
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$48, DW_AT_location[DW_OP_reg4]
$C$DW$49	.dwtag  DW_TAG_variable, DW_AT_name("t_dif")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("t_dif")
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$49, DW_AT_location[DW_OP_reg10]
	.dwpsn	file "C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cacheAux.h",line 247,column 5,is_stmt,isa 0
           MVKL    .S1     0x1840040,A3
           MVKH    .S1     0x1840040,A3
           LDW     .D1T1   *A3,A4            ; |247| 
           NOP             4
           AND     .L1     -4,A4,A4          ; |247| 
           OR      .L1     4,A4,A4           ; |247| 
           STW     .D1T1   A4,*A3            ; |247| 
	.dwpsn	file "C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cacheAux.h",line 957,column 5,is_stmt,isa 0
           MVK     .S2     32,B5
           SUB     .L2X    A3,B5,B5
           LDW     .D2T2   *B5,B4            ; |957| 
           NOP             4
           AND     .L2     -4,B4,B4          ; |957| 
           OR      .L2     4,B4,B4           ; |957| 
           STW     .D2T2   B4,*B5            ; |957| 
	.dwpsn	file "../main.c",line 70,column 5,is_stmt,isa 0
$C$DW$50	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$50, DW_AT_low_pc(0x00)
	.dwattr $C$DW$50, DW_AT_name("clock")
	.dwattr $C$DW$50, DW_AT_TI_call
           CALLP   .S2     clock,B3
$C$RL0:    ; CALL OCCURS {clock} {0}         ; |70| 
;** --------------------------------------------------------------------------*
           MV      .L1     A4,A10            ; |70| 
	.dwpsn	file "../main.c",line 71,column 5,is_stmt,isa 0
$C$DW$51	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$51, DW_AT_low_pc(0x00)
	.dwattr $C$DW$51, DW_AT_name("clock")
	.dwattr $C$DW$51, DW_AT_TI_call
           CALLP   .S2     clock,B3
$C$RL1:    ; CALL OCCURS {clock} {0}         ; |71| 
	.dwpsn	file "../main.c",line 72,column 5,is_stmt,isa 0
           SUB     .L1     A4,A10,A10        ; |72| 
	.dwpsn	file "../main.c",line 76,column 3,is_stmt,isa 0
           MVKL    .S1     filterBuffer,A12

           MVKH    .S1     filterBuffer,A12
||         MVK     .S2     0x10,B4           ; |76| 

$C$DW$52	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$52, DW_AT_low_pc(0x00)
	.dwattr $C$DW$52, DW_AT_name("generateCoef")
	.dwattr $C$DW$52, DW_AT_TI_call

           CALLP   .S2     generateCoef,B3
||         MV      .L1     A12,A4            ; |76| 

$C$RL2:    ; CALL OCCURS {generateCoef} {0}  ; |76| 
	.dwpsn	file "../main.c",line 77,column 3,is_stmt,isa 0
           MVKL    .S2     inputBuffer,B11
           MVKH    .S2     inputBuffer,B11
           MVK     .S2     0x1000,B10        ; |77| 
$C$DW$53	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$53, DW_AT_low_pc(0x00)
	.dwattr $C$DW$53, DW_AT_name("generateData")
	.dwattr $C$DW$53, DW_AT_TI_call

           CALLP   .S2     generateData,B3
||         MV      .L1X    B11,A4            ; |77| 
||         MV      .L2     B10,B4            ; |77| 

$C$RL3:    ; CALL OCCURS {generateData} {0}  ; |77| 
           MV      .L1X    B11,A13           ; |77| 
	.dwpsn	file "../main.c",line 81,column 6,is_stmt,isa 0
$C$DW$54	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$54, DW_AT_low_pc(0x00)
	.dwattr $C$DW$54, DW_AT_name("clock")
	.dwattr $C$DW$54, DW_AT_TI_call
           CALLP   .S2     clock,B3
$C$RL4:    ; CALL OCCURS {clock} {0}         ; |81| 
;** --------------------------------------------------------------------------*

           MV      .L1     A4,A11            ; |81| 
||         MVK     .S2     0x100,B28

	.dwpsn	file "../main.c",line 83,column 16,is_stmt,isa 0
           MVK     .S1     0x10,A3           ; |83| 
           MVKL    .S1     outBuffer,A6

           MVKH    .S1     outBuffer,A6
||         MV      .L1     A3,A18            ; |83| 

	.dwpsn	file "../main.c",line 77,column 3,is_stmt,isa 0
           MV      .L1     A13,A20           ; |77| 
	.dwpsn	file "../main.c",line 76,column 3,is_stmt,isa 0
           MV      .L1     A12,A19           ; |76| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*----------------------------------------------------------------------------*
$C$L4:    
$C$DW$L$main$4$B:
	.dwpsn	file "../main.c",line 85,column 7,is_stmt,isa 0
$C$DW$55	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$55, DW_AT_low_pc(0x00)
	.dwattr $C$DW$55, DW_AT_name("DecimationFIR")
	.dwattr $C$DW$55, DW_AT_TI_call
           CALL    .S1     DecimationFIR     ; |85| 
           MV      .L2X    A19,B4            ; |85| 
           ADDKPC  .S2     $C$RL5,B3,2       ; |85| 

           MV      .L1     A20,A4            ; |85| 
||         MV      .L2     B28,B6            ; |85| 
||         MVK     .S1     0x10,A8           ; |85| 

$C$RL5:    ; CALL OCCURS {DecimationFIR} {0}  ; |85| 
$C$DW$L$main$4$E:
;** --------------------------------------------------------------------------*
$C$DW$L$main$5$B:
	.dwpsn	file "../main.c",line 83,column 16,is_stmt,isa 0

           SUB     .L1     A18,1,A0          ; |83| 
||         ADDK    .S1     2048,A6           ; |83| 
||         SUB     .D1     A18,1,A18         ; |83| 

   [ A0]   BNOP    .S1     $C$L4,5           ; |83| 
           ; BRANCHCC OCCURS {$C$L4}         ; |83| 
$C$DW$L$main$5$E:
;** --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 92,column 3,is_stmt,isa 0
$C$DW$56	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$56, DW_AT_low_pc(0x00)
	.dwattr $C$DW$56, DW_AT_name("clock")
	.dwattr $C$DW$56, DW_AT_TI_call
           CALL    .S1     clock             ; |92| 
           ADDKPC  .S2     $C$RL6,B3,4       ; |92| 
$C$RL6:    ; CALL OCCURS {clock} {0}         ; |92| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 93,column 3,is_stmt,isa 0
           MVK     .S1     16,A3             ; |93| 

           STW     .D2T1   A3,*+SP(8)        ; |93| 
||         MVKL    .S2     $C$SL1+0,B4

           SUB     .L1     A4,A11,A3         ; |93| 
||         MVKH    .S2     $C$SL1+0,B4
||         STW     .D2T2   B10,*+SP(12)      ; |93| 

           SUB     .L1     A3,A10,A10        ; |93| 
||         STW     .D2T2   B4,*+SP(4)        ; |93| 

$C$DW$57	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$57, DW_AT_low_pc(0x00)
	.dwattr $C$DW$57, DW_AT_name("printf")
	.dwattr $C$DW$57, DW_AT_TI_call

           CALLP   .S2     printf,B3
||         STW     .D2T1   A10,*+SP(16)      ; |93| 

$C$RL7:    ; CALL OCCURS {printf} {0}        ; |93| 
	.dwpsn	file "../main.c",line 94,column 3,is_stmt,isa 0
           INTSP   .L1     A10,A3            ; |94| 
           ZERO    .L1     A4
           MVKH    .S1     0x39800000,A4
           MVKL    .S2     $C$SL2+0,B4
           MPYSP   .M1     A4,A3,A3          ; |94| 
           MVKH    .S2     $C$SL2+0,B4
           STW     .D2T2   B4,*+SP(4)        ; |94| 
           NOP             1
           SPDP    .S1     A3,A5:A4          ; |94| 
           NOP             1
$C$DW$58	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$58, DW_AT_low_pc(0x00)
	.dwattr $C$DW$58, DW_AT_name("printf")
	.dwattr $C$DW$58, DW_AT_TI_call

           CALLP   .S2     printf,B3
||         STDW    .D2T1   A5:A4,*+SP(8)     ; |94| 

$C$RL8:    ; CALL OCCURS {printf} {0}        ; |94| 
;** --------------------------------------------------------------------------*
	.dwpsn	file "../main.c",line 100,column 1,is_stmt,isa 0
           ADDK    .S2     16,SP             ; |100| 
	.dwcfi	cfa_offset, 40
           LDDW    .D2T1   *++SP,A11:A10
	.dwcfi	cfa_offset, 32
	.dwcfi	restore_reg, 11
	.dwcfi	restore_reg, 10
           LDDW    .D2T1   *++SP,A13:A12
	.dwcfi	cfa_offset, 24
	.dwcfi	restore_reg, 13
	.dwcfi	restore_reg, 12
           LDW     .D2T2   *++SP(8),B3
           NOP             2
	.dwcfi	cfa_offset, 16
	.dwcfi	restore_reg, 19
           LDW     .D2T2   *++SP(8),B10
	.dwcfi	cfa_offset, 8
	.dwcfi	restore_reg, 26
           LDW     .D2T2   *++SP(8),B11      ; |100| 
	.dwcfi	cfa_offset, 0
	.dwcfi	restore_reg, 27
	.dwcfi	cfa_offset, 0
$C$DW$59	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$59, DW_AT_low_pc(0x00)
	.dwattr $C$DW$59, DW_AT_TI_return
           RETNOP  .S2     B3,5
           ; BRANCH OCCURS {B3}  

$C$DW$60	.dwtag  DW_TAG_TI_loop
	.dwattr $C$DW$60, DW_AT_name("C:\Users\a0270985\Documents\training\customer\Israel_2012\handsOnTraining\OptimizationMemoryLab2\Debug\main.asm:$C$L4:1:1331128649")
	.dwattr $C$DW$60, DW_AT_TI_begin_file("../main.c")
	.dwattr $C$DW$60, DW_AT_TI_begin_line(0x53)
	.dwattr $C$DW$60, DW_AT_TI_end_line(0x57)
$C$DW$61	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$61, DW_AT_low_pc($C$DW$L$main$4$B)
	.dwattr $C$DW$61, DW_AT_high_pc($C$DW$L$main$4$E)
$C$DW$62	.dwtag  DW_TAG_TI_loop_range
	.dwattr $C$DW$62, DW_AT_low_pc($C$DW$L$main$5$B)
	.dwattr $C$DW$62, DW_AT_high_pc($C$DW$L$main$5$E)
	.dwendtag $C$DW$60

	.dwattr $C$DW$44, DW_AT_TI_end_file("../main.c")
	.dwattr $C$DW$44, DW_AT_TI_end_line(0x64)
	.dwattr $C$DW$44, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$44

;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
$C$SL1:	.string	" Decimation FIR time for %d   filters %d elements   = %d ",0
$C$SL2:	.string	" Average filter  = %f",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	clock
	.global	generateCoef
	.global	generateData

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

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************

$C$DW$T$66	.dwtag  DW_TAG_enumeration_type
	.dwattr $C$DW$T$66, DW_AT_byte_size(0x04)
$C$DW$63	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_L1_0KCACHE"), DW_AT_const_value(0x00)
	.dwattr $C$DW$63, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$63, DW_AT_decl_line(0x93)
	.dwattr $C$DW$63, DW_AT_decl_column(0x05)
$C$DW$64	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_L1_4KCACHE"), DW_AT_const_value(0x01)
	.dwattr $C$DW$64, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$64, DW_AT_decl_line(0x95)
	.dwattr $C$DW$64, DW_AT_decl_column(0x05)
$C$DW$65	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_L1_8KCACHE"), DW_AT_const_value(0x02)
	.dwattr $C$DW$65, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$65, DW_AT_decl_line(0x97)
	.dwattr $C$DW$65, DW_AT_decl_column(0x05)
$C$DW$66	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_L1_16KCACHE"), DW_AT_const_value(0x03)
	.dwattr $C$DW$66, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$66, DW_AT_decl_line(0x99)
	.dwattr $C$DW$66, DW_AT_decl_column(0x05)
$C$DW$67	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_L1_32KCACHE"), DW_AT_const_value(0x04)
	.dwattr $C$DW$67, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$67, DW_AT_decl_line(0x9b)
	.dwattr $C$DW$67, DW_AT_decl_column(0x05)
$C$DW$68	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_L1_MAXIM1"), DW_AT_const_value(0x05)
	.dwattr $C$DW$68, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$68, DW_AT_decl_line(0x9d)
	.dwattr $C$DW$68, DW_AT_decl_column(0x05)
$C$DW$69	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_L1_MAXIM2"), DW_AT_const_value(0x06)
	.dwattr $C$DW$69, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$69, DW_AT_decl_line(0x9f)
	.dwattr $C$DW$69, DW_AT_decl_column(0x05)
$C$DW$70	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_L1_MAXIM3"), DW_AT_const_value(0x07)
	.dwattr $C$DW$70, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$70, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$70, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$66

	.dwattr $C$DW$T$66, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$T$66, DW_AT_decl_line(0x91)
	.dwattr $C$DW$T$66, DW_AT_decl_column(0x0e)
$C$DW$T$67	.dwtag  DW_TAG_typedef, DW_AT_name("CACHE_L1Size")
	.dwattr $C$DW$T$67, DW_AT_type(*$C$DW$T$66)
	.dwattr $C$DW$T$67, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$67, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$T$67, DW_AT_decl_line(0xa2)
	.dwattr $C$DW$T$67, DW_AT_decl_column(0x03)

$C$DW$T$68	.dwtag  DW_TAG_enumeration_type
	.dwattr $C$DW$T$68, DW_AT_byte_size(0x04)
$C$DW$71	.dwtag  DW_TAG_enumerator, DW_AT_name("CSL_EXCLUSIVE"), DW_AT_const_value(0x00)
	.dwattr $C$DW$71, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$71, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$71, DW_AT_decl_column(0x03)
$C$DW$72	.dwtag  DW_TAG_enumerator, DW_AT_name("CSL_SHARED"), DW_AT_const_value(0x01)
	.dwattr $C$DW$72, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$72, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$72, DW_AT_decl_column(0x03)
	.dwendtag $C$DW$T$68

	.dwattr $C$DW$T$68, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$68, DW_AT_decl_line(0x49)
	.dwattr $C$DW$T$68, DW_AT_decl_column(0x0e)
$C$DW$T$69	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_OpenMode")
	.dwattr $C$DW$T$69, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$T$69, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$69, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$69, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$T$69, DW_AT_decl_column(0x03)

$C$DW$T$70	.dwtag  DW_TAG_enumeration_type
	.dwattr $C$DW$T$70, DW_AT_byte_size(0x04)
$C$DW$73	.dwtag  DW_TAG_enumerator, DW_AT_name("CSL_FAIL"), DW_AT_const_value(0x00)
	.dwattr $C$DW$73, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$73, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$73, DW_AT_decl_column(0x03)
$C$DW$74	.dwtag  DW_TAG_enumerator, DW_AT_name("CSL_PASS"), DW_AT_const_value(0x01)
	.dwattr $C$DW$74, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$74, DW_AT_decl_line(0x50)
	.dwattr $C$DW$74, DW_AT_decl_column(0x03)
	.dwendtag $C$DW$T$70

	.dwattr $C$DW$T$70, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$70, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$T$70, DW_AT_decl_column(0x0e)
$C$DW$T$71	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_Test")
	.dwattr $C$DW$T$71, DW_AT_type(*$C$DW$T$70)
	.dwattr $C$DW$T$71, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$71, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$71, DW_AT_decl_line(0x51)
	.dwattr $C$DW$T$71, DW_AT_decl_column(0x03)

$C$DW$T$72	.dwtag  DW_TAG_enumeration_type
	.dwattr $C$DW$T$72, DW_AT_byte_size(0x04)
$C$DW$75	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_NOWAIT"), DW_AT_const_value(0x00)
	.dwattr $C$DW$75, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$75, DW_AT_decl_line(0x81)
	.dwattr $C$DW$75, DW_AT_decl_column(0x05)
$C$DW$76	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_WAIT"), DW_AT_const_value(0x01)
	.dwattr $C$DW$76, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$76, DW_AT_decl_line(0x87)
	.dwattr $C$DW$76, DW_AT_decl_column(0x05)
$C$DW$77	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_FENCE_WAIT"), DW_AT_const_value(0x02)
	.dwattr $C$DW$77, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$77, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$77, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$72

	.dwattr $C$DW$T$72, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$T$72, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$T$72, DW_AT_decl_column(0x01)
$C$DW$T$73	.dwtag  DW_TAG_typedef, DW_AT_name("CACHE_Wait")
	.dwattr $C$DW$T$73, DW_AT_type(*$C$DW$T$72)
	.dwattr $C$DW$T$73, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$73, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$T$73, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$T$73, DW_AT_decl_column(0x02)

$C$DW$T$74	.dwtag  DW_TAG_enumeration_type
	.dwattr $C$DW$T$74, DW_AT_byte_size(0x04)
$C$DW$78	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_0KCACHE"), DW_AT_const_value(0x00)
	.dwattr $C$DW$78, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$78, DW_AT_decl_line(0xac)
	.dwattr $C$DW$78, DW_AT_decl_column(0x05)
$C$DW$79	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_32KCACHE"), DW_AT_const_value(0x01)
	.dwattr $C$DW$79, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$79, DW_AT_decl_line(0xae)
	.dwattr $C$DW$79, DW_AT_decl_column(0x05)
$C$DW$80	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_64KCACHE"), DW_AT_const_value(0x02)
	.dwattr $C$DW$80, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$80, DW_AT_decl_line(0xb0)
	.dwattr $C$DW$80, DW_AT_decl_column(0x05)
$C$DW$81	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_128KCACHE"), DW_AT_const_value(0x03)
	.dwattr $C$DW$81, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$81, DW_AT_decl_line(0xb2)
	.dwattr $C$DW$81, DW_AT_decl_column(0x05)
$C$DW$82	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_256KCACHE"), DW_AT_const_value(0x04)
	.dwattr $C$DW$82, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$82, DW_AT_decl_line(0xb4)
	.dwattr $C$DW$82, DW_AT_decl_column(0x05)
$C$DW$83	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_512KCACHE"), DW_AT_const_value(0x05)
	.dwattr $C$DW$83, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$83, DW_AT_decl_line(0xb6)
	.dwattr $C$DW$83, DW_AT_decl_column(0x05)
$C$DW$84	.dwtag  DW_TAG_enumerator, DW_AT_name("CACHE_1024KCACHE"), DW_AT_const_value(0x06)
	.dwattr $C$DW$84, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$84, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$84, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$74

	.dwattr $C$DW$T$74, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$T$74, DW_AT_decl_line(0xaa)
	.dwattr $C$DW$T$74, DW_AT_decl_column(0x0e)
$C$DW$T$75	.dwtag  DW_TAG_typedef, DW_AT_name("CACHE_L2Size")
	.dwattr $C$DW$T$75, DW_AT_type(*$C$DW$T$74)
	.dwattr $C$DW$T$75, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$75, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_cache.h")
	.dwattr $C$DW$T$75, DW_AT_decl_line(0xb9)
	.dwattr $C$DW$T$75, DW_AT_decl_column(0x03)

$C$DW$T$56	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$56, DW_AT_byte_size(0x4ae80)
$C$DW$85	.dwtag  DW_TAG_member
	.dwattr $C$DW$85, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$85, DW_AT_name("EVTFLAG")
	.dwattr $C$DW$85, DW_AT_TI_symbol_name("EVTFLAG")
	.dwattr $C$DW$85, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$85, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$85, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$85, DW_AT_decl_line(0x34)
	.dwattr $C$DW$85, DW_AT_decl_column(0x15)
$C$DW$86	.dwtag  DW_TAG_member
	.dwattr $C$DW$86, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$86, DW_AT_name("RSVD0")
	.dwattr $C$DW$86, DW_AT_TI_symbol_name("RSVD0")
	.dwattr $C$DW$86, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$86, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$86, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$86, DW_AT_decl_line(0x35)
	.dwattr $C$DW$86, DW_AT_decl_column(0x14)
$C$DW$87	.dwtag  DW_TAG_member
	.dwattr $C$DW$87, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$87, DW_AT_name("EVTSET")
	.dwattr $C$DW$87, DW_AT_TI_symbol_name("EVTSET")
	.dwattr $C$DW$87, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$87, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$87, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$87, DW_AT_decl_line(0x36)
	.dwattr $C$DW$87, DW_AT_decl_column(0x15)
$C$DW$88	.dwtag  DW_TAG_member
	.dwattr $C$DW$88, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$88, DW_AT_name("RSVD1")
	.dwattr $C$DW$88, DW_AT_TI_symbol_name("RSVD1")
	.dwattr $C$DW$88, DW_AT_data_member_location[DW_OP_plus_uconst 0x30]
	.dwattr $C$DW$88, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$88, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$88, DW_AT_decl_line(0x37)
	.dwattr $C$DW$88, DW_AT_decl_column(0x14)
$C$DW$89	.dwtag  DW_TAG_member
	.dwattr $C$DW$89, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$89, DW_AT_name("EVTCLR")
	.dwattr $C$DW$89, DW_AT_TI_symbol_name("EVTCLR")
	.dwattr $C$DW$89, DW_AT_data_member_location[DW_OP_plus_uconst 0x40]
	.dwattr $C$DW$89, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$89, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$89, DW_AT_decl_line(0x38)
	.dwattr $C$DW$89, DW_AT_decl_column(0x15)
$C$DW$90	.dwtag  DW_TAG_member
	.dwattr $C$DW$90, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$90, DW_AT_name("RSVD2")
	.dwattr $C$DW$90, DW_AT_TI_symbol_name("RSVD2")
	.dwattr $C$DW$90, DW_AT_data_member_location[DW_OP_plus_uconst 0x50]
	.dwattr $C$DW$90, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$90, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$90, DW_AT_decl_line(0x39)
	.dwattr $C$DW$90, DW_AT_decl_column(0x14)
$C$DW$91	.dwtag  DW_TAG_member
	.dwattr $C$DW$91, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$91, DW_AT_name("EVTMASK")
	.dwattr $C$DW$91, DW_AT_TI_symbol_name("EVTMASK")
	.dwattr $C$DW$91, DW_AT_data_member_location[DW_OP_plus_uconst 0x80]
	.dwattr $C$DW$91, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$91, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$91, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$91, DW_AT_decl_column(0x15)
$C$DW$92	.dwtag  DW_TAG_member
	.dwattr $C$DW$92, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$92, DW_AT_name("RSVD3")
	.dwattr $C$DW$92, DW_AT_TI_symbol_name("RSVD3")
	.dwattr $C$DW$92, DW_AT_data_member_location[DW_OP_plus_uconst 0x90]
	.dwattr $C$DW$92, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$92, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$92, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$92, DW_AT_decl_column(0x14)
$C$DW$93	.dwtag  DW_TAG_member
	.dwattr $C$DW$93, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$93, DW_AT_name("MEVTFLAG")
	.dwattr $C$DW$93, DW_AT_TI_symbol_name("MEVTFLAG")
	.dwattr $C$DW$93, DW_AT_data_member_location[DW_OP_plus_uconst 0xa0]
	.dwattr $C$DW$93, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$93, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$93, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$93, DW_AT_decl_column(0x15)
$C$DW$94	.dwtag  DW_TAG_member
	.dwattr $C$DW$94, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$94, DW_AT_name("RSVD4")
	.dwattr $C$DW$94, DW_AT_TI_symbol_name("RSVD4")
	.dwattr $C$DW$94, DW_AT_data_member_location[DW_OP_plus_uconst 0xb0]
	.dwattr $C$DW$94, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$94, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$94, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$94, DW_AT_decl_column(0x14)
$C$DW$95	.dwtag  DW_TAG_member
	.dwattr $C$DW$95, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$95, DW_AT_name("EXPMASK")
	.dwattr $C$DW$95, DW_AT_TI_symbol_name("EXPMASK")
	.dwattr $C$DW$95, DW_AT_data_member_location[DW_OP_plus_uconst 0xc0]
	.dwattr $C$DW$95, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$95, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$95, DW_AT_decl_line(0x3e)
	.dwattr $C$DW$95, DW_AT_decl_column(0x15)
$C$DW$96	.dwtag  DW_TAG_member
	.dwattr $C$DW$96, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$96, DW_AT_name("RSVD5")
	.dwattr $C$DW$96, DW_AT_TI_symbol_name("RSVD5")
	.dwattr $C$DW$96, DW_AT_data_member_location[DW_OP_plus_uconst 0xd0]
	.dwattr $C$DW$96, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$96, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$96, DW_AT_decl_line(0x3f)
	.dwattr $C$DW$96, DW_AT_decl_column(0x14)
$C$DW$97	.dwtag  DW_TAG_member
	.dwattr $C$DW$97, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$97, DW_AT_name("MEXPFLAG")
	.dwattr $C$DW$97, DW_AT_TI_symbol_name("MEXPFLAG")
	.dwattr $C$DW$97, DW_AT_data_member_location[DW_OP_plus_uconst 0xe0]
	.dwattr $C$DW$97, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$97, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$97, DW_AT_decl_line(0x40)
	.dwattr $C$DW$97, DW_AT_decl_column(0x15)
$C$DW$98	.dwtag  DW_TAG_member
	.dwattr $C$DW$98, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$98, DW_AT_name("RSVD6")
	.dwattr $C$DW$98, DW_AT_TI_symbol_name("RSVD6")
	.dwattr $C$DW$98, DW_AT_data_member_location[DW_OP_plus_uconst 0xf0]
	.dwattr $C$DW$98, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$98, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$98, DW_AT_decl_line(0x41)
	.dwattr $C$DW$98, DW_AT_decl_column(0x14)
$C$DW$99	.dwtag  DW_TAG_member
	.dwattr $C$DW$99, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$99, DW_AT_name("INTMUX1")
	.dwattr $C$DW$99, DW_AT_TI_symbol_name("INTMUX1")
	.dwattr $C$DW$99, DW_AT_data_member_location[DW_OP_plus_uconst 0x104]
	.dwattr $C$DW$99, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$99, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$99, DW_AT_decl_line(0x42)
	.dwattr $C$DW$99, DW_AT_decl_column(0x15)
$C$DW$100	.dwtag  DW_TAG_member
	.dwattr $C$DW$100, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$100, DW_AT_name("INTMUX2")
	.dwattr $C$DW$100, DW_AT_TI_symbol_name("INTMUX2")
	.dwattr $C$DW$100, DW_AT_data_member_location[DW_OP_plus_uconst 0x108]
	.dwattr $C$DW$100, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$100, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$100, DW_AT_decl_line(0x43)
	.dwattr $C$DW$100, DW_AT_decl_column(0x15)
$C$DW$101	.dwtag  DW_TAG_member
	.dwattr $C$DW$101, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$101, DW_AT_name("INTMUX3")
	.dwattr $C$DW$101, DW_AT_TI_symbol_name("INTMUX3")
	.dwattr $C$DW$101, DW_AT_data_member_location[DW_OP_plus_uconst 0x10c]
	.dwattr $C$DW$101, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$101, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$101, DW_AT_decl_line(0x44)
	.dwattr $C$DW$101, DW_AT_decl_column(0x15)
$C$DW$102	.dwtag  DW_TAG_member
	.dwattr $C$DW$102, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$102, DW_AT_name("RSVD7")
	.dwattr $C$DW$102, DW_AT_TI_symbol_name("RSVD7")
	.dwattr $C$DW$102, DW_AT_data_member_location[DW_OP_plus_uconst 0x110]
	.dwattr $C$DW$102, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$102, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$102, DW_AT_decl_line(0x45)
	.dwattr $C$DW$102, DW_AT_decl_column(0x14)
$C$DW$103	.dwtag  DW_TAG_member
	.dwattr $C$DW$103, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$103, DW_AT_name("AEGMUX0")
	.dwattr $C$DW$103, DW_AT_TI_symbol_name("AEGMUX0")
	.dwattr $C$DW$103, DW_AT_data_member_location[DW_OP_plus_uconst 0x140]
	.dwattr $C$DW$103, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$103, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$103, DW_AT_decl_line(0x46)
	.dwattr $C$DW$103, DW_AT_decl_column(0x15)
$C$DW$104	.dwtag  DW_TAG_member
	.dwattr $C$DW$104, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$104, DW_AT_name("AEGMUX1")
	.dwattr $C$DW$104, DW_AT_TI_symbol_name("AEGMUX1")
	.dwattr $C$DW$104, DW_AT_data_member_location[DW_OP_plus_uconst 0x144]
	.dwattr $C$DW$104, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$104, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$104, DW_AT_decl_line(0x47)
	.dwattr $C$DW$104, DW_AT_decl_column(0x15)
$C$DW$105	.dwtag  DW_TAG_member
	.dwattr $C$DW$105, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$105, DW_AT_name("RSVD8")
	.dwattr $C$DW$105, DW_AT_TI_symbol_name("RSVD8")
	.dwattr $C$DW$105, DW_AT_data_member_location[DW_OP_plus_uconst 0x148]
	.dwattr $C$DW$105, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$105, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$105, DW_AT_decl_line(0x48)
	.dwattr $C$DW$105, DW_AT_decl_column(0x14)
$C$DW$106	.dwtag  DW_TAG_member
	.dwattr $C$DW$106, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$106, DW_AT_name("INTXSTAT")
	.dwattr $C$DW$106, DW_AT_TI_symbol_name("INTXSTAT")
	.dwattr $C$DW$106, DW_AT_data_member_location[DW_OP_plus_uconst 0x180]
	.dwattr $C$DW$106, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$106, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$106, DW_AT_decl_line(0x49)
	.dwattr $C$DW$106, DW_AT_decl_column(0x15)
$C$DW$107	.dwtag  DW_TAG_member
	.dwattr $C$DW$107, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$107, DW_AT_name("INTXCLR")
	.dwattr $C$DW$107, DW_AT_TI_symbol_name("INTXCLR")
	.dwattr $C$DW$107, DW_AT_data_member_location[DW_OP_plus_uconst 0x184]
	.dwattr $C$DW$107, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$107, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$107, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$107, DW_AT_decl_column(0x15)
$C$DW$108	.dwtag  DW_TAG_member
	.dwattr $C$DW$108, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$108, DW_AT_name("INTDMASK")
	.dwattr $C$DW$108, DW_AT_TI_symbol_name("INTDMASK")
	.dwattr $C$DW$108, DW_AT_data_member_location[DW_OP_plus_uconst 0x188]
	.dwattr $C$DW$108, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$108, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$108, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$108, DW_AT_decl_column(0x15)
$C$DW$109	.dwtag  DW_TAG_member
	.dwattr $C$DW$109, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$109, DW_AT_name("RSVD9")
	.dwattr $C$DW$109, DW_AT_TI_symbol_name("RSVD9")
	.dwattr $C$DW$109, DW_AT_data_member_location[DW_OP_plus_uconst 0x18c]
	.dwattr $C$DW$109, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$109, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$109, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$109, DW_AT_decl_column(0x14)
$C$DW$110	.dwtag  DW_TAG_member
	.dwattr $C$DW$110, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$110, DW_AT_name("EVTASRT")
	.dwattr $C$DW$110, DW_AT_TI_symbol_name("EVTASRT")
	.dwattr $C$DW$110, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c0]
	.dwattr $C$DW$110, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$110, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$110, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$110, DW_AT_decl_column(0x15)
$C$DW$111	.dwtag  DW_TAG_member
	.dwattr $C$DW$111, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$111, DW_AT_name("RSVD10")
	.dwattr $C$DW$111, DW_AT_TI_symbol_name("RSVD10")
	.dwattr $C$DW$111, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c4]
	.dwattr $C$DW$111, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$111, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$111, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$111, DW_AT_decl_column(0x14)
$C$DW$112	.dwtag  DW_TAG_member
	.dwattr $C$DW$112, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$112, DW_AT_name("PDCCMD")
	.dwattr $C$DW$112, DW_AT_TI_symbol_name("PDCCMD")
	.dwattr $C$DW$112, DW_AT_data_member_location[DW_OP_plus_uconst 0x10000]
	.dwattr $C$DW$112, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$112, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$112, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$112, DW_AT_decl_column(0x15)
$C$DW$113	.dwtag  DW_TAG_member
	.dwattr $C$DW$113, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$113, DW_AT_name("RSVD11")
	.dwattr $C$DW$113, DW_AT_TI_symbol_name("RSVD11")
	.dwattr $C$DW$113, DW_AT_data_member_location[DW_OP_plus_uconst 0x10004]
	.dwattr $C$DW$113, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$113, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$113, DW_AT_decl_line(0x50)
	.dwattr $C$DW$113, DW_AT_decl_column(0x14)
$C$DW$114	.dwtag  DW_TAG_member
	.dwattr $C$DW$114, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$114, DW_AT_name("MM_REVID")
	.dwattr $C$DW$114, DW_AT_TI_symbol_name("MM_REVID")
	.dwattr $C$DW$114, DW_AT_data_member_location[DW_OP_plus_uconst 0x12000]
	.dwattr $C$DW$114, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$114, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$114, DW_AT_decl_line(0x51)
	.dwattr $C$DW$114, DW_AT_decl_column(0x15)
$C$DW$115	.dwtag  DW_TAG_member
	.dwattr $C$DW$115, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$115, DW_AT_name("RSVD12")
	.dwattr $C$DW$115, DW_AT_TI_symbol_name("RSVD12")
	.dwattr $C$DW$115, DW_AT_data_member_location[DW_OP_plus_uconst 0x12004]
	.dwattr $C$DW$115, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$115, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$115, DW_AT_decl_line(0x52)
	.dwattr $C$DW$115, DW_AT_decl_column(0x14)
$C$DW$116	.dwtag  DW_TAG_member
	.dwattr $C$DW$116, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$116, DW_AT_name("IDMA0_STAT")
	.dwattr $C$DW$116, DW_AT_TI_symbol_name("IDMA0_STAT")
	.dwattr $C$DW$116, DW_AT_data_member_location[DW_OP_plus_uconst 0x20000]
	.dwattr $C$DW$116, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$116, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$116, DW_AT_decl_line(0x53)
	.dwattr $C$DW$116, DW_AT_decl_column(0x15)
$C$DW$117	.dwtag  DW_TAG_member
	.dwattr $C$DW$117, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$117, DW_AT_name("IDMA0_MASK")
	.dwattr $C$DW$117, DW_AT_TI_symbol_name("IDMA0_MASK")
	.dwattr $C$DW$117, DW_AT_data_member_location[DW_OP_plus_uconst 0x20004]
	.dwattr $C$DW$117, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$117, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$117, DW_AT_decl_line(0x54)
	.dwattr $C$DW$117, DW_AT_decl_column(0x15)
$C$DW$118	.dwtag  DW_TAG_member
	.dwattr $C$DW$118, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$118, DW_AT_name("IDMA0_SOURCE")
	.dwattr $C$DW$118, DW_AT_TI_symbol_name("IDMA0_SOURCE")
	.dwattr $C$DW$118, DW_AT_data_member_location[DW_OP_plus_uconst 0x20008]
	.dwattr $C$DW$118, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$118, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$118, DW_AT_decl_line(0x55)
	.dwattr $C$DW$118, DW_AT_decl_column(0x15)
$C$DW$119	.dwtag  DW_TAG_member
	.dwattr $C$DW$119, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$119, DW_AT_name("IDMA0_DEST")
	.dwattr $C$DW$119, DW_AT_TI_symbol_name("IDMA0_DEST")
	.dwattr $C$DW$119, DW_AT_data_member_location[DW_OP_plus_uconst 0x2000c]
	.dwattr $C$DW$119, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$119, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$119, DW_AT_decl_line(0x56)
	.dwattr $C$DW$119, DW_AT_decl_column(0x15)
$C$DW$120	.dwtag  DW_TAG_member
	.dwattr $C$DW$120, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$120, DW_AT_name("IDMA0_COUNT")
	.dwattr $C$DW$120, DW_AT_TI_symbol_name("IDMA0_COUNT")
	.dwattr $C$DW$120, DW_AT_data_member_location[DW_OP_plus_uconst 0x20010]
	.dwattr $C$DW$120, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$120, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$120, DW_AT_decl_line(0x57)
	.dwattr $C$DW$120, DW_AT_decl_column(0x15)
$C$DW$121	.dwtag  DW_TAG_member
	.dwattr $C$DW$121, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$121, DW_AT_name("RSVD13")
	.dwattr $C$DW$121, DW_AT_TI_symbol_name("RSVD13")
	.dwattr $C$DW$121, DW_AT_data_member_location[DW_OP_plus_uconst 0x20014]
	.dwattr $C$DW$121, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$121, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$121, DW_AT_decl_line(0x58)
	.dwattr $C$DW$121, DW_AT_decl_column(0x14)
$C$DW$122	.dwtag  DW_TAG_member
	.dwattr $C$DW$122, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$122, DW_AT_name("IDMA1_STAT")
	.dwattr $C$DW$122, DW_AT_TI_symbol_name("IDMA1_STAT")
	.dwattr $C$DW$122, DW_AT_data_member_location[DW_OP_plus_uconst 0x20100]
	.dwattr $C$DW$122, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$122, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$122, DW_AT_decl_line(0x59)
	.dwattr $C$DW$122, DW_AT_decl_column(0x15)
$C$DW$123	.dwtag  DW_TAG_member
	.dwattr $C$DW$123, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$123, DW_AT_name("RSVD14")
	.dwattr $C$DW$123, DW_AT_TI_symbol_name("RSVD14")
	.dwattr $C$DW$123, DW_AT_data_member_location[DW_OP_plus_uconst 0x20104]
	.dwattr $C$DW$123, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$123, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$123, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$123, DW_AT_decl_column(0x14)
$C$DW$124	.dwtag  DW_TAG_member
	.dwattr $C$DW$124, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$124, DW_AT_name("IDMA1_SOURCE")
	.dwattr $C$DW$124, DW_AT_TI_symbol_name("IDMA1_SOURCE")
	.dwattr $C$DW$124, DW_AT_data_member_location[DW_OP_plus_uconst 0x20108]
	.dwattr $C$DW$124, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$124, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$124, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$124, DW_AT_decl_column(0x15)
$C$DW$125	.dwtag  DW_TAG_member
	.dwattr $C$DW$125, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$125, DW_AT_name("IDMA1_DEST")
	.dwattr $C$DW$125, DW_AT_TI_symbol_name("IDMA1_DEST")
	.dwattr $C$DW$125, DW_AT_data_member_location[DW_OP_plus_uconst 0x2010c]
	.dwattr $C$DW$125, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$125, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$125, DW_AT_decl_line(0x5c)
	.dwattr $C$DW$125, DW_AT_decl_column(0x15)
$C$DW$126	.dwtag  DW_TAG_member
	.dwattr $C$DW$126, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$126, DW_AT_name("IDMA1_COUNT")
	.dwattr $C$DW$126, DW_AT_TI_symbol_name("IDMA1_COUNT")
	.dwattr $C$DW$126, DW_AT_data_member_location[DW_OP_plus_uconst 0x20110]
	.dwattr $C$DW$126, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$126, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$126, DW_AT_decl_line(0x5d)
	.dwattr $C$DW$126, DW_AT_decl_column(0x15)
$C$DW$127	.dwtag  DW_TAG_member
	.dwattr $C$DW$127, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$127, DW_AT_name("RSVD15")
	.dwattr $C$DW$127, DW_AT_TI_symbol_name("RSVD15")
	.dwattr $C$DW$127, DW_AT_data_member_location[DW_OP_plus_uconst 0x20114]
	.dwattr $C$DW$127, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$127, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$127, DW_AT_decl_line(0x5e)
	.dwattr $C$DW$127, DW_AT_decl_column(0x14)
$C$DW$128	.dwtag  DW_TAG_member
	.dwattr $C$DW$128, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$128, DW_AT_name("CPUARBE")
	.dwattr $C$DW$128, DW_AT_TI_symbol_name("CPUARBE")
	.dwattr $C$DW$128, DW_AT_data_member_location[DW_OP_plus_uconst 0x20200]
	.dwattr $C$DW$128, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$128, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$128, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$128, DW_AT_decl_column(0x15)
$C$DW$129	.dwtag  DW_TAG_member
	.dwattr $C$DW$129, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$129, DW_AT_name("IDMAARBE")
	.dwattr $C$DW$129, DW_AT_TI_symbol_name("IDMAARBE")
	.dwattr $C$DW$129, DW_AT_data_member_location[DW_OP_plus_uconst 0x20204]
	.dwattr $C$DW$129, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$129, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$129, DW_AT_decl_line(0x60)
	.dwattr $C$DW$129, DW_AT_decl_column(0x15)
$C$DW$130	.dwtag  DW_TAG_member
	.dwattr $C$DW$130, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$130, DW_AT_name("SDMAARBE")
	.dwattr $C$DW$130, DW_AT_TI_symbol_name("SDMAARBE")
	.dwattr $C$DW$130, DW_AT_data_member_location[DW_OP_plus_uconst 0x20208]
	.dwattr $C$DW$130, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$130, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$130, DW_AT_decl_line(0x61)
	.dwattr $C$DW$130, DW_AT_decl_column(0x15)
$C$DW$131	.dwtag  DW_TAG_member
	.dwattr $C$DW$131, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$131, DW_AT_name("RSVD16")
	.dwattr $C$DW$131, DW_AT_TI_symbol_name("RSVD16")
	.dwattr $C$DW$131, DW_AT_data_member_location[DW_OP_plus_uconst 0x2020c]
	.dwattr $C$DW$131, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$131, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$131, DW_AT_decl_line(0x62)
	.dwattr $C$DW$131, DW_AT_decl_column(0x14)
$C$DW$132	.dwtag  DW_TAG_member
	.dwattr $C$DW$132, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$132, DW_AT_name("ECFGARBE")
	.dwattr $C$DW$132, DW_AT_TI_symbol_name("ECFGARBE")
	.dwattr $C$DW$132, DW_AT_data_member_location[DW_OP_plus_uconst 0x20210]
	.dwattr $C$DW$132, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$132, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$132, DW_AT_decl_line(0x63)
	.dwattr $C$DW$132, DW_AT_decl_column(0x15)
$C$DW$133	.dwtag  DW_TAG_member
	.dwattr $C$DW$133, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$133, DW_AT_name("RSVD17")
	.dwattr $C$DW$133, DW_AT_TI_symbol_name("RSVD17")
	.dwattr $C$DW$133, DW_AT_data_member_location[DW_OP_plus_uconst 0x20214]
	.dwattr $C$DW$133, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$133, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$133, DW_AT_decl_line(0x64)
	.dwattr $C$DW$133, DW_AT_decl_column(0x14)
$C$DW$134	.dwtag  DW_TAG_member
	.dwattr $C$DW$134, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$134, DW_AT_name("ICFGMPFAR")
	.dwattr $C$DW$134, DW_AT_TI_symbol_name("ICFGMPFAR")
	.dwattr $C$DW$134, DW_AT_data_member_location[DW_OP_plus_uconst 0x20300]
	.dwattr $C$DW$134, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$134, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$134, DW_AT_decl_line(0x65)
	.dwattr $C$DW$134, DW_AT_decl_column(0x15)
$C$DW$135	.dwtag  DW_TAG_member
	.dwattr $C$DW$135, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$135, DW_AT_name("ICFGMPFSR")
	.dwattr $C$DW$135, DW_AT_TI_symbol_name("ICFGMPFSR")
	.dwattr $C$DW$135, DW_AT_data_member_location[DW_OP_plus_uconst 0x20304]
	.dwattr $C$DW$135, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$135, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$135, DW_AT_decl_line(0x66)
	.dwattr $C$DW$135, DW_AT_decl_column(0x15)
$C$DW$136	.dwtag  DW_TAG_member
	.dwattr $C$DW$136, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$136, DW_AT_name("ICFGMPFCR")
	.dwattr $C$DW$136, DW_AT_TI_symbol_name("ICFGMPFCR")
	.dwattr $C$DW$136, DW_AT_data_member_location[DW_OP_plus_uconst 0x20308]
	.dwattr $C$DW$136, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$136, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$136, DW_AT_decl_line(0x67)
	.dwattr $C$DW$136, DW_AT_decl_column(0x15)
$C$DW$137	.dwtag  DW_TAG_member
	.dwattr $C$DW$137, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$137, DW_AT_name("RSVD18")
	.dwattr $C$DW$137, DW_AT_TI_symbol_name("RSVD18")
	.dwattr $C$DW$137, DW_AT_data_member_location[DW_OP_plus_uconst 0x2030c]
	.dwattr $C$DW$137, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$137, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$137, DW_AT_decl_line(0x68)
	.dwattr $C$DW$137, DW_AT_decl_column(0x14)
$C$DW$138	.dwtag  DW_TAG_member
	.dwattr $C$DW$138, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$138, DW_AT_name("ECFGERR")
	.dwattr $C$DW$138, DW_AT_TI_symbol_name("ECFGERR")
	.dwattr $C$DW$138, DW_AT_data_member_location[DW_OP_plus_uconst 0x20408]
	.dwattr $C$DW$138, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$138, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$138, DW_AT_decl_line(0x69)
	.dwattr $C$DW$138, DW_AT_decl_column(0x15)
$C$DW$139	.dwtag  DW_TAG_member
	.dwattr $C$DW$139, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$139, DW_AT_name("ECFGERRCLR")
	.dwattr $C$DW$139, DW_AT_TI_symbol_name("ECFGERRCLR")
	.dwattr $C$DW$139, DW_AT_data_member_location[DW_OP_plus_uconst 0x2040c]
	.dwattr $C$DW$139, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$139, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$139, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$139, DW_AT_decl_column(0x15)
$C$DW$140	.dwtag  DW_TAG_member
	.dwattr $C$DW$140, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$140, DW_AT_name("RSVD19")
	.dwattr $C$DW$140, DW_AT_TI_symbol_name("RSVD19")
	.dwattr $C$DW$140, DW_AT_data_member_location[DW_OP_plus_uconst 0x20410]
	.dwattr $C$DW$140, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$140, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$140, DW_AT_decl_line(0x6b)
	.dwattr $C$DW$140, DW_AT_decl_column(0x14)
$C$DW$141	.dwtag  DW_TAG_member
	.dwattr $C$DW$141, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$141, DW_AT_name("PAMAP0")
	.dwattr $C$DW$141, DW_AT_TI_symbol_name("PAMAP0")
	.dwattr $C$DW$141, DW_AT_data_member_location[DW_OP_plus_uconst 0x20500]
	.dwattr $C$DW$141, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$141, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$141, DW_AT_decl_line(0x6c)
	.dwattr $C$DW$141, DW_AT_decl_column(0x15)
$C$DW$142	.dwtag  DW_TAG_member
	.dwattr $C$DW$142, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$142, DW_AT_name("PAMAP1")
	.dwattr $C$DW$142, DW_AT_TI_symbol_name("PAMAP1")
	.dwattr $C$DW$142, DW_AT_data_member_location[DW_OP_plus_uconst 0x20504]
	.dwattr $C$DW$142, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$142, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$142, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$142, DW_AT_decl_column(0x15)
$C$DW$143	.dwtag  DW_TAG_member
	.dwattr $C$DW$143, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$143, DW_AT_name("PAMAP2")
	.dwattr $C$DW$143, DW_AT_TI_symbol_name("PAMAP2")
	.dwattr $C$DW$143, DW_AT_data_member_location[DW_OP_plus_uconst 0x20508]
	.dwattr $C$DW$143, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$143, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$143, DW_AT_decl_line(0x6e)
	.dwattr $C$DW$143, DW_AT_decl_column(0x15)
$C$DW$144	.dwtag  DW_TAG_member
	.dwattr $C$DW$144, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$144, DW_AT_name("PAMAP3")
	.dwattr $C$DW$144, DW_AT_TI_symbol_name("PAMAP3")
	.dwattr $C$DW$144, DW_AT_data_member_location[DW_OP_plus_uconst 0x2050c]
	.dwattr $C$DW$144, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$144, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$144, DW_AT_decl_line(0x6f)
	.dwattr $C$DW$144, DW_AT_decl_column(0x15)
$C$DW$145	.dwtag  DW_TAG_member
	.dwattr $C$DW$145, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$145, DW_AT_name("PAMAP4")
	.dwattr $C$DW$145, DW_AT_TI_symbol_name("PAMAP4")
	.dwattr $C$DW$145, DW_AT_data_member_location[DW_OP_plus_uconst 0x20510]
	.dwattr $C$DW$145, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$145, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$145, DW_AT_decl_line(0x70)
	.dwattr $C$DW$145, DW_AT_decl_column(0x15)
$C$DW$146	.dwtag  DW_TAG_member
	.dwattr $C$DW$146, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$146, DW_AT_name("PAMAP5")
	.dwattr $C$DW$146, DW_AT_TI_symbol_name("PAMAP5")
	.dwattr $C$DW$146, DW_AT_data_member_location[DW_OP_plus_uconst 0x20514]
	.dwattr $C$DW$146, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$146, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$146, DW_AT_decl_line(0x71)
	.dwattr $C$DW$146, DW_AT_decl_column(0x15)
$C$DW$147	.dwtag  DW_TAG_member
	.dwattr $C$DW$147, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$147, DW_AT_name("PAMAP6")
	.dwattr $C$DW$147, DW_AT_TI_symbol_name("PAMAP6")
	.dwattr $C$DW$147, DW_AT_data_member_location[DW_OP_plus_uconst 0x20518]
	.dwattr $C$DW$147, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$147, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$147, DW_AT_decl_line(0x72)
	.dwattr $C$DW$147, DW_AT_decl_column(0x15)
$C$DW$148	.dwtag  DW_TAG_member
	.dwattr $C$DW$148, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$148, DW_AT_name("PAMAP7")
	.dwattr $C$DW$148, DW_AT_TI_symbol_name("PAMAP7")
	.dwattr $C$DW$148, DW_AT_data_member_location[DW_OP_plus_uconst 0x2051c]
	.dwattr $C$DW$148, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$148, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$148, DW_AT_decl_line(0x73)
	.dwattr $C$DW$148, DW_AT_decl_column(0x15)
$C$DW$149	.dwtag  DW_TAG_member
	.dwattr $C$DW$149, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$149, DW_AT_name("PAMAP8")
	.dwattr $C$DW$149, DW_AT_TI_symbol_name("PAMAP8")
	.dwattr $C$DW$149, DW_AT_data_member_location[DW_OP_plus_uconst 0x20520]
	.dwattr $C$DW$149, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$149, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$149, DW_AT_decl_line(0x74)
	.dwattr $C$DW$149, DW_AT_decl_column(0x15)
$C$DW$150	.dwtag  DW_TAG_member
	.dwattr $C$DW$150, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$150, DW_AT_name("PAMAP9")
	.dwattr $C$DW$150, DW_AT_TI_symbol_name("PAMAP9")
	.dwattr $C$DW$150, DW_AT_data_member_location[DW_OP_plus_uconst 0x20524]
	.dwattr $C$DW$150, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$150, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$150, DW_AT_decl_line(0x75)
	.dwattr $C$DW$150, DW_AT_decl_column(0x15)
$C$DW$151	.dwtag  DW_TAG_member
	.dwattr $C$DW$151, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$151, DW_AT_name("PAMAP10")
	.dwattr $C$DW$151, DW_AT_TI_symbol_name("PAMAP10")
	.dwattr $C$DW$151, DW_AT_data_member_location[DW_OP_plus_uconst 0x20528]
	.dwattr $C$DW$151, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$151, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$151, DW_AT_decl_line(0x76)
	.dwattr $C$DW$151, DW_AT_decl_column(0x15)
$C$DW$152	.dwtag  DW_TAG_member
	.dwattr $C$DW$152, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$152, DW_AT_name("PAMAP11")
	.dwattr $C$DW$152, DW_AT_TI_symbol_name("PAMAP11")
	.dwattr $C$DW$152, DW_AT_data_member_location[DW_OP_plus_uconst 0x2052c]
	.dwattr $C$DW$152, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$152, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$152, DW_AT_decl_line(0x77)
	.dwattr $C$DW$152, DW_AT_decl_column(0x15)
$C$DW$153	.dwtag  DW_TAG_member
	.dwattr $C$DW$153, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$153, DW_AT_name("PAMAP12")
	.dwattr $C$DW$153, DW_AT_TI_symbol_name("PAMAP12")
	.dwattr $C$DW$153, DW_AT_data_member_location[DW_OP_plus_uconst 0x20530]
	.dwattr $C$DW$153, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$153, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$153, DW_AT_decl_line(0x78)
	.dwattr $C$DW$153, DW_AT_decl_column(0x15)
$C$DW$154	.dwtag  DW_TAG_member
	.dwattr $C$DW$154, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$154, DW_AT_name("PAMAP13")
	.dwattr $C$DW$154, DW_AT_TI_symbol_name("PAMAP13")
	.dwattr $C$DW$154, DW_AT_data_member_location[DW_OP_plus_uconst 0x20534]
	.dwattr $C$DW$154, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$154, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$154, DW_AT_decl_line(0x79)
	.dwattr $C$DW$154, DW_AT_decl_column(0x15)
$C$DW$155	.dwtag  DW_TAG_member
	.dwattr $C$DW$155, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$155, DW_AT_name("PAMAP14")
	.dwattr $C$DW$155, DW_AT_TI_symbol_name("PAMAP14")
	.dwattr $C$DW$155, DW_AT_data_member_location[DW_OP_plus_uconst 0x20538]
	.dwattr $C$DW$155, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$155, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$155, DW_AT_decl_line(0x7a)
	.dwattr $C$DW$155, DW_AT_decl_column(0x15)
$C$DW$156	.dwtag  DW_TAG_member
	.dwattr $C$DW$156, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$156, DW_AT_name("PAMAP15")
	.dwattr $C$DW$156, DW_AT_TI_symbol_name("PAMAP15")
	.dwattr $C$DW$156, DW_AT_data_member_location[DW_OP_plus_uconst 0x2053c]
	.dwattr $C$DW$156, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$156, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$156, DW_AT_decl_line(0x7b)
	.dwattr $C$DW$156, DW_AT_decl_column(0x15)
$C$DW$157	.dwtag  DW_TAG_member
	.dwattr $C$DW$157, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$157, DW_AT_name("RSVD20")
	.dwattr $C$DW$157, DW_AT_TI_symbol_name("RSVD20")
	.dwattr $C$DW$157, DW_AT_data_member_location[DW_OP_plus_uconst 0x20540]
	.dwattr $C$DW$157, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$157, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$157, DW_AT_decl_line(0x7c)
	.dwattr $C$DW$157, DW_AT_decl_column(0x14)
$C$DW$158	.dwtag  DW_TAG_member
	.dwattr $C$DW$158, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$158, DW_AT_name("L2CFG")
	.dwattr $C$DW$158, DW_AT_TI_symbol_name("L2CFG")
	.dwattr $C$DW$158, DW_AT_data_member_location[DW_OP_plus_uconst 0x40000]
	.dwattr $C$DW$158, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$158, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$158, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$158, DW_AT_decl_column(0x15)
$C$DW$159	.dwtag  DW_TAG_member
	.dwattr $C$DW$159, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$159, DW_AT_name("RSVD21")
	.dwattr $C$DW$159, DW_AT_TI_symbol_name("RSVD21")
	.dwattr $C$DW$159, DW_AT_data_member_location[DW_OP_plus_uconst 0x40004]
	.dwattr $C$DW$159, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$159, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$159, DW_AT_decl_line(0x7e)
	.dwattr $C$DW$159, DW_AT_decl_column(0x14)
$C$DW$160	.dwtag  DW_TAG_member
	.dwattr $C$DW$160, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$160, DW_AT_name("L1PCFG")
	.dwattr $C$DW$160, DW_AT_TI_symbol_name("L1PCFG")
	.dwattr $C$DW$160, DW_AT_data_member_location[DW_OP_plus_uconst 0x40020]
	.dwattr $C$DW$160, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$160, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$160, DW_AT_decl_line(0x7f)
	.dwattr $C$DW$160, DW_AT_decl_column(0x15)
$C$DW$161	.dwtag  DW_TAG_member
	.dwattr $C$DW$161, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$161, DW_AT_name("L1PCC")
	.dwattr $C$DW$161, DW_AT_TI_symbol_name("L1PCC")
	.dwattr $C$DW$161, DW_AT_data_member_location[DW_OP_plus_uconst 0x40024]
	.dwattr $C$DW$161, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$161, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$161, DW_AT_decl_line(0x80)
	.dwattr $C$DW$161, DW_AT_decl_column(0x15)
$C$DW$162	.dwtag  DW_TAG_member
	.dwattr $C$DW$162, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$162, DW_AT_name("RSVD22")
	.dwattr $C$DW$162, DW_AT_TI_symbol_name("RSVD22")
	.dwattr $C$DW$162, DW_AT_data_member_location[DW_OP_plus_uconst 0x40028]
	.dwattr $C$DW$162, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$162, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$162, DW_AT_decl_line(0x81)
	.dwattr $C$DW$162, DW_AT_decl_column(0x14)
$C$DW$163	.dwtag  DW_TAG_member
	.dwattr $C$DW$163, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$163, DW_AT_name("L1DCFG")
	.dwattr $C$DW$163, DW_AT_TI_symbol_name("L1DCFG")
	.dwattr $C$DW$163, DW_AT_data_member_location[DW_OP_plus_uconst 0x40040]
	.dwattr $C$DW$163, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$163, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$163, DW_AT_decl_line(0x82)
	.dwattr $C$DW$163, DW_AT_decl_column(0x15)
$C$DW$164	.dwtag  DW_TAG_member
	.dwattr $C$DW$164, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$164, DW_AT_name("L1DCC")
	.dwattr $C$DW$164, DW_AT_TI_symbol_name("L1DCC")
	.dwattr $C$DW$164, DW_AT_data_member_location[DW_OP_plus_uconst 0x40044]
	.dwattr $C$DW$164, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$164, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$164, DW_AT_decl_line(0x83)
	.dwattr $C$DW$164, DW_AT_decl_column(0x15)
$C$DW$165	.dwtag  DW_TAG_member
	.dwattr $C$DW$165, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$165, DW_AT_name("RSVD23")
	.dwattr $C$DW$165, DW_AT_TI_symbol_name("RSVD23")
	.dwattr $C$DW$165, DW_AT_data_member_location[DW_OP_plus_uconst 0x40048]
	.dwattr $C$DW$165, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$165, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$165, DW_AT_decl_line(0x84)
	.dwattr $C$DW$165, DW_AT_decl_column(0x14)
$C$DW$166	.dwtag  DW_TAG_member
	.dwattr $C$DW$166, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$166, DW_AT_name("CPUARBU")
	.dwattr $C$DW$166, DW_AT_TI_symbol_name("CPUARBU")
	.dwattr $C$DW$166, DW_AT_data_member_location[DW_OP_plus_uconst 0x41000]
	.dwattr $C$DW$166, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$166, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$166, DW_AT_decl_line(0x85)
	.dwattr $C$DW$166, DW_AT_decl_column(0x15)
$C$DW$167	.dwtag  DW_TAG_member
	.dwattr $C$DW$167, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$167, DW_AT_name("IDMAARBU")
	.dwattr $C$DW$167, DW_AT_TI_symbol_name("IDMAARBU")
	.dwattr $C$DW$167, DW_AT_data_member_location[DW_OP_plus_uconst 0x41004]
	.dwattr $C$DW$167, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$167, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$167, DW_AT_decl_line(0x86)
	.dwattr $C$DW$167, DW_AT_decl_column(0x15)
$C$DW$168	.dwtag  DW_TAG_member
	.dwattr $C$DW$168, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$168, DW_AT_name("SDMAARBU")
	.dwattr $C$DW$168, DW_AT_TI_symbol_name("SDMAARBU")
	.dwattr $C$DW$168, DW_AT_data_member_location[DW_OP_plus_uconst 0x41008]
	.dwattr $C$DW$168, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$168, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$168, DW_AT_decl_line(0x87)
	.dwattr $C$DW$168, DW_AT_decl_column(0x15)
$C$DW$169	.dwtag  DW_TAG_member
	.dwattr $C$DW$169, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$169, DW_AT_name("UCARBU")
	.dwattr $C$DW$169, DW_AT_TI_symbol_name("UCARBU")
	.dwattr $C$DW$169, DW_AT_data_member_location[DW_OP_plus_uconst 0x4100c]
	.dwattr $C$DW$169, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$169, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$169, DW_AT_decl_line(0x88)
	.dwattr $C$DW$169, DW_AT_decl_column(0x15)
$C$DW$170	.dwtag  DW_TAG_member
	.dwattr $C$DW$170, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$170, DW_AT_name("MDMAARBU")
	.dwattr $C$DW$170, DW_AT_TI_symbol_name("MDMAARBU")
	.dwattr $C$DW$170, DW_AT_data_member_location[DW_OP_plus_uconst 0x41010]
	.dwattr $C$DW$170, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$170, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$170, DW_AT_decl_line(0x89)
	.dwattr $C$DW$170, DW_AT_decl_column(0x15)
$C$DW$171	.dwtag  DW_TAG_member
	.dwattr $C$DW$171, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$171, DW_AT_name("RSVD24")
	.dwattr $C$DW$171, DW_AT_TI_symbol_name("RSVD24")
	.dwattr $C$DW$171, DW_AT_data_member_location[DW_OP_plus_uconst 0x41014]
	.dwattr $C$DW$171, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$171, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$171, DW_AT_decl_line(0x8a)
	.dwattr $C$DW$171, DW_AT_decl_column(0x14)
$C$DW$172	.dwtag  DW_TAG_member
	.dwattr $C$DW$172, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$172, DW_AT_name("CPUARBD")
	.dwattr $C$DW$172, DW_AT_TI_symbol_name("CPUARBD")
	.dwattr $C$DW$172, DW_AT_data_member_location[DW_OP_plus_uconst 0x41040]
	.dwattr $C$DW$172, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$172, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$172, DW_AT_decl_line(0x8b)
	.dwattr $C$DW$172, DW_AT_decl_column(0x15)
$C$DW$173	.dwtag  DW_TAG_member
	.dwattr $C$DW$173, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$173, DW_AT_name("IDMAARBD")
	.dwattr $C$DW$173, DW_AT_TI_symbol_name("IDMAARBD")
	.dwattr $C$DW$173, DW_AT_data_member_location[DW_OP_plus_uconst 0x41044]
	.dwattr $C$DW$173, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$173, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$173, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$173, DW_AT_decl_column(0x15)
$C$DW$174	.dwtag  DW_TAG_member
	.dwattr $C$DW$174, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$174, DW_AT_name("SDMAARBD")
	.dwattr $C$DW$174, DW_AT_TI_symbol_name("SDMAARBD")
	.dwattr $C$DW$174, DW_AT_data_member_location[DW_OP_plus_uconst 0x41048]
	.dwattr $C$DW$174, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$174, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$174, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$174, DW_AT_decl_column(0x15)
$C$DW$175	.dwtag  DW_TAG_member
	.dwattr $C$DW$175, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$175, DW_AT_name("UCARBD")
	.dwattr $C$DW$175, DW_AT_TI_symbol_name("UCARBD")
	.dwattr $C$DW$175, DW_AT_data_member_location[DW_OP_plus_uconst 0x4104c]
	.dwattr $C$DW$175, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$175, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$175, DW_AT_decl_line(0x8e)
	.dwattr $C$DW$175, DW_AT_decl_column(0x15)
$C$DW$176	.dwtag  DW_TAG_member
	.dwattr $C$DW$176, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$176, DW_AT_name("RSVD25")
	.dwattr $C$DW$176, DW_AT_TI_symbol_name("RSVD25")
	.dwattr $C$DW$176, DW_AT_data_member_location[DW_OP_plus_uconst 0x41050]
	.dwattr $C$DW$176, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$176, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$176, DW_AT_decl_line(0x8f)
	.dwattr $C$DW$176, DW_AT_decl_column(0x14)
$C$DW$177	.dwtag  DW_TAG_member
	.dwattr $C$DW$177, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$177, DW_AT_name("L2WBAR")
	.dwattr $C$DW$177, DW_AT_TI_symbol_name("L2WBAR")
	.dwattr $C$DW$177, DW_AT_data_member_location[DW_OP_plus_uconst 0x44000]
	.dwattr $C$DW$177, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$177, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$177, DW_AT_decl_line(0x90)
	.dwattr $C$DW$177, DW_AT_decl_column(0x15)
$C$DW$178	.dwtag  DW_TAG_member
	.dwattr $C$DW$178, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$178, DW_AT_name("L2WWC")
	.dwattr $C$DW$178, DW_AT_TI_symbol_name("L2WWC")
	.dwattr $C$DW$178, DW_AT_data_member_location[DW_OP_plus_uconst 0x44004]
	.dwattr $C$DW$178, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$178, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$178, DW_AT_decl_line(0x91)
	.dwattr $C$DW$178, DW_AT_decl_column(0x15)
$C$DW$179	.dwtag  DW_TAG_member
	.dwattr $C$DW$179, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$179, DW_AT_name("RSVD26")
	.dwattr $C$DW$179, DW_AT_TI_symbol_name("RSVD26")
	.dwattr $C$DW$179, DW_AT_data_member_location[DW_OP_plus_uconst 0x44008]
	.dwattr $C$DW$179, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$179, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$179, DW_AT_decl_line(0x92)
	.dwattr $C$DW$179, DW_AT_decl_column(0x14)
$C$DW$180	.dwtag  DW_TAG_member
	.dwattr $C$DW$180, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$180, DW_AT_name("L2WIBAR")
	.dwattr $C$DW$180, DW_AT_TI_symbol_name("L2WIBAR")
	.dwattr $C$DW$180, DW_AT_data_member_location[DW_OP_plus_uconst 0x44010]
	.dwattr $C$DW$180, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$180, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$180, DW_AT_decl_line(0x93)
	.dwattr $C$DW$180, DW_AT_decl_column(0x15)
$C$DW$181	.dwtag  DW_TAG_member
	.dwattr $C$DW$181, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$181, DW_AT_name("L2WIWC")
	.dwattr $C$DW$181, DW_AT_TI_symbol_name("L2WIWC")
	.dwattr $C$DW$181, DW_AT_data_member_location[DW_OP_plus_uconst 0x44014]
	.dwattr $C$DW$181, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$181, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$181, DW_AT_decl_line(0x94)
	.dwattr $C$DW$181, DW_AT_decl_column(0x15)
$C$DW$182	.dwtag  DW_TAG_member
	.dwattr $C$DW$182, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$182, DW_AT_name("L2IBAR")
	.dwattr $C$DW$182, DW_AT_TI_symbol_name("L2IBAR")
	.dwattr $C$DW$182, DW_AT_data_member_location[DW_OP_plus_uconst 0x44018]
	.dwattr $C$DW$182, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$182, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$182, DW_AT_decl_line(0x95)
	.dwattr $C$DW$182, DW_AT_decl_column(0x15)
$C$DW$183	.dwtag  DW_TAG_member
	.dwattr $C$DW$183, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$183, DW_AT_name("L2IWC")
	.dwattr $C$DW$183, DW_AT_TI_symbol_name("L2IWC")
	.dwattr $C$DW$183, DW_AT_data_member_location[DW_OP_plus_uconst 0x4401c]
	.dwattr $C$DW$183, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$183, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$183, DW_AT_decl_line(0x96)
	.dwattr $C$DW$183, DW_AT_decl_column(0x15)
$C$DW$184	.dwtag  DW_TAG_member
	.dwattr $C$DW$184, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$184, DW_AT_name("L1PIBAR")
	.dwattr $C$DW$184, DW_AT_TI_symbol_name("L1PIBAR")
	.dwattr $C$DW$184, DW_AT_data_member_location[DW_OP_plus_uconst 0x44020]
	.dwattr $C$DW$184, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$184, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$184, DW_AT_decl_line(0x97)
	.dwattr $C$DW$184, DW_AT_decl_column(0x15)
$C$DW$185	.dwtag  DW_TAG_member
	.dwattr $C$DW$185, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$185, DW_AT_name("L1PIWC")
	.dwattr $C$DW$185, DW_AT_TI_symbol_name("L1PIWC")
	.dwattr $C$DW$185, DW_AT_data_member_location[DW_OP_plus_uconst 0x44024]
	.dwattr $C$DW$185, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$185, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$185, DW_AT_decl_line(0x98)
	.dwattr $C$DW$185, DW_AT_decl_column(0x15)
$C$DW$186	.dwtag  DW_TAG_member
	.dwattr $C$DW$186, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$186, DW_AT_name("RSVD27")
	.dwattr $C$DW$186, DW_AT_TI_symbol_name("RSVD27")
	.dwattr $C$DW$186, DW_AT_data_member_location[DW_OP_plus_uconst 0x44028]
	.dwattr $C$DW$186, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$186, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$186, DW_AT_decl_line(0x99)
	.dwattr $C$DW$186, DW_AT_decl_column(0x14)
$C$DW$187	.dwtag  DW_TAG_member
	.dwattr $C$DW$187, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$187, DW_AT_name("L1DWIBAR")
	.dwattr $C$DW$187, DW_AT_TI_symbol_name("L1DWIBAR")
	.dwattr $C$DW$187, DW_AT_data_member_location[DW_OP_plus_uconst 0x44030]
	.dwattr $C$DW$187, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$187, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$187, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$187, DW_AT_decl_column(0x15)
$C$DW$188	.dwtag  DW_TAG_member
	.dwattr $C$DW$188, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$188, DW_AT_name("L1DWIWC")
	.dwattr $C$DW$188, DW_AT_TI_symbol_name("L1DWIWC")
	.dwattr $C$DW$188, DW_AT_data_member_location[DW_OP_plus_uconst 0x44034]
	.dwattr $C$DW$188, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$188, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$188, DW_AT_decl_line(0x9b)
	.dwattr $C$DW$188, DW_AT_decl_column(0x15)
$C$DW$189	.dwtag  DW_TAG_member
	.dwattr $C$DW$189, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$189, DW_AT_name("RSVD28")
	.dwattr $C$DW$189, DW_AT_TI_symbol_name("RSVD28")
	.dwattr $C$DW$189, DW_AT_data_member_location[DW_OP_plus_uconst 0x44038]
	.dwattr $C$DW$189, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$189, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$189, DW_AT_decl_line(0x9c)
	.dwattr $C$DW$189, DW_AT_decl_column(0x14)
$C$DW$190	.dwtag  DW_TAG_member
	.dwattr $C$DW$190, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$190, DW_AT_name("L1DWBAR")
	.dwattr $C$DW$190, DW_AT_TI_symbol_name("L1DWBAR")
	.dwattr $C$DW$190, DW_AT_data_member_location[DW_OP_plus_uconst 0x44040]
	.dwattr $C$DW$190, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$190, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$190, DW_AT_decl_line(0x9d)
	.dwattr $C$DW$190, DW_AT_decl_column(0x15)
$C$DW$191	.dwtag  DW_TAG_member
	.dwattr $C$DW$191, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$191, DW_AT_name("L1DWWC")
	.dwattr $C$DW$191, DW_AT_TI_symbol_name("L1DWWC")
	.dwattr $C$DW$191, DW_AT_data_member_location[DW_OP_plus_uconst 0x44044]
	.dwattr $C$DW$191, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$191, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$191, DW_AT_decl_line(0x9e)
	.dwattr $C$DW$191, DW_AT_decl_column(0x15)
$C$DW$192	.dwtag  DW_TAG_member
	.dwattr $C$DW$192, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$192, DW_AT_name("L1DIBAR")
	.dwattr $C$DW$192, DW_AT_TI_symbol_name("L1DIBAR")
	.dwattr $C$DW$192, DW_AT_data_member_location[DW_OP_plus_uconst 0x44048]
	.dwattr $C$DW$192, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$192, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$192, DW_AT_decl_line(0x9f)
	.dwattr $C$DW$192, DW_AT_decl_column(0x15)
$C$DW$193	.dwtag  DW_TAG_member
	.dwattr $C$DW$193, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$193, DW_AT_name("L1DIWC")
	.dwattr $C$DW$193, DW_AT_TI_symbol_name("L1DIWC")
	.dwattr $C$DW$193, DW_AT_data_member_location[DW_OP_plus_uconst 0x4404c]
	.dwattr $C$DW$193, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$193, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$193, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$193, DW_AT_decl_column(0x15)
$C$DW$194	.dwtag  DW_TAG_member
	.dwattr $C$DW$194, DW_AT_type(*$C$DW$T$43)
	.dwattr $C$DW$194, DW_AT_name("RSVD29")
	.dwattr $C$DW$194, DW_AT_TI_symbol_name("RSVD29")
	.dwattr $C$DW$194, DW_AT_data_member_location[DW_OP_plus_uconst 0x44050]
	.dwattr $C$DW$194, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$194, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$194, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$194, DW_AT_decl_column(0x14)
$C$DW$195	.dwtag  DW_TAG_member
	.dwattr $C$DW$195, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$195, DW_AT_name("L2WB")
	.dwattr $C$DW$195, DW_AT_TI_symbol_name("L2WB")
	.dwattr $C$DW$195, DW_AT_data_member_location[DW_OP_plus_uconst 0x45000]
	.dwattr $C$DW$195, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$195, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$195, DW_AT_decl_line(0xa2)
	.dwattr $C$DW$195, DW_AT_decl_column(0x15)
$C$DW$196	.dwtag  DW_TAG_member
	.dwattr $C$DW$196, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$196, DW_AT_name("L2WBINV")
	.dwattr $C$DW$196, DW_AT_TI_symbol_name("L2WBINV")
	.dwattr $C$DW$196, DW_AT_data_member_location[DW_OP_plus_uconst 0x45004]
	.dwattr $C$DW$196, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$196, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$196, DW_AT_decl_line(0xa3)
	.dwattr $C$DW$196, DW_AT_decl_column(0x15)
$C$DW$197	.dwtag  DW_TAG_member
	.dwattr $C$DW$197, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$197, DW_AT_name("L2INV")
	.dwattr $C$DW$197, DW_AT_TI_symbol_name("L2INV")
	.dwattr $C$DW$197, DW_AT_data_member_location[DW_OP_plus_uconst 0x45008]
	.dwattr $C$DW$197, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$197, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$197, DW_AT_decl_line(0xa4)
	.dwattr $C$DW$197, DW_AT_decl_column(0x15)
$C$DW$198	.dwtag  DW_TAG_member
	.dwattr $C$DW$198, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$198, DW_AT_name("RSVD30")
	.dwattr $C$DW$198, DW_AT_TI_symbol_name("RSVD30")
	.dwattr $C$DW$198, DW_AT_data_member_location[DW_OP_plus_uconst 0x4500c]
	.dwattr $C$DW$198, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$198, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$198, DW_AT_decl_line(0xa5)
	.dwattr $C$DW$198, DW_AT_decl_column(0x14)
$C$DW$199	.dwtag  DW_TAG_member
	.dwattr $C$DW$199, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$199, DW_AT_name("L1PINV")
	.dwattr $C$DW$199, DW_AT_TI_symbol_name("L1PINV")
	.dwattr $C$DW$199, DW_AT_data_member_location[DW_OP_plus_uconst 0x45028]
	.dwattr $C$DW$199, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$199, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$199, DW_AT_decl_line(0xa6)
	.dwattr $C$DW$199, DW_AT_decl_column(0x15)
$C$DW$200	.dwtag  DW_TAG_member
	.dwattr $C$DW$200, DW_AT_type(*$C$DW$T$26)
	.dwattr $C$DW$200, DW_AT_name("RSVD31")
	.dwattr $C$DW$200, DW_AT_TI_symbol_name("RSVD31")
	.dwattr $C$DW$200, DW_AT_data_member_location[DW_OP_plus_uconst 0x4502c]
	.dwattr $C$DW$200, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$200, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$200, DW_AT_decl_line(0xa7)
	.dwattr $C$DW$200, DW_AT_decl_column(0x14)
$C$DW$201	.dwtag  DW_TAG_member
	.dwattr $C$DW$201, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$201, DW_AT_name("L1DWB")
	.dwattr $C$DW$201, DW_AT_TI_symbol_name("L1DWB")
	.dwattr $C$DW$201, DW_AT_data_member_location[DW_OP_plus_uconst 0x45040]
	.dwattr $C$DW$201, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$201, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$201, DW_AT_decl_line(0xa8)
	.dwattr $C$DW$201, DW_AT_decl_column(0x15)
$C$DW$202	.dwtag  DW_TAG_member
	.dwattr $C$DW$202, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$202, DW_AT_name("L1DWBINV")
	.dwattr $C$DW$202, DW_AT_TI_symbol_name("L1DWBINV")
	.dwattr $C$DW$202, DW_AT_data_member_location[DW_OP_plus_uconst 0x45044]
	.dwattr $C$DW$202, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$202, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$202, DW_AT_decl_line(0xa9)
	.dwattr $C$DW$202, DW_AT_decl_column(0x15)
$C$DW$203	.dwtag  DW_TAG_member
	.dwattr $C$DW$203, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$203, DW_AT_name("L1DINV")
	.dwattr $C$DW$203, DW_AT_TI_symbol_name("L1DINV")
	.dwattr $C$DW$203, DW_AT_data_member_location[DW_OP_plus_uconst 0x45048]
	.dwattr $C$DW$203, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$203, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$203, DW_AT_decl_line(0xaa)
	.dwattr $C$DW$203, DW_AT_decl_column(0x15)
$C$DW$204	.dwtag  DW_TAG_member
	.dwattr $C$DW$204, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$204, DW_AT_name("RSVD32")
	.dwattr $C$DW$204, DW_AT_TI_symbol_name("RSVD32")
	.dwattr $C$DW$204, DW_AT_data_member_location[DW_OP_plus_uconst 0x4504c]
	.dwattr $C$DW$204, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$204, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$204, DW_AT_decl_line(0xab)
	.dwattr $C$DW$204, DW_AT_decl_column(0x14)
$C$DW$205	.dwtag  DW_TAG_member
	.dwattr $C$DW$205, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$205, DW_AT_name("L2EDSTAT")
	.dwattr $C$DW$205, DW_AT_TI_symbol_name("L2EDSTAT")
	.dwattr $C$DW$205, DW_AT_data_member_location[DW_OP_plus_uconst 0x46004]
	.dwattr $C$DW$205, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$205, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$205, DW_AT_decl_line(0xac)
	.dwattr $C$DW$205, DW_AT_decl_column(0x15)
$C$DW$206	.dwtag  DW_TAG_member
	.dwattr $C$DW$206, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$206, DW_AT_name("L2EDCMD")
	.dwattr $C$DW$206, DW_AT_TI_symbol_name("L2EDCMD")
	.dwattr $C$DW$206, DW_AT_data_member_location[DW_OP_plus_uconst 0x46008]
	.dwattr $C$DW$206, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$206, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$206, DW_AT_decl_line(0xad)
	.dwattr $C$DW$206, DW_AT_decl_column(0x15)
$C$DW$207	.dwtag  DW_TAG_member
	.dwattr $C$DW$207, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$207, DW_AT_name("L2EDADDR")
	.dwattr $C$DW$207, DW_AT_TI_symbol_name("L2EDADDR")
	.dwattr $C$DW$207, DW_AT_data_member_location[DW_OP_plus_uconst 0x4600c]
	.dwattr $C$DW$207, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$207, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$207, DW_AT_decl_line(0xae)
	.dwattr $C$DW$207, DW_AT_decl_column(0x15)
$C$DW$208	.dwtag  DW_TAG_member
	.dwattr $C$DW$208, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$208, DW_AT_name("RSVD33")
	.dwattr $C$DW$208, DW_AT_TI_symbol_name("RSVD33")
	.dwattr $C$DW$208, DW_AT_data_member_location[DW_OP_plus_uconst 0x46010]
	.dwattr $C$DW$208, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$208, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$208, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$208, DW_AT_decl_column(0x14)
$C$DW$209	.dwtag  DW_TAG_member
	.dwattr $C$DW$209, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$209, DW_AT_name("L2EDCPEC")
	.dwattr $C$DW$209, DW_AT_TI_symbol_name("L2EDCPEC")
	.dwattr $C$DW$209, DW_AT_data_member_location[DW_OP_plus_uconst 0x46018]
	.dwattr $C$DW$209, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$209, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$209, DW_AT_decl_line(0xb0)
	.dwattr $C$DW$209, DW_AT_decl_column(0x15)
$C$DW$210	.dwtag  DW_TAG_member
	.dwattr $C$DW$210, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$210, DW_AT_name("L2EDCNEC")
	.dwattr $C$DW$210, DW_AT_TI_symbol_name("L2EDCNEC")
	.dwattr $C$DW$210, DW_AT_data_member_location[DW_OP_plus_uconst 0x4601c]
	.dwattr $C$DW$210, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$210, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$210, DW_AT_decl_line(0xb1)
	.dwattr $C$DW$210, DW_AT_decl_column(0x15)
$C$DW$211	.dwtag  DW_TAG_member
	.dwattr $C$DW$211, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$211, DW_AT_name("MDMAERR")
	.dwattr $C$DW$211, DW_AT_TI_symbol_name("MDMAERR")
	.dwattr $C$DW$211, DW_AT_data_member_location[DW_OP_plus_uconst 0x46020]
	.dwattr $C$DW$211, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$211, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$211, DW_AT_decl_line(0xb2)
	.dwattr $C$DW$211, DW_AT_decl_column(0x15)
$C$DW$212	.dwtag  DW_TAG_member
	.dwattr $C$DW$212, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$212, DW_AT_name("MDMAERRCLR")
	.dwattr $C$DW$212, DW_AT_TI_symbol_name("MDMAERRCLR")
	.dwattr $C$DW$212, DW_AT_data_member_location[DW_OP_plus_uconst 0x46024]
	.dwattr $C$DW$212, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$212, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$212, DW_AT_decl_line(0xb3)
	.dwattr $C$DW$212, DW_AT_decl_column(0x15)
$C$DW$213	.dwtag  DW_TAG_member
	.dwattr $C$DW$213, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$213, DW_AT_name("RSVD34")
	.dwattr $C$DW$213, DW_AT_TI_symbol_name("RSVD34")
	.dwattr $C$DW$213, DW_AT_data_member_location[DW_OP_plus_uconst 0x46028]
	.dwattr $C$DW$213, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$213, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$213, DW_AT_decl_line(0xb4)
	.dwattr $C$DW$213, DW_AT_decl_column(0x14)
$C$DW$214	.dwtag  DW_TAG_member
	.dwattr $C$DW$214, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$214, DW_AT_name("L2EDCEN")
	.dwattr $C$DW$214, DW_AT_TI_symbol_name("L2EDCEN")
	.dwattr $C$DW$214, DW_AT_data_member_location[DW_OP_plus_uconst 0x46030]
	.dwattr $C$DW$214, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$214, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$214, DW_AT_decl_line(0xb5)
	.dwattr $C$DW$214, DW_AT_decl_column(0x15)
$C$DW$215	.dwtag  DW_TAG_member
	.dwattr $C$DW$215, DW_AT_type(*$C$DW$T$44)
	.dwattr $C$DW$215, DW_AT_name("RSVD35")
	.dwattr $C$DW$215, DW_AT_TI_symbol_name("RSVD35")
	.dwattr $C$DW$215, DW_AT_data_member_location[DW_OP_plus_uconst 0x46034]
	.dwattr $C$DW$215, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$215, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$215, DW_AT_decl_line(0xb6)
	.dwattr $C$DW$215, DW_AT_decl_column(0x14)
$C$DW$216	.dwtag  DW_TAG_member
	.dwattr $C$DW$216, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$216, DW_AT_name("L1PEDSTAT")
	.dwattr $C$DW$216, DW_AT_TI_symbol_name("L1PEDSTAT")
	.dwattr $C$DW$216, DW_AT_data_member_location[DW_OP_plus_uconst 0x46404]
	.dwattr $C$DW$216, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$216, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$216, DW_AT_decl_line(0xb7)
	.dwattr $C$DW$216, DW_AT_decl_column(0x15)
$C$DW$217	.dwtag  DW_TAG_member
	.dwattr $C$DW$217, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$217, DW_AT_name("L1PEDCMD")
	.dwattr $C$DW$217, DW_AT_TI_symbol_name("L1PEDCMD")
	.dwattr $C$DW$217, DW_AT_data_member_location[DW_OP_plus_uconst 0x46408]
	.dwattr $C$DW$217, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$217, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$217, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$217, DW_AT_decl_column(0x15)
$C$DW$218	.dwtag  DW_TAG_member
	.dwattr $C$DW$218, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$218, DW_AT_name("L1PEDADDR")
	.dwattr $C$DW$218, DW_AT_TI_symbol_name("L1PEDADDR")
	.dwattr $C$DW$218, DW_AT_data_member_location[DW_OP_plus_uconst 0x4640c]
	.dwattr $C$DW$218, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$218, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$218, DW_AT_decl_line(0xb9)
	.dwattr $C$DW$218, DW_AT_decl_column(0x15)
$C$DW$219	.dwtag  DW_TAG_member
	.dwattr $C$DW$219, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$219, DW_AT_name("RSVD36")
	.dwattr $C$DW$219, DW_AT_TI_symbol_name("RSVD36")
	.dwattr $C$DW$219, DW_AT_data_member_location[DW_OP_plus_uconst 0x46410]
	.dwattr $C$DW$219, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$219, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$219, DW_AT_decl_line(0xba)
	.dwattr $C$DW$219, DW_AT_decl_column(0x14)
$C$DW$220	.dwtag  DW_TAG_member
	.dwattr $C$DW$220, DW_AT_type(*$C$DW$T$46)
	.dwattr $C$DW$220, DW_AT_name("MAR")
	.dwattr $C$DW$220, DW_AT_TI_symbol_name("MAR")
	.dwattr $C$DW$220, DW_AT_data_member_location[DW_OP_plus_uconst 0x48000]
	.dwattr $C$DW$220, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$220, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$220, DW_AT_decl_line(0x1bd)
	.dwattr $C$DW$220, DW_AT_decl_column(0x15)
$C$DW$221	.dwtag  DW_TAG_member
	.dwattr $C$DW$221, DW_AT_type(*$C$DW$T$47)
	.dwattr $C$DW$221, DW_AT_name("RSVD37")
	.dwattr $C$DW$221, DW_AT_TI_symbol_name("RSVD37")
	.dwattr $C$DW$221, DW_AT_data_member_location[DW_OP_plus_uconst 0x48400]
	.dwattr $C$DW$221, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$221, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$221, DW_AT_decl_line(0x1bf)
	.dwattr $C$DW$221, DW_AT_decl_column(0x14)
$C$DW$222	.dwtag  DW_TAG_member
	.dwattr $C$DW$222, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$222, DW_AT_name("L2MPFAR")
	.dwattr $C$DW$222, DW_AT_TI_symbol_name("L2MPFAR")
	.dwattr $C$DW$222, DW_AT_data_member_location[DW_OP_plus_uconst 0x4a000]
	.dwattr $C$DW$222, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$222, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$222, DW_AT_decl_line(0x1c0)
	.dwattr $C$DW$222, DW_AT_decl_column(0x15)
$C$DW$223	.dwtag  DW_TAG_member
	.dwattr $C$DW$223, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$223, DW_AT_name("L2MPFSR")
	.dwattr $C$DW$223, DW_AT_TI_symbol_name("L2MPFSR")
	.dwattr $C$DW$223, DW_AT_data_member_location[DW_OP_plus_uconst 0x4a004]
	.dwattr $C$DW$223, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$223, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$223, DW_AT_decl_line(0x1c1)
	.dwattr $C$DW$223, DW_AT_decl_column(0x15)
$C$DW$224	.dwtag  DW_TAG_member
	.dwattr $C$DW$224, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$224, DW_AT_name("L2MPFCR")
	.dwattr $C$DW$224, DW_AT_TI_symbol_name("L2MPFCR")
	.dwattr $C$DW$224, DW_AT_data_member_location[DW_OP_plus_uconst 0x4a008]
	.dwattr $C$DW$224, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$224, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$224, DW_AT_decl_line(0x1c2)
	.dwattr $C$DW$224, DW_AT_decl_column(0x15)
$C$DW$225	.dwtag  DW_TAG_member
	.dwattr $C$DW$225, DW_AT_type(*$C$DW$T$48)
	.dwattr $C$DW$225, DW_AT_name("RSVD38")
	.dwattr $C$DW$225, DW_AT_TI_symbol_name("RSVD38")
	.dwattr $C$DW$225, DW_AT_data_member_location[DW_OP_plus_uconst 0x4a00c]
	.dwattr $C$DW$225, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$225, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$225, DW_AT_decl_line(0x1c3)
	.dwattr $C$DW$225, DW_AT_decl_column(0x14)
$C$DW$226	.dwtag  DW_TAG_member
	.dwattr $C$DW$226, DW_AT_type(*$C$DW$T$49)
	.dwattr $C$DW$226, DW_AT_name("L2MPPA")
	.dwattr $C$DW$226, DW_AT_TI_symbol_name("L2MPPA")
	.dwattr $C$DW$226, DW_AT_data_member_location[DW_OP_plus_uconst 0x4a200]
	.dwattr $C$DW$226, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$226, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$226, DW_AT_decl_line(0x1c4)
	.dwattr $C$DW$226, DW_AT_decl_column(0x15)
$C$DW$227	.dwtag  DW_TAG_member
	.dwattr $C$DW$227, DW_AT_type(*$C$DW$T$50)
	.dwattr $C$DW$227, DW_AT_name("RSVD39")
	.dwattr $C$DW$227, DW_AT_TI_symbol_name("RSVD39")
	.dwattr $C$DW$227, DW_AT_data_member_location[DW_OP_plus_uconst 0x4a280]
	.dwattr $C$DW$227, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$227, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$227, DW_AT_decl_line(0x1c5)
	.dwattr $C$DW$227, DW_AT_decl_column(0x14)
$C$DW$228	.dwtag  DW_TAG_member
	.dwattr $C$DW$228, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$228, DW_AT_name("L1PMPFAR")
	.dwattr $C$DW$228, DW_AT_TI_symbol_name("L1PMPFAR")
	.dwattr $C$DW$228, DW_AT_data_member_location[DW_OP_plus_uconst 0x4a400]
	.dwattr $C$DW$228, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$228, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$228, DW_AT_decl_line(0x1c6)
	.dwattr $C$DW$228, DW_AT_decl_column(0x15)
$C$DW$229	.dwtag  DW_TAG_member
	.dwattr $C$DW$229, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$229, DW_AT_name("L1PMPFSR")
	.dwattr $C$DW$229, DW_AT_TI_symbol_name("L1PMPFSR")
	.dwattr $C$DW$229, DW_AT_data_member_location[DW_OP_plus_uconst 0x4a404]
	.dwattr $C$DW$229, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$229, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$229, DW_AT_decl_line(0x1c7)
	.dwattr $C$DW$229, DW_AT_decl_column(0x15)
$C$DW$230	.dwtag  DW_TAG_member
	.dwattr $C$DW$230, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$230, DW_AT_name("L1PMPFCR")
	.dwattr $C$DW$230, DW_AT_TI_symbol_name("L1PMPFCR")
	.dwattr $C$DW$230, DW_AT_data_member_location[DW_OP_plus_uconst 0x4a408]
	.dwattr $C$DW$230, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$230, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$230, DW_AT_decl_line(0x1c8)
	.dwattr $C$DW$230, DW_AT_decl_column(0x15)
$C$DW$231	.dwtag  DW_TAG_member
	.dwattr $C$DW$231, DW_AT_type(*$C$DW$T$51)
	.dwattr $C$DW$231, DW_AT_name("RSVD40")
	.dwattr $C$DW$231, DW_AT_TI_symbol_name("RSVD40")
	.dwattr $C$DW$231, DW_AT_data_member_location[DW_OP_plus_uconst 0x4a40c]
	.dwattr $C$DW$231, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$231, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$231, DW_AT_decl_line(0x1c9)
	.dwattr $C$DW$231, DW_AT_decl_column(0x14)
$C$DW$232	.dwtag  DW_TAG_member
	.dwattr $C$DW$232, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$232, DW_AT_name("L1PMPPA")
	.dwattr $C$DW$232, DW_AT_TI_symbol_name("L1PMPPA")
	.dwattr $C$DW$232, DW_AT_data_member_location[DW_OP_plus_uconst 0x4a640]
	.dwattr $C$DW$232, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$232, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$232, DW_AT_decl_line(0x1ca)
	.dwattr $C$DW$232, DW_AT_decl_column(0x15)
$C$DW$233	.dwtag  DW_TAG_member
	.dwattr $C$DW$233, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$233, DW_AT_name("RSVD41")
	.dwattr $C$DW$233, DW_AT_TI_symbol_name("RSVD41")
	.dwattr $C$DW$233, DW_AT_data_member_location[DW_OP_plus_uconst 0x4a680]
	.dwattr $C$DW$233, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$233, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$233, DW_AT_decl_line(0x1cb)
	.dwattr $C$DW$233, DW_AT_decl_column(0x14)
$C$DW$234	.dwtag  DW_TAG_member
	.dwattr $C$DW$234, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$234, DW_AT_name("L1DMPFAR")
	.dwattr $C$DW$234, DW_AT_TI_symbol_name("L1DMPFAR")
	.dwattr $C$DW$234, DW_AT_data_member_location[DW_OP_plus_uconst 0x4ac00]
	.dwattr $C$DW$234, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$234, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$234, DW_AT_decl_line(0x1cc)
	.dwattr $C$DW$234, DW_AT_decl_column(0x15)
$C$DW$235	.dwtag  DW_TAG_member
	.dwattr $C$DW$235, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$235, DW_AT_name("L1DMPFSR")
	.dwattr $C$DW$235, DW_AT_TI_symbol_name("L1DMPFSR")
	.dwattr $C$DW$235, DW_AT_data_member_location[DW_OP_plus_uconst 0x4ac04]
	.dwattr $C$DW$235, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$235, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$235, DW_AT_decl_line(0x1cd)
	.dwattr $C$DW$235, DW_AT_decl_column(0x15)
$C$DW$236	.dwtag  DW_TAG_member
	.dwattr $C$DW$236, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$236, DW_AT_name("L1DMPFCR")
	.dwattr $C$DW$236, DW_AT_TI_symbol_name("L1DMPFCR")
	.dwattr $C$DW$236, DW_AT_data_member_location[DW_OP_plus_uconst 0x4ac08]
	.dwattr $C$DW$236, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$236, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$236, DW_AT_decl_line(0x1ce)
	.dwattr $C$DW$236, DW_AT_decl_column(0x15)
$C$DW$237	.dwtag  DW_TAG_member
	.dwattr $C$DW$237, DW_AT_type(*$C$DW$T$54)
	.dwattr $C$DW$237, DW_AT_name("RSVD42")
	.dwattr $C$DW$237, DW_AT_TI_symbol_name("RSVD42")
	.dwattr $C$DW$237, DW_AT_data_member_location[DW_OP_plus_uconst 0x4ac0c]
	.dwattr $C$DW$237, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$237, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$237, DW_AT_decl_line(0x1cf)
	.dwattr $C$DW$237, DW_AT_decl_column(0x14)
$C$DW$238	.dwtag  DW_TAG_member
	.dwattr $C$DW$238, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$238, DW_AT_name("MPLK")
	.dwattr $C$DW$238, DW_AT_TI_symbol_name("MPLK")
	.dwattr $C$DW$238, DW_AT_data_member_location[DW_OP_plus_uconst 0x4ad00]
	.dwattr $C$DW$238, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$238, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$238, DW_AT_decl_line(0x1d0)
	.dwattr $C$DW$238, DW_AT_decl_column(0x15)
$C$DW$239	.dwtag  DW_TAG_member
	.dwattr $C$DW$239, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$239, DW_AT_name("MPLKCMD")
	.dwattr $C$DW$239, DW_AT_TI_symbol_name("MPLKCMD")
	.dwattr $C$DW$239, DW_AT_data_member_location[DW_OP_plus_uconst 0x4ad10]
	.dwattr $C$DW$239, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$239, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$239, DW_AT_decl_line(0x1d1)
	.dwattr $C$DW$239, DW_AT_decl_column(0x15)
$C$DW$240	.dwtag  DW_TAG_member
	.dwattr $C$DW$240, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$240, DW_AT_name("MPLKSTAT")
	.dwattr $C$DW$240, DW_AT_TI_symbol_name("MPLKSTAT")
	.dwattr $C$DW$240, DW_AT_data_member_location[DW_OP_plus_uconst 0x4ad14]
	.dwattr $C$DW$240, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$240, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$240, DW_AT_decl_line(0x1d2)
	.dwattr $C$DW$240, DW_AT_decl_column(0x15)
$C$DW$241	.dwtag  DW_TAG_member
	.dwattr $C$DW$241, DW_AT_type(*$C$DW$T$55)
	.dwattr $C$DW$241, DW_AT_name("RSVD43")
	.dwattr $C$DW$241, DW_AT_TI_symbol_name("RSVD43")
	.dwattr $C$DW$241, DW_AT_data_member_location[DW_OP_plus_uconst 0x4ad18]
	.dwattr $C$DW$241, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$241, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$241, DW_AT_decl_line(0x1d3)
	.dwattr $C$DW$241, DW_AT_decl_column(0x14)
$C$DW$242	.dwtag  DW_TAG_member
	.dwattr $C$DW$242, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$242, DW_AT_name("L1DMPPA")
	.dwattr $C$DW$242, DW_AT_TI_symbol_name("L1DMPPA")
	.dwattr $C$DW$242, DW_AT_data_member_location[DW_OP_plus_uconst 0x4ae40]
	.dwattr $C$DW$242, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$242, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$242, DW_AT_decl_line(0x1d4)
	.dwattr $C$DW$242, DW_AT_decl_column(0x15)
	.dwendtag $C$DW$T$56

	.dwattr $C$DW$T$56, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$T$56, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$56, DW_AT_decl_column(0x11)
$C$DW$T$76	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_CgemRegs")
	.dwattr $C$DW$T$76, DW_AT_type(*$C$DW$T$56)
	.dwattr $C$DW$T$76, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$76, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/cslr_cgem.h")
	.dwattr $C$DW$T$76, DW_AT_decl_line(0x1d5)
	.dwattr $C$DW$T$76, DW_AT_decl_column(0x03)

$C$DW$T$58	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$58, DW_AT_byte_size(0x18)
$C$DW$243	.dwtag  DW_TAG_member
	.dwattr $C$DW$243, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$243, DW_AT_name("fd")
	.dwattr $C$DW$243, DW_AT_TI_symbol_name("fd")
	.dwattr $C$DW$243, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$243, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$243, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdio.h")
	.dwattr $C$DW$243, DW_AT_decl_line(0x48)
	.dwattr $C$DW$243, DW_AT_decl_column(0x0b)
$C$DW$244	.dwtag  DW_TAG_member
	.dwattr $C$DW$244, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$244, DW_AT_name("buf")
	.dwattr $C$DW$244, DW_AT_TI_symbol_name("buf")
	.dwattr $C$DW$244, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$244, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$244, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdio.h")
	.dwattr $C$DW$244, DW_AT_decl_line(0x49)
	.dwattr $C$DW$244, DW_AT_decl_column(0x16)
$C$DW$245	.dwtag  DW_TAG_member
	.dwattr $C$DW$245, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$245, DW_AT_name("pos")
	.dwattr $C$DW$245, DW_AT_TI_symbol_name("pos")
	.dwattr $C$DW$245, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$245, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$245, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdio.h")
	.dwattr $C$DW$245, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$245, DW_AT_decl_column(0x16)
$C$DW$246	.dwtag  DW_TAG_member
	.dwattr $C$DW$246, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$246, DW_AT_name("bufend")
	.dwattr $C$DW$246, DW_AT_TI_symbol_name("bufend")
	.dwattr $C$DW$246, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$246, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$246, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdio.h")
	.dwattr $C$DW$246, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$246, DW_AT_decl_column(0x16)
$C$DW$247	.dwtag  DW_TAG_member
	.dwattr $C$DW$247, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$247, DW_AT_name("buff_stop")
	.dwattr $C$DW$247, DW_AT_TI_symbol_name("buff_stop")
	.dwattr $C$DW$247, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$247, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$247, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdio.h")
	.dwattr $C$DW$247, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$247, DW_AT_decl_column(0x16)
$C$DW$248	.dwtag  DW_TAG_member
	.dwattr $C$DW$248, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$248, DW_AT_name("flags")
	.dwattr $C$DW$248, DW_AT_TI_symbol_name("flags")
	.dwattr $C$DW$248, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$248, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$248, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdio.h")
	.dwattr $C$DW$248, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$248, DW_AT_decl_column(0x16)
	.dwendtag $C$DW$T$58

	.dwattr $C$DW$T$58, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdio.h")
	.dwattr $C$DW$T$58, DW_AT_decl_line(0x47)
	.dwattr $C$DW$T$58, DW_AT_decl_column(0x10)
$C$DW$T$78	.dwtag  DW_TAG_typedef, DW_AT_name("FILE")
	.dwattr $C$DW$T$78, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$T$78, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$78, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdio.h")
	.dwattr $C$DW$T$78, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$T$78, DW_AT_decl_column(0x03)

$C$DW$T$61	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$61, DW_AT_byte_size(0x10)
$C$DW$249	.dwtag  DW_TAG_member
	.dwattr $C$DW$249, DW_AT_type(*$C$DW$T$8)
	.dwattr $C$DW$249, DW_AT_name("daylight")
	.dwattr $C$DW$249, DW_AT_TI_symbol_name("daylight")
	.dwattr $C$DW$249, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$249, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$249, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$249, DW_AT_decl_line(0x51)
	.dwattr $C$DW$249, DW_AT_decl_column(0x0b)
$C$DW$250	.dwtag  DW_TAG_member
	.dwattr $C$DW$250, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$250, DW_AT_name("timezone")
	.dwattr $C$DW$250, DW_AT_TI_symbol_name("timezone")
	.dwattr $C$DW$250, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$250, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$250, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$250, DW_AT_decl_line(0x52)
	.dwattr $C$DW$250, DW_AT_decl_column(0x0b)
$C$DW$251	.dwtag  DW_TAG_member
	.dwattr $C$DW$251, DW_AT_type(*$C$DW$T$60)
	.dwattr $C$DW$251, DW_AT_name("tzname")
	.dwattr $C$DW$251, DW_AT_TI_symbol_name("tzname")
	.dwattr $C$DW$251, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$251, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$251, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$251, DW_AT_decl_line(0x53)
	.dwattr $C$DW$251, DW_AT_decl_column(0x0b)
$C$DW$252	.dwtag  DW_TAG_member
	.dwattr $C$DW$252, DW_AT_type(*$C$DW$T$60)
	.dwattr $C$DW$252, DW_AT_name("dstname")
	.dwattr $C$DW$252, DW_AT_TI_symbol_name("dstname")
	.dwattr $C$DW$252, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$252, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$252, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$252, DW_AT_decl_line(0x54)
	.dwattr $C$DW$252, DW_AT_decl_column(0x0b)
	.dwendtag $C$DW$T$61

	.dwattr $C$DW$T$61, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$T$61, DW_AT_decl_line(0x50)
	.dwattr $C$DW$T$61, DW_AT_decl_column(0x01)
$C$DW$T$79	.dwtag  DW_TAG_typedef, DW_AT_name("TZ")
	.dwattr $C$DW$T$79, DW_AT_type(*$C$DW$T$61)
	.dwattr $C$DW$T$79, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$79, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$T$79, DW_AT_decl_line(0x55)
	.dwattr $C$DW$T$79, DW_AT_decl_column(0x03)
$C$DW$T$2	.dwtag  DW_TAG_unspecified_type
	.dwattr $C$DW$T$2, DW_AT_name("void")
$C$DW$T$3	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$3, DW_AT_type(*$C$DW$T$2)
	.dwattr $C$DW$T$3, DW_AT_address_class(0x20)
$C$DW$T$80	.dwtag  DW_TAG_typedef, DW_AT_name("Ptr")
	.dwattr $C$DW$T$80, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$T$80, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$80, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/tistdtypes.h")
	.dwattr $C$DW$T$80, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$T$80, DW_AT_decl_column(0x11)
$C$DW$T$4	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$4, DW_AT_encoding(DW_ATE_boolean)
	.dwattr $C$DW$T$4, DW_AT_name("bool")
	.dwattr $C$DW$T$4, DW_AT_byte_size(0x01)
$C$DW$T$5	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$5, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$5, DW_AT_name("signed char")
	.dwattr $C$DW$T$5, DW_AT_byte_size(0x01)
$C$DW$T$95	.dwtag  DW_TAG_typedef, DW_AT_name("int8_t")
	.dwattr $C$DW$T$95, DW_AT_type(*$C$DW$T$5)
	.dwattr $C$DW$T$95, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$95, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$95, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$T$95, DW_AT_decl_column(0x1d)
$C$DW$T$96	.dwtag  DW_TAG_typedef, DW_AT_name("int_least8_t")
	.dwattr $C$DW$T$96, DW_AT_type(*$C$DW$T$95)
	.dwattr $C$DW$T$96, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$96, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$96, DW_AT_decl_line(0x39)
	.dwattr $C$DW$T$96, DW_AT_decl_column(0x17)
$C$DW$T$6	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$6, DW_AT_encoding(DW_ATE_unsigned_char)
	.dwattr $C$DW$T$6, DW_AT_name("unsigned char")
	.dwattr $C$DW$T$6, DW_AT_byte_size(0x01)
$C$DW$T$22	.dwtag  DW_TAG_typedef, DW_AT_name("Uint8")
	.dwattr $C$DW$T$22, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$22, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$22, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/tistdtypes.h")
	.dwattr $C$DW$T$22, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$T$22, DW_AT_decl_column(0x1b)
$C$DW$T$97	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_BitMask8")
	.dwattr $C$DW$T$97, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$T$97, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$97, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$97, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$T$97, DW_AT_decl_column(0x19)
$C$DW$T$23	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$23, DW_AT_type(*$C$DW$T$22)
$C$DW$T$98	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_Reg8")
	.dwattr $C$DW$T$98, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$98, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$98, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$98, DW_AT_decl_line(0x3f)
	.dwattr $C$DW$T$98, DW_AT_decl_column(0x19)

$C$DW$T$24	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$24, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$24, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$24, DW_AT_byte_size(0x10)
$C$DW$253	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$253, DW_AT_upper_bound(0x0f)
	.dwendtag $C$DW$T$24


$C$DW$T$25	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$25, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$25, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$25, DW_AT_byte_size(0x30)
$C$DW$254	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$254, DW_AT_upper_bound(0x2f)
	.dwendtag $C$DW$T$25


$C$DW$T$26	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$26, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$26, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$26, DW_AT_byte_size(0x14)
$C$DW$255	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$255, DW_AT_upper_bound(0x13)
	.dwendtag $C$DW$T$26


$C$DW$T$27	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$27, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$27, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$27, DW_AT_byte_size(0x38)
$C$DW$256	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$256, DW_AT_upper_bound(0x37)
	.dwendtag $C$DW$T$27


$C$DW$T$28	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$28, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$28, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$28, DW_AT_byte_size(0x34)
$C$DW$257	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$257, DW_AT_upper_bound(0x33)
	.dwendtag $C$DW$T$28


$C$DW$T$29	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$29, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$29, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$29, DW_AT_byte_size(0xfe3c)
$C$DW$258	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$258, DW_AT_upper_bound(0xfe3b)
	.dwendtag $C$DW$T$29


$C$DW$T$30	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$30, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$30, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$30, DW_AT_byte_size(0x1ffc)
$C$DW$259	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$259, DW_AT_upper_bound(0x1ffb)
	.dwendtag $C$DW$T$30


$C$DW$T$31	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$31, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$31, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$31, DW_AT_byte_size(0xdffc)
$C$DW$260	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$260, DW_AT_upper_bound(0xdffb)
	.dwendtag $C$DW$T$31


$C$DW$T$32	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$32, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$32, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$32, DW_AT_byte_size(0xec)
$C$DW$261	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$261, DW_AT_upper_bound(0xeb)
	.dwendtag $C$DW$T$32


$C$DW$T$33	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$33, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$33, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$33, DW_AT_byte_size(0x04)
$C$DW$262	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$262, DW_AT_upper_bound(0x03)
	.dwendtag $C$DW$T$33


$C$DW$T$34	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$34, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$34, DW_AT_byte_size(0xfc)
$C$DW$263	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$263, DW_AT_upper_bound(0xfb)
	.dwendtag $C$DW$T$34


$C$DW$T$35	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$35, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$35, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$35, DW_AT_byte_size(0xf0)
$C$DW$264	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$264, DW_AT_upper_bound(0xef)
	.dwendtag $C$DW$T$35


$C$DW$T$36	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$36, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$36, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$36, DW_AT_byte_size(0x1fac0)
$C$DW$265	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$265, DW_AT_upper_bound(0x1fabf)
	.dwendtag $C$DW$T$36


$C$DW$T$37	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$37, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$37, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$37, DW_AT_byte_size(0x1c)
$C$DW$266	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$266, DW_AT_upper_bound(0x1b)
	.dwendtag $C$DW$T$37


$C$DW$T$38	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$38, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$38, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$38, DW_AT_byte_size(0x18)
$C$DW$267	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$267, DW_AT_upper_bound(0x17)
	.dwendtag $C$DW$T$38


$C$DW$T$39	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$39, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$39, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$39, DW_AT_byte_size(0xfb8)
$C$DW$268	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$268, DW_AT_upper_bound(0xfb7)
	.dwendtag $C$DW$T$39


$C$DW$T$40	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$40, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$40, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$40, DW_AT_byte_size(0x2c)
$C$DW$269	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$269, DW_AT_upper_bound(0x2b)
	.dwendtag $C$DW$T$40


$C$DW$T$41	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$41, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$41, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$41, DW_AT_byte_size(0x2fb0)
$C$DW$270	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$270, DW_AT_upper_bound(0x2faf)
	.dwendtag $C$DW$T$41


$C$DW$T$42	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$42, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$42, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$42, DW_AT_byte_size(0x08)
$C$DW$271	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$271, DW_AT_upper_bound(0x07)
	.dwendtag $C$DW$T$42


$C$DW$T$43	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$43, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$43, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$43, DW_AT_byte_size(0xfb0)
$C$DW$272	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$272, DW_AT_upper_bound(0xfaf)
	.dwendtag $C$DW$T$43


$C$DW$T$44	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$44, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$44, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$44, DW_AT_byte_size(0x3d0)
$C$DW$273	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$273, DW_AT_upper_bound(0x3cf)
	.dwendtag $C$DW$T$44


$C$DW$T$45	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$45, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$45, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$45, DW_AT_byte_size(0x1bf0)
$C$DW$274	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$274, DW_AT_upper_bound(0x1bef)
	.dwendtag $C$DW$T$45


$C$DW$T$47	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$47, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$47, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$47, DW_AT_byte_size(0x1c00)
$C$DW$275	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$275, DW_AT_upper_bound(0x1bff)
	.dwendtag $C$DW$T$47


$C$DW$T$48	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$48, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$48, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$48, DW_AT_byte_size(0x1f4)
$C$DW$276	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$276, DW_AT_upper_bound(0x1f3)
	.dwendtag $C$DW$T$48


$C$DW$T$50	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$50, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$50, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$50, DW_AT_byte_size(0x180)
$C$DW$277	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$277, DW_AT_upper_bound(0x17f)
	.dwendtag $C$DW$T$50


$C$DW$T$51	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$51, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$51, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$51, DW_AT_byte_size(0x234)
$C$DW$278	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$278, DW_AT_upper_bound(0x233)
	.dwendtag $C$DW$T$51


$C$DW$T$53	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$53, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$53, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$53, DW_AT_byte_size(0x580)
$C$DW$279	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$279, DW_AT_upper_bound(0x57f)
	.dwendtag $C$DW$T$53


$C$DW$T$54	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$54, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$54, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$54, DW_AT_byte_size(0xf4)
$C$DW$280	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$280, DW_AT_upper_bound(0xf3)
	.dwendtag $C$DW$T$54


$C$DW$T$55	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$55, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$T$55, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$55, DW_AT_byte_size(0x128)
$C$DW$281	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$281, DW_AT_upper_bound(0x127)
	.dwendtag $C$DW$T$55

$C$DW$T$57	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$57, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$57, DW_AT_address_class(0x20)
$C$DW$T$99	.dwtag  DW_TAG_typedef, DW_AT_name("uint8_t")
	.dwattr $C$DW$T$99, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$99, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$99, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$99, DW_AT_decl_line(0x2b)
	.dwattr $C$DW$T$99, DW_AT_decl_column(0x1c)
$C$DW$T$100	.dwtag  DW_TAG_typedef, DW_AT_name("uint_least8_t")
	.dwattr $C$DW$T$100, DW_AT_type(*$C$DW$T$99)
	.dwattr $C$DW$T$100, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$100, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$100, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$T$100, DW_AT_decl_column(0x16)
$C$DW$T$7	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$7, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$7, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$7, DW_AT_byte_size(0x02)
$C$DW$T$8	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$8, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$8, DW_AT_name("short")
	.dwattr $C$DW$T$8, DW_AT_byte_size(0x02)
$C$DW$T$101	.dwtag  DW_TAG_typedef, DW_AT_name("Int16")
	.dwattr $C$DW$T$101, DW_AT_type(*$C$DW$T$8)
	.dwattr $C$DW$T$101, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$101, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/tistdtypes.h")
	.dwattr $C$DW$T$101, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$T$101, DW_AT_decl_column(0x14)
$C$DW$T$102	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_ChaNum")
	.dwattr $C$DW$T$102, DW_AT_type(*$C$DW$T$101)
	.dwattr $C$DW$T$102, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$102, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$102, DW_AT_decl_line(0x45)
	.dwattr $C$DW$T$102, DW_AT_decl_column(0x19)
$C$DW$T$103	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_InstNum")
	.dwattr $C$DW$T$103, DW_AT_type(*$C$DW$T$101)
	.dwattr $C$DW$T$103, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$103, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$103, DW_AT_decl_line(0x44)
	.dwattr $C$DW$T$103, DW_AT_decl_column(0x19)
$C$DW$T$104	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_ModuleId")
	.dwattr $C$DW$T$104, DW_AT_type(*$C$DW$T$101)
	.dwattr $C$DW$T$104, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$104, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$104, DW_AT_decl_line(0x38)
	.dwattr $C$DW$T$104, DW_AT_decl_column(0x19)
$C$DW$T$105	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_Status")
	.dwattr $C$DW$T$105, DW_AT_type(*$C$DW$T$101)
	.dwattr $C$DW$T$105, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$105, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$105, DW_AT_decl_line(0x43)
	.dwattr $C$DW$T$105, DW_AT_decl_column(0x19)
$C$DW$T$106	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_Uid")
	.dwattr $C$DW$T$106, DW_AT_type(*$C$DW$T$101)
	.dwattr $C$DW$T$106, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$106, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$106, DW_AT_decl_line(0x37)
	.dwattr $C$DW$T$106, DW_AT_decl_column(0x19)
$C$DW$T$107	.dwtag  DW_TAG_typedef, DW_AT_name("int16_t")
	.dwattr $C$DW$T$107, DW_AT_type(*$C$DW$T$8)
	.dwattr $C$DW$T$107, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$107, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$107, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$107, DW_AT_decl_column(0x1d)
$C$DW$T$108	.dwtag  DW_TAG_typedef, DW_AT_name("int_least16_t")
	.dwattr $C$DW$T$108, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$T$108, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$108, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$108, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$T$108, DW_AT_decl_column(0x17)
$C$DW$T$9	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$9, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$9, DW_AT_name("unsigned short")
	.dwattr $C$DW$T$9, DW_AT_byte_size(0x02)
$C$DW$T$115	.dwtag  DW_TAG_typedef, DW_AT_name("Bool")
	.dwattr $C$DW$T$115, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$T$115, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$115, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/tistdtypes.h")
	.dwattr $C$DW$T$115, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$T$115, DW_AT_decl_column(0x19)
$C$DW$T$109	.dwtag  DW_TAG_typedef, DW_AT_name("Uint16")
	.dwattr $C$DW$T$109, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$T$109, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$109, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/tistdtypes.h")
	.dwattr $C$DW$T$109, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$T$109, DW_AT_decl_column(0x1c)
$C$DW$T$110	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_BitMask16")
	.dwattr $C$DW$T$110, DW_AT_type(*$C$DW$T$109)
	.dwattr $C$DW$T$110, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$110, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$110, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$T$110, DW_AT_decl_column(0x19)
$C$DW$T$111	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$111, DW_AT_type(*$C$DW$T$109)
$C$DW$T$112	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_Reg16")
	.dwattr $C$DW$T$112, DW_AT_type(*$C$DW$T$111)
	.dwattr $C$DW$T$112, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$112, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$112, DW_AT_decl_line(0x40)
	.dwattr $C$DW$T$112, DW_AT_decl_column(0x19)
$C$DW$T$113	.dwtag  DW_TAG_typedef, DW_AT_name("uint16_t")
	.dwattr $C$DW$T$113, DW_AT_type(*$C$DW$T$9)
	.dwattr $C$DW$T$113, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$113, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$113, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$T$113, DW_AT_decl_column(0x1c)
$C$DW$T$114	.dwtag  DW_TAG_typedef, DW_AT_name("uint_least16_t")
	.dwattr $C$DW$T$114, DW_AT_type(*$C$DW$T$113)
	.dwattr $C$DW$T$114, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$114, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$114, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$T$114, DW_AT_decl_column(0x16)
$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)
$C$DW$T$121	.dwtag  DW_TAG_typedef, DW_AT_name("Int")
	.dwattr $C$DW$T$121, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$121, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$121, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/tistdtypes.h")
	.dwattr $C$DW$T$121, DW_AT_decl_line(0x43)
	.dwattr $C$DW$T$121, DW_AT_decl_column(0x0f)
$C$DW$T$122	.dwtag  DW_TAG_typedef, DW_AT_name("Int32")
	.dwattr $C$DW$T$122, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$122, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$122, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/tistdtypes.h")
	.dwattr $C$DW$T$122, DW_AT_decl_line(0x5e)
	.dwattr $C$DW$T$122, DW_AT_decl_column(0x13)
$C$DW$T$120	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$120, DW_AT_type(*$C$DW$T$10)
$C$DW$T$128	.dwtag  DW_TAG_typedef, DW_AT_name("fpos_t")
	.dwattr $C$DW$T$128, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$128, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$128, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdio.h")
	.dwattr $C$DW$T$128, DW_AT_decl_line(0x52)
	.dwattr $C$DW$T$128, DW_AT_decl_column(0x0d)
$C$DW$T$62	.dwtag  DW_TAG_typedef, DW_AT_name("int32_t")
	.dwattr $C$DW$T$62, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$62, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$62, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$62, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$T$62, DW_AT_decl_column(0x1d)

$C$DW$T$63	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$63, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$T$63, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$63, DW_AT_byte_size(0x10)
$C$DW$282	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$282, DW_AT_upper_bound(0x03)
	.dwendtag $C$DW$T$63

$C$DW$T$123	.dwtag  DW_TAG_typedef, DW_AT_name("int_fast16_t")
	.dwattr $C$DW$T$123, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$T$123, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$123, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$123, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$T$123, DW_AT_decl_column(0x17)
$C$DW$T$124	.dwtag  DW_TAG_typedef, DW_AT_name("int_fast32_t")
	.dwattr $C$DW$T$124, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$T$124, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$124, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$124, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$T$124, DW_AT_decl_column(0x17)
$C$DW$T$125	.dwtag  DW_TAG_typedef, DW_AT_name("int_fast8_t")
	.dwattr $C$DW$T$125, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$T$125, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$125, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$125, DW_AT_decl_line(0x49)
	.dwattr $C$DW$T$125, DW_AT_decl_column(0x17)
$C$DW$T$126	.dwtag  DW_TAG_typedef, DW_AT_name("int_least32_t")
	.dwattr $C$DW$T$126, DW_AT_type(*$C$DW$T$62)
	.dwattr $C$DW$T$126, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$126, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$126, DW_AT_decl_line(0x3e)
	.dwattr $C$DW$T$126, DW_AT_decl_column(0x17)
$C$DW$T$127	.dwtag  DW_TAG_typedef, DW_AT_name("intptr_t")
	.dwattr $C$DW$T$127, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$127, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$127, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$127, DW_AT_decl_line(0x58)
	.dwattr $C$DW$T$127, DW_AT_decl_column(0x1a)
$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)
$C$DW$T$19	.dwtag  DW_TAG_typedef, DW_AT_name("Uint32")
	.dwattr $C$DW$T$19, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$19, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$19, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/tistdtypes.h")
	.dwattr $C$DW$T$19, DW_AT_decl_line(0x59)
	.dwattr $C$DW$T$19, DW_AT_decl_column(0x1a)
$C$DW$T$133	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_BitMask32")
	.dwattr $C$DW$T$133, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$T$133, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$133, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$133, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$T$133, DW_AT_decl_column(0x19)
$C$DW$T$134	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_Xio")
	.dwattr $C$DW$T$134, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$T$134, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$134, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$134, DW_AT_decl_line(0x39)
	.dwattr $C$DW$T$134, DW_AT_decl_column(0x19)
$C$DW$T$20	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$20, DW_AT_type(*$C$DW$T$19)
$C$DW$T$135	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_Reg32")
	.dwattr $C$DW$T$135, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$T$135, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$135, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$135, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$135, DW_AT_decl_column(0x19)

$C$DW$T$21	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$21, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$T$21, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$21, DW_AT_byte_size(0x10)
$C$DW$283	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$283, DW_AT_upper_bound(0x03)
	.dwendtag $C$DW$T$21


$C$DW$T$46	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$46, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$T$46, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$46, DW_AT_byte_size(0x400)
$C$DW$284	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$284, DW_AT_upper_bound(0xff)
	.dwendtag $C$DW$T$46


$C$DW$T$49	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$49, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$T$49, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$49, DW_AT_byte_size(0x80)
$C$DW$285	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$285, DW_AT_upper_bound(0x1f)
	.dwendtag $C$DW$T$49


$C$DW$T$52	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$52, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$T$52, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$52, DW_AT_byte_size(0x40)
$C$DW$286	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$286, DW_AT_upper_bound(0x0f)
	.dwendtag $C$DW$T$52

$C$DW$T$145	.dwtag  DW_TAG_typedef, DW_AT_name("Uns")
	.dwattr $C$DW$T$145, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$145, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$145, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/tistdtypes.h")
	.dwattr $C$DW$T$145, DW_AT_decl_line(0x44)
	.dwattr $C$DW$T$145, DW_AT_decl_column(0x13)
$C$DW$T$143	.dwtag  DW_TAG_typedef, DW_AT_name("clock_t")
	.dwattr $C$DW$T$143, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$143, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$143, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$T$143, DW_AT_decl_line(0x36)
	.dwattr $C$DW$T$143, DW_AT_decl_column(0x16)
$C$DW$T$142	.dwtag  DW_TAG_typedef, DW_AT_name("size_t")
	.dwattr $C$DW$T$142, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$142, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$142, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdio.h")
	.dwattr $C$DW$T$142, DW_AT_decl_line(0x44)
	.dwattr $C$DW$T$142, DW_AT_decl_column(0x19)
$C$DW$T$132	.dwtag  DW_TAG_typedef, DW_AT_name("time_t")
	.dwattr $C$DW$T$132, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$132, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$132, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$T$132, DW_AT_decl_line(0x37)
	.dwattr $C$DW$T$132, DW_AT_decl_column(0x16)
$C$DW$T$136	.dwtag  DW_TAG_typedef, DW_AT_name("uint32_t")
	.dwattr $C$DW$T$136, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$136, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$136, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$136, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$T$136, DW_AT_decl_column(0x1c)
$C$DW$T$137	.dwtag  DW_TAG_typedef, DW_AT_name("uint_fast16_t")
	.dwattr $C$DW$T$137, DW_AT_type(*$C$DW$T$136)
	.dwattr $C$DW$T$137, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$137, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$137, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$T$137, DW_AT_decl_column(0x16)
$C$DW$T$138	.dwtag  DW_TAG_typedef, DW_AT_name("uint_fast32_t")
	.dwattr $C$DW$T$138, DW_AT_type(*$C$DW$T$136)
	.dwattr $C$DW$T$138, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$138, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$138, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$T$138, DW_AT_decl_column(0x16)
$C$DW$T$139	.dwtag  DW_TAG_typedef, DW_AT_name("uint_fast8_t")
	.dwattr $C$DW$T$139, DW_AT_type(*$C$DW$T$136)
	.dwattr $C$DW$T$139, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$139, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$139, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$T$139, DW_AT_decl_column(0x16)
$C$DW$T$140	.dwtag  DW_TAG_typedef, DW_AT_name("uint_least32_t")
	.dwattr $C$DW$T$140, DW_AT_type(*$C$DW$T$136)
	.dwattr $C$DW$T$140, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$140, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$140, DW_AT_decl_line(0x3f)
	.dwattr $C$DW$T$140, DW_AT_decl_column(0x16)
$C$DW$T$141	.dwtag  DW_TAG_typedef, DW_AT_name("uintptr_t")
	.dwattr $C$DW$T$141, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$141, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$141, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$141, DW_AT_decl_line(0x59)
	.dwattr $C$DW$T$141, DW_AT_decl_column(0x1a)
$C$DW$T$12	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$12, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$12, DW_AT_name("__int40_t")
	.dwattr $C$DW$T$12, DW_AT_byte_size(0x08)
	.dwattr $C$DW$T$12, DW_AT_bit_size(0x28)
	.dwattr $C$DW$T$12, DW_AT_bit_offset(0x18)
$C$DW$T$146	.dwtag  DW_TAG_typedef, DW_AT_name("int40_t")
	.dwattr $C$DW$T$146, DW_AT_type(*$C$DW$T$12)
	.dwattr $C$DW$T$146, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$146, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$146, DW_AT_decl_line(0x31)
	.dwattr $C$DW$T$146, DW_AT_decl_column(0x21)
$C$DW$T$147	.dwtag  DW_TAG_typedef, DW_AT_name("int_fast40_t")
	.dwattr $C$DW$T$147, DW_AT_type(*$C$DW$T$146)
	.dwattr $C$DW$T$147, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$147, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$147, DW_AT_decl_line(0x51)
	.dwattr $C$DW$T$147, DW_AT_decl_column(0x17)
$C$DW$T$148	.dwtag  DW_TAG_typedef, DW_AT_name("int_least40_t")
	.dwattr $C$DW$T$148, DW_AT_type(*$C$DW$T$146)
	.dwattr $C$DW$T$148, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$148, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$148, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$148, DW_AT_decl_column(0x17)
$C$DW$T$13	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$13, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$13, DW_AT_name("unsigned __int40_t")
	.dwattr $C$DW$T$13, DW_AT_byte_size(0x08)
	.dwattr $C$DW$T$13, DW_AT_bit_size(0x28)
	.dwattr $C$DW$T$13, DW_AT_bit_offset(0x18)
$C$DW$T$149	.dwtag  DW_TAG_typedef, DW_AT_name("uint40_t")
	.dwattr $C$DW$T$149, DW_AT_type(*$C$DW$T$13)
	.dwattr $C$DW$T$149, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$149, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$149, DW_AT_decl_line(0x32)
	.dwattr $C$DW$T$149, DW_AT_decl_column(0x20)
$C$DW$T$150	.dwtag  DW_TAG_typedef, DW_AT_name("uint_fast40_t")
	.dwattr $C$DW$T$150, DW_AT_type(*$C$DW$T$149)
	.dwattr $C$DW$T$150, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$150, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$150, DW_AT_decl_line(0x52)
	.dwattr $C$DW$T$150, DW_AT_decl_column(0x16)
$C$DW$T$151	.dwtag  DW_TAG_typedef, DW_AT_name("uint_least40_t")
	.dwattr $C$DW$T$151, DW_AT_type(*$C$DW$T$149)
	.dwattr $C$DW$T$151, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$151, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$151, DW_AT_decl_line(0x42)
	.dwattr $C$DW$T$151, DW_AT_decl_column(0x16)
$C$DW$T$14	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$14, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$14, DW_AT_name("long long")
	.dwattr $C$DW$T$14, DW_AT_byte_size(0x08)
$C$DW$T$152	.dwtag  DW_TAG_typedef, DW_AT_name("int64_t")
	.dwattr $C$DW$T$152, DW_AT_type(*$C$DW$T$14)
	.dwattr $C$DW$T$152, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$152, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$152, DW_AT_decl_line(0x34)
	.dwattr $C$DW$T$152, DW_AT_decl_column(0x21)
$C$DW$T$153	.dwtag  DW_TAG_typedef, DW_AT_name("int_fast64_t")
	.dwattr $C$DW$T$153, DW_AT_type(*$C$DW$T$152)
	.dwattr $C$DW$T$153, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$153, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$153, DW_AT_decl_line(0x54)
	.dwattr $C$DW$T$153, DW_AT_decl_column(0x17)
$C$DW$T$154	.dwtag  DW_TAG_typedef, DW_AT_name("int_least64_t")
	.dwattr $C$DW$T$154, DW_AT_type(*$C$DW$T$152)
	.dwattr $C$DW$T$154, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$154, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$154, DW_AT_decl_line(0x44)
	.dwattr $C$DW$T$154, DW_AT_decl_column(0x17)
$C$DW$T$155	.dwtag  DW_TAG_typedef, DW_AT_name("intmax_t")
	.dwattr $C$DW$T$155, DW_AT_type(*$C$DW$T$14)
	.dwattr $C$DW$T$155, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$155, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$155, DW_AT_decl_line(0x5c)
	.dwattr $C$DW$T$155, DW_AT_decl_column(0x20)
$C$DW$T$15	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$15, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$15, DW_AT_name("unsigned long long")
	.dwattr $C$DW$T$15, DW_AT_byte_size(0x08)
$C$DW$T$156	.dwtag  DW_TAG_typedef, DW_AT_name("CSL_Uint64")
	.dwattr $C$DW$T$156, DW_AT_type(*$C$DW$T$15)
	.dwattr $C$DW$T$156, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$156, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/csl_types.h")
	.dwattr $C$DW$T$156, DW_AT_decl_line(0x47)
	.dwattr $C$DW$T$156, DW_AT_decl_column(0x21)
$C$DW$T$157	.dwtag  DW_TAG_typedef, DW_AT_name("uint64_t")
	.dwattr $C$DW$T$157, DW_AT_type(*$C$DW$T$15)
	.dwattr $C$DW$T$157, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$157, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$157, DW_AT_decl_line(0x35)
	.dwattr $C$DW$T$157, DW_AT_decl_column(0x20)
$C$DW$T$158	.dwtag  DW_TAG_typedef, DW_AT_name("uint_fast64_t")
	.dwattr $C$DW$T$158, DW_AT_type(*$C$DW$T$157)
	.dwattr $C$DW$T$158, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$158, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$158, DW_AT_decl_line(0x55)
	.dwattr $C$DW$T$158, DW_AT_decl_column(0x16)
$C$DW$T$159	.dwtag  DW_TAG_typedef, DW_AT_name("uint_least64_t")
	.dwattr $C$DW$T$159, DW_AT_type(*$C$DW$T$157)
	.dwattr $C$DW$T$159, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$159, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$159, DW_AT_decl_line(0x45)
	.dwattr $C$DW$T$159, DW_AT_decl_column(0x16)
$C$DW$T$160	.dwtag  DW_TAG_typedef, DW_AT_name("uintmax_t")
	.dwattr $C$DW$T$160, DW_AT_type(*$C$DW$T$15)
	.dwattr $C$DW$T$160, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$160, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdint.h")
	.dwattr $C$DW$T$160, DW_AT_decl_line(0x5d)
	.dwattr $C$DW$T$160, DW_AT_decl_column(0x20)
$C$DW$T$16	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$16, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$16, DW_AT_name("float")
	.dwattr $C$DW$T$16, DW_AT_byte_size(0x04)
$C$DW$T$161	.dwtag  DW_TAG_typedef, DW_AT_name("float32_t")
	.dwattr $C$DW$T$161, DW_AT_type(*$C$DW$T$16)
	.dwattr $C$DW$T$161, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$161, DW_AT_decl_file("C:\ti\ccs\ccsv5\tools\compiler\c6000\include\vect.h")
	.dwattr $C$DW$T$161, DW_AT_decl_line(0x30)
	.dwattr $C$DW$T$161, DW_AT_decl_column(0x0f)
$C$DW$T$17	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$17, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$17, DW_AT_name("double")
	.dwattr $C$DW$T$17, DW_AT_byte_size(0x08)
$C$DW$T$162	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$162, DW_AT_type(*$C$DW$T$17)
	.dwattr $C$DW$T$162, DW_AT_address_class(0x20)
$C$DW$T$82	.dwtag  DW_TAG_typedef, DW_AT_name("__float2_t")
	.dwattr $C$DW$T$82, DW_AT_type(*$C$DW$T$17)
	.dwattr $C$DW$T$82, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$82, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/c6x.h")
	.dwattr $C$DW$T$82, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$T$82, DW_AT_decl_column(0x14)
$C$DW$T$83	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$83, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$83, DW_AT_address_class(0x20)
$C$DW$T$169	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$169, DW_AT_type(*$C$DW$T$83)

$C$DW$T$171	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$171, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$171, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$171, DW_AT_byte_size(0x8000)
$C$DW$287	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$287, DW_AT_upper_bound(0xfff)
	.dwendtag $C$DW$T$171


$C$DW$T$172	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$172, DW_AT_type(*$C$DW$T$82)
	.dwattr $C$DW$T$172, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$172, DW_AT_byte_size(0x80)
$C$DW$288	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$288, DW_AT_upper_bound(0x0f)
	.dwendtag $C$DW$T$172

$C$DW$T$18	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$18, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$18, DW_AT_name("long double")
	.dwattr $C$DW$T$18, DW_AT_byte_size(0x08)
$C$DW$T$59	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$59, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$59, DW_AT_name("signed char")
	.dwattr $C$DW$T$59, DW_AT_byte_size(0x01)
$C$DW$T$176	.dwtag  DW_TAG_typedef, DW_AT_name("Char")
	.dwattr $C$DW$T$176, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$T$176, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$176, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/tistdtypes.h")
	.dwattr $C$DW$T$176, DW_AT_decl_line(0x45)
	.dwattr $C$DW$T$176, DW_AT_decl_column(0x10)
$C$DW$T$177	.dwtag  DW_TAG_typedef, DW_AT_name("Int8")
	.dwattr $C$DW$T$177, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$T$177, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$177, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/tistdtypes.h")
	.dwattr $C$DW$T$177, DW_AT_decl_line(0x60)
	.dwattr $C$DW$T$177, DW_AT_decl_column(0x13)

$C$DW$T$60	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$60, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$T$60, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$60, DW_AT_byte_size(0x04)
$C$DW$289	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$289, DW_AT_upper_bound(0x03)
	.dwendtag $C$DW$T$60

$C$DW$T$116	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$116, DW_AT_type(*$C$DW$T$59)
$C$DW$T$117	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$117, DW_AT_type(*$C$DW$T$116)
	.dwattr $C$DW$T$117, DW_AT_address_class(0x20)
$C$DW$T$173	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$173, DW_AT_type(*$C$DW$T$59)
	.dwattr $C$DW$T$173, DW_AT_address_class(0x20)
$C$DW$T$175	.dwtag  DW_TAG_typedef, DW_AT_name("String")
	.dwattr $C$DW$T$175, DW_AT_type(*$C$DW$T$173)
	.dwattr $C$DW$T$175, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$175, DW_AT_decl_file("C:/ti/ccs/pdk_C6678_1_0_0_18/packages/ti/csl/tistdtypes.h")
	.dwattr $C$DW$T$175, DW_AT_decl_line(0x48)
	.dwattr $C$DW$T$175, DW_AT_decl_column(0x11)
$C$DW$T$174	.dwtag  DW_TAG_typedef, DW_AT_name("va_list")
	.dwattr $C$DW$T$174, DW_AT_type(*$C$DW$T$173)
	.dwattr $C$DW$T$174, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$174, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/stdarg.h")
	.dwattr $C$DW$T$174, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$T$174, DW_AT_decl_column(0x12)

$C$DW$T$64	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$64, DW_AT_name("__simd128_int32_t")
	.dwattr $C$DW$T$64, DW_AT_byte_size(0x10)
$C$DW$290	.dwtag  DW_TAG_member
	.dwattr $C$DW$290, DW_AT_type(*$C$DW$T$63)
	.dwattr $C$DW$290, DW_AT_name("_v")
	.dwattr $C$DW$290, DW_AT_TI_symbol_name("_v")
	.dwattr $C$DW$290, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$290, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$290, DW_AT_decl_file("C:\ti\ccs\ccsv5\tools\compiler\c6000\include\vect.h")
	.dwattr $C$DW$290, DW_AT_decl_line(0x44)
	.dwattr $C$DW$290, DW_AT_decl_column(0x01)
	.dwendtag $C$DW$T$64

	.dwattr $C$DW$T$64, DW_AT_decl_file("C:\ti\ccs\ccsv5\tools\compiler\c6000\include\vect.h")
	.dwattr $C$DW$T$64, DW_AT_decl_line(0x44)
	.dwattr $C$DW$T$64, DW_AT_decl_column(0x01)
$C$DW$T$178	.dwtag  DW_TAG_typedef, DW_AT_name("int32x4_t")
	.dwattr $C$DW$T$178, DW_AT_type(*$C$DW$T$64)
	.dwattr $C$DW$T$178, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$178, DW_AT_decl_file("C:\ti\ccs\ccsv5\tools\compiler\c6000\include\vect.h")
	.dwattr $C$DW$T$178, DW_AT_decl_line(0x44)
	.dwattr $C$DW$T$178, DW_AT_decl_column(0x01)
$C$DW$T$179	.dwtag  DW_TAG_typedef, DW_AT_name("__x128_t")
	.dwattr $C$DW$T$179, DW_AT_type(*$C$DW$T$178)
	.dwattr $C$DW$T$179, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$179, DW_AT_decl_file("C:\ti\ccs\ccsv5\tools\compiler\c6000\include\vect.h")
	.dwattr $C$DW$T$179, DW_AT_decl_line(0x46)
	.dwattr $C$DW$T$179, DW_AT_decl_column(0x13)

$C$DW$T$65	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$65, DW_AT_name("tm")
	.dwattr $C$DW$T$65, DW_AT_byte_size(0x24)
$C$DW$291	.dwtag  DW_TAG_member
	.dwattr $C$DW$291, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$291, DW_AT_name("tm_sec")
	.dwattr $C$DW$291, DW_AT_TI_symbol_name("tm_sec")
	.dwattr $C$DW$291, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$291, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$291, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$291, DW_AT_decl_line(0x40)
	.dwattr $C$DW$291, DW_AT_decl_column(0x09)
$C$DW$292	.dwtag  DW_TAG_member
	.dwattr $C$DW$292, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$292, DW_AT_name("tm_min")
	.dwattr $C$DW$292, DW_AT_TI_symbol_name("tm_min")
	.dwattr $C$DW$292, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$292, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$292, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$292, DW_AT_decl_line(0x41)
	.dwattr $C$DW$292, DW_AT_decl_column(0x09)
$C$DW$293	.dwtag  DW_TAG_member
	.dwattr $C$DW$293, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$293, DW_AT_name("tm_hour")
	.dwattr $C$DW$293, DW_AT_TI_symbol_name("tm_hour")
	.dwattr $C$DW$293, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$293, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$293, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$293, DW_AT_decl_line(0x42)
	.dwattr $C$DW$293, DW_AT_decl_column(0x09)
$C$DW$294	.dwtag  DW_TAG_member
	.dwattr $C$DW$294, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$294, DW_AT_name("tm_mday")
	.dwattr $C$DW$294, DW_AT_TI_symbol_name("tm_mday")
	.dwattr $C$DW$294, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$294, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$294, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$294, DW_AT_decl_line(0x43)
	.dwattr $C$DW$294, DW_AT_decl_column(0x09)
$C$DW$295	.dwtag  DW_TAG_member
	.dwattr $C$DW$295, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$295, DW_AT_name("tm_mon")
	.dwattr $C$DW$295, DW_AT_TI_symbol_name("tm_mon")
	.dwattr $C$DW$295, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$295, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$295, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$295, DW_AT_decl_line(0x44)
	.dwattr $C$DW$295, DW_AT_decl_column(0x09)
$C$DW$296	.dwtag  DW_TAG_member
	.dwattr $C$DW$296, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$296, DW_AT_name("tm_year")
	.dwattr $C$DW$296, DW_AT_TI_symbol_name("tm_year")
	.dwattr $C$DW$296, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$296, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$296, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$296, DW_AT_decl_line(0x45)
	.dwattr $C$DW$296, DW_AT_decl_column(0x09)
$C$DW$297	.dwtag  DW_TAG_member
	.dwattr $C$DW$297, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$297, DW_AT_name("tm_wday")
	.dwattr $C$DW$297, DW_AT_TI_symbol_name("tm_wday")
	.dwattr $C$DW$297, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$297, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$297, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$297, DW_AT_decl_line(0x46)
	.dwattr $C$DW$297, DW_AT_decl_column(0x09)
$C$DW$298	.dwtag  DW_TAG_member
	.dwattr $C$DW$298, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$298, DW_AT_name("tm_yday")
	.dwattr $C$DW$298, DW_AT_TI_symbol_name("tm_yday")
	.dwattr $C$DW$298, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$298, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$298, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$298, DW_AT_decl_line(0x47)
	.dwattr $C$DW$298, DW_AT_decl_column(0x09)
$C$DW$299	.dwtag  DW_TAG_member
	.dwattr $C$DW$299, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$299, DW_AT_name("tm_isdst")
	.dwattr $C$DW$299, DW_AT_TI_symbol_name("tm_isdst")
	.dwattr $C$DW$299, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$299, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$299, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$299, DW_AT_decl_line(0x48)
	.dwattr $C$DW$299, DW_AT_decl_column(0x09)
	.dwendtag $C$DW$T$65

	.dwattr $C$DW$T$65, DW_AT_decl_file("C:/ti/ccs/ccsv5/tools/compiler/c6000/include/time.h")
	.dwattr $C$DW$T$65, DW_AT_decl_line(0x3e)
	.dwattr $C$DW$T$65, DW_AT_decl_column(0x08)
	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)

;***************************************************************
;* DWARF CIE ENTRIES                                           *
;***************************************************************

$C$DW$CIE	.dwcie 19
	.dwcfi	cfa_register, 31
	.dwcfi	cfa_offset, 0
	.dwcfi	undefined, 0
	.dwcfi	undefined, 1
	.dwcfi	undefined, 2
	.dwcfi	undefined, 3
	.dwcfi	undefined, 4
	.dwcfi	undefined, 5
	.dwcfi	undefined, 6
	.dwcfi	undefined, 7
	.dwcfi	undefined, 8
	.dwcfi	undefined, 9
	.dwcfi	same_value, 10
	.dwcfi	same_value, 11
	.dwcfi	same_value, 12
	.dwcfi	same_value, 13
	.dwcfi	same_value, 14
	.dwcfi	same_value, 15
	.dwcfi	undefined, 16
	.dwcfi	undefined, 17
	.dwcfi	undefined, 18
	.dwcfi	undefined, 19
	.dwcfi	undefined, 20
	.dwcfi	undefined, 21
	.dwcfi	undefined, 22
	.dwcfi	undefined, 23
	.dwcfi	undefined, 24
	.dwcfi	undefined, 25
	.dwcfi	same_value, 26
	.dwcfi	same_value, 27
	.dwcfi	same_value, 28
	.dwcfi	same_value, 29
	.dwcfi	same_value, 30
	.dwcfi	same_value, 31
	.dwcfi	same_value, 32
	.dwcfi	undefined, 33
	.dwcfi	undefined, 34
	.dwcfi	undefined, 35
	.dwcfi	undefined, 36
	.dwcfi	undefined, 37
	.dwcfi	undefined, 38
	.dwcfi	undefined, 39
	.dwcfi	undefined, 40
	.dwcfi	undefined, 41
	.dwcfi	undefined, 42
	.dwcfi	undefined, 43
	.dwcfi	undefined, 44
	.dwcfi	undefined, 45
	.dwcfi	undefined, 46
	.dwcfi	undefined, 47
	.dwcfi	undefined, 48
	.dwcfi	undefined, 49
	.dwcfi	undefined, 50
	.dwcfi	undefined, 51
	.dwcfi	undefined, 52
	.dwcfi	undefined, 53
	.dwcfi	undefined, 54
	.dwcfi	undefined, 55
	.dwcfi	undefined, 56
	.dwcfi	undefined, 57
	.dwcfi	undefined, 58
	.dwcfi	undefined, 59
	.dwcfi	undefined, 60
	.dwcfi	undefined, 61
	.dwcfi	undefined, 62
	.dwcfi	undefined, 63
	.dwcfi	undefined, 64
	.dwcfi	undefined, 65
	.dwcfi	undefined, 66
	.dwcfi	undefined, 67
	.dwcfi	undefined, 68
	.dwcfi	undefined, 69
	.dwcfi	undefined, 70
	.dwcfi	undefined, 71
	.dwcfi	undefined, 72
	.dwcfi	undefined, 73
	.dwcfi	undefined, 74
	.dwcfi	undefined, 75
	.dwcfi	undefined, 76
	.dwcfi	undefined, 77
	.dwcfi	undefined, 78
	.dwcfi	undefined, 79
	.dwcfi	undefined, 80
	.dwcfi	undefined, 81
	.dwcfi	undefined, 82
	.dwcfi	undefined, 83
	.dwcfi	undefined, 84
	.dwcfi	undefined, 85
	.dwcfi	undefined, 86
	.dwcfi	undefined, 87
	.dwcfi	undefined, 88
	.dwcfi	undefined, 89
	.dwcfi	undefined, 90
	.dwcfi	undefined, 91
	.dwcfi	undefined, 92
	.dwcfi	undefined, 93
	.dwcfi	undefined, 94
	.dwcfi	undefined, 95
	.dwcfi	undefined, 96
	.dwcfi	undefined, 97
	.dwcfi	undefined, 98
	.dwcfi	undefined, 99
	.dwcfi	undefined, 100
	.dwcfi	undefined, 101
	.dwcfi	undefined, 102
	.dwcfi	undefined, 103
	.dwcfi	undefined, 104
	.dwcfi	undefined, 105
	.dwcfi	undefined, 106
	.dwcfi	undefined, 107
	.dwcfi	undefined, 108
	.dwcfi	undefined, 109
	.dwcfi	undefined, 110
	.dwcfi	undefined, 111
	.dwcfi	undefined, 112
	.dwcfi	undefined, 113
	.dwcfi	undefined, 114
	.dwcfi	undefined, 115
	.dwcfi	undefined, 116
	.dwcfi	undefined, 117
	.dwcfi	undefined, 118
	.dwcfi	undefined, 119
	.dwcfi	undefined, 120
	.dwcfi	undefined, 121
	.dwcfi	undefined, 122
	.dwcfi	undefined, 123
	.dwcfi	undefined, 124
	.dwcfi	undefined, 125
	.dwcfi	undefined, 126
	.dwcfi	undefined, 127
	.dwendentry
	.dwendtag $C$DW$CU

