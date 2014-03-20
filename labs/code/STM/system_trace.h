/*
 * system_trace.h
 *
 *  Created on: Jan 16, 2012
 *      Author: a0216870
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
	STMCH_STATUS,
	STMCH_ERROR,
	STMCH_MASTER_SEND,
	STMCH_MASTER_RECEIVE,
	STMCH_SLAVE_SEND,
	STMCH_SLAVE_RECEIVE
}STM_channel;

#endif /* SYSTEM_TRACE_H_ */
