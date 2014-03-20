/*
 * system_trace.c
 *
 *  Created on: Jan 16, 2012
 *      Author: a0216870
 */

#include "system_trace.h"

/* Global Variables */
STMHandle *pSTMHandle;



void initializeSTM(void)
{
	STMBufObj *pSTMBufInfo = NULL;
	STMConfigObj STMConfigInfo;
#if  0
	STMConfigInfo.optimized_prinf=false;
	STMConfigInfo.STM_BaseAddress = STM_BASE_ADDRESS;
#else
	STMConfigInfo.xmit_printf_mode=false;
	STMConfigInfo.STM_XportBaseAddr = STM_BASE_ADDRESS;
#endif


	STMConfigInfo.STM_ChannelResolution = STM_CHAN_RESOLUTION;
	STMConfigInfo.pCallBack = NULL;

	/*
	 * Open the STM port
	 */
	pSTMHandle = STMXport_open(pSTMBufInfo, &STMConfigInfo);

	if (pSTMHandle == 0)
		exit (0);
}

void closeSTM(void){
	STMXport_close(pSTMHandle);
}

void* cTools_memAlloc(size_t sizeInBytes){
	return malloc(sizeInBytes);
}

void* cTools_memMap(unsigned int phyAddr, unsigned int mapSizeInBytes){
	return (void*)phyAddr;
}

void cTools_memFree(void* ptr){
	free(ptr);
}

void cTools_memUnMap(void* vAddr, unsigned int mapSizeInBytes){
	return;
}
