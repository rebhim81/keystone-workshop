

#ifndef IPC_H_
#define IPC_H_

#include <xdc/std.h>
#include <xdc/cfg/global.h>

#include <ti/ipc/MultiProc.h>
#include <ti/ipc/MessageQ.h>
#include <ti/ipc/SharedRegion.h>

#include <ti/platform/platform.h>

#include <ti/sysbios/Bios.h>

#include <ti/csl/csl_chip.h>

typedef enum {
	MSG_TOKEN = 0,
	MSG_ACK,
	MSG_DONE
}msgType;

typedef struct myMsg {
	MessageQ_MsgHeader header;
	msgType messageType;
	Int tokenCount;
}myMsg;


int findNextCore(Int);
void task_fxn(UArg, UArg);


#endif /* IPC_H_ */
