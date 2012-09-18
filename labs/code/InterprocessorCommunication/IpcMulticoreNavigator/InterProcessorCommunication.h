/*
 * MessageQRoundRobin.h
 *
 *  Created on: Jun 8, 2012
 *      Author: a0216870
 */

#ifndef MESSAGEQROUNDROBIN_H_
#define MESSAGEQROUNDROBIN_H_

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
int32_t systemInit ();


#endif /* MESSAGEQROUNDROBIN_H_ */
