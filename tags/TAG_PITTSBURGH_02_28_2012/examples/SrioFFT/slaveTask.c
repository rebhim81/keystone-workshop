/*
 * slaveTask.c
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
#include <slaveTask.h>
#include <initialization.h>
#include <fftRoutines.h>

/* Bios Files */
#include <xdc/runtime/System.h>

/* DSP Lib */
#include <dsplib.h>

/* System Trace Lib */
#include <system_trace.h>

extern STMHandle *pSTMHandle;

/**********************************************************************
 ************************** LOCAL Definitions *************************
 **********************************************************************/

/*
 * File Level Globals
 */
int32_t randomValue;


/*
 * Extern Variables
 */
extern uint8_t coreNum;
extern uint16_t coreDeviceID[NUM_CORES_MAX];
extern volatile uint32_t runFlag;

extern Srio_SockHandle			srioSocket;
extern int16_t*					txData_int;
extern Srio_SockAddrInfo		to;
extern Srio_SockAddrInfo		from;
extern Srio_DrvBuffer			hDrvBuffer;
extern int32_t 					recvFromCore;
extern Srio_DrvHandle 			hSrioDriver;

extern int16_t twiddle_32[64];
extern int16_t twiddle_64[128];
extern int16_t twiddle_128[256];
extern int16_t twiddle_256[512];
extern int16_t twiddle_512[1024];
extern int16_t twiddle_1024[2048];

extern int16_t 	z_short[8][2 * MAX_FFT_SIZE];
extern int16_t 	xxx[8][2 * MAX_FFT_SIZE];
extern int16_t 	y_short[8][MAX_FFT_SIZE];
extern int16_t 	x_short[8][MAX_FFT_SIZE];


Void slaveTask(UArg arg0, UArg arg1){
	int32_t num_bytes;
	int16_t* pointerToData;
	int16_t* ptrMessage;
	int16_t *restrict y_ptr;
	const int16_t *restrict pw;
	uint8_t* ptr_rxDataPayload;
	int32_t fftSize;


	if (threadInitialization() < 0 )
	     return;

	if (slaveTaskInitialization(hSrioDriver, &pointerToData) < 0){
		System_printf ("Slave Task Initialization failed\n");
		return;
	}

	/*
	 * Slaves only send messages to the master
	 */
	to.type11.id = coreDeviceID[CORE_SYS_INIT];

	do {
		/* See if there is a message */
		num_bytes = Srio_sockRecv (srioSocket, (Srio_DrvBuffer*)&ptr_rxDataPayload, &from);

		if (num_bytes <= 0 ){
			continue;
		}

		/* If so, process it */

		/* If the message is not from core0, it's an error */
		if (from.type11.id != coreDeviceID[CORE_SYS_INIT]){
#if (VERBOSE_LEVEL > 1)
			System_printf ("Message received from invalid core\n");
#endif
    	    continue;
		}

		ptrMessage = (int16_t*)&ptr_rxDataPayload[0];
		switch (*ptrMessage){
		case SRIOMSG_PROC_REQUEST:
			STMXport_logMsg0(pSTMHandle, STMC_S_RECEIVED_PROC_REQUEST, "Process Request Received\0");
			/* Send an acknowledgement to the master core */
			txData_int[0] = SRIOMSG_REQ_ACK;
            if (Srio_sockSend (srioSocket, hDrvBuffer, SEND_SIZE, &to) < 0)
            {
#if (VERBOSE_LEVEL > 1)
            	System_printf ("Error: SRIO Socket send failed\n");
#endif
            	return;
            }
			STMXport_logMsg0(pSTMHandle, STMC_S_ACK_PROC_REQUEST, "Process Request Acknowledged\0");
			break;
		case SRIOMSG_PROC_DATA:
			STMXport_logMsg0(pSTMHandle, STMC_S_RECEIVED_DATA, "Data Received\0");
			fftSize = ptrMessage[2];
			memcpy(xxx[coreNum], ptrMessage, 4 * fftSize);
			xxx[coreNum][0] = xxx[coreNum][1];
			xxx[coreNum][1] = 0;
			xxx[coreNum][2] = xxx[coreNum][3];
			xxx[coreNum][3] = 0;

			y_ptr = (int16_t*) z_short[coreNum];

			switch(fftSize){
			case 32:
				pw = (const int16_t *)twiddle_32;
				break;
			case 64:
				pw = (const int16_t *)twiddle_64;
				break;
			case 128:
				pw = (const int16_t *)twiddle_128;
				break;
			case 256:
				pw = (const int16_t *)twiddle_256;
				break;
			case 512:
				pw = (const int16_t *)twiddle_512;
				break;
			case 1024:
				pw = (const int16_t *)twiddle_1024;
				break;
			default:
				/* Invalid FFT size */
				pw = 0;
#if (VERBOSE_LEVEL > 1)
            	System_printf ("Invalid FFT Size\n");
#endif
			}

			DSP_fft16x16(pw, fftSize, xxx[coreNum], y_ptr);
			seperateRealImg(fftSize, y_ptr, x_short[coreNum], y_short[coreNum]);
#if (VERBOSE_LEVEL > 2)
			System_printf("fft size %d output %x real %x imag %x \n",
					fftSize, y_ptr, x_short[coreNum], y_short[coreNum]);
#endif
			STMXport_logMsg1(pSTMHandle,
					STMC_S_PROCESS_COMPLETE,
					"Completed processing of size %d\0",
					fftSize
					);

			ranDelay(fftSize);
			txData_int[0] = SRIOMSG_DATA_COMPLETE;
            if (Srio_sockSend (srioSocket, hDrvBuffer, SEND_SIZE, &to) < 0)
            {
#if (VERBOSE_LEVEL > 1)
            	System_printf ("Error: SRIO Socket send failed\n");
#endif
            	return;
            }
            break;
		case SRIOMSG_PROC_COMPLETE:
			STMXport_logMsg0(pSTMHandle, STMC_S_RECEIVED_PROCESSING_COMPLETE, "Proc. Complete Received\0");
			txData_int[0] = SRIOMSG_ACK_COMPLETE;
            if (Srio_sockSend (srioSocket, hDrvBuffer, SEND_SIZE, &to) < 0)
            {
#if (VERBOSE_LEVEL > 1)
            	System_printf ("Error: SRIO Socket send failed\n");
#endif
            	return;
            }
            STMXport_logMsg0(pSTMHandle, STMC_S_COMPLETE_ACK, "Complete Acknowledged\0");
			break;
		case SRIOMSG_REQ_ACK:
		case SRIOMSG_DATA_COMPLETE:
		case SRIOMSG_ACK_COMPLETE:
#if (VERBOSE_LEVEL > 1)
			System_printf ("Error: Invalid Srio Message received.\n");
#endif
			break;

		}
		Srio_freeRxDrvBuffer(srioSocket, (Srio_DrvBuffer)ptr_rxDataPayload);
	}while (*ptrMessage != SRIOMSG_PROC_COMPLETE);

	/* Close the SRIO Socket */
	Srio_sockClose(srioSocket);
	exit(1);
	return;

}
