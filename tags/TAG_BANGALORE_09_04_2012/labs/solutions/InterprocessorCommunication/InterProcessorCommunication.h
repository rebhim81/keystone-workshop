/*
 * MessageQRoundRobin.h
 *
 *  Created on: Jun 8, 2012
 *      Author: a0216870
 */

#ifndef MESSAGEQROUNDROBIN_H_
#define MESSAGEQROUNDROBIN_H_

#include <stdlib.h>
#include <time.h>
#include <xdc/std.h>
#include <string.h>

/* XDC Runtime Module Headers */
#include <xdc/runtime/System.h>
#include <xdc/runtime/IHeap.h>
#include <xdc/runtime/Error.h>

/* IPC Module Headers */
#include <ti/ipc/Ipc.h>

#include <ti/ipc/MessageQ.h>
#include <ti/ipc/HeapBufMP.h>
#include <ti/ipc/MultiProc.h>

/* SYS/Bios Module Headers */
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>

/* Get Globals from .cfg Header */
#include <xdc/cfg/global.h>

#if 0
#define HEAP_ID 	0
#define HEAP_NAME 	"myHeapBuf"

#define MASTER_CORE			0
#define INITIAL_TOKEN_CORE 	0
#define NUM_TOKEN_PASSES	30
#define MAX_NUM_CORES		8
#endif

typedef enum {
	MSG_TOKEN = 0,
	MSG_ACK,
	MSG_DONE
}msgType;

typedef struct myMsg {
	MessageQ_MsgHeader	header;
	msgType  messageType;
	Int tokenCount;
}myMsg;

/*
 * Function Prototypes
 */
void task_fxn();
Int findNextCore(Int);


#endif /* MESSAGEQROUNDROBIN_H_ */
