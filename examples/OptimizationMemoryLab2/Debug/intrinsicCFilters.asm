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

;	C:\ti\ccs\ccsv5\tools\compiler\c6000\bin\opt6x.exe C:\\Users\\a0270985\\AppData\\Local\\Temp\\023082 C:\\Users\\a0270985\\AppData\\Local\\Temp\\023084 
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
;*   Local Frame Size  : 0 Args + 196 Auto + 64 Save = 260 byte               *
;******************************************************************************
intrinsicC_filters:
;** --------------------------------------------------------------------------*
           STW     .D2T1   A11,*SP--(8)      ; |15| 
           STW     .D2T1   A10,*SP--(8)      ; |15| 
           STDW    .D2T2   B13:B12,*SP--     ; |15| 
           STDW    .D2T2   B11:B10,*SP--     ; |15| 
           STDW    .D2T1   A15:A14,*SP--     ; |15| 

           STDW    .D2T1   A13:A12,*SP--     ; |15| 
||         ZERO    .L2     B13

           STW     .D2T2   B3,*SP--(8)       ; |15| 
||         MVKH    .S2     0xbf000000,B13

           ADDK    .S2     -208,SP           ; |15| 
||         ZERO    .L1     A3

           ADDAW   .D2     SP,4,B10
||         SET     .S1     A3,0x18,0x1d,A3

           STW     .D2T1   A3,*+SP(164)      ; |37| 
||         MV      .L1X    B13,A5            ; |37| 

           STW     .D2T1   A5,*+SP(160)      ; |37| 
||         ADD     .L2     3,B4,B4           ; |43| 
||         MV      .S2     B4,B11            ; |15| 

           LDDW    .D2T2   *+SP(160),B7:B6   ; |38| 
||         SHR     .S2     B4,2,B4           ; |43| 

           STW     .D2T2   B4,*+SP(144)      ; |37| 
||         MV      .L2X    A3,B12            ; |37| 

           STDW    .D2T2   B13:B12,*+SP(24)  ; |38| 

           STW     .D2T1   A6,*+SP(152)      ; |15| 
||         MVK     .L2     0x2,B4            ; |45| 

           STW     .D2T2   B4,*+SP(148)      ; |43| 
           STDW    .D2T2   B7:B6,*+SP(16)    ; |37| 

           LDDW    .D2T2   *B10++,B5:B4      ; |49| 
||         MV      .L1     A4,A15            ; |15| 
||         ZERO    .S1     A10
||         ZERO    .D1     A11

           LDNDW   .D1T1   *A15,A5:A4        ; |49| 
||         DADD    .L1     0,A11:A10,A13:A12 ; |43| 
||         MV      .S1     A4,A14            ; |15| 

;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L1
;** --------------------------------------------------------------------------*
$C$L1:    
           CALL    .S1     complexMultiply   ; |49| 
           NOP             4
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*----------------------------------------------------------------------------*
$C$L2:    
           ADDKPC  .S2     $C$RL0,B3,0       ; |49| 
$C$RL0:    ; CALL OCCURS {complexMultiply} {0}  ; |49| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(148),B4      ; |49| 
           DADDSP  .L1     A13:A12,A5:A4,A13:A12 ; |50| 
           ADD     .L1     8,A15,A15         ; |48| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |45| 
||         SUB     .L2     B4,1,B4           ; |45| 

   [ A0]   B       .S1     $C$L2             ; |45| 
||         STW     .D2T2   B4,*+SP(148)      ; |50| 

   [ A0]   CALL    .S1     complexMultiply   ; |49| 
|| [ A0]   LDDW    .D2T2   *B10++,B5:B4      ; |49| 

   [ A0]   LDNDW   .D1T1   *A15,A5:A4        ; |49| 
   [!A0]   LDW     .D2T2   *+SP(144),B4
           NOP             2
           ; BRANCHCC OCCURS {$C$L2}         ; |45| 
;** --------------------------------------------------------------------------*
           ADDAW   .D2     SP,4,B10
           NOP             1

           SUB     .L1X    B4,1,A0           ; |41| 
||         SUB     .L2     B4,1,B4           ; |41| 

   [ A0]   B       .S1     $C$L1             ; |41| 
|| [!A0]   ZERO    .L2     B6
||         STW     .D2T2   B4,*+SP(144)      ; |41| 
||         MVK     .S2     0x2,B4            ; |45| 
|| [!A0]   ZERO    .D1     A6
|| [ A0]   DADD    .L1     0,A11:A10,A13:A12 ; |43| 

   [!A0]   MVKH    .S2     0xbe800000,B6
|| [!A0]   MVKH    .S1     0x3e800000,A6
|| [ A0]   STW     .D2T2   B4,*+SP(148)      ; |43| 

   [!A0]   LDDW    .D2T2   *+SP(160),B5:B4   ; |62| 
|| [!A0]   MV      .L1     A6,A31            ; |66| 

   [!A0]   MV      .L1X    B6,A3             ; |66| 
|| [ A0]   LDNDW   .D1T1   *A15,A5:A4        ; |49| 

   [!A0]   STW     .D2T1   A3,*+SP(168)      ; |66| 
   [ A0]   LDDW    .D2T2   *B10++,B5:B4      ; |49| 
           ; BRANCHCC OCCURS {$C$L1}         ; |41| 
;** --------------------------------------------------------------------------*

           STW     .D2T1   A31,*+SP(172)     ; |66| 
||         MV      .L1X    B6,A30            ; |66| 
||         MPYSP   .M1     A12,A12,A4        ; |55| 
||         ADD     .L2     7,B11,B31         ; |73| 
||         MV      .S1     A14,A15           ; |62| 

           STDW    .D2T2   B5:B4,*+SP(24)    ; |67| 
||         MPYSP   .M1     A13,A13,A5        ; |55| 
||         DADD    .L1     0,A11:A10,A13:A12 ; |73| 

           LDDW    .D2T2   *+SP(168),B5:B4   ; |66| 
           STW     .D2T1   A30,*+SP(188)     ; |66| 
           STW     .D2T1   A6,*+SP(184)      ; |66| 

           LDDW    .D2T2   *+SP(184),B7:B6   ; |66| 
||         FADDSP  .L1     A4,A5,A29         ; |55| 

           LDW     .D2T1   *+SP(152),A28     ; |66| 

           STDW    .D2T2   B5:B4,*+SP(16)    ; |66| 
||         SHR     .S2     B31,3,B4          ; |73| 

           STW     .D2T2   B4,*+SP(144)      ; |55| 
||         MVK     .L2     0x4,B4            ; |75| 

           STDW    .D2T2   B13:B12,*+SP(40)  ; |69| 
           STDW    .D2T2   B7:B6,*+SP(32)    ; |68| 

           STW     .D1T1   A29,*A28          ; |55| 
||         STW     .D2T2   B4,*+SP(148)      ; |73| 

           ADDAW   .D2     SP,4,B10
||         LDNDW   .D1T1   *A15,A5:A4        ; |79| 

           LDDW    .D2T2   *B10++,B5:B4      ; |79| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L3
;** --------------------------------------------------------------------------*
$C$L3:    
           CALL    .S1     complexMultiply   ; |79| 
           NOP             4
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*----------------------------------------------------------------------------*
$C$L4:    
           ADDKPC  .S2     $C$RL1,B3,0       ; |79| 
$C$RL1:    ; CALL OCCURS {complexMultiply} {0}  ; |79| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(148),B4      ; |79| 
           DADDSP  .L1     A13:A12,A5:A4,A13:A12 ; |80| 
           ADD     .L1     8,A15,A15         ; |78| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |75| 
||         SUB     .L2     B4,1,B4           ; |75| 

   [ A0]   B       .S1     $C$L4             ; |75| 
||         STW     .D2T2   B4,*+SP(148)      ; |80| 

   [ A0]   CALL    .S1     complexMultiply   ; |79| 
|| [ A0]   LDDW    .D2T2   *B10++,B5:B4      ; |79| 

   [ A0]   LDNDW   .D1T1   *A15,A5:A4        ; |79| 
   [!A0]   LDW     .D2T2   *+SP(144),B4
           NOP             2
           ; BRANCHCC OCCURS {$C$L4}         ; |75| 
;** --------------------------------------------------------------------------*
           ADDAW   .D2     SP,4,B10
           NOP             1

           SUB     .L1X    B4,1,A0           ; |71| 
||         SUB     .L2     B4,1,B4           ; |71| 

   [ A0]   B       .S1     $C$L3             ; |71| 
|| [!A0]   ZERO    .L2     B6
||         STW     .D2T2   B4,*+SP(144)      ; |71| 
||         MVK     .S2     0x4,B4            ; |75| 
|| [!A0]   ZERO    .D1     A6
|| [ A0]   DADD    .L1     0,A11:A10,A13:A12 ; |73| 

   [!A0]   MVKH    .S2     0xbf800000,B6
|| [!A0]   SET     .S1     A6,0x17,0x1d,A6
|| [ A0]   STW     .D2T2   B4,*+SP(148)      ; |73| 

   [!A0]   LDDW    .D2T2   *+SP(160),B5:B4   ; |102| 
|| [!A0]   MV      .L1     A6,A31            ; |98| 

   [!A0]   MV      .L1X    B6,A3             ; |98| 
|| [ A0]   LDNDW   .D1T1   *A15,A5:A4        ; |79| 

   [!A0]   STW     .D2T1   A3,*+SP(176)      ; |98| 
   [ A0]   LDDW    .D2T2   *B10++,B5:B4      ; |79| 
           ; BRANCHCC OCCURS {$C$L3}         ; |71| 
;** --------------------------------------------------------------------------*

           STW     .D2T1   A31,*+SP(180)     ; |98| 
||         MV      .L1X    B6,A30            ; |98| 
||         MV      .S1     A6,A29            ; |98| 
||         MPYSP   .M1     A12,A12,A5        ; |85| 
||         ADD     .L2     15,B11,B31        ; |120| 
||         MV      .D1     A14,A15           ; |93| 

           STDW    .D2T2   B5:B4,*+SP(16)    ; |96| 
||         MPYSP   .M1     A13,A13,A4        ; |85| 
||         SHR     .S2     B31,4,B30         ; |120| 
||         DADD    .L1     0,A11:A10,A13:A12 ; |120| 

           STDW    .D2T2   B5:B4,*+SP(32)    ; |100| 
           LDDW    .D2T2   *+SP(176),B5:B4   ; |98| 
           STW     .D2T1   A30,*+SP(196)     ; |98| 

           STW     .D2T1   A29,*+SP(192)     ; |98| 
||         FADDSP  .L1     A5,A4,A4          ; |85| 

           LDW     .D2T1   *+SP(152),A28     ; |98| 
           STDW    .D2T1   A11:A10,*+SP(72)  ; |111| 
           STDW    .D2T2   B5:B4,*+SP(24)    ; |98| 
           LDDW    .D2T2   *+SP(192),B5:B4   ; |98| 
           STDW    .D2T1   A11:A10,*+SP(40)  ; |102| 
           STDW    .D2T2   B13:B12,*+SP(64)  ; |110| 
           STDW    .D2T2   B13:B12,*+SP(48)  ; |105| 
           ADDAW   .D2     SP,4,B10

           STDW    .D2T2   B5:B4,*+SP(56)    ; |107| 
||         MVK     .L2     0x8,B4            ; |122| 

           STW     .D1T1   A4,*++A28         ; |85| 
||         STW     .D2T2   B30,*+SP(144)     ; |85| 

           STW     .D2T1   A28,*+SP(152)     ; |85| 
           STW     .D2T2   B4,*+SP(148)      ; |120| 
           LDNDW   .D1T1   *A15,A5:A4        ; |126| 
           LDDW    .D2T2   *B10++,B5:B4      ; |126| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L5
;** --------------------------------------------------------------------------*
$C$L5:    
           CALL    .S1     complexMultiply   ; |126| 
           NOP             4
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*----------------------------------------------------------------------------*
$C$L6:    
           ADDKPC  .S2     $C$RL2,B3,0       ; |126| 
$C$RL2:    ; CALL OCCURS {complexMultiply} {0}  ; |126| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(148),B4      ; |126| 
           DADDSP  .L1     A13:A12,A5:A4,A13:A12 ; |127| 
           ADD     .L1     8,A15,A15         ; |125| 
           NOP             2

           SUB     .L1X    B4,1,A0           ; |122| 
||         SUB     .L2     B4,1,B4           ; |122| 

   [ A0]   B       .S1     $C$L6             ; |122| 
||         STW     .D2T2   B4,*+SP(148)      ; |127| 

   [ A0]   CALL    .S1     complexMultiply   ; |126| 
|| [ A0]   LDDW    .D2T2   *B10++,B5:B4      ; |126| 

   [ A0]   LDNDW   .D1T1   *A15,A5:A4        ; |126| 
   [!A0]   LDW     .D2T2   *+SP(144),B4
           NOP             2
           ; BRANCHCC OCCURS {$C$L6}         ; |122| 
;** --------------------------------------------------------------------------*
           ADDAW   .D2     SP,4,B10
           NOP             1

           SUB     .L1X    B4,1,A0           ; |118| 
||         SUB     .L2     B4,1,B4           ; |118| 

   [ A0]   B       .S1     $C$L5             ; |118| 
||         STW     .D2T2   B4,*+SP(144)      ; |118| 
||         MVK     .L2     0x8,B4            ; |122| 
|| [!A0]   MPYSP   .M1     A12,A12,A6        ; |132| 
|| [ A0]   DADD    .L1     0,A11:A10,A13:A12 ; |120| 

   [!A0]   MPYSP   .M1     A13,A13,A3        ; |132| 
|| [ A0]   STW     .D2T2   B4,*+SP(148)      ; |120| 

   [!A0]   LDDW    .D2T2   *+SP(184),B5:B4   ; |166| 
   [!A0]   LDDW    .D2T2   *+SP(192),B7:B6   ; |164| 
   [ A0]   LDDW    .D2T2   *B10++,B5:B4      ; |126| 
   [ A0]   LDNDW   .D1T1   *A15,A5:A4        ; |126| 
           ; BRANCHCC OCCURS {$C$L5}         ; |118| 
;** --------------------------------------------------------------------------*

           LDDW    .D2T2   *+SP(176),B9:B8   ; |156| 
||         ZERO    .L2     B17
||         ZERO    .D1     A5
||         FADDSP  .L1     A6,A3,A6          ; |132| 
||         DADD    .S1     0,A11:A10,A13:A12 ; |175| 

           STDW    .D2T2   B5:B4,*+SP(80)    ; |159| 
||         MVKH    .S2     0xbf400000,B17
||         MVKH    .S1     0x3f400000,A5

           STDW    .D2T2   B7:B6,*+SP(104)   ; |162| 

           LDDW    .D2T2   *+SP(160),B7:B6   ; |157| 
||         MV      .L1X    B17,A4            ; |153| 
||         MV      .L2X    A5,B16            ; |153| 

           STDW    .D2T2   B5:B4,*+SP(128)   ; |165| 
           LDDW    .D2T2   *+SP(168),B5:B4   ; |158| 
           LDW     .D2T1   *+SP(152),A31     ; |153| 
           STDW    .D2T2   B9:B8,*+SP(40)    ; |154| 
           STDW    .D2T2   B7:B6,*+SP(56)    ; |156| 
           STDW    .D2T2   B7:B6,*+SP(24)    ; |152| 
           STDW    .D2T2   B5:B4,*+SP(64)    ; |157| 
           STDW    .D2T2   B17:B16,*+SP(96)  ; |161| 
           STDW    .D2T2   B17:B16,*+SP(112) ; |163| 
           STDW    .D2T1   A5:A4,*+SP(48)    ; |155| 
           STDW    .D2T1   A5:A4,*+SP(32)    ; |153| 
           STDW    .D2T1   A11:A10,*+SP(136) ; |166| 
           STDW    .D2T2   B13:B12,*+SP(120) ; |164| 
           STDW    .D2T2   B13:B12,*+SP(88)  ; |160| 
           STDW    .D2T1   A11:A10,*+SP(72)  ; |158| 

           STW     .D1T1   A6,*++A31         ; |132| 
||         STDW    .D2T2   B5:B4,*+SP(16)    ; |151| 
||         MVK     .S2     0x10,B4           ; |177| 

           STW     .D2T1   A31,*+SP(152)     ; |132| 

           ADD     .D2     B11,31,B18        ; |175| 
||         LDNDW   .D1T1   *A14,A5:A4        ; |181| 
||         MV      .L1X    B4,A15            ; |175| 

           ADDAW   .D2     SP,4,B11
||         SHR     .S2     B18,5,B10         ; |175| 

           LDDW    .D2T2   *B11++,B5:B4      ; |181| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP $C$L7
;** --------------------------------------------------------------------------*
$C$L7:    
           CALL    .S1     complexMultiply   ; |181| 
           NOP             4
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*----------------------------------------------------------------------------*
$C$L8:    
           ADDKPC  .S2     $C$RL3,B3,0       ; |181| 
$C$RL3:    ; CALL OCCURS {complexMultiply} {0}  ; |181| 
;** --------------------------------------------------------------------------*

           SUB     .S1     A15,1,A0          ; |177| 
||         ADD     .D1     8,A14,A14         ; |180| 
||         DADDSP  .L1     A13:A12,A5:A4,A13:A12 ; |182| 

   [ A0]   B       .S1     $C$L8             ; |177| 
|| [ A0]   LDDW    .D2T2   *B11++,B5:B4      ; |181| 

   [ A0]   CALL    .S1     complexMultiply   ; |181| 
   [ A0]   LDNDW   .D1T1   *A14,A5:A4        ; |181| 
           SUB     .L1     A15,1,A15         ; |177| 
   [!A0]   SUB     .L1X    B10,1,A0          ; |173| 
           NOP             1
           ; BRANCHCC OCCURS {$C$L8}         ; |177| 
;** --------------------------------------------------------------------------*

           SUB     .L2     B10,1,B10         ; |173| 
|| [ A0]   LDNDW   .D1T1   *A14,A5:A4        ; |181| 
|| [ A0]   DADD    .L1     0,A11:A10,A13:A12 ; |175| 
|| [ A0]   B       .S1     $C$L7             ; |173| 
|| [!A0]   MPYSP   .M1     A12,A12,A4        ; |187| 
|| [ A0]   MVK     .S2     0x10,B4           ; |177| 

   [!A0]   MPYSP   .M1     A13,A13,A3        ; |187| 
           ADDAW   .D2     SP,4,B11
   [ A0]   MV      .L1X    B4,A15            ; |175| 
   [ A0]   LDDW    .D2T2   *B11++,B5:B4      ; |181| 

   [!A0]   FADDSP  .L1     A4,A3,A4          ; |187| 
|| [!A0]   LDW     .D2T1   *+SP(152),A3

           ; BRANCHCC OCCURS {$C$L7}         ; |173| 
;** --------------------------------------------------------------------------*
           ADDK    .S2     208,SP            ; |192| 
           NOP             3
           STW     .D1T1   A4,*++A3          ; |187| 
           LDW     .D2T2   *++SP(8),B3       ; |192| 
           LDDW    .D2T1   *++SP,A13:A12     ; |192| 
           LDDW    .D2T1   *++SP,A15:A14     ; |192| 
           LDDW    .D2T2   *++SP,B11:B10     ; |192| 
           LDDW    .D2T2   *++SP,B13:B12     ; |192| 

           LDW     .D2T1   *++SP(8),A10      ; |192| 
||         RET     .S2     B3                ; |192| 

           LDW     .D2T1   *++SP(8),A11      ; |192| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |192| 
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	complexMultiply

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
