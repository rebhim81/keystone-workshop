;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.3.1 *
;* Date/Time created: Fri Mar 09 00:29:18 2012                                *
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

;	C:\ti\ccs\ccsv5\tools\compiler\c6000\bin\opt6x.exe C:\\Users\\a0270985\\AppData\\Local\\Temp\\058482 C:\\Users\\a0270985\\AppData\\Local\\Temp\\058484 
	.sect	".text"
	.clink
	.global	intrinsicC_filters

;******************************************************************************
;* FUNCTION NAME: intrinsicC_filters                                          *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,  *
;*                           A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20,B21, *
;*                           B22,B23,B24,B25,B26,B27,B28,B29,B30,B31          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,  *
;*                           A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20,B21, *
;*                           B22,B23,B24,B25,B26,B27,B28,B29,B30,B31          *
;*   Local Frame Size  : 0 Args + 76 Auto + 64 Save = 140 byte                *
;******************************************************************************
intrinsicC_filters:
;** --------------------------------------------------------------------------*
           STW     .D2T1   A11,*SP--(8)      ; |13| 
           STW     .D2T1   A10,*SP--(8)      ; |13| 
           STDW    .D2T2   B13:B12,*SP--     ; |13| 
           STDW    .D2T2   B11:B10,*SP--     ; |13| 
           STDW    .D2T1   A15:A14,*SP--     ; |13| 

           STDW    .D2T1   A13:A12,*SP--     ; |13| 
||         ZERO    .L2     B18

           STW     .D2T2   B3,*SP--(88)      ; |13| 
||         SET     .S2     B18,0x18,0x1d,B18

           STW     .D2T2   B18,*+SP(20)      ; |35| 
           STW     .D2T2   B18,*+SP(24)      ; |35| 

           STW     .D2T2   B4,*+SP(4)        ; |13| 
||         ZERO    .L1     A4
||         MV      .S1     A4,A15            ; |13| 
||         ADD     .L2X    8,A4,B20
||         MV      .D1     A4,A3             ; |13| 

           STW     .D2T1   A6,*+SP(8)        ; |13| 
||         MVKH    .S1     0xbf000000,A4

           STW     .D2T1   A4,*+SP(28)       ; |35| 
||         ADD     .L2     3,B4,B18          ; |41| 

           SHR     .S2     B18,2,B18         ; |41| 
||         STW     .D2T1   A4,*+SP(16)       ; |35| 

           LDDW    .D2T2   *+SP(24),B19:B18  ; |13| 
||         SUB     .L2     B18,2,B21

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 39
;*      Loop opening brace source line   : 40
;*      Loop closing brace source line   : 51
;*      Known Minimum Trip Count         : 128                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 2
;*      Unpartitioned Resource Bound     : 1
;*      Partitioned Resource Bound(*)    : 2
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     0        0     
;*      .D units                     1        1     
;*      .M units                     1        1     
;*      .X cross paths               1        0     
;*      .T address paths             2*       2*    
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           3        1     (.L or .S unit)
;*      Addition ops (.LSD)          0        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             2*       1     
;*      Bound(.L .S .D .LS .LSD)     2*       1     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 2  Schedule found with 8 iterations in parallel
;*      Done
;*
;*      Loop will be splooped
;*      Collapsed epilog stages       : 0
;*      Collapsed prolog stages       : 0
;*      Minimum required memory pad   : 0 bytes
;*
;*      For further improvement on this loop, try option -mh16
;*
;*      Minimum safe trip count       : 1
;*----------------------------------------------------------------------------*
$C$L1:    ; PIPED LOOP PROLOG

           SPLOOPD 2       ;16               ; (P) 
||         MVC     .S2     B21,ILC
||         LDDW    .D2T1   *+SP(16),A19:A18  ; |13| 

;** --------------------------------------------------------------------------*
$C$L2:    ; PIPED LOOP KERNEL
           LDNDW   .D1T1   *A3++(16),A17:A16 ; |41| (P) <0,0> 
           LDNDW   .D2T2   *B20++(16),B17:B16 ; |41| (P) <0,1> 
           NOP             3
           CMPYSP  .M1     A17:A16,A19:A18,A7:A6:A5:A4 ; |41| (P) <0,5> 
           NOP             1
           CMPYSP  .M2     B17:B16,B19:B18,B7:B6:B5:B4 ; |41| (P) <0,7> 
           NOP             1
           DADDSP  .L1     A7:A6,A5:A4,A7:A6 ; |41| (P) <0,9> 
           NOP             1

           SPMASK          S1,D1
||         ZERO    .S1     A21
||         ZERO    .D1     A20
||         DADDSP  .L2     B7:B6,B5:B4,B9:B8 ; |41| (P) <0,11>  ^ 

           DADDSP  .L1     A21:A20,A7:A6,A9:A8 ; |41| (P) <0,12> 
           NOP             1
           NOP             1

           SPKERNEL 0,0
||         DADDSP  .S1X    A9:A8,B9:B8,A5:A4 ; |41| <0,15>  ^ 

;** --------------------------------------------------------------------------*
$C$L3:    ; PIPED LOOP EPILOG

           MV      .L2X    A15,B0            ; |60| 
||         ZERO    .S1     A3
||         LDW     .D2T1   *+SP(4),A31       ; |64| 

           ADDK    .S2     24,B0
||         LDW     .D2T2   *+SP(8),B31       ; |64| 

           ADD     .L2X    8,A15,B1
||         LDDW    .D2T2   *+SP(16),B23:B22  ; |64| 
||         MVKH    .S1     0x3e800000,A3

           MV      .D1     A20,A16
||         STW     .D2T1   A3,*+SP(36)       ; |64| 

           MV      .S1     A21,A17
||         MV      .D1     A15,A3            ; |60| 
||         STW     .D2T1   A3,*+SP(48)       ; |64| 

           LDDW    .D2T2   *+SP(24),B27:B26  ; |64| 
||         ADD     .S2X    7,A31,B16         ; |71| 

           ADDK    .S1     16,A3
||         SHR     .S2     B16,3,B30         ; |71| 

           SUB     .S2     B30,1,B16
           MVC     .S2     B16,ILC
           ZERO    .S2     B4

           MV      .S1     A15,A20           ; |60| 
||         MVKH    .S2     0xbe800000,B4

           NOP             1
           MV      .S1X    B4,A6             ; |64| 
           STW     .D2T1   A6,*+SP(52)       ; |64| 
;** --------------------------------------------------------------------------*
           MV      .L1X    B4,A30            ; |64| 
           STW     .D2T1   A30,*+SP(32)      ; |64| 
           MPYSP   .M1     A4,A4,A9          ; |53| 
           MPYSP   .M1     A5,A5,A8          ; |53| 
           NOP             3
           FADDSP  .L1     A9,A8,A21         ; |53| 
           LDDW    .D2T1   *+SP(32),A9:A8    ; |64| 
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 69
;*      Loop opening brace source line   : 70
;*      Loop closing brace source line   : 81
;*      Known Minimum Trip Count         : 64                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 2
;*      Unpartitioned Resource Bound     : 2
;*      Partitioned Resource Bound(*)    : 4
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     0        0     
;*      .D units                     2        2     
;*      .M units                     1        3     
;*      .X cross paths               0        1     
;*      .T address paths             4*       4*    
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           2        6     (.L or .S unit)
;*      Addition ops (.LSD)          0        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        3     
;*      Bound(.L .S .D .LS .LSD)     2        3     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 4  Schedule found with 6 iterations in parallel
;*      Done
;*
;*      Loop will be splooped
;*      Collapsed epilog stages       : 0
;*      Collapsed prolog stages       : 0
;*      Minimum required memory pad   : 0 bytes
;*
;*      For further improvement on this loop, try option -mh32
;*
;*      Minimum safe trip count       : 1
;*----------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP PROLOG

           SPLOOPD 4       ;24               ; (P) 
||         STW     .D2T1   A21,*B31          ; |53| 

;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP KERNEL
           LDNDW   .D1T1   *A20++(32),A19:A18 ; |71| (P) <0,0> 
           LDNDW   .D2T2   *B1++(32),B19:B18 ; |71| (P) <0,1> 

           SPMASK          D2
||         LDDW    .D2T2   *+SP(48),B25:B24  ; |64| 

           LDNDW   .D1T2   *A3++(32),B19:B18 ; |71| (P) <0,3> 
           NOP             1
           CMPYSP  .M1     A19:A18,A9:A8,A7:A6:A5:A4 ; |71| (P) <0,5> 

           LDNDW   .D2T2   *B0++(32),B31:B30 ; |71| (P) <0,6> 
||         CMPYSP  .M2     B19:B18,B23:B22,B7:B6:B5:B4 ; |71| (P) <0,6> 

           NOP             2

           CMPYSP  .M2     B19:B18,B25:B24,B7:B6:B5:B4 ; |71| (P) <0,9> 
||         DADDSP  .L1     A7:A6,A5:A4,A7:A6 ; |71| (P) <0,9> 

           DADDSP  .S2     B7:B6,B5:B4,B21:B20 ; |71| (P) <0,10> 
           NOP             1

           CMPYSP  .M2     B31:B30,B27:B26,B7:B6:B5:B4 ; |71| (P) <0,12> 
||         DADDSP  .L1     A17:A16,A7:A6,A5:A4 ; |71| (P) <0,12>  ^ 

           DADDSP  .L2     B7:B6,B5:B4,B17:B16 ; |71| (P) <0,13> 
           NOP             2

           DADDSP  .S2     B7:B6,B5:B4,B9:B8 ; |71| (P) <0,16> 
||         DADDSP  .L2X    A5:A4,B21:B20,B29:B28 ; |71| (P) <0,16>  ^ 

           NOP             2
           DADDSP  .L2     B29:B28,B17:B16,B29:B28 ; |71| (P) <0,19> 
           NOP             1
           NOP             1

           SPKERNEL 0,0
||         DADDSP  .L2     B29:B28,B9:B8,B29:B28 ; |71| <0,22> 

;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP EPILOG

           MV      .S1     A16,A20
||         ZERO    .D1     A3
||         LDW     .D2T1   *+SP(4),A31       ; |123| 

           MV      .D1     A17,A21
||         LDDW    .D2T1   *+SP(24),A29:A28  ; |96| 
||         SET     .S1     A3,0x17,0x1d,A3

           MVK     .S1     4,A13             ; |123| 
||         MV      .D1     A3,A27            ; |96| 

           MV      .D1     A16,A0
||         MVK     .S1     6,A2              ; |123| 
||         STW     .D2T1   A27,*+SP(56)      ; |96| 

           MV      .D1     A15,A14
||         MVK     .S1     5,A12             ; |123| 
||         STW     .D2T1   A27,*+SP(44)      ; |96| 

           MV      .D1     A17,A1
||         MVK     .S1     7,A3              ; |123| 
||         ADD     .S2X    15,A31,B18        ; |118| 
||         LDW     .D2T2   *+SP(8),B25       ; |109| 

           LDDW    .D2T1   *+SP(16),A25:A24  ; |96| 
           SHR     .S2     B18,4,B18         ; |118| 
           SUB     .D2     B18,1,B24
           MVC     .S2     B24,ILC
           NOP             1
           DADD    .L1     0,A25:A24,A27:A26 ; |98| 
           ZERO    .D2     B5
           MVKH    .S2     0xbf800000,B5
           NOP             1
           MV      .L1X    B5,A30            ; |96| 

           DADD    .L1     0,A29:A28,A31:A30 ; |108| 
||         STW     .D2T1   A30,*+SP(60)      ; |96| 
||         MV      .S1X    B5,A4             ; |96| 

           STW     .D2T1   A4,*+SP(40)       ; |96| 
           LDDW    .D2T2   *+SP(40),B27:B26  ; |109| 
;** --------------------------------------------------------------------------*
           LDDW    .D2T2   *+SP(56),B31:B30  ; |109| 
           NOP             2
           MV      .L1X    B29,A4
           MPYSP   .M1X    B29,A4,A4         ; |83| 
           MPYSP   .M2     B28,B28,B4        ; |83| 
           NOP             3
           FADDSP  .L2X    B4,A4,B4          ; |83| 
           NOP             2
           STW     .D2T2   B4,*++B25         ; |83| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 116
;*      Loop opening brace source line   : 117
;*      Loop closing brace source line   : 128
;*      Known Minimum Trip Count         : 32                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 7
;*      Unpartitioned Resource Bound     : 5
;*      Partitioned Resource Bound(*)    : 8
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     1        0     
;*      .D units                     8*       0     
;*      .M units                     4        4     
;*      .X cross paths               7        6     
;*      .T address paths             8*       8*    
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           9       10     (.L or .S unit)
;*      Addition ops (.LSD)          0        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             5        5     
;*      Bound(.L .S .D .LS .LSD)     6        4     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 8  Cannot allocate machine registers
;*                   Regs Live Always   : 15/8  (A/B-side)
;*                   Max Regs Live      : 29/31
;*                   Max Cond Regs Live :  0/0 
;*         ii = 8  Schedule found with 5 iterations in parallel
;*      Done
;*
;*      Loop will be splooped
;*      Collapsed epilog stages       : 0
;*      Collapsed prolog stages       : 0
;*      Minimum required memory pad   : 0 bytes
;*
;*      For further improvement on this loop, try option -mh64
;*
;*      Minimum safe trip count       : 1
;*----------------------------------------------------------------------------*
$C$L7:    ; PIPED LOOP PROLOG

           SPLOOPD 8       ;40               ; (P) 
||         STW     .D2T2   B25,*+SP(8)       ; |83| 

;** --------------------------------------------------------------------------*
$C$L8:    ; PIPED LOOP KERNEL
           LDNDW   .D1T1   *A14,A7:A6        ; |123| (P) <0,0> 
           LDNDW   .D1T2   *+A14(24),B23:B22 ; |123| (P) <0,1> 
           LDNDW   .D1T2   *+A14(8),B13:B12  ; |123| (P) <0,2> 
           LDNDW   .D1T1   *+A14(16),A19:A18 ; |123| (P) <0,3> 
           LDNDW   .D1T1   *+A14[A13],A19:A18 ; |123| (P) <0,4> 

           LDNDW   .D1T2   *+A14[A3],B17:B16 ; |123| (P) <0,5> 
||         CMPYSP  .M1     A7:A6,A25:A24,A11:A10:A9:A8 ; |123| (P) <0,5> 

           LDNDW   .D1T1   *+A14[A2],A17:A16 ; |123| (P) <0,6> 

           LDNDW   .D1T2   *+A14[A12],B19:B18 ; |123| (P) <0,7> 
||         ADDK    .S1     64,A14            ; |123| (P) <0,7> Define a twin register
||         CMPYSP  .M2     B13:B12,B27:B26,B7:B6:B5:B4 ; |123| (P) <0,7> 

           SPMASK          L2
||         DADD    .L2X    0,A21:A20,B29:B28 ; |100| 
||         CMPYSP  .M1     A19:A18,A27:A26,A23:A22:A21:A20 ; |123| (P) <0,8> 

           DADDSP  .S1     A11:A10,A9:A8,A5:A4 ; |123| (P) <0,9> 
           NOP             1
           DADDSP  .L2     B7:B6,B5:B4,B25:B24 ; |123| (P) <0,11> 
           DADDSP  .L1     A1:A0,A5:A4,A9:A8 ; |123| (P) <0,12> 

           CMPYSP  .M2     B23:B22,B29:B28,B7:B6:B5:B4 ; |123| (P) <0,13> 
||         DADD    .S2X    0,A21:A20,B5:B4   ; |123| (P) <0,13> Define a twin register

           CMPYSP  .M1     A19:A18,A29:A28,A11:A10:A9:A8 ; |123| (P) <0,14> 
||         DADDSP  .L2X    A23:A22,B5:B4,B25:B24 ; |123| (P) <0,14> 

           DADDSP  .L1X    A9:A8,B25:B24,A5:A4 ; |123| (P) <0,15> 

           SPMASK          S2
||         DADD    .S2     0,B29:B28,B1:B0   ; |109| 

           CMPYSP  .M2     B17:B16,B1:B0,B11:B10:B9:B8 ; |123| (P) <0,17> 
||         DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |123| (P) <0,17> 

           CMPYSP  .M1     A17:A16,A31:A30,A7:A6:A5:A4 ; |123| (P) <0,18> 
||         DADDSP  .L1X    A5:A4,B25:B24,A5:A4 ; |123| (P) <0,18> 

           CMPYSP  .M2     B19:B18,B31:B30,B7:B6:B5:B4 ; |123| (P) <0,19> 
||         DADD    .S2X    0,A9:A8,B7:B6     ; |123| (P) <0,19> Define a twin register

           DADDSP  .L2X    A11:A10,B7:B6,B3:B2 ; |123| (P) <0,20> 
           DADDSP  .L1X    A5:A4,B5:B4,A9:A8 ; |123| (P) <0,21> 
           NOP             1
           DADDSP  .L2     B7:B6,B5:B4,B21:B20 ; |123| (P) <0,23> 
           DADDSP  .L1X    A9:A8,B3:B2,A5:A4 ; |123| (P) <0,24> 
           DADD    .S2X    0,A5:A4,B5:B4     ; |123| (P) <0,25> Define a twin register
           DADDSP  .L2X    A7:A6,B5:B4,B7:B6 ; |123| (P) <0,26> 
           DADDSP  .L1X    A5:A4,B21:B20,A9:A8 ; |123| (P) <0,27> 
           DADDSP  .S2     B11:B10,B9:B8,B21:B20 ; |123| (P) <0,28> 
           NOP             1
           DADDSP  .L1X    A9:A8,B7:B6,A21:A20 ; |123| (P) <0,30> 
           NOP             1
           NOP             1

           SPKERNEL 0,0
||         DADDSP  .L1X    A21:A20,B21:B20,A7:A6 ; |123| <0,33> 

;** --------------------------------------------------------------------------*
$C$L9:    ; PIPED LOOP EPILOG

           MV      .D1     A15,A3            ; |146| 
||         MVK     .S1     8,A25             ; |178| 

           NOP             1
           MVK     .S1     7,A26             ; |178| 
           NOP             1
           MVK     .S1     9,A24             ; |178| 

           MVK     .S1     6,A27             ; |178| 
||         LDDW    .D2T2   *+SP(24),B23:B22  ; |178| 

           MVK     .S1     13,A22            ; |178| 
||         LDW     .D2T1   *+SP(4),A29       ; |154| 

           MVK     .S1     14,A19            ; |178| 
           MVK     .S1     12,A23            ; |178| 

           MVK     .S1     15,A18            ; |178| 
||         LDDW    .D2T2   *+SP(16),B17:B16  ; |178| 

           MVK     .S1     10,A17            ; |178| 
||         LDDW    .D2T2   *+SP(40),B25:B24  ; |146| 

           MVK     .S1     5,A30             ; |178| 
||         ADD     .D1     A29,31,A16        ; |173| 
||         LDW     .D2T2   *+SP(8),B31       ; |155| 

           SHR     .S1     A16,5,A2          ; |173| 
           MVK     .S1     11,A16            ; |178| 
           MVK     .S1     4,A31             ; |178| 
           DADD    .S2     0,B17:B16,B13:B12 ; |154| 
           NOP             2
           ZERO    .S2     B5

           ZERO    .S1     A4
||         MVKH    .S2     0xbf400000,B5

           MVKH    .S1     0x3f400000,A4

           STW     .D2T1   A4,*+SP(64)       ; |151| 
||         MV      .S1X    B5,A5             ; |151| 

           DADD    .L2     0,B23:B22,B7:B6   ; |162| 
||         LDDW    .D2T1   *+SP(32),A9:A8    ; |151| 

           STW     .D2T1   A5,*+SP(68)       ; |151| 

           DADD    .S1X    0,B7:B6,A11:A10   ; |162| 
||         STW     .D2T1   A5,*+SP(72)       ; |151| 

           MV      .S1     A1,A21
||         MV      .D1     A0,A20
||         LDDW    .D2T2   *+SP(48),B21:B20  ; |178| 

;** --------------------------------------------------------------------------*
           STW     .D2T1   A4,*+SP(76)       ; |151| 
           DADD    .L2X    0,A21:A20,B19:B18 ; |156| 
           MPYSP   .M1     A7,A7,A4          ; |130| 
           MV      .L2X    A6,B4
           MPYSP   .M2X    A6,B4,B4          ; |130| 
           LDDW    .D2T2   *+SP(72),B3:B2    ; |155| 
           DADD    .L2X    0,A9:A8,B7:B6     ; |155| 
           NOP             1

           FADDSP  .L2X    B4,A4,B8          ; |130| 
||         LDDW    .D2T2   *+SP(56),B5:B4    ; |151| 

           DADD    .L1X    0,B7:B6,A1:A0     ; |155| 
           NOP             3

           STDW    .D2T2   B5:B4,*+SP(24)    ; |162| 
||         DADD    .L2     0,B21:B20,B5:B4   ; |163| 

           NOP             1

           DADD    .L1X    0,B5:B4,A13:A12   ; |154| 
||         DADD    .L2     0,B19:B18,B5:B4   ; |164| 

           STDW    .D2T2   B5:B4,*+SP(16)    ; |155| 
           LDDW    .D2T2   *+SP(64),B5:B4    ; |155| 
           STW     .D2T2   B8,*++B31         ; |130| 
           STW     .D2T2   B31,*+SP(8)       ; |130| 
           LDNDW   .D1T1   *A3,A5:A4         ; |178| 
           NOP             1

           DADD    .L1X    0,B5:B4,A29:A28   ; |130| 
||         LDNDW   .D1T2   *+A3(8),B5:B4     ; |178| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 171
;*      Loop opening brace source line   : 172
;*      Loop closing brace source line   : 183
;*      Known Minimum Trip Count         : 16                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 1
;*      Unpartitioned Resource Bound     : 9
;*      Partitioned Resource Bound(*)    : 16
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     0        0     
;*      .D units                    13        0     
;*      .M units                     1       12     
;*      .X cross paths               0        1     
;*      .T address paths            13       13     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           2       24     (.L or .S unit)
;*      Addition ops (.LSD)          0        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1       12     
;*      Bound(.L .S .D .LS .LSD)     5        8     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 16 Register is live too long
;*         ii = 16 Register is live too long
;*         ii = 16 Register pressure too high: 72
;*         ii = 16 Register pressure too high: 72
;*         ii = 16 Did not find schedule
;*         ii = 17 Register is live too long
;*         ii = 17 Register is live too long
;*         ii = 17 Register pressure too high: 69
;*         ii = 17 Register pressure too high: 69
;*         ii = 17 Did not find schedule
;*         ii = 18 Register pressure too high: 68
;*         ii = 18 Register pressure too high: 68
;*         ii = 18 Register pressure too high: 69
;*         ii = 18 Register pressure too high: 69
;*         ii = 18 Did not find schedule
;*         ii = 19 Register pressure too high: 63
;*         ii = 19 Register pressure too high: 62
;*         ii = 19 Register pressure too high: 64
;*         ii = 19 Register pressure too high: 64
;*         ii = 19 Did not find schedule
;*         ii = 20 Register pressure too high: 58
;*         ii = 20 Register pressure too high: 60
;*         ii = 20 Register pressure too high: 61
;*         ii = 20 Register pressure too high: 61
;*         ii = 20 Did not find schedule
;*         ii = 21 Register pressure too high: 57
;*         ii = 21 Register pressure too high: 58
;*         ii = 21 Register pressure too high: 61
;*         ii = 21 Register pressure too high: 61
;*         ii = 21 Did not find schedule
;*         ii = 22 Register pressure too high: 51
;*         ii = 22 Register pressure too high: 52
;*         ii = 22 Register pressure too high: 59
;*         ii = 22 Register pressure too high: 59
;*         ii = 22 Did not find schedule
;*         ii = 23 Register pressure too high: 49
;*         ii = 23 Register pressure too high: 50
;*         ii = 23 Register pressure too high: 59
;*         ii = 23 Register pressure too high: 59
;*         ii = 23 Did not find schedule
;*         ii = 24 Register pressure too high: 49
;*         ii = 24 Register pressure too high: 51
;*         ii = 24 Register pressure too high: 58
;*         ii = 24 Register pressure too high: 58
;*         ii = 24 Did not find schedule
;*         ii = 26 Register pressure too high: 45
;*         ii = 26 Register pressure too high: 47
;*         ii = 26 Register pressure too high: 56
;*         ii = 26 Register pressure too high: 56
;*         ii = 26 Did not find schedule
;*         ii = 28 Register pressure too high: 45
;*         ii = 28 Register pressure too high: 45
;*         ii = 28 Register pressure too high: 54
;*         ii = 28 Register pressure too high: 54
;*         ii = 28 Did not find schedule
;*         ii = 30 Register pressure too high: 44
;*         ii = 30 Register pressure too high: 45
;*         ii = 30 Register pressure too high: 52
;*         ii = 30 Register pressure too high: 52
;*         ii = 30 Did not find schedule
;*         ii = 32 Register pressure too high: 43
;*         ii = 32 Register pressure too high: 43
;*         ii = 32 Register pressure too high: 51
;*         ii = 32 Register pressure too high: 51
;*         ii = 32 Did not find schedule
;*         ii = 35 Register pressure too high: 41
;*         ii = 35 Register pressure too high: 41
;*         ii = 35 Register pressure too high: 50
;*         ii = 35 Register pressure too high: 50
;*         ii = 35 Did not find schedule
;*         ii = 38 Register pressure too high: 40
;*         ii = 38 Register pressure too high: 40
;*         ii = 38 Register pressure too high: 47
;*         ii = 38 Register pressure too high: 47
;*         ii = 38 Did not find schedule
;*         ii = 41 Register pressure too high: 40
;*         ii = 41 Register pressure too high: 40
;*         ii = 41 Register pressure too high: 46
;*         ii = 41 Register pressure too high: 46
;*         ii = 41 Register pressure too high: 46
;*         ii = 41 Did not find schedule
;*         ii = 45 Register pressure too high: 40
;*         ii = 45 Register pressure too high: 40
;*         ii = 45 Register pressure too high: 44
;*         ii = 45 Register pressure too high: 44
;*         ii = 45 Register pressure too high: 44
;*         ii = 45 Did not find schedule
;*         ii = 49 Register pressure too high: 38
;*         ii = 49 Register pressure too high: 38
;*         ii = 49 Register pressure too high: 44
;*         ii = 49 Register pressure too high: 44
;*         ii = 49 Register pressure too high: 44
;*         ii = 49 Did not find schedule
;*         ii = 54 Register pressure too high: 38
;*         ii = 54 Register pressure too high: 38
;*         ii = 54 Register pressure too high: 44
;*         ii = 54 Register pressure too high: 44
;*         ii = 54 Did not find schedule
;*         ii = 59 Register pressure too high: 38
;*         ii = 59 Register pressure too high: 38
;*         ii = 59 Register pressure too high: 44
;*         ii = 59 Register pressure too high: 44
;*         ii = 59 Register pressure too high: 44
;*         ii = 59 Did not find schedule
;*      Disqualified loop: Did not find schedule
;*----------------------------------------------------------------------------*
$C$L10:    
           NOP             4
;** --------------------------------------------------------------------------*

           CMPYSP  .M1     A5:A4,A9:A8,A7:A6:A5:A4 ; |178| 
||         LDNDW   .D1T2   *+A3(16),B29:B28  ; |178| 

           LDDW    .D2T2   *+SP(72),B9:B8
           CMPYSP  .M2     B5:B4,B17:B16,B7:B6:B5:B4 ; |178| 
           LDNDW   .D1T2   *+A3(24),B27:B26  ; |178| 
           DADDSP  .L1     A7:A6,A5:A4,A5:A4 ; |178| 
           SUB     .L1     A2,1,A2           ; |171| 

           CMPYSP  .M2     B29:B28,B9:B8,B11:B10:B9:B8 ; |178| 
||         LDNDW   .D1T2   *+A3[A31],B29:B28 ; |178| 

           DADDSP  .L1     A21:A20,A5:A4,A5:A4 ; |178| 
           DADDSP  .L2     B7:B6,B5:B4,B31:B30 ; |178| 
           CMPYSP  .M2     B27:B26,B25:B24,B7:B6:B5:B4 ; |178| 
           LDNDW   .D1T2   *+A3[A30],B27:B26 ; |178| 

           DADDSP  .L2X    A5:A4,B31:B30,B1:B0 ; |178| 
||         DADDSP  .S2     B11:B10,B9:B8,B31:B30 ; |178| 

           CMPYSP  .M2     B29:B28,B3:B2,B11:B10:B9:B8 ; |178| 
           LDNDW   .D1T2   *+A3[A27],B29:B28 ; |178| 

           DADDSP  .L2     B1:B0,B31:B30,B1:B0 ; |178| 
||         DADDSP  .S2     B7:B6,B5:B4,B31:B30 ; |178| 

           CMPYSP  .M2     B27:B26,B13:B12,B7:B6:B5:B4 ; |178| 
           LDNDW   .D1T2   *+A3[A26],B27:B26 ; |178| 

           DADDSP  .L2     B1:B0,B31:B30,B1:B0 ; |178| 
||         DADDSP  .S2     B11:B10,B9:B8,B31:B30 ; |178| 

           DADD    .L2X    0,A1:A0,B9:B8

           CMPYSP  .M2     B29:B28,B9:B8,B11:B10:B9:B8 ; |178| 
||         LDNDW   .D1T2   *+A3[A25],B29:B28 ; |178| 

           DADDSP  .L2     B1:B0,B31:B30,B1:B0 ; |178| 
||         DADDSP  .S2     B7:B6,B5:B4,B31:B30 ; |178| 

           CMPYSP  .M2     B27:B26,B19:B18,B7:B6:B5:B4 ; |178| 
           LDNDW   .D1T2   *+A3[A24],B27:B26 ; |178| 

           DADDSP  .L2     B1:B0,B31:B30,B1:B0 ; |178| 
||         DADDSP  .S2     B11:B10,B9:B8,B31:B30 ; |178| 

           CMPYSP  .M2     B29:B28,B21:B20,B11:B10:B9:B8 ; |178| 
           LDNDW   .D1T2   *+A3[A17],B29:B28 ; |178| 

           DADDSP  .L2     B1:B0,B31:B30,B1:B0 ; |178| 
||         DADDSP  .S2     B7:B6,B5:B4,B31:B30 ; |178| 

           CMPYSP  .M2     B27:B26,B23:B22,B7:B6:B5:B4 ; |178| 
           LDNDW   .D1T2   *+A3[A16],B27:B26 ; |178| 

           DADDSP  .L2     B1:B0,B31:B30,B1:B0 ; |178| 
||         DADDSP  .S2     B11:B10,B9:B8,B31:B30 ; |178| 
||         LDDW    .D2T2   *+SP(64),B9:B8

           NOP             2

           DADDSP  .L2     B1:B0,B31:B30,B1:B0 ; |178| 
||         DADDSP  .S2     B7:B6,B5:B4,B31:B30 ; |178| 
||         LDDW    .D2T2   *+SP(24),B5:B4

           NOP             1

           CMPYSP  .M2     B29:B28,B9:B8,B11:B10:B9:B8 ; |178| 
||         LDNDW   .D1T2   *+A3[A23],B29:B28 ; |178| 

           DADDSP  .L2     B1:B0,B31:B30,B1:B0 ; |178| 
           NOP             1

           CMPYSP  .M2     B27:B26,B5:B4,B7:B6:B5:B4 ; |178| 
||         LDNDW   .D1T2   *+A3[A22],B27:B26 ; |178| 

           DADDSP  .L2     B11:B10,B9:B8,B31:B30 ; |178| 
||         DADD    .S2X    0,A29:A28,B9:B8

           CMPYSP  .M2     B29:B28,B9:B8,B11:B10:B9:B8 ; |178| 
           LDNDW   .D1T2   *+A3[A19],B29:B28 ; |178| 

           DADDSP  .L2     B1:B0,B31:B30,B1:B0 ; |178| 
||         DADDSP  .S2     B7:B6,B5:B4,B31:B30 ; |178| 

           DADD    .L2X    0,A11:A10,B5:B4

           CMPYSP  .M2     B27:B26,B5:B4,B7:B6:B5:B4 ; |178| 
||         LDNDW   .D1T2   *+A3[A18],B27:B26 ; |178| 

           DADDSP  .L2     B1:B0,B31:B30,B31:B30 ; |178| 
||         DADDSP  .S2     B11:B10,B9:B8,B1:B0 ; |178| 

           DADD    .L2X    0,A13:A12,B9:B8
           CMPYSP  .M2     B29:B28,B9:B8,B11:B10:B9:B8 ; |178| 

           DADDSP  .L2     B7:B6,B5:B4,B29:B28 ; |178| 
||         LDDW    .D2T2   *+SP(16),B5:B4

           DADDSP  .L2     B31:B30,B1:B0,B31:B30 ; |178| 
           ADDK    .S1     128,A3            ; |178| 
           DADDSP  .L2     B11:B10,B9:B8,B9:B8 ; |178| 
   [ A2]   LDNDW   .D1T1   *A3,A5:A4         ; |178| 
           CMPYSP  .M2     B27:B26,B5:B4,B7:B6:B5:B4 ; |178| 
           DADDSP  .L2     B31:B30,B29:B28,B27:B26 ; |178| 
   [ A2]   BNOP    .S1     $C$L10,1          ; |171| 

           DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |178| 
||         DADDSP  .S2     B27:B26,B9:B8,B7:B6 ; |178| 

           NOP             2

           DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |178| 
|| [ A2]   LDNDW   .D1T2   *+A3(8),B5:B4     ; |178| 

           ; BRANCHCC OCCURS {$C$L10}        ; |171| 
;** --------------------------------------------------------------------------*
           NOP             2
           MPYSP   .M2     B5,B5,B5          ; |185| 
           MPYSP   .M2     B4,B4,B4          ; |185| 
           NOP             3

           FADDSP  .L2     B4,B5,B5          ; |185| 
||         LDW     .D2T2   *+SP(8),B4

           NOP             4
           STW     .D2T2   B5,*++B4          ; |185| 
           LDW     .D2T2   *++SP(88),B3      ; |190| 
           LDDW    .D2T1   *++SP,A13:A12     ; |190| 
           LDDW    .D2T1   *++SP,A15:A14     ; |190| 
           LDDW    .D2T2   *++SP,B11:B10     ; |190| 
           LDDW    .D2T2   *++SP,B13:B12     ; |190| 

           LDW     .D2T1   *++SP(8),A10      ; |190| 
||         RET     .S2     B3                ; |190| 

           LDW     .D2T1   *++SP(8),A11      ; |190| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |190| 

;******************************************************************************
;* BUILD ATTRIBUTES                                                           *
;******************************************************************************
	.battr "TI", Tag_File, 1, Tag_Long_Precision_Bits(2)
	.battr "TI", Tag_File, 1, Tag_Bitfield_layout(2)
	.battr "TI", Tag_File, 1, Tag_ABI_enum_size(3)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_wchar_t(1)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_array_object_alignment(2)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_array_object_align_expected(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_PIC(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_PID(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_DSBT(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_stack_align_needed(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_stack_align_preserved(1)
	.battr "TI", Tag_File, 1, Tag_Tramps_Use_SOC(1)
