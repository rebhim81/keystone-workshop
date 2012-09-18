/*  ============================================================================
 *   Copyright (c) Texas Instruments Inc 2002, 2003, 2004, 2005
 *
 *   Use of this software is controlled by the terms and conditions found in the
 *   license agreement under which this software has been supplied.
 *  ============================================================================
 */
 


/**********************************************************
 **********************************************************/
-c
-stack 0x1000
-heap  0x1000

MEMORY
{


   
    L2_SRAM:            o = 0x00800000   l = 0x00080000  
    MSMC_RAM:           o = 0x0C000000   l = 0x000ec000  /* 1Mb alloc for each core */    
    DDR3_RAM:           o = 0x80000000   l = 0x04000000 
    L1_SRAM:            o = 0x00f00000   l = 0x00008000
}
 
SECTIONS
{

    .text       >       MSMC_RAM
    .L2         >       L2_SRAM  
    .DDR        >       DDR3_RAM
    .stack      >       L2_SRAM
    .bss        >       MSMC_RAM
    .cinit      >       MSMC_RAM 
    .cio        >      MSMC_RAM
    .const      >        MSMC_RAM
    .data       >       L2_SRAM
    .neardata   >       L2_SRAM    
    .rodata     >       L2_SRAM       
    .switch     >       L2_SRAM
    .sysmem     >       L2_SRAM
    .far        >       L2_SRAM
    .fardata    >       L2_SRAM   
    .testMem    >       L2_SRAM
	.CSL_VARS	>		L2_SRAM
	.inL2_SRAM	>	    L2_SRAM
	.inMSMC_RAM	>	    MSMC_RAM
	.MySection  >       L2_SRAM    



}


/*****************************************************************************/
/*                       End of Linker command file                          */
/*****************************************************************************/
