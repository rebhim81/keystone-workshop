/*
 * system_trace.h
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

#ifndef SYSTEM_TRACE_H_
#define SYSTEM_TRACE_H_
#include <StmLibrary.h>
#include <StmHelper.h>
#include <stdlib.h>

/******************************************************************************
 * These definitions are specific to the 66x
 *****************************************************************************/
#define STM_BASE_ADDRESS		0x20000000
#define STM_CHAN_RESOLUTION 	0x1000
/*****************************************************************************/




/* Function Declarations */
void initializeSTM(void);
void closeSTM(void);

void* cTools_memAlloc(size_t);
void* cTools_memMap(unsigned int, unsigned int);
void cTools_memFree(void*);
void cTools_memUnMap(void*, unsigned int);

/* Channel Enumerations */
typedef enum {
	STMC_CLEAR_BUFFER = 0,
	STMC_M_REQUEST_PROCESSING,
	STMC_M_RECEIVE_ACK,
	STMC_M_SENT_DATA,
	STMC_M_DATA_AVAILABLE,
	STMC_M_PROCESSING_COMPLETE,
	STMC_M_PROCESSING_COMPLETE_ACK,
	STMC_S_READY,
	STMC_S_RECEIVED_PROC_REQUEST,
	STMC_S_ACK_PROC_REQUEST,
	STMC_S_RECEIVED_DATA,
	STMC_S_PROCESS_COMPLETE,
	STMC_S_RECEIVED_PROCESSING_COMPLETE,
	STMC_S_COMPLETE_ACK
}STM_channel;


#endif /* SYSTEM_TRACE_H_ */
