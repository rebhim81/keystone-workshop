;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.3.1 *
;* Date/Time created: Fri Mar 09 00:58:28 2012                                *
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

;	C:\ti\ccs\ccsv5\tools\compiler\c6000\bin\opt6x.exe C:\\Users\\a0270985\\AppData\\Local\\Temp\\008002 C:\\Users\\a0270985\\AppData\\Local\\Temp\\008004 
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
;*                           B13,DP,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24,   *
;*                           A25,A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20, *
;*                           B21,B22,B23,B24,B25,B26,B27,B28,B29,B30,B31      *
;*   Local Frame Size  : 0 Args + 20 Auto + 64 Save = 84 byte                 *
;******************************************************************************
intrinsicC_filters:
;** --------------------------------------------------------------------------*
           STW     .D2T1   A11,*SP--(8)      ; |13| 
           STW     .D2T1   A10,*SP--(8)      ; |13| 
           STDW    .D2T2   B13:B12,*SP--     ; |13| 

           STDW    .D2T2   B11:B10,*SP--     ; |13| 
||         ADD     .L2     3,B4,B8           ; |41| 

           STDW    .D2T1   A15:A14,*SP--     ; |13| 
||         SHR     .S2     B8,2,B8           ; |41| 

           STDW    .D2T1   A13:A12,*SP--     ; |13| 
||         SUB     .L2     B8,2,B8

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 39
;*      Loop opening brace source line   : 40
;*      Loop closing brace source line   : 51
;*      Known Minimum Trip Count         : 128                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 0
;*      Unpartitioned Resource Bound     : 1
;*      Partitioned Resource Bound(*)    : 1
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     0        0     
;*      .D units                     1*       1*    
;*      .M units                     1*       1*    
;*      .X cross paths               0        1*    
;*      .T address paths             1*       1*    
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           2        2     (.L or .S unit)
;*      Addition ops (.LSD)          0        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1*       1*    
;*      Bound(.L .S .D .LS .LSD)     1*       1*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 1  Register is live too long
;*         ii = 1  Register is live too long
;*         ii = 1  Register is live too long
;*         ii = 1  Register is live too long
;*         ii = 1  Register is live too long
;*         ii = 1  Did not find schedule
;*         ii = 2  Schedule found with 9 iterations in parallel
;*      Done
;*
;*      Loop will be splooped
;*      Collapsed epilog stages       : 0
;*      Collapsed prolog stages       : 0
;*      Minimum required memory pad   : 0 bytes
;*
;*      For further improvement on this loop, try option -mh112
;*
;*      Minimum safe trip count       : 1
;*----------------------------------------------------------------------------*
$C$L1:    ; PIPED LOOP PROLOG

           SPLOOPD 2       ;18               ; (P) 
||         ADD     .L2X    8,A4,B20
||         MV      .L1     A4,A3             ; |13| 
||         MVC     .S2     B8,ILC
||         MV      .S1     A4,A14            ; |13| 
||         ZERO    .D1     A4
||         STW     .D2T2   B3,*SP--(40)      ; |13| 

;** --------------------------------------------------------------------------*
$C$L2:    ; PIPED LOOP KERNEL

           SPMASK          S1
||         MVKH    .S1     0xbf000000,A4
||         LDDW    .D1T1   *A3++(16),A21:A20 ; |41| (P) <0,0> 

           SPMASK          L2
||         ZERO    .L2     B13

           SPMASK          L2,S2
||         SET     .S2     B13,0x18,0x1d,B13
||         MV      .L2X    A4,B12            ; |35| 

           NOP             1

           SPMASK          L1
||         DADD    .L1X    0,B13:B12,A17:A16 ; |35| 
||         LDDW    .D2T2   *B20++(16),B19:B18 ; |41| (P) <0,4> 

           SPMASK          L1,L2
||         MV      .L1     A6,A15            ; |13| 
||         MV      .L2X    A4,B11            ; |35| 
||         CMPYSP  .M1     A21:A20,A17:A16,A7:A6:A5:A4 ; |41| (P) <0,5> 

           NOP             1

           SPMASK          L2
||         MV      .L2     B13,B10           ; |35| 

           SPMASK          L2
||         DADD    .L2     0,B11:B10,B9:B8   ; |36| 

           SPMASK          L2
||         MV      .L2     B4,B1             ; |13| 
||         CMPYSP  .M2     B19:B18,B9:B8,B7:B6:B5:B4 ; |41| (P) <0,9> 
||         DADDSP  .L1     A7:A6,A5:A4,A5:A4 ; |41| (P) <0,9> 

           NOP             1

           SPMASK          S1,D1
||         ZERO    .S1     A9
||         ZERO    .D1     A8

           DADDSP  .L1     A9:A8,A5:A4,A19:A18 ; |41| (P) <0,12> 
           DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |41| (P) <0,13> 
           NOP             1
           NOP             1

           SPKERNEL 0,0
||         DADDSP  .L2X    A19:A18,B5:B4,B17:B16 ; |41| <0,16> 

;** --------------------------------------------------------------------------*
$C$L3:    ; PIPED LOOP EPILOG

           MV      .S1     A14,A3
||         ADD     .S2     7,B1,B31          ; |71| 
||         ZERO    .D1     A13

           MV      .D2X    A14,B26
||         SHR     .S2     B31,3,B21         ; |71| 
||         MVKH    .S1     0xbe800000,A13

           MV      .D1     A8,A24
||         ADDK    .S1     16,A3
||         SUB     .S2     B21,2,B21

           MV      .D1     A14,A30
||         MVC     .S2     B21,ILC
||         STW     .D2T1   A13,*+SP(8)       ; |64| 

           MV      .S1     A9,A25
||         DADD    .S2     0,B11:B10,B21:B20 ; |67| 

           ADD     .D2X    8,A14,B27
||         ADDK    .S2     24,B26

           NOP             1
           DADD    .S2     0,B13:B12,B19:B18 ; |65| 
           NOP             3
           ZERO    .S2     B6
           MVKH    .S2     0x3e800000,B6
           STW     .D2T2   B6,*+SP(12)       ; |64| 

           MV      .L1X    B6,A12            ; |64| 
||         LDDW    .D2T1   *+SP(8),A21:A20   ; |64| 

;** --------------------------------------------------------------------------*
           NOP             2
           MPYSP   .M2     B17,B17,B28       ; |53| 
           MPYSP   .M2     B16,B16,B29       ; |53| 
           NOP             3
           FADDSP  .L2     B29,B28,B28       ; |53| 
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 69
;*      Loop opening brace source line   : 70
;*      Loop closing brace source line   : 81
;*      Known Minimum Trip Count         : 64                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 0
;*      Unpartitioned Resource Bound     : 2
;*      Partitioned Resource Bound(*)    : 3
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     0        0     
;*      .D units                     2        2     
;*      .M units                     2        2     
;*      .X cross paths               4*       4*    
;*      .T address paths             2        2     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           6        6     (.L or .S unit)
;*      Addition ops (.LSD)          0        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             3*       3*    
;*      Bound(.L .S .D .LS .LSD)     3*       3*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 3  Schedule found with 9 iterations in parallel
;*      Done
;*
;*      Loop will be splooped
;*      Collapsed epilog stages       : 0
;*      Collapsed prolog stages       : 0
;*      Minimum required memory pad   : 0 bytes
;*
;*      For further improvement on this loop, try option -mh224
;*
;*      Minimum safe trip count       : 1
;*----------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP PROLOG

           SPLOOPD 3       ;27               ; (P) 
||         STW     .D1T2   B28,*A15          ; |53| 

;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP KERNEL
           LDDW    .D1T1   *A30++(32),A5:A4  ; |71| (P) <0,0> 
           NOP             4

           LDDW    .D2T2   *B27++(32),B17:B16 ; |71| (P) <0,5> 
||         CMPYSP  .M1     A5:A4,A21:A20,A7:A6:A5:A4 ; |71| (P) <0,5> 

           NOP             2
           LDDW    .D1T1   *A3++(32),A27:A26 ; |71| (P) <0,8> 
           DADDSP  .L1     A7:A6,A5:A4,A19:A18 ; |71| (P) <0,9> 

           LDDW    .D2T2   *B26++(32),B17:B16 ; |71| (P) <0,10> 
||         CMPYSP  .M2     B17:B16,B19:B18,B7:B6:B5:B4 ; |71| (P) <0,10> 

           NOP             1

           SPMASK          S1
||         DADD    .S1     0,A13:A12,A23:A22 ; |66| 

           CMPYSP  .M1     A27:A26,A23:A22,A11:A10:A9:A8 ; |71| (P) <0,13> 
||         DADDSP  .L1     A25:A24,A19:A18,A17:A16 ; |71| (P) <0,13> 

           DADDSP  .S2     B7:B6,B5:B4,B25:B24 ; |71| (P) <0,14> 
           CMPYSP  .M2     B17:B16,B21:B20,B7:B6:B5:B4 ; |71| (P) <0,15> 
           NOP             1

           DADDSP  .L1     A11:A10,A9:A8,A27:A26 ; |71| (P) <0,17> 
||         DADDSP  .L2X    A17:A16,B25:B24,B23:B22 ; |71| (P) <0,17> 

           NOP             1
           DADDSP  .L2     B7:B6,B5:B4,B9:B8 ; |71| (P) <0,19> 
           NOP             1
           DADDSP  .L2X    B23:B22,A27:A26,B25:B24 ; |71| (P) <0,21> 
           NOP             1
           DADD    .S1X    0,B9:B8,A9:A8     ; |71| (P) <0,23> Define a twin register
           NOP             1

           SPKERNEL 0,0
||         DADDSP  .S1X    B25:B24,A9:A8,A29:A28 ; |71| <0,25> 

;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP EPILOG

           DINT                              ; interrupts off
||         ADD     .D2     15,B1,B31         ; |118| 

           NOP             5
           MV      .D1     A14,A3
           NOP             3
           SUB     .D2X    A14,8,B0
           NOP             3
           ZERO    .D1     A10
           DADD    .L1     0,A25:A24,A19:A18 ; |100| 
           ZERO    .S2     B5
           MVKH    .S2     0xbf800000,B5
           DADD    .L1X    0,B11:B10,A21:A20 ; |103| 
           DADD    .L2X    0,A19:A18,B21:B20 ; |109| 
           DADD    .S2X    0,A21:A20,B19:B18 ; |108| 
           MV      .L1X    B5,A4             ; |96| 
           STW     .D2T1   A4,*+SP(16)       ; |96| 
;** --------------------------------------------------------------------------*
           SHR     .S1X    B31,4,A4          ; |118| 
           SUB     .L1     A4,5,A0
           MPYSP   .M1     A29,A29,A5        ; |83| 
           MV      .L2X    A28,B4
           MPYSP   .M2X    A28,B4,B4         ; |83| 
           SET     .S1     A10,0x17,0x1d,A10
           MV      .L1     A10,A31           ; |96| 
           STW     .D2T1   A31,*+SP(20)      ; |96| 
           LDDW    .D2T2   *+SP(16),B9:B8    ; |108| 
           FADDSP  .L1X    B4,A5,A4          ; |83| 
           NOP             2
           STW     .D1T1   A4,*++A15         ; |83| 
           LDDW    .D1T2   *+A3(8),B3:B2     ; |125| (P) <0,0> 
           LDDW    .D1T1   *A3++(64),A31:A30 ; |125| (P) <0,1> 
           NOP             3
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 116
;*      Loop opening brace source line   : 117
;*      Loop closing brace source line   : 128
;*      Known Minimum Trip Count         : 32                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 0
;*      Unpartitioned Resource Bound     : 5
;*      Partitioned Resource Bound(*)    : 5
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     1        0     
;*      .D units                     5*       3     
;*      .M units                     4        4     
;*      .X cross paths               2        4     
;*      .T address paths             4        4     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           7       10     (.L or .S unit)
;*      Addition ops (.LSD)          0        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             4        5*    
;*      Bound(.L .S .D .LS .LSD)     5*       5*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 5  Schedule found with 8 iterations in parallel
;*      Done
;*
;*      Epilog not removed
;*      Collapsed epilog stages       : 0
;*
;*      Prolog not entirely removed
;*      Collapsed prolog stages       : 3
;*
;*      Minimum required memory pad   : 0 bytes
;*
;*      For further improvement on this loop, try option -mh448
;*
;*      Minimum safe trip count       : 5
;*----------------------------------------------------------------------------*
$C$L7:    ; PIPED LOOP PROLOG

           DADD    .L1X    0,B13:B12,A9:A8   ; |94| 
||         MV      .L2     B3,B31            ; |125| (P) <0,5> Split a long life
||         LDDW    .D1T2   *+A3(8),B3:B2     ; |125| (P) <1,0> 

           CMPYSP  .M1     A31:A30,A9:A8,A7:A6:A5:A4 ; |125| (P) <0,6> 
||         LDDW    .D1T1   *A3++(64),A31:A30 ; |125| (P) <1,1> 

           LDDW    .D1T1   *-A3(112),A31:A30 ; |125| (P) <0,7> 
           MV      .L2     B2,B30            ; |125| (P) <0,8> Split a long life
           LDDW    .D1T1   *-A3(104),A29:A28 ; |125| (P) <0,9> 

           MV      .S1X    B5,A11            ; |96| 
||         CMPYSP  .M2     B31:B30,B9:B8,B7:B6:B5:B4 ; |125| (P) <0,10> 
||         DADDSP  .L1     A7:A6,A5:A4,A7:A6 ; |125| (P) <0,10> 
||         MV      .L2     B3,B31            ; |125| (P) <1,5> Split a long life
||         LDDW    .D1T2   *+A3(8),B3:B2     ; |125| (P) <2,0> 

           DADD    .L1     0,A9:A8,A17:A16   ; |98| 
||         CMPYSP  .M1     A31:A30,A9:A8,A7:A6:A5:A4 ; |125| (P) <1,6> 
||         LDDW    .D1T1   *A3++(64),A31:A30 ; |125| (P) <2,1> 

           CMPYSP  .M1     A31:A30,A17:A16,A7:A6:A5:A4 ; |125| (P) <0,12> 
||         LDDW    .D1T1   *-A3(112),A31:A30 ; |125| (P) <1,7> 

           LDDW    .D1T1   *-A3(160),A5:A4   ; |125| (P) <0,13> 
||         DADDSP  .L1     A25:A24,A7:A6,A29:A28 ; |125| (P) <0,13> 
||         MV      .L2     B2,B30            ; |125| (P) <1,8> Split a long life

           DADDSP  .S2     B7:B6,B5:B4,B23:B22 ; |125| (P) <0,14> 
||         LDDW    .D1T1   *-A3(104),A29:A28 ; |125| (P) <1,9> 

           CMPYSP  .M1     A29:A28,A19:A18,A7:A6:A5:A4 ; |125| (P) <0,15> 
||         CMPYSP  .M2     B31:B30,B9:B8,B7:B6:B5:B4 ; |125| (P) <1,10> 
||         DADDSP  .L1     A7:A6,A5:A4,A7:A6 ; |125| (P) <1,10> 
||         MV      .L2     B3,B31            ; |125| (P) <2,5> Split a long life
||         LDDW    .D1T2   *+A3(8),B3:B2     ; |125| (P) <3,0> 

           DADDSP  .L1     A7:A6,A5:A4,A31:A30 ; |125| (P) <0,16> 
||         CMPYSP  .M1     A31:A30,A9:A8,A7:A6:A5:A4 ; |125| (P) <2,6> 
||         LDDW    .D1T1   *A3++(64),A31:A30 ; |125| (P) <3,1> 

           LDDW    .D2T2   *+B0(48),B7:B6    ; |125| (P) <0,17> 
||         DADDSP  .L2X    A29:A28,B23:B22,B27:B26 ; |125| (P) <0,17> 
||         CMPYSP  .M1     A31:A30,A17:A16,A7:A6:A5:A4 ; |125| (P) <1,12> 
||         LDDW    .D1T1   *-A3(112),A31:A30 ; |125| (P) <2,7> 

           DADD    .L2X    0,A11:A10,B17:B16 ; |108| 
||         CMPYSP  .M1     A5:A4,A21:A20,A7:A6:A5:A4 ; |125| (P) <0,18> 
||         LDDW    .D1T1   *-A3(160),A5:A4   ; |125| (P) <1,13> 
||         DADDSP  .L1     A25:A24,A7:A6,A29:A28 ; |125| (P) <1,13> 
||         MV      .S2     B2,B30            ; |125| (P) <2,8> Split a long life

           LDDW    .D2T2   *+B0(56),B25:B24  ; |125| (P) <0,19> 
||         DADDSP  .L1     A7:A6,A5:A4,A27:A26 ; |125| (P) <0,19> 
|| [ A0]   BDEC    .S1     $C$L8,A0          ; |116| (P) <0,34> 
||         DADDSP  .S2     B7:B6,B5:B4,B23:B22 ; |125| (P) <1,14> 
||         LDDW    .D1T1   *-A3(104),A29:A28 ; |125| (P) <2,9> 

;** --------------------------------------------------------------------------*
$C$L8:    ; PIPED LOOP KERNEL

           DADD    .S1X    0,B23:B22,A23:A22 ; |125| <0,35> Define a twin register
||         DADDSP  .S2     B7:B6,B5:B4,B23:B22 ; |125| <1,30> 
||         DADDSP  .L2X    B27:B26,A31:A30,B25:B24 ; |125| <3,20> 
||         CMPYSP  .M1     A29:A28,A19:A18,A7:A6:A5:A4 ; |125| <4,15> 
||         CMPYSP  .M2     B31:B30,B9:B8,B7:B6:B5:B4 ; |125| <5,10> 
||         DADDSP  .L1     A7:A6,A5:A4,A7:A6 ; |125| <5,10> 
||         MV      .D2     B3,B31            ; |125| <6,5> Split a long life
||         LDDW    .D1T2   *+A3(8),B3:B2     ; |125| <7,0> 

           DADDSP  .S1X    B25:B24,A23:A22,A23:A22 ; |125| <0,36> 
||         CMPYSP  .M2     B23:B22,B21:B20,B7:B6:B5:B4 ; |125| <2,26> 
||         DADDSP  .S2     B7:B6,B5:B4,B27:B26 ; |125| <2,26> 
||         DADDSP  .L2X    B29:B28,A27:A26,B29:B28 ; |125| <2,26> 
||         LDDW    .D2T2   *++B0(64),B23:B22 ; |125| <3,21> 
||         DADDSP  .L1     A7:A6,A5:A4,A31:A30 ; |125| <4,16> 
||         CMPYSP  .M1     A31:A30,A9:A8,A7:A6:A5:A4 ; |125| <6,6> 
||         LDDW    .D1T1   *A3++(64),A31:A30 ; |125| <7,1> 

           DADDSP  .S2     B5:B4,B27:B26,B25:B24 ; |125| <1,32> 
||         CMPYSP  .M2     B7:B6,B17:B16,B7:B6:B5:B4 ; |125| <3,22> 
||         DADDSP  .L1     A7:A6,A5:A4,A27:A26 ; |125| <3,22> 
||         LDDW    .D2T2   *+B0(48),B7:B6    ; |125| <4,17> 
||         DADDSP  .L2X    A29:A28,B23:B22,B27:B26 ; |125| <4,17> 
||         CMPYSP  .M1     A31:A30,A17:A16,A7:A6:A5:A4 ; |125| <5,12> 
||         LDDW    .D1T1   *-A3(112),A31:A30 ; |125| <6,7> 

           DADDSP  .S2     B7:B6,B5:B4,B27:B26 ; |125| <2,28> 
||         DADDSP  .L2X    B25:B24,A27:A26,B29:B28 ; |125| <3,23> 
||         CMPYSP  .M1     A5:A4,A21:A20,A7:A6:A5:A4 ; |125| <4,18> 
||         LDDW    .D1T1   *-A3(160),A5:A4   ; |125| <5,13> 
||         DADDSP  .L1     A25:A24,A7:A6,A29:A28 ; |125| <5,13> 
||         MV      .D2     B2,B30            ; |125| <6,8> Split a long life

   [ A0]   BDEC    .S1     $C$L8,A0          ; |116| <1,34> 
||         DADDSP  .L2     B29:B28,B27:B26,B5:B4 ; |125| <2,29> 
||         CMPYSP  .M2     B25:B24,B19:B18,B7:B6:B5:B4 ; |125| <3,24> 
||         LDDW    .D2T2   *+B0(56),B25:B24  ; |125| <4,19> 
||         DADDSP  .L1     A7:A6,A5:A4,A27:A26 ; |125| <4,19> 
||         DADDSP  .S2     B7:B6,B5:B4,B23:B22 ; |125| <5,14> 
||         LDDW    .D1T1   *-A3(104),A29:A28 ; |125| <6,9> 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop source line                 : 171
;*      Loop opening brace source line   : 172
;*      Loop closing brace source line   : 183
;*      Known Minimum Trip Count         : 16                    
;*      Known Max Trip Count Factor      : 1
;*      Loop Carried Dependency Bound(^) : 3
;*      Unpartitioned Resource Bound     : 9
;*      Partitioned Resource Bound(*)    : 15
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     0        1     
;*      .D units                     9        7     
;*      .M units                     8        8     
;*      .X cross paths              15*      14     
;*      .T address paths             8        8     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)          23       22     (.L or .S unit)
;*      Addition ops (.LSD)          0        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)            12       12     
;*      Bound(.L .S .D .LS .LSD)    11       10     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 15 Address increment too large
;*         ii = 15 Register pressure too high: 42
;*         ii = 15 Register pressure too high: 74
;*         ii = 15 Did not find schedule
;*         ii = 16 Register pressure too high: 43
;*         ii = 16 Register pressure too high: 34
;*         ii = 16 Register pressure too high: 57
;*         ii = 16 Register pressure too high: 48
;*         ii = 16 Register pressure too high: 56
;*         ii = 16 Did not find schedule
;*         ii = 17 Register pressure too high: 42
;*         ii = 17 Cannot allocate machine registers
;*                   Regs Live Always   : 19/18 (A/B-side)
;*                   Max Regs Live      : 33/30
;*                   Max Cond Regs Live :  0/1 
;*         ii = 17 Register pressure too high: 61
;*         ii = 17 Register pressure too high: 48
;*         ii = 17 Register pressure too high: 54
;*         ii = 17 Did not find schedule
;*         ii = 18 Register pressure too high: 41
;*         ii = 18 Cannot allocate machine registers
;*                   Regs Live Always   : 19/18 (A/B-side)
;*                   Max Regs Live      : 33/30
;*                   Max Cond Regs Live :  0/1 
;*         ii = 18 Register pressure too high: 55
;*         ii = 18 Register pressure too high: 48
;*         ii = 18 Address increment too large
;*         ii = 18 Did not find schedule
;*         ii = 19 Register pressure too high: 43
;*         ii = 19 Schedule found with 4 iterations in parallel
;*      Done
;*
;*      Epilog not removed
;*      Collapsed epilog stages       : 0
;*
;*      Prolog not removed
;*      Collapsed prolog stages       : 0
;*
;*      Minimum required memory pad   : 0 bytes
;*
;*      For further improvement on this loop, try option -mh384
;*
;*      Minimum safe trip count       : 4
;*----------------------------------------------------------------------------*
$C$L9:    ; PIPED LOOP EPILOG AND PROLOG

           MV      .D1     A24,A0
||         DADD    .S1X    0,B23:B22,A23:A22 ; |125| (E) <1,35> Define a twin register
||         DADDSP  .S2     B7:B6,B5:B4,B23:B22 ; |125| (E) <2,30> 
||         DADDSP  .L2X    B27:B26,A31:A30,B25:B24 ; |125| (E) <4,20> 
||         CMPYSP  .M1     A29:A28,A19:A18,A7:A6:A5:A4 ; |125| (E) <5,15> 
||         CMPYSP  .M2     B31:B30,B9:B8,B7:B6:B5:B4 ; |125| (E) <6,10> 
||         DADDSP  .L1     A7:A6,A5:A4,A7:A6 ; |125| (E) <6,10> 
||         MV      .D2     B3,B31            ; |125| (E) <7,5> Split a long life

           MV      .D1     A25,A1
||         DADDSP  .S1X    B25:B24,A23:A22,A23:A22 ; |125| (E) <1,36> 
||         CMPYSP  .M2     B23:B22,B21:B20,B7:B6:B5:B4 ; |125| (E) <3,26> 
||         DADDSP  .S2     B7:B6,B5:B4,B27:B26 ; |125| (E) <3,26> 
||         DADDSP  .L2X    B29:B28,A27:A26,B29:B28 ; |125| (E) <3,26> 
||         LDDW    .D2T2   *++B0(64),B23:B22 ; |125| (E) <4,21> 
||         DADDSP  .L1     A7:A6,A5:A4,A31:A30 ; |125| (E) <5,16> 
||         CMPYSP  .M1     A31:A30,A9:A8,A7:A6:A5:A4 ; |125| (E) <7,6> 

           DADDSP  .S2     B5:B4,B27:B26,B25:B24 ; |125| (E) <2,32> 
||         CMPYSP  .M2     B7:B6,B17:B16,B7:B6:B5:B4 ; |125| (E) <4,22> 
||         DADDSP  .L1     A7:A6,A5:A4,A27:A26 ; |125| (E) <4,22> 
||         LDDW    .D2T2   *+B0(48),B7:B6    ; |125| (E) <5,17> 
||         DADDSP  .L2X    A29:A28,B23:B22,B27:B26 ; |125| (E) <5,17> 
||         CMPYSP  .M1     A31:A30,A17:A16,A7:A6:A5:A4 ; |125| (E) <6,12> 
||         LDDW    .D1T1   *-A3(48),A31:A30  ; |125| (E) <7,7> 

           DADDSP  .S2     B7:B6,B5:B4,B27:B26 ; |125| (E) <3,28> 
||         DADDSP  .L2X    B25:B24,A27:A26,B29:B28 ; |125| (E) <4,23> 
||         CMPYSP  .M1     A5:A4,A21:A20,A7:A6:A5:A4 ; |125| (E) <5,18> 
||         LDDW    .D1T1   *-A3(96),A5:A4    ; |125| (E) <6,13> 
||         DADDSP  .L1     A25:A24,A7:A6,A29:A28 ; |125| (E) <6,13> 
||         MV      .D2     B2,B30            ; |125| (E) <7,8> Split a long life

           DADDSP  .L2     B29:B28,B27:B26,B5:B4 ; |125| (E) <3,29> 
||         CMPYSP  .M2     B25:B24,B19:B18,B7:B6:B5:B4 ; |125| (E) <4,24> 
||         LDDW    .D2T2   *+B0(56),B25:B24  ; |125| (E) <5,19> 
||         DADDSP  .L1     A7:A6,A5:A4,A27:A26 ; |125| (E) <5,19> 
||         DADDSP  .S2     B7:B6,B5:B4,B23:B22 ; |125| (E) <6,14> 
||         LDDW    .D1T1   *-A3(40),A29:A28  ; |125| (E) <7,9> 

           ADD     .D2     B1,31,B31         ; |173| 
||         DADD    .S1X    0,B23:B22,A23:A22 ; |125| (E) <2,35> Define a twin register
||         DADDSP  .S2     B7:B6,B5:B4,B23:B22 ; |125| (E) <3,30> 
||         DADDSP  .L2X    B27:B26,A31:A30,B25:B24 ; |125| (E) <5,20> 
||         CMPYSP  .M1     A29:A28,A19:A18,A7:A6:A5:A4 ; |125| (E) <6,15> 
||         CMPYSP  .M2     B31:B30,B9:B8,B7:B6:B5:B4 ; |125| (E) <7,10> 
||         DADDSP  .L1     A7:A6,A5:A4,A7:A6 ; |125| (E) <7,10> 

           DADDSP  .S1X    B25:B24,A23:A22,A23:A22 ; |125| (E) <2,36> 
||         CMPYSP  .M2     B23:B22,B21:B20,B7:B6:B5:B4 ; |125| (E) <4,26> 
||         DADDSP  .S2     B7:B6,B5:B4,B27:B26 ; |125| (E) <4,26> 
||         DADDSP  .L2X    B29:B28,A27:A26,B29:B28 ; |125| (E) <4,26> 
||         LDDW    .D2T2   *++B0(64),B23:B22 ; |125| (E) <5,21> 
||         DADDSP  .L1     A7:A6,A5:A4,A31:A30 ; |125| (E) <6,16> 

           DADDSP  .S2     B5:B4,B27:B26,B25:B24 ; |125| (E) <3,32> 
||         CMPYSP  .M2     B7:B6,B17:B16,B7:B6:B5:B4 ; |125| (E) <5,22> 
||         DADDSP  .L1     A7:A6,A5:A4,A27:A26 ; |125| (E) <5,22> 
||         LDDW    .D2T2   *+B0(48),B7:B6    ; |125| (E) <6,17> 
||         DADDSP  .L2X    A29:A28,B23:B22,B27:B26 ; |125| (E) <6,17> 
||         CMPYSP  .M1     A31:A30,A17:A16,A7:A6:A5:A4 ; |125| (E) <7,12> 

           DADDSP  .S2     B7:B6,B5:B4,B27:B26 ; |125| (E) <4,28> 
||         DADDSP  .L2X    B25:B24,A27:A26,B29:B28 ; |125| (E) <5,23> 
||         CMPYSP  .M1     A5:A4,A21:A20,A7:A6:A5:A4 ; |125| (E) <6,18> 
||         LDDW    .D1T1   *-A3(32),A5:A4    ; |125| (E) <7,13> 
||         DADDSP  .L1     A25:A24,A7:A6,A29:A28 ; |125| (E) <7,13> 

           DADDSP  .L2     B29:B28,B27:B26,B5:B4 ; |125| (E) <4,29> 
||         CMPYSP  .M2     B25:B24,B19:B18,B7:B6:B5:B4 ; |125| (E) <5,24> 
||         LDDW    .D2T2   *+B0(56),B25:B24  ; |125| (E) <6,19> 
||         DADDSP  .L1     A7:A6,A5:A4,A27:A26 ; |125| (E) <6,19> 
||         DADDSP  .S2     B7:B6,B5:B4,B23:B22 ; |125| (E) <7,14> 

           LDDW    .D2T1   *+SP(8),A17:A16   ; |151| 
||         DADD    .S1X    0,B23:B22,A23:A22 ; |125| (E) <3,35> Define a twin register
||         DADDSP  .S2     B7:B6,B5:B4,B23:B22 ; |125| (E) <4,30> 
||         DADDSP  .L2X    B27:B26,A31:A30,B25:B24 ; |125| (E) <6,20> 
||         CMPYSP  .M1     A29:A28,A19:A18,A7:A6:A5:A4 ; |125| (E) <7,15> 

           DADDSP  .S1X    B25:B24,A23:A22,A23:A22 ; |125| (E) <3,36> 
||         CMPYSP  .M2     B23:B22,B21:B20,B7:B6:B5:B4 ; |125| (E) <5,26> 
||         DADDSP  .S2     B7:B6,B5:B4,B27:B26 ; |125| (E) <5,26> 
||         DADDSP  .L2X    B29:B28,A27:A26,B29:B28 ; |125| (E) <5,26> 
||         LDDW    .D2T2   *++B0(64),B23:B22 ; |125| (E) <6,21> 
||         DADDSP  .L1     A7:A6,A5:A4,A31:A30 ; |125| (E) <7,16> 

           DADDSP  .S2     B5:B4,B27:B26,B25:B24 ; |125| (E) <4,32> 
||         CMPYSP  .M2     B7:B6,B17:B16,B7:B6:B5:B4 ; |125| (E) <6,22> 
||         DADDSP  .L1     A7:A6,A5:A4,A27:A26 ; |125| (E) <6,22> 
||         LDDW    .D2T2   *+B0(48),B7:B6    ; |125| (E) <7,17> 
||         DADDSP  .L2X    A29:A28,B23:B22,B27:B26 ; |125| (E) <7,17> 

           DADDSP  .S2     B7:B6,B5:B4,B27:B26 ; |125| (E) <5,28> 
||         DADDSP  .L2X    B25:B24,A27:A26,B29:B28 ; |125| (E) <6,23> 
||         CMPYSP  .M1     A5:A4,A21:A20,A7:A6:A5:A4 ; |125| (E) <7,18> 

           DADDSP  .L2     B29:B28,B27:B26,B5:B4 ; |125| (E) <5,29> 
||         CMPYSP  .M2     B25:B24,B19:B18,B7:B6:B5:B4 ; |125| (E) <6,24> 
||         LDDW    .D2T2   *+B0(56),B25:B24  ; |125| (E) <7,19> 
||         DADDSP  .L1     A7:A6,A5:A4,A27:A26 ; |125| (E) <7,19> 

           DADD    .L1     0,A13:A12,A31:A30 ; |163| 
||         DADD    .S1X    0,B23:B22,A23:A22 ; |125| (E) <4,35> Define a twin register
||         DADDSP  .S2     B7:B6,B5:B4,B23:B22 ; |125| (E) <5,30> 
||         DADDSP  .L2X    B27:B26,A31:A30,B25:B24 ; |125| (E) <7,20> 

           DADDSP  .S1X    B25:B24,A23:A22,A23:A22 ; |125| (E) <4,36> 
||         CMPYSP  .M2     B23:B22,B21:B20,B7:B6:B5:B4 ; |125| (E) <6,26> 
||         DADDSP  .S2     B7:B6,B5:B4,B27:B26 ; |125| (E) <6,26> 
||         DADDSP  .L2X    B29:B28,A27:A26,B29:B28 ; |125| (E) <6,26> 
||         LDDW    .D2T2   *++B0(64),B23:B22 ; |125| (E) <7,21> 

           LDDW    .D2T2   *+SP(16),B17:B16  ; |151| 
||         DADDSP  .S2     B5:B4,B27:B26,B25:B24 ; |125| (E) <5,32> 
||         CMPYSP  .M2     B7:B6,B17:B16,B7:B6:B5:B4 ; |125| (E) <7,22> 
||         DADDSP  .L1     A7:A6,A5:A4,A27:A26 ; |125| (E) <7,22> 

           DADDSP  .S2     B7:B6,B5:B4,B27:B26 ; |125| (E) <6,28> 
||         DADDSP  .L2X    B25:B24,A27:A26,B29:B28 ; |125| (E) <7,23> 

           SUB     .D2X    A14,8,B1
||         DADDSP  .L2     B29:B28,B27:B26,B5:B4 ; |125| (E) <6,29> 
||         CMPYSP  .M2     B25:B24,B19:B18,B7:B6:B5:B4 ; |125| (E) <7,24> 

           DADD    .L1X    0,B23:B22,A23:A22 ; |125| (E) <5,35> Define a twin register
||         DADDSP  .S2     B7:B6,B5:B4,B23:B22 ; |125| (E) <6,30> 

           ZERO    .L1     A27
||         DADDSP  .S1X    B25:B24,A23:A22,A23:A22 ; |125| (E) <5,36> 
||         CMPYSP  .M2     B23:B22,B21:B20,B7:B6:B5:B4 ; |125| (E) <7,26> 
||         DADDSP  .S2     B7:B6,B5:B4,B27:B26 ; |125| (E) <7,26> 
||         DADDSP  .L2X    B29:B28,A27:A26,B29:B28 ; |125| (E) <7,26> 

           MVKH    .S1     0xbf400000,A27
||         MV      .L1     A13,A25
||         MV      .D1     A12,A24
||         DADD    .L2X    0,A25:A24,B21:B20 ; |156| 
||         DADDSP  .S2     B5:B4,B27:B26,B25:B24 ; |125| (E) <6,32> 

           MV      .L1     A27,A18           ; |151| 
||         DADDSP  .S2     B7:B6,B5:B4,B27:B26 ; |125| (E) <7,28> 

           DADDSP  .L2     B29:B28,B27:B26,B5:B4 ; |125| (E) <7,29> 

           DADD    .L2     0,B13:B12,B9:B8   ; |150| 
||         DADD    .L1X    0,B23:B22,A23:A22 ; |125| (E) <6,35> Define a twin register
||         DADDSP  .S2     B7:B6,B5:B4,B23:B22 ; |125| (E) <7,30> 

           SHR     .S2     B31,5,B6          ; |173| 

           DADD    .L2     0,B9:B8,B19:B18   ; |154| 
||         ZERO    .D2     B5
||         DADDSP  .S2     B5:B4,B27:B26,B25:B24 ; |125| (E) <7,32> 

           DADD    .L2     0,B21:B20,B29:B28 ; |164| 
||         SUB     .D2     B6,4,B0
||         MVKH    .S2     0x3f400000,B5

           DADD    .L2     0,B11:B10,B23:B22 ; |158| 
||         DADD    .L1X    0,B23:B22,A23:A22 ; |125| (E) <7,35> Define a twin register

           DADD    .L2     0,B23:B22,B27:B26 ; |162| 
||         MV      .L1X    B5,A19            ; |151| 
||         RINT                              ; interrupts on

           DADD    .L1     0,A19:A18,A21:A20 ; |153| 
||         DINT                              ; interrupts off
||         DADD    .L2X    0,A11:A10,B25:B24 ; |151| 
||         DADDSP  .S1X    B25:B24,A23:A22,A23:A22 ; |125| (E) <7,36> 

           MV      .L1X    B5,A26            ; |151| 
           DADD    .L1     0,A27:A26,A29:A28 ; |161| 
           MPYSP   .M1     A23,A23,A3        ; |130| 
           MV      .L2X    A22,B4

           DADD    .L1     0,A17:A16,A23:A22 ; |155| 
||         MPYSP   .M2X    A22,B4,B4         ; |130| 

           NOP             4
           FADDSP  .L1X    B4,A3,A3          ; |130| 
           NOP             2
           STW     .D1T1   A3,*++A15         ; |130| 
           LDDW    .D1T2   *+A14(8),B11:B10  ; |180| (P) <0,0> 
           LDDW    .D1T1   *A14++(128),A13:A12 ; |180| (P) <0,1> 
           LDDW    .D1T1   *-A14(112),A5:A4  ; |180| (P) <0,3> 
           NOP             3
           CMPYSP  .M1     A13:A12,A17:A16,A11:A10:A9:A8 ; |180| (P) <0,7> 
           CMPYSP  .M1     A5:A4,A19:A18,A11:A10:A9:A8 ; |180| (P) <0,8>  ^ 
           CMPYSP  .M2     B11:B10,B9:B8,B7:B6:B5:B4 ; |180| (P) <0,9> 
           LDDW    .D1T2   *-A14(104),B31:B30 ; |180| (P) <0,10> 

           LDDW    .D1T1   *-A14(96),A7:A6   ; |180| (P) <0,11> 
||         DADDSP  .L1     A11:A10,A9:A8,A13:A12 ; |180| (P) <0,11> 

           NOP             1

           DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |180| (P) <0,13> 
||         DADD    .S2X    0,A9:A8,B11:B10   ; |180| (P) <0,13>  ^ Define a twin register

           DADDSP  .L1     A1:A0,A13:A12,A5:A4 ; |180| (P) <0,14> 
           CMPYSP  .M2     B31:B30,B17:B16,B7:B6:B5:B4 ; |180| (P) <0,15> 

           LDDW    .D1T2   *-A14(88),B7:B6   ; |180| (P) <0,16> 
||         CMPYSP  .M1     A7:A6,A21:A20,A11:A10:A9:A8 ; |180| (P) <0,16>  ^ 
||         DADDSP  .L2X    A11:A10,B11:B10,B31:B30 ; |180| (P) <0,16>  ^ 

           LDDW    .D1T1   *-A14(80),A7:A6   ; |180| (P) <0,17> 
||         DADDSP  .L1X    A5:A4,B5:B4,A13:A12 ; |180| (P) <0,17> 

           NOP             1

           DADDSP  .L2     B7:B6,B5:B4,B3:B2 ; |180| (P) <0,19> 
||         LDDW    .D1T2   *+A14(8),B11:B10  ; |180| (P) <1,0> 

           DADDSP  .L1X    A13:A12,B31:B30,A5:A4 ; |180| (P) <0,20> 
||         LDDW    .D1T1   *A14++(128),A13:A12 ; |180| (P) <1,1> 

           LDDW    .D1T2   *-A14(200),B7:B6  ; |180| (P) <0,21> 
||         CMPYSP  .M2     B7:B6,B19:B18,B7:B6:B5:B4 ; |180| (P) <0,21> 
||         DADD    .S2X    0,A9:A8,B7:B6     ; |180| (P) <0,21>  ^ Define a twin register

           CMPYSP  .M1     A7:A6,A23:A22,A11:A10:A9:A8 ; |180| (P) <0,22>  ^ 
||         DADDSP  .L2X    A11:A10,B7:B6,B3:B2 ; |180| (P) <0,22>  ^ 
||         LDDW    .D1T1   *-A14(112),A5:A4  ; |180| (P) <1,3> 

           LDDW    .D1T1   *-A14(192),A9:A8  ; |180| (P) <0,23> 
||         DADDSP  .L1X    A5:A4,B3:B2,A5:A4 ; |180| (P) <0,23> 

           NOP             1
           DADDSP  .L2     B7:B6,B5:B4,B31:B30 ; |180| (P) <0,25> 

           DADDSP  .L1X    A5:A4,B3:B2,A9:A8 ; |180| (P) <0,26> 
||         CMPYSP  .M1     A13:A12,A17:A16,A11:A10:A9:A8 ; |180| (P) <1,7> 

           LDDW    .D2T2   *+B1(80),B31:B30  ; |180| (P) <0,27> 
||         CMPYSP  .M2     B7:B6,B21:B20,B7:B6:B5:B4 ; |180| (P) <0,27> 
||         DADD    .S2X    0,A9:A8,B5:B4     ; |180| (P) <0,27>  ^ Define a twin register
||         CMPYSP  .M1     A5:A4,A19:A18,A11:A10:A9:A8 ; |180| (P) <1,8>  ^ 

           LDDW    .D2T1   *+B1(88),A9:A8    ; |180| (P) <0,28> 
||         CMPYSP  .M1     A9:A8,A25:A24,A7:A6:A5:A4 ; |180| (P) <0,28>  ^ 
||         DADDSP  .L2X    A11:A10,B5:B4,B11:B10 ; |180| (P) <0,28>  ^ 
||         CMPYSP  .M2     B11:B10,B9:B8,B7:B6:B5:B4 ; |180| (P) <1,9> 

           DADDSP  .L1X    A9:A8,B31:B30,A13:A12 ; |180| (P) <0,29> 
||         LDDW    .D1T2   *-A14(104),B31:B30 ; |180| (P) <1,10> 

           LDDW    .D1T1   *-A14(96),A7:A6   ; |180| (P) <1,11> 
||         DADDSP  .L1     A11:A10,A9:A8,A13:A12 ; |180| (P) <1,11> 

           DADDSP  .L2     B7:B6,B5:B4,B7:B6 ; |180| (P) <0,31> 

           DADDSP  .L1X    A13:A12,B11:B10,A5:A4 ; |180| (P) <0,32> 
||         DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |180| (P) <1,13> 
||         DADD    .S2X    0,A9:A8,B11:B10   ; |180| (P) <1,13>  ^ Define a twin register

           LDDW    .D2T2   *+B1(96),B3:B2    ; |180| (P) <0,33> 
||         CMPYSP  .M2     B31:B30,B23:B22,B7:B6:B5:B4 ; |180| (P) <0,33> 
||         CMPYSP  .M1     A9:A8,A27:A26,A7:A6:A5:A4 ; |180| (P) <0,33>  ^ 
||         DADD    .S2X    0,A5:A4,B5:B4     ; |180| (P) <0,33>  ^ Define a twin register
||         DADDSP  .L1     A1:A0,A13:A12,A5:A4 ; |180| (P) <1,14> 

           LDDW    .D2T1   *+B1(104),A5:A4   ; |180| (P) <0,34> 
||         DADDSP  .L2X    A7:A6,B5:B4,B11:B10 ; |180| (P) <0,34>  ^ 
||         CMPYSP  .M2     B31:B30,B17:B16,B7:B6:B5:B4 ; |180| (P) <1,15> 

           DADDSP  .L1X    A5:A4,B7:B6,A9:A8 ; |180| (P) <0,35> 
||         LDDW    .D1T2   *-A14(88),B7:B6   ; |180| (P) <1,16> 
||         CMPYSP  .M1     A7:A6,A21:A20,A11:A10:A9:A8 ; |180| (P) <1,16>  ^ 
||         DADDSP  .L2X    A11:A10,B11:B10,B31:B30 ; |180| (P) <1,16>  ^ 

           LDDW    .D1T1   *-A14(80),A7:A6   ; |180| (P) <1,17> 
||         DADDSP  .L1X    A5:A4,B5:B4,A13:A12 ; |180| (P) <1,17> 

           DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |180| (P) <0,37> 

           LDDW    .D2T1   *+B1(120),A9:A8   ; |180| (P) <0,38> 
||         CMPYSP  .M2     B3:B2,B25:B24,B7:B6:B5:B4 ; |180| (P) <0,38> 
||         DADD    .S2X    0,A5:A4,B5:B4     ; |180| (P) <0,38>  ^ Define a twin register
||         DADDSP  .L1X    A9:A8,B11:B10,A5:A4 ; |180| (P) <0,38> 
||         DADDSP  .L2     B7:B6,B5:B4,B3:B2 ; |180| (P) <1,19> 
||         LDDW    .D1T2   *+A14(8),B11:B10  ; |180| (P) <2,0> 

           LDDW    .D2T2   *+B1(112),B31:B30 ; |180| (P) <0,39> 
||         CMPYSP  .M1     A5:A4,A29:A28,A7:A6:A5:A4 ; |180| (P) <0,39>  ^ 
||         DADDSP  .L2X    A7:A6,B5:B4,B31:B30 ; |180| (P) <0,39>  ^ 
||         DADDSP  .L1X    A13:A12,B31:B30,A5:A4 ; |180| (P) <1,20> 
||         LDDW    .D1T1   *A14++(128),A13:A12 ; |180| (P) <2,1> 

           LDDW    .D1T2   *-A14(200),B7:B6  ; |180| (P) <1,21> 
||         CMPYSP  .M2     B7:B6,B19:B18,B7:B6:B5:B4 ; |180| (P) <1,21> 
||         DADD    .S2X    0,A9:A8,B7:B6     ; |180| (P) <1,21>  ^ Define a twin register

           DADDSP  .L1X    A5:A4,B5:B4,A9:A8 ; |180| (P) <0,41> 
||         CMPYSP  .M1     A7:A6,A23:A22,A11:A10:A9:A8 ; |180| (P) <1,22>  ^ 
||         DADDSP  .L2X    A11:A10,B7:B6,B3:B2 ; |180| (P) <1,22>  ^ 
||         LDDW    .D1T1   *-A14(112),A5:A4  ; |180| (P) <2,3> 

           DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |180| (P) <0,42> 
||         LDDW    .D1T1   *-A14(192),A9:A8  ; |180| (P) <1,23> 
||         DADDSP  .L1X    A5:A4,B3:B2,A5:A4 ; |180| (P) <1,23> 

;** --------------------------------------------------------------------------*
$C$L10:    ; PIPED LOOP KERNEL

           LDDW    .D2T2   *++B1(128),B11:B10 ; |180| <0,43> 
||         CMPYSP  .M1     A9:A8,A31:A30,A7:A6:A5:A4 ; |180| <0,43>  ^ 
||         DADD    .S1X    0,B31:B30,A3:A2   ; |180| <0,43> Define a twin register

           CMPYSP  .M2     B31:B30,B27:B26,B7:B6:B5:B4 ; |180| <0,44> 
||         DADD    .S2X    0,A5:A4,B31:B30   ; |180| <0,44>  ^ Define a twin register
||         DADDSP  .L1     A9:A8,A3:A2,A13:A12 ; |180| <0,44> 
||         DADDSP  .L2     B7:B6,B5:B4,B31:B30 ; |180| <1,25> 

           DADDSP  .L2X    A7:A6,B31:B30,B3:B2 ; |180| <0,45>  ^ 
||         DADDSP  .L1X    A5:A4,B3:B2,A9:A8 ; |180| <1,26> 
||         CMPYSP  .M1     A13:A12,A17:A16,A11:A10:A9:A8 ; |180| <2,7> 

           DADD    .S1X    0,B5:B4,A3:A2     ; |180| <0,46> Define a twin register
||         LDDW    .D2T2   *+B1(80),B31:B30  ; |180| <1,27> 
||         CMPYSP  .M2     B7:B6,B21:B20,B7:B6:B5:B4 ; |180| <1,27> 
||         DADD    .S2X    0,A9:A8,B5:B4     ; |180| <1,27>  ^ Define a twin register
||         CMPYSP  .M1     A5:A4,A19:A18,A11:A10:A9:A8 ; |180| <2,8>  ^ 

           DADDSP  .L1     A13:A12,A3:A2,A7:A6 ; |180| <0,47> 
||         LDDW    .D2T1   *+B1(88),A9:A8    ; |180| <1,28> 
||         CMPYSP  .M1     A9:A8,A25:A24,A7:A6:A5:A4 ; |180| <1,28>  ^ 
||         DADDSP  .L2X    A11:A10,B5:B4,B11:B10 ; |180| <1,28>  ^ 
||         CMPYSP  .M2     B11:B10,B9:B8,B7:B6:B5:B4 ; |180| <2,9> 

           CMPYSP  .M2     B11:B10,B29:B28,B7:B6:B5:B4 ; |180| <0,48> 
||         DADDSP  .L2     B7:B6,B5:B4,B3:B2 ; |180| <0,48> 
||         DADD    .S2X    0,A5:A4,B5:B4     ; |180| <0,48>  ^ Define a twin register
||         DADDSP  .L1X    A9:A8,B31:B30,A13:A12 ; |180| <1,29> 
||         LDDW    .D1T2   *-A14(104),B31:B30 ; |180| <2,10> 

           DADDSP  .L2X    A7:A6,B5:B4,B13:B12 ; |180| <0,49>  ^ 
||         DADD    .S1X    0,B3:B2,A5:A4     ; |180| <0,49> Define a twin register
||         LDDW    .D1T1   *-A14(96),A7:A6   ; |180| <2,11> 
||         DADDSP  .L1     A11:A10,A9:A8,A13:A12 ; |180| <2,11> 

           DADDSP  .L1     A7:A6,A5:A4,A9:A8 ; |180| <0,50> 
||         DADDSP  .L2     B7:B6,B5:B4,B7:B6 ; |180| <1,31> 

           DADDSP  .L1X    A13:A12,B11:B10,A5:A4 ; |180| <1,32> 
||         DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |180| <2,13> 
||         DADD    .S2X    0,A9:A8,B11:B10   ; |180| <2,13>  ^ Define a twin register

           DADDSP  .L2     B7:B6,B5:B4,B31:B30 ; |180| <0,52> 
||         DADD    .S1X    0,B3:B2,A5:A4     ; |180| <0,52> Define a twin register
||         LDDW    .D2T2   *+B1(96),B3:B2    ; |180| <1,33> 
||         CMPYSP  .M2     B31:B30,B23:B22,B7:B6:B5:B4 ; |180| <1,33> 
||         CMPYSP  .M1     A9:A8,A27:A26,A7:A6:A5:A4 ; |180| <1,33>  ^ 
||         DADD    .S2X    0,A5:A4,B5:B4     ; |180| <1,33>  ^ Define a twin register
||         DADDSP  .L1     A1:A0,A13:A12,A5:A4 ; |180| <2,14> 

           DADD    .S1X    0,B13:B12,A9:A8   ; |180| <0,53> Define a twin register
||         DADDSP  .L1     A9:A8,A5:A4,A3:A2 ; |180| <0,53> 
||         LDDW    .D2T1   *+B1(104),A5:A4   ; |180| <1,34> 
||         DADDSP  .L2X    A7:A6,B5:B4,B11:B10 ; |180| <1,34>  ^ 
||         CMPYSP  .M2     B31:B30,B17:B16,B7:B6:B5:B4 ; |180| <2,15> 

           DADDSP  .L1X    A5:A4,B7:B6,A9:A8 ; |180| <1,35> 
||         LDDW    .D1T2   *-A14(88),B7:B6   ; |180| <2,16> 
||         CMPYSP  .M1     A7:A6,A21:A20,A11:A10:A9:A8 ; |180| <2,16>  ^ 
||         DADDSP  .L2X    A11:A10,B11:B10,B31:B30 ; |180| <2,16>  ^ 

           LDDW    .D1T1   *-A14(80),A7:A6   ; |180| <2,17> 
||         DADDSP  .L1X    A5:A4,B5:B4,A13:A12 ; |180| <2,17> 

   [ B0]   BDEC    .S2     $C$L10,B0         ; |171| <0,56> 
||         DADD    .S1X    0,B31:B30,A3:A2   ; |180| <0,56> Define a twin register
||         DADDSP  .L1     A3:A2,A9:A8,A5:A4 ; |180| <0,56> 
||         DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |180| <1,37> 

           LDDW    .D2T1   *+B1(120),A9:A8   ; |180| <1,38> 
||         CMPYSP  .M2     B3:B2,B25:B24,B7:B6:B5:B4 ; |180| <1,38> 
||         DADD    .S2X    0,A5:A4,B5:B4     ; |180| <1,38>  ^ Define a twin register
||         DADDSP  .L1X    A9:A8,B11:B10,A5:A4 ; |180| <1,38> 
||         DADDSP  .L2     B7:B6,B5:B4,B3:B2 ; |180| <2,19> 
||         LDDW    .D1T2   *+A14(8),B11:B10  ; |180| <3,0> 

           LDDW    .D2T2   *+B1(112),B31:B30 ; |180| <1,39> 
||         CMPYSP  .M1     A5:A4,A29:A28,A7:A6:A5:A4 ; |180| <1,39>  ^ 
||         DADDSP  .L2X    A7:A6,B5:B4,B31:B30 ; |180| <1,39>  ^ 
||         DADDSP  .L1X    A13:A12,B31:B30,A5:A4 ; |180| <2,20> 
||         LDDW    .D1T1   *A14++(128),A13:A12 ; |180| <3,1> 

           DADDSP  .L1     A5:A4,A3:A2,A3:A2 ; |180| <0,59> 
||         LDDW    .D1T2   *-A14(200),B7:B6  ; |180| <2,21> 
||         CMPYSP  .M2     B7:B6,B19:B18,B7:B6:B5:B4 ; |180| <2,21> 
||         DADD    .S2X    0,A9:A8,B7:B6     ; |180| <2,21>  ^ Define a twin register

           DADDSP  .L1X    A5:A4,B5:B4,A9:A8 ; |180| <1,41> 
||         CMPYSP  .M1     A7:A6,A23:A22,A11:A10:A9:A8 ; |180| <2,22>  ^ 
||         DADDSP  .L2X    A11:A10,B7:B6,B3:B2 ; |180| <2,22>  ^ 
||         LDDW    .D1T1   *-A14(112),A5:A4  ; |180| <3,3> 

           DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |180| <1,42> 
||         LDDW    .D1T1   *-A14(192),A9:A8  ; |180| <2,23> 
||         DADDSP  .L1X    A5:A4,B3:B2,A5:A4 ; |180| <2,23> 

;** --------------------------------------------------------------------------*
$C$L11:    ; PIPED LOOP EPILOG

           LDDW    .D2T2   *++B1(128),B11:B10 ; |180| (E) <1,43> 
||         CMPYSP  .M1     A9:A8,A31:A30,A7:A6:A5:A4 ; |180| (E) <1,43>  ^ 
||         DADD    .S1X    0,B31:B30,A3:A2   ; |180| (E) <1,43> Define a twin register

           CMPYSP  .M2     B31:B30,B27:B26,B7:B6:B5:B4 ; |180| (E) <1,44> 
||         DADD    .S2X    0,A5:A4,B31:B30   ; |180| (E) <1,44>  ^ Define a twin register
||         DADDSP  .L1     A9:A8,A3:A2,A13:A12 ; |180| (E) <1,44> 
||         DADDSP  .L2     B7:B6,B5:B4,B31:B30 ; |180| (E) <2,25> 

           DADDSP  .L2X    A7:A6,B31:B30,B3:B2 ; |180| (E) <1,45>  ^ 
||         DADDSP  .L1X    A5:A4,B3:B2,A9:A8 ; |180| (E) <2,26> 
||         CMPYSP  .M1     A13:A12,A17:A16,A11:A10:A9:A8 ; |180| (E) <3,7> 

           DADD    .S1X    0,B5:B4,A3:A2     ; |180| (E) <1,46> Define a twin register
||         LDDW    .D2T2   *+B1(80),B31:B30  ; |180| (E) <2,27> 
||         CMPYSP  .M2     B7:B6,B21:B20,B7:B6:B5:B4 ; |180| (E) <2,27> 
||         DADD    .S2X    0,A9:A8,B5:B4     ; |180| (E) <2,27>  ^ Define a twin register
||         CMPYSP  .M1     A5:A4,A19:A18,A11:A10:A9:A8 ; |180| (E) <3,8>  ^ 

           DADDSP  .L1     A13:A12,A3:A2,A7:A6 ; |180| (E) <1,47> 
||         LDDW    .D2T1   *+B1(88),A9:A8    ; |180| (E) <2,28> 
||         CMPYSP  .M1     A9:A8,A25:A24,A7:A6:A5:A4 ; |180| (E) <2,28>  ^ 
||         DADDSP  .L2X    A11:A10,B5:B4,B11:B10 ; |180| (E) <2,28>  ^ 
||         CMPYSP  .M2     B11:B10,B9:B8,B7:B6:B5:B4 ; |180| (E) <3,9> 

           CMPYSP  .M2     B11:B10,B29:B28,B7:B6:B5:B4 ; |180| (E) <1,48> 
||         DADDSP  .L2     B7:B6,B5:B4,B3:B2 ; |180| (E) <1,48> 
||         DADD    .S2X    0,A5:A4,B5:B4     ; |180| (E) <1,48>  ^ Define a twin register
||         DADDSP  .L1X    A9:A8,B31:B30,A13:A12 ; |180| (E) <2,29> 
||         LDDW    .D1T2   *-A14(104),B31:B30 ; |180| (E) <3,10> 

           DADDSP  .L2X    A7:A6,B5:B4,B13:B12 ; |180| (E) <1,49>  ^ 
||         DADD    .S1X    0,B3:B2,A5:A4     ; |180| (E) <1,49> Define a twin register
||         LDDW    .D1T1   *-A14(96),A7:A6   ; |180| (E) <3,11> 
||         DADDSP  .L1     A11:A10,A9:A8,A13:A12 ; |180| (E) <3,11> 

           DADDSP  .L1     A7:A6,A5:A4,A9:A8 ; |180| (E) <1,50> 
||         DADDSP  .L2     B7:B6,B5:B4,B7:B6 ; |180| (E) <2,31> 

           DADDSP  .L1X    A13:A12,B11:B10,A5:A4 ; |180| (E) <2,32> 
||         DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |180| (E) <3,13> 
||         DADD    .S2X    0,A9:A8,B11:B10   ; |180| (E) <3,13>  ^ Define a twin register

           DADDSP  .L2     B7:B6,B5:B4,B31:B30 ; |180| (E) <1,52> 
||         DADD    .S1X    0,B3:B2,A5:A4     ; |180| (E) <1,52> Define a twin register
||         LDDW    .D2T2   *+B1(96),B3:B2    ; |180| (E) <2,33> 
||         CMPYSP  .M2     B31:B30,B23:B22,B7:B6:B5:B4 ; |180| (E) <2,33> 
||         CMPYSP  .M1     A9:A8,A27:A26,A7:A6:A5:A4 ; |180| (E) <2,33>  ^ 
||         DADD    .S2X    0,A5:A4,B5:B4     ; |180| (E) <2,33>  ^ Define a twin register
||         DADDSP  .L1     A1:A0,A13:A12,A5:A4 ; |180| (E) <3,14> 

           DADD    .S1X    0,B13:B12,A9:A8   ; |180| (E) <1,53> Define a twin register
||         DADDSP  .L1     A9:A8,A5:A4,A3:A2 ; |180| (E) <1,53> 
||         LDDW    .D2T1   *+B1(104),A5:A4   ; |180| (E) <2,34> 
||         DADDSP  .L2X    A7:A6,B5:B4,B11:B10 ; |180| (E) <2,34>  ^ 
||         CMPYSP  .M2     B31:B30,B17:B16,B7:B6:B5:B4 ; |180| (E) <3,15> 

           DADDSP  .L1X    A5:A4,B7:B6,A9:A8 ; |180| (E) <2,35> 
||         LDDW    .D1T2   *-A14(88),B7:B6   ; |180| (E) <3,16> 
||         CMPYSP  .M1     A7:A6,A21:A20,A11:A10:A9:A8 ; |180| (E) <3,16>  ^ 
||         DADDSP  .L2X    A11:A10,B11:B10,B31:B30 ; |180| (E) <3,16>  ^ 

           LDDW    .D1T1   *-A14(80),A7:A6   ; |180| (E) <3,17> 
||         DADDSP  .L1X    A5:A4,B5:B4,A13:A12 ; |180| (E) <3,17> 

           DADD    .S1X    0,B31:B30,A3:A2   ; |180| (E) <1,56> Define a twin register
||         DADDSP  .L1     A3:A2,A9:A8,A5:A4 ; |180| (E) <1,56> 
||         DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |180| (E) <2,37> 

           LDDW    .D2T1   *+B1(120),A9:A8   ; |180| (E) <2,38> 
||         CMPYSP  .M2     B3:B2,B25:B24,B7:B6:B5:B4 ; |180| (E) <2,38> 
||         DADD    .S2X    0,A5:A4,B5:B4     ; |180| (E) <2,38>  ^ Define a twin register
||         DADDSP  .L1X    A9:A8,B11:B10,A5:A4 ; |180| (E) <2,38> 
||         DADDSP  .L2     B7:B6,B5:B4,B3:B2 ; |180| (E) <3,19> 

           LDDW    .D2T2   *+B1(112),B31:B30 ; |180| (E) <2,39> 
||         CMPYSP  .M1     A5:A4,A29:A28,A7:A6:A5:A4 ; |180| (E) <2,39>  ^ 
||         DADDSP  .L2X    A7:A6,B5:B4,B31:B30 ; |180| (E) <2,39>  ^ 
||         DADDSP  .L1X    A13:A12,B31:B30,A5:A4 ; |180| (E) <3,20> 

           DADDSP  .L1     A5:A4,A3:A2,A3:A2 ; |180| (E) <1,59> 
||         LDDW    .D1T2   *-A14(72),B7:B6   ; |180| (E) <3,21> 
||         CMPYSP  .M2     B7:B6,B19:B18,B7:B6:B5:B4 ; |180| (E) <3,21> 
||         DADD    .S2X    0,A9:A8,B7:B6     ; |180| (E) <3,21>  ^ Define a twin register

           DADDSP  .L1X    A5:A4,B5:B4,A9:A8 ; |180| (E) <2,41> 
||         CMPYSP  .M1     A7:A6,A23:A22,A11:A10:A9:A8 ; |180| (E) <3,22>  ^ 
||         DADDSP  .L2X    A11:A10,B7:B6,B3:B2 ; |180| (E) <3,22>  ^ 

           DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |180| (E) <2,42> 
||         LDDW    .D1T1   *-A14(64),A9:A8   ; |180| (E) <3,23> 
||         DADDSP  .L1X    A5:A4,B3:B2,A5:A4 ; |180| (E) <3,23> 

           LDDW    .D2T2   *++B1(128),B11:B10 ; |180| (E) <2,43> 
||         CMPYSP  .M1     A9:A8,A31:A30,A7:A6:A5:A4 ; |180| (E) <2,43>  ^ 
||         DADD    .S1X    0,B31:B30,A3:A2   ; |180| (E) <2,43> Define a twin register

           CMPYSP  .M2     B31:B30,B27:B26,B7:B6:B5:B4 ; |180| (E) <2,44> 
||         DADD    .S2X    0,A5:A4,B31:B30   ; |180| (E) <2,44>  ^ Define a twin register
||         DADDSP  .L1     A9:A8,A3:A2,A13:A12 ; |180| (E) <2,44> 
||         DADDSP  .L2     B7:B6,B5:B4,B31:B30 ; |180| (E) <3,25> 

           DADDSP  .L2X    A7:A6,B31:B30,B3:B2 ; |180| (E) <2,45>  ^ 
||         DADDSP  .L1X    A5:A4,B3:B2,A9:A8 ; |180| (E) <3,26> 

           DADD    .S1X    0,B5:B4,A3:A2     ; |180| (E) <2,46> Define a twin register
||         LDDW    .D2T2   *+B1(80),B31:B30  ; |180| (E) <3,27> 
||         CMPYSP  .M2     B7:B6,B21:B20,B7:B6:B5:B4 ; |180| (E) <3,27> 
||         DADD    .S2X    0,A9:A8,B5:B4     ; |180| (E) <3,27>  ^ Define a twin register

           DADDSP  .L1     A13:A12,A3:A2,A7:A6 ; |180| (E) <2,47> 
||         LDDW    .D2T1   *+B1(88),A9:A8    ; |180| (E) <3,28> 
||         CMPYSP  .M1     A9:A8,A25:A24,A7:A6:A5:A4 ; |180| (E) <3,28>  ^ 
||         DADDSP  .L2X    A11:A10,B5:B4,B11:B10 ; |180| (E) <3,28>  ^ 

           CMPYSP  .M2     B11:B10,B29:B28,B7:B6:B5:B4 ; |180| (E) <2,48> 
||         DADDSP  .L2     B7:B6,B5:B4,B3:B2 ; |180| (E) <2,48> 
||         DADD    .S2X    0,A5:A4,B5:B4     ; |180| (E) <2,48>  ^ Define a twin register
||         DADDSP  .L1X    A9:A8,B31:B30,A13:A12 ; |180| (E) <3,29> 

           DADDSP  .L2X    A7:A6,B5:B4,B13:B12 ; |180| (E) <2,49>  ^ 
||         DADD    .S1X    0,B3:B2,A5:A4     ; |180| (E) <2,49> Define a twin register

           DADDSP  .L1     A7:A6,A5:A4,A9:A8 ; |180| (E) <2,50> 
||         DADDSP  .L2     B7:B6,B5:B4,B7:B6 ; |180| (E) <3,31> 

           DADDSP  .L1X    A13:A12,B11:B10,A5:A4 ; |180| (E) <3,32> 

           DADDSP  .L2     B7:B6,B5:B4,B31:B30 ; |180| (E) <2,52> 
||         DADD    .S1X    0,B3:B2,A5:A4     ; |180| (E) <2,52> Define a twin register
||         LDDW    .D2T2   *+B1(96),B3:B2    ; |180| (E) <3,33> 
||         CMPYSP  .M2     B31:B30,B23:B22,B7:B6:B5:B4 ; |180| (E) <3,33> 
||         CMPYSP  .M1     A9:A8,A27:A26,A7:A6:A5:A4 ; |180| (E) <3,33>  ^ 
||         DADD    .S2X    0,A5:A4,B5:B4     ; |180| (E) <3,33>  ^ Define a twin register

           DADD    .S1X    0,B13:B12,A9:A8   ; |180| (E) <2,53> Define a twin register
||         DADDSP  .L1     A9:A8,A5:A4,A3:A2 ; |180| (E) <2,53> 
||         LDDW    .D2T1   *+B1(104),A5:A4   ; |180| (E) <3,34> 
||         DADDSP  .L2X    A7:A6,B5:B4,B11:B10 ; |180| (E) <3,34>  ^ 

           DADDSP  .L1X    A5:A4,B7:B6,A9:A8 ; |180| (E) <3,35> 
           NOP             1

           DADD    .S1X    0,B31:B30,A3:A2   ; |180| (E) <2,56> Define a twin register
||         DADDSP  .L1     A3:A2,A9:A8,A5:A4 ; |180| (E) <2,56> 
||         DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |180| (E) <3,37> 

           LDDW    .D2T1   *+B1(120),A9:A8   ; |180| (E) <3,38> 
||         CMPYSP  .M2     B3:B2,B25:B24,B7:B6:B5:B4 ; |180| (E) <3,38> 
||         DADD    .L2X    0,A5:A4,B5:B4     ; |180| (E) <3,38>  ^ Define a twin register
||         DADDSP  .L1X    A9:A8,B11:B10,A5:A4 ; |180| (E) <3,38> 

           LDDW    .D2T2   *+B1(112),B31:B30 ; |180| (E) <3,39> 
||         CMPYSP  .M1     A5:A4,A29:A28,A7:A6:A5:A4 ; |180| (E) <3,39>  ^ 
||         DADDSP  .L2X    A7:A6,B5:B4,B31:B30 ; |180| (E) <3,39>  ^ 

           DADDSP  .L1     A5:A4,A3:A2,A3:A2 ; |180| (E) <2,59> 
           DADDSP  .L1X    A5:A4,B5:B4,A9:A8 ; |180| (E) <3,41> 
           DADDSP  .L2     B7:B6,B5:B4,B5:B4 ; |180| (E) <3,42> 

           LDDW    .D2T2   *++B1(128),B11:B10 ; |180| (E) <3,43> 
||         CMPYSP  .M1     A9:A8,A31:A30,A7:A6:A5:A4 ; |180| (E) <3,43>  ^ 
||         DADD    .S1X    0,B31:B30,A3:A2   ; |180| (E) <3,43> Define a twin register

           CMPYSP  .M2     B31:B30,B27:B26,B7:B6:B5:B4 ; |180| (E) <3,44> 
||         DADD    .S2X    0,A5:A4,B31:B30   ; |180| (E) <3,44>  ^ Define a twin register
||         DADDSP  .L1     A9:A8,A3:A2,A13:A12 ; |180| (E) <3,44> 

           DADDSP  .L2X    A7:A6,B31:B30,B3:B2 ; |180| (E) <3,45>  ^ 
           DADD    .S1X    0,B5:B4,A3:A2     ; |180| (E) <3,46> Define a twin register
           DADDSP  .L1     A13:A12,A3:A2,A7:A6 ; |180| (E) <3,47> 

           CMPYSP  .M2     B11:B10,B29:B28,B7:B6:B5:B4 ; |180| (E) <3,48> 
||         DADDSP  .L2     B7:B6,B5:B4,B3:B2 ; |180| (E) <3,48> 
||         DADD    .S2X    0,A5:A4,B5:B4     ; |180| (E) <3,48>  ^ Define a twin register

           DADDSP  .L2X    A7:A6,B5:B4,B13:B12 ; |180| (E) <3,49>  ^ 
||         DADD    .S1X    0,B3:B2,A5:A4     ; |180| (E) <3,49> Define a twin register

;** --------------------------------------------------------------------------*
           DADDSP  .L1     A7:A6,A5:A4,A9:A8 ; |180| (E) <3,50> 
           DADD    .L1X    0,B3:B2,A5:A4     ; |180| (E) <3,52> Define a twin register
           DADDSP  .L2     B7:B6,B5:B4,B31:B30 ; |180| (E) <3,52> 
           DADDSP  .L1     A9:A8,A5:A4,A3:A2 ; |180| (E) <3,53> 
           DADD    .L1X    0,B13:B12,A9:A8   ; |180| (E) <3,53> Define a twin register
           RINT                              ; interrupts on
           DADDSP  .L1     A3:A2,A9:A8,A5:A4 ; |180| (E) <3,56> 
           DADD    .L1X    0,B31:B30,A3:A2   ; |180| (E) <3,56> Define a twin register
           NOP             1
           DADDSP  .L1     A5:A4,A3:A2,A3:A2 ; |180| (E) <3,59> 
           NOP             3
           MV      .L2X    A2,B4
           MPYSP   .M2X    A2,B4,B4          ; |185| 
           MPYSP   .M1     A3,A3,A3          ; |185| 
           NOP             3
           FADDSP  .L1X    B4,A3,A3          ; |185| 
           NOP             2
           STW     .D1T1   A3,*++A15         ; |185| 
           LDW     .D2T2   *++SP(40),B3      ; |190| 
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
