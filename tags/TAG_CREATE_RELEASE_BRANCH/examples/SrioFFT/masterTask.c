/*
 * masterTask.c
 *
 * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
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
 *
 *  =========================== REVISION INFORMATION ===========================
 *  Revision Information
 *   Changed: $LastChangedDate: 2012-02-09 10:29:24 -0500 (Thu, 09 Feb 2012) $
 *   Revision: $LastChangedRevision: 19 $
 *   Last Update By: $Author: danrinkes $
 *  ============================================================================
 *
        1         2         3         4         5         6          7
12345678901234567890123456789012345678901234567890123456789012345678901234567890
*/
#include <masterTask.h>
#include <initialization.h>
#include <requestProcessingData.h>
#include <master_core_manager.h>


/* Bios Files */
#include <xdc/runtime/System.h>
#include <ti/sysbios/knl/Task.h>
/* CSL Include Files */
#include <ti/csl/csl_cacheAux.h>

#include <system_trace.h>

#include <stdlib.h>
#include <time.h>

/**********************************************************************
 ************************** LOCAL Definitions *************************
 **********************************************************************/


/*
 * Extern Variables
 */
extern uint8_t				coreNum;
extern uint16_t				coreDeviceID[NUM_CORES_MAX];
extern volatile uint32_t	runFlag;
extern Srio_SockHandle		srioSocket;
extern int16_t*				txData_int;
extern Srio_SockAddrInfo	to;
extern Srio_SockAddrInfo	from;
extern int32_t				sendToCore;
extern Srio_DrvBuffer		hDrvBuffer;
extern int32_t				firstSendStart;
extern Srio_DrvHandle 		hSrioDriver;
extern STMHandle 			*pSTMHandle;

/*
 * File Level Globals
 */
int32_t 		coreLoop;
bufferControl_t	controlVector[NUM_FFT_BUFFER];
int16_t 		fftBuffer[MAX_FFT_SIZE * 2 * NUM_FFT_BUFFER];


#pragma DATA_ALIGN   (fftBuffer, 128)
#pragma DATA_SECTION (fftBuffer, ".fftInput");
int16_t fftBuffer[MAX_FFT_SIZE*2*NUM_FFT_BUFFER]  ;

bufferControl_t controlVector[NUM_FFT_BUFFER];

uint8_t 		coreTaskInitComplete = 0;
uint16_t 		num_complete_cores = 0;

Void masterCoreTask(UArg arg0, UArg arg1){

	int16_t* ptrMessage;
	uint8_t* ptr_rxDataPayload;
	int32_t num_bytes;
	uint16_t messageSource;
	uint8_t slaveCore;

	if (threadInitialization() < 0 )
	     return;

	srand(time(NULL));	/* TODO: DO we need this? */

	if (masterTaskInitialization(hSrioDriver) < 0){
		System_printf ("Master Task Initialization failed\n");
		return;
	}

	coreStateInit(coreNum);

	/* Clear the SRIO buffer if there is anything in there */
	STMXport_logMsg0(pSTMHandle, STMC_CLEAR_BUFFER, "Clearing Buffer");
	while((num_bytes = Srio_sockRecv (srioSocket, (Srio_DrvBuffer*)&ptr_rxDataPayload, &from)) != 0)
	{
		Srio_freeRxDrvBuffer(srioSocket, (Srio_DrvBuffer)ptr_rxDataPayload);
	}

	coreTaskInitComplete = 1;

	/*
	 * Send a processing request to all cores to ready them
	 */
	txData_int[0] = SRIOMSG_PROC_REQUEST;
	while(getAvailableCore(&slaveCore) != CORE_NOT_AVAILABLE){
		to.type11.id = coreDeviceID[slaveCore];
        if (Srio_sockSend (srioSocket, hDrvBuffer, 4 * 128, &to) < 0)
        {

#if (VERBOSE_LEVEL > 1)
        	System_printf ("Error: SRIO Socket send failed\n");
#endif
        	return;
        }
#if (VERBOSE_LEVEL > 2)
        System_printf ("Proc Request sent to core %d\n", slaveCore);
#endif
        STMXport_logMsg1(pSTMHandle, STMC_M_REQUEST_PROCESSING, "Process Request sent to core %d\0", slaveCore);
        ranDelay(20);
	}

	/*
	 * Once an initial request is sent to all cores, then check for received
	 * messages
	 */
	do {
		num_bytes = Srio_sockRecv(srioSocket, (Srio_DrvBuffer*)&ptr_rxDataPayload, &from);
		if (num_bytes == 0){
			Task_yield();
			continue;
		}

		if (num_bytes < 0){
			continue;
		}

		messageSource = from.type11.id;
		slaveCore = coreNumberFromId(&coreDeviceID[0], messageSource);
		ptrMessage = (int16_t*)&ptr_rxDataPayload[0];

		switch (*ptrMessage){
		case SRIOMSG_REQ_ACK:
			STMXport_logMsg1(pSTMHandle, STMC_M_REQUEST_PROCESSING, "Process Request sent to core %d\0", slaveCore);
			/* Mark this processor as Ready */
			markCoreReady(slaveCore);
			Srio_freeRxDrvBuffer(srioSocket, (Srio_DrvBuffer)ptr_rxDataPayload);
			break;
		case SRIOMSG_DATA_COMPLETE:
			STMXport_logMsg1(pSTMHandle, STMC_M_DATA_AVAILABLE, "Received Data from Core %d\0", slaveCore);
			markCoreComplete(slaveCore);
			Srio_freeRxDrvBuffer(srioSocket, (Srio_DrvBuffer)ptr_rxDataPayload);
			/* Send another Request Message to this core */
			txData_int[0] = SRIOMSG_PROC_REQUEST;
			to.type11.id = coreDeviceID[slaveCore];
			if (Srio_sockSend (srioSocket, hDrvBuffer, 4 * 128, &to) < 0)
			{
#if (VERBOSE_LEVEL > 1)
				System_printf ("Error: SRIO Socket send failed\n");
#endif
			}
			STMXport_logMsg1(pSTMHandle, STMC_M_REQUEST_PROCESSING, "Process Request sent to core %d\0", slaveCore);
			markCorePending(slaveCore);
			break;
		case SRIOMSG_ACK_COMPLETE:
			STMXport_logMsg1(pSTMHandle, STMC_M_PROCESSING_COMPLETE_ACK, "Received Complete Ack. from Core %d\0", slaveCore);
			num_complete_cores++;
			Srio_freeRxDrvBuffer(srioSocket, (Srio_DrvBuffer)ptr_rxDataPayload);
			break;
		case SRIOMSG_PROC_REQUEST:
		case SRIOMSG_PROC_DATA:
		case SRIOMSG_PROC_COMPLETE:
			/*
			 * Shouldn't get these messages here.
			 * These are messages to the slave.
			 */
			Srio_freeRxDrvBuffer(srioSocket, (Srio_DrvBuffer)ptr_rxDataPayload);
#if (VERBOSE_LEVEL > 1)
			System_printf ("Error: Invalid Srio Message received.\n");
#endif
		}
	}while(num_complete_cores < NUM_CORES);

#if (VERBOSE_LEVEL > 2)
	System_printf ("Master Core Task Complete\n");
#endif

	exit(1);
	return;

}

Void masterProcTask(UArg arg0, UArg arg1){

	uint32_t iterationCounter;
	int32_t N = 38;
	int16_t *p_data;
	uint8_t slaveCore;

	while (coreTaskInitComplete != 1){
		Task_yield();
	}

	iterationCounter = ITERATIONS;
    initializeBufferControl(fftBuffer,  controlVector, NUM_FFT_BUFFER );

    p_data = getNextfreeBuffer(controlVector);
    p_data = (int16_t*) prepareData(p_data, &N);

    if (p_data == NULL)
	{
		exit(1);
	}

    while (iterationCounter--){

    	/* Get a core that's ready for processing */
    	while (getReadyCore(&slaveCore) == CORE_NOT_AVAILABLE){
    		Task_yield();
    	}
#if (VERBOSE_LEVEL > 2)
    	System_printf("Iteration %d\n", ITERATIONS - iterationCounter);
#endif

    	p_data[1] = p_data[0];
    	p_data[0] = SRIOMSG_PROC_DATA;
    	p_data[3] = p_data[2];
    	p_data[2] = N;
    	memcpy(txData_int, p_data, 4 * N);
    	to.type11.id = coreDeviceID[slaveCore];
        if (N < 128) N = 128 ; // segmentation socket must have more than 256 bytes
        if (Srio_sockSend (srioSocket, hDrvBuffer, 4*N, &to) < 0)
        {

#if (VERBOSE_LEVEL > 1)
        	System_printf ("Error: SRIO Socket send failed\n");
#endif

        	return;
        }
        markCoreBusy(slaveCore);
        STMXport_logMsg1(pSTMHandle, STMC_M_SENT_DATA, "Data Sent to Core %d\n", slaveCore);

    }
    num_complete_cores = 1;

   // p_data[0] = SRIOMSG_PROC_COMPLETE;
    txData_int[0] = SRIOMSG_PROC_COMPLETE;
    //memcpy(txData_int, p_data, 4 * 128);
    /*
     * We're done with all of the cores, so send a stop command.
     */
    for (slaveCore = 0; slaveCore < NUM_CORES; slaveCore++){
    	if (getCoreState(slaveCore) != CORE_STATE_MASTER){
    		to.type11.id = coreDeviceID[slaveCore];
            if (Srio_sockSend (srioSocket, hDrvBuffer, 4*N, &to) < 0)
            {

    #if (VERBOSE_LEVEL > 1)
            	System_printf ("Error: SRIO Socket send failed\n");
    #endif

            	return;
            }
            STMXport_logMsg1(pSTMHandle, STMC_M_SENT_DATA, "Complete Notification sent to core %d\n", slaveCore);

    	}
    }
    ranDelay(30);
    ranDelay(3);

    while (num_complete_cores < NUM_CORES){
    	Task_yield();
    }

#if (VERBOSE_LEVEL > 2)
	System_printf ("Master Proc Task Complete\n");
#endif

	Srio_sockClose(srioSocket);

	exit(1);
	return;

}


void initializeBufferControl(short * in1, bufferControl_t controlVector[], int numberBuffers)
{
	int  i   ;
	short *p    ;
	p = in1 ;
	for (i=0; i< numberBuffers; i++)
	{
		controlVector[i].status = (int) FREE_BUFFER    ;
		controlVector[i].pointer = p  ;
		p = p + MAX_FFT_SIZE*2   ;
	}
}

short   lastOne   =  0  ;
short * getNextfreeBuffer (bufferControl_t control[] )
{
	int  i   ;


	for (i=0; i<NUM_FFT_BUFFER; i++)
	{
		if (control[i].status == FREE_BUFFER)
		{
			control[i].status = USE_BUFFER    ;
			lastOne = i   ;
			return (control[i].pointer ) ;
		}
//		lastOne = lastOne + 1   ;
		if (lastOne == NUM_FFT_BUFFER)lastOne = 0  ;
		return (control[lastOne].pointer ) ;
	}

#if (VERBOSE_LEVEL > 1)
	System_printf("error in finding free buffer \n")  ;
#endif
	return (NULL);
}

short * prepareData(short *buffer , int *N )
{
	int   powerOfSize, size, numberOfSin   ;
	int   interval   ;
	interval = rand()  % (MAX_FFT_POWER-MIN_FFT_POWER + 1 );
	powerOfSize = interval + MIN_FFT_POWER    ;
	size = 1 << powerOfSize ;
	*N = size   ;
	numberOfSin = 1 + rand() % MAX_SIM     ;
	ranDelay (5)  ;
	generateShortInput (size, numberOfSin, buffer)   ;
	return (buffer) ;
}

