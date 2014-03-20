/*
 * testMPAX.c
 *
 *  Created on: Feb 11, 2013
 *      Author: a0270985
 */



#include <c6x.h>
#include "stdio.h"
#include <stdlib.h>

#include <xdc/std.h>
#include <string.h>

/*  -----------------------------------XDC.RUNTIME module Headers    */
#include <xdc/runtime/System.h>
#include <xdc/runtime/IHeap.h>

/*  ----------------------------------- IPC module Headers           */
#include <ti/ipc/Ipc.h>
#include <ti/ipc/MessageQ.h>
#include <ti/ipc/HeapBufMP.h>
#include <ti/ipc/MultiProc.h>

/*  ----------------------------------- BIOS6 module Headers         */
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>

/*  ----------------------------------- To get globals from .cfg Header */
#include <xdc/cfg/global.h>



#include <ti\csl\csl_cache.h>
#include <ti\csl\csl_cacheAux.h>
#include <ti\csl\csl_chip.h>
#include <ti\csl\csl_chipAux.h>
#include <ti\csl\csl_xmc.h>
#include <ti\csl\csl_xmcAux.h>
#include <ti/csl/soc.h>
#include <ti/csl/csl.h>
#include <ti/csl/cslr_xmc.h>

#include <ti/ipc/Ipc.h>
#include <ti/ipc/MessageQ.h>
#include <ti/ipc/HeapBufMP.h>
#include <ti/ipc/MultiProc.h>



#pragma DATA_ALIGN(myBuffer, 8);
#pragma DATA_SECTION(myBuffer, ".DDR_private");
volatile unsigned int myBuffer[1024];


void     fillMemory(unsigned int *baseAddress, unsigned int startValue, int numberOfValues)
{
	int   i    ;
	unsigned int *p    ;
	p = baseAddress   ;
	for (i=0; i<numberOfValues;i++)
	{
		*p++ = startValue    ;
		startValue = startValue + 1  ;
	}
}


void  erasememory(unsigned int *baseAddress,  int numberOfValues)
{
	int   i    ;
	unsigned int *p    ;
	p = baseAddress   ;
	for (i=0; i<numberOfValues;i++)
	{
		*p++ = 0xFACEBAD  ;

	}
}



void main()
{
	int coreNum   ;
	Uint32 index;
	CSL_XMC_XMPAXH mpaxh;
    CSL_XMC_XMPAXL mpaxl;
    int  i   ;
    unsigned int startValue   ;
    unsigned int *baseAddress   ;
    int numberOfValues    ;
    volatile uint32_t* lvMarPtr;
    unsigned int L_Value, H_Value   ;
    unsigned int xx    ;

//    Ipc_start();


////    First step, configure the MPAX registers
////    We will use register number 4

	coreNum = CSL_chipReadReg (CSL_CHIP_DNUM);
//	printMPAXRegisters()  ;

//   To load the H part of the register, we use the function        CSL_XMC_setXMPAXH (index, &mpaxh);
	ranDelay(coreNum * 10)  ;
	   printMPAXOneRegisters(4)  ;
	   
//      Here comes CSL configuration  - we use CSL functions to configure the MPAX	   
	   
#if  1
     index = 4    ;
     mpaxh.segSize   =  23  ; //  Each segment is
     mpaxh.bAddr = 0x90000;   //    base address

     CSL_XMC_setXMPAXH (index, &mpaxh);
//
//   For the lower part,




     mpaxl.ux = 1;
     mpaxl.uw = 1;
     mpaxl.ur = 1;
     mpaxl.sx = 1;
     mpaxl.sw = 1;
     mpaxl.sr = 1;

     xx = (0x810 + coreNum * 0x01) << 12 ;
     printValueUnsigned (xx)  ;
     mpaxl.rAddr = xx    ;


     CSL_XMC_setXMPAXL (index, &mpaxl);
 	//printMPAXRegisters()  ;
    printMPAXOneRegisters(4)  ;
///   Disable the Cache
///   The MAR registers for logical address 0x9000 0000 to 0x9fff ffff is 144 to 159
#endif


//      Here comes direct configuration  - we use direct access to the Memory mapped Register configure the MPAX	

#if  1
     lvMarPtr = (volatile uint32_t*)0x08000020;

     H_Value = 0x90000017    ;

     if (coreNum == 0) L_Value = 0x8100003f    ;
     if (coreNum == 1) L_Value = 0x8110003f    ;
     if (coreNum == 2) L_Value = 0x8120003f    ;
     if (coreNum == 3) L_Value = 0x8130003f    ;
     if (coreNum == 4) L_Value = 0x8140003f    ;
     if (coreNum == 5) L_Value = 0x8150003f    ;
     if (coreNum == 6) L_Value = 0x8160003f    ;
     if (coreNum == 7) L_Value = 0x8170003f    ;


     *lvMarPtr++ = L_Value;
     *lvMarPtr++ = H_Value;

     printMPAXOneRegisters(4)  ;


#endif
    for (i=144; i<160; i++)
    {
       CACHE_disableCaching  ( (unsigned char) i )   ;
       CACHE_getMemRegionInfo(i,0,0)   ;    //  this if for pre-fetch
    }

    startValue = (0x2 * coreNum  )  <<  16     ;

    baseAddress = (unsigned int *) &myBuffer[0]  ;  //     0x90000000    ;
    numberOfValues = 10   ;

    erasememory(baseAddress, numberOfValues )   ;
    fillMemory(baseAddress, startValue, numberOfValues)    ;

    printDone(coreNum)  ;
    stay()    ;
}

