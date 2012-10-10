/**
 *   @file  bioUtilityandGlobals.c
 *
 *  
 *
 *  \par
 *  NOTE:
 *      (C) Copyright 2009 Texas Instruments, Inc.
 * 
 *  Redistribution and use in source and binary forms, with or without 
 *  modification, are permitted provided that the following conditions 
 *  are met:
 *
 *    Redistributions of source code must retain the above copyright 
 *    notice, this list of conditions and the following disclaimer.
 *
 *    Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the 
 *    documentation and/or other materials provided with the   
 *    distribution.
 *
 *    Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *  socket1 bind failed
 *  \par
*/
#include "bioInclude.h"



Srio_DrvConfig  cfg;
Srio_DrvHandle  hSrioDriver;
UInt8           isAllocated;

//int messageValue, xx   ;
//int    myStatus, processingCounter, recvFromCore ;

Srio_SockHandle         srioSocket;
Srio_SockBindAddrInfo   bindInfo;
UInt8*                  txData;
Srio_SockAddrInfo       to;
Srio_SockAddrInfo       from;
UInt16                  idx;
Int32                   num_bytes;
UInt8*                  ptr_rxDataPayload;
Int32                   sendToCore;

Srio_DrvBuffer          hDrvBuffer;
UInt32                  allocatedLen;
UInt16                  coreDeviceID[NUM_CORES_MAX];
Int32                   messageSource   ;
int                     coreLoop    ;
Int32                   randomValue   ;

int firstSendStart      ;
Int32                   iterationCounter   ;
UInt32                  myBuffer[BUFFER_SIZE]   ;


Int32                   messageValue =0x00   ;
    Int32                   processingCounter = 1  ;

    int            xx  ;


    int           myStatus   ;
    int                   recvFromCore;







void saveTime(long tt1, long tt2)
{
//	System_printf("t1 t2 bufferCounter  %d %d %d \n",tt1, tt2, bufferCounter) ;
	if (bufferCounter++ < OUTPUT_SIZE)
	{
		*pp1++ = tt1  ;
		*pp1++  = tt2   ;
	}
}


#if  0
/* Memory used for the accumulator list. */
#pragma DATA_ALIGN (gHiPriAccumList, 16)
UInt32              gHiPriAccumList[32];
#endif

/* These are the device identifiers used used in the TEST Application */
const uint32_t DEVICE_ID1_16BIT    = 0xBEEF;
const uint32_t DEVICE_ID1_8BIT     = 0xAB;
const uint32_t DEVICE_ID2_16BIT    = 0x4560;
const uint32_t DEVICE_ID2_8BIT     = 0xCD;
const uint32_t DEVICE_ID3_16BIT    = 0x1234;
const uint32_t DEVICE_ID3_8BIT     = 0x12;
const uint32_t DEVICE_ID4_16BIT    = 0x5678;
const uint32_t DEVICE_ID4_8BIT     = 0x56;

///    Added by Ran katzur

const uint32_t DEVICE_ID5_16BIT    = 0x1357;
const uint32_t DEVICE_ID5_8BIT     = 0x13;
const uint32_t DEVICE_ID6_16BIT    = 0x9bdf;
const uint32_t DEVICE_ID6_8BIT     = 0x9B;
const uint32_t DEVICE_ID7_16BIT    = 0x147a;
const uint32_t DEVICE_ID7_8BIT     = 0x14;
const uint32_t DEVICE_ID8_16BIT    = 0xd147;
const uint32_t DEVICE_ID8_8BIT     = 0xd1;


long  x_min   ;
unsigned int x1  ;

void ranDelay(Int32 N)
{
	int  i,j,k    ;
	for (k=0; k<N; k++)
	{
		for (j=0; j<1000; j++)
		{
			for (i=0; i < 2000; i++)
				asm ("    NOP (9)")  ;
		}
	}
}



UInt16  coreNumberFromId(UInt16 coreDeviceID[], UInt16 value)
{
	int  i   ;

	for (i=0; i<NUM_CORES; i++)
	{
		if (coreDeviceID[i] == value)
		{
			return (i)  ;

		}
	}
	System_printf("error in Device ID  \n");
	return (0xffff)     ;
}

UInt16  IdFromCore(UInt16 coreDeviceID[], UInt16 value)
{

	return (coreDeviceID[value])     ;
}



void disableCaches()
{
    CACHE_setL2Size(CACHE_0KCACHE)  ;
    CACHE_setL1DSize(CACHE_L1_0KCACHE)  ;
}


void         	printMessages(int coreNum, unsigned char *ptr)
{
	int   i   ;
	System_printf("message arrived to core %d \n ",coreNum);
	for (i=0; i< NUMBER_PRINTS; i++)
	{
		System_printf("->  %x \n",*ptr++ );
	}
}



/**
 *  @b Description
 *  @n  
 *      Utility function which converts a local address to global.
 *
 *  @param[in]  addr
 *      Local address to be converted
 *
 *  @retval
 *      Global Address
 */
 UInt32 l2_global_address (Uint32 addr)
{
	UInt32 corenum;

	/* Get the core number. */
	corenum = CSL_chipReadReg(CSL_CHIP_DNUM); 

	/* Compute the global address. */
	return (addr + (0x10000000 + (corenum*0x1000000)));
}

/**
 *  @b Description
 *  @n  
 *      Utility function that is required by the IPC module to set the proc Id.
 *      The proc Id is set via this function instead of hard coding it in the .cfg file
 *
 *  @retval
 *      Not Applicable.
 */
Void myStartupFxn (Void)
{
	MultiProc_setLocalId (CSL_chipReadReg (CSL_CHIP_DNUM));
}

void fillDataChar (unsigned char * p, int N )
{
	int   i    ;
	int   j ,k  ;
	j = rand()    ;
	k = rand()  % 4  ;
	for (i=0; i < N ; i++)
	{
		*p++ = ( j % 0xf);
		j = j + k   ;
	}
}


#define        AMOUNT     4
void             printStartEndChar(unsigned char buffer[], int N)
{
	int  i   ;
	System_printf("Consumer ->  ");
	for (i=0; i< 2* AMOUNT ;i++)
	{
		System_printf("%x ", buffer[i]);
	}
	System_printf(" -> .. ->  ");
	for (i=N-2*AMOUNT ; i< N; i++)
	{
		System_printf("%x ", buffer[i]);
	}
	System_printf("\n") ;

}


void  printStartEndShort(unsigned char buffer[], int N)
{
	int  i   ;
	unsigned short *p   ;
	p = (unsigned short *) &buffer[0]    ;
	System_printf("->  ");
	for (i=0; i< 2* AMOUNT ;i++)
	{
		System_printf("%x ", *(p+i)  );
	}
	System_printf(" -> .. ->  ");
	for (i=N/2-2*AMOUNT ; i< N/2; i++)
	{
		System_printf("%x ", *(p+i));
	}
	System_printf("\n") ;

}



Int32 randomValue1 ()
{
	Int32   x   ;
	x = (Int32) ( rand() % INTERVAL1 ) ;
	x = + BASE1  ;
	return (x ) ;
}




