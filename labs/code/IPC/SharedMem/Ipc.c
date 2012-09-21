/*
 * ==================== Ipc.c ====================
 */

/*******************************************************************************
 * OVERVIEW
 *******************************************************************************
 * In this example, we will use MessageQ tp pass a token message from one core
 * to other randomly chosen cores.  A total of NUM_MESSAGES will be passed.
 * There are three types of messages that we will use in this example, TOKEN,
 * ACK, and DONE.
 *
 * Messages:
 * 	MSG_TOKEN - The token message is passed betweer the randomly chosen cores.
 * 	MSG_ACK - When a core receives the token, it will send an acknowledge
 * 			message back to the core that sent it the token.
 * 	MSG_DONE - Once NUM_MESSAGE passes have occurred, whichever core has the
 * 			token will send a DONE message to all other cores, letting them know
 * 			to	exit.
 ******************************************************************************/
#include <xdc/std.h>
#include <xdc/cfg/global.h>

#include <xdc/runtime/System.h>
#include <xdc/runtime/IHeap.h>


#include <ti/ipc/MultiProc.h>
#include <ti/ipc/MessageQ.h>
#include <ti/ipc/SharedRegion.h>

#include <ti/platform/platform.h>

#include <ti/sysbios/Bios.h>

#include <ti/csl/csl_chip.h>
#include <stdlib.h>
#include <time.h>

#include "include/Ipc.h"
#include "../common/include/Ipc_common.h"

#define MAX_NUM_CORES			8
#define NUM_MESSAGES			100
#define MASTER_CORE				0
#define TOKEN_START_CORE		0
#define HEAP_ID					0

/* Global Variables */
Char localQueueName[10];
Char remoteQueueName[10];
Char msgQueueNames[MAX_NUM_CORES][10];

UInt numCores = 0;
Uint16 selfId;

MessageQ_Handle messageQ = NULL;


/******************************************************************************
 * MAIN FUNCTION
 *****************************************************************************/
Int main(Int argc, Char* argv[]){

	srand(time(NULL));

	selfId = CSL_chipReadReg(CSL_CHIP_DNUM);

	if (numCores == 0){
		numCores = MultiProc_getNumProcessors();
	}

	/* Attach All Cores */
	attachAll(numCores);

	/* Create a MessageQ */
	System_sprintf(localQueueName, "%s", MultiProc_getName(MultiProc_self()));
	messageQ = MessageQ_create(localQueueName, NULL);
	if (messageQ == NULL){
		System_abort("MessageQ_create failed\n");
	}

	BIOS_start();

	return (0);
}

/******************************************************************************
 * TASK FUNCTION
 *****************************************************************************/
void task_fxn(UArg arg0, UArg arg1){
	Int 				status;
	Int 				coreCount;
	Int 				nextCore;
	MessageQ_Msg 		msg;
	MessageQ_QueueId 	msgQueueIds[MAX_NUM_CORES];

	/* Register this heap with the Message Q */
	MessageQ_registerHeap((IHeap_Handle)SharedRegion_getHeap(0), HEAP_ID);

/*
 * In order to send messages to other cores, we must know that core's Queue
 * ID.  So, we'll create an array on each core that associates the Queue ID
 * with the core number, and then we'll open each queue.  Again, we spin
 * here until the queue is open, sleeping for one tick after every attempt.
 */
	for (coreCount = 0; coreCount < MAX_NUM_CORES; coreCount++){
		System_sprintf(remoteQueueName, "%s", MultiProc_getName(coreCount));
		do {
			status = MessageQ_open(remoteQueueName, &msgQueueIds[coreCount]);
			if (status < 0){
				Task_sleep(1);
			}
		}while (status < 0);
	}


	/*
	 * At this point, our application is ready to begin sending messages using
	 * Message Queue.  The core with the number TOKEN_START_CORE has the
	 * responsibility of sending the first message.  So, we'll handle that in
	 * this block.
	 */
	if (selfId == TOKEN_START_CORE){

		/*
		 * Allocate the initial message.  If the message is not properly
		 * allocated, we must abort
		 */

		/*
		 * TODO: IPC #1 - Allocate Memory for Token Message
		 * Add core below that ALLOCATES the memory for the token message.
		 * We've already declared the variable msg to hold the pointer to
		 * this message.  The code to check if the pointer is NULL is
		 * already included.
		 */


		if (msg == NULL){
			System_abort("MessageQ_alloc failed\n");
		}

		/*
		 * Now randomly select the next processor to send the.  This function
		 * simply selects a random core number and ensures it's not the same as
		 * the current core number.
		 */
		nextCore = findNextCore(selfId);

		/*
		 * Set the Initial Token Count in the message, and specify that the
		 * message type is MSG_TOKEN
		 */
		((myMsg*)msg)->tokenCount = 1;
		((myMsg*)msg)->messageType = MSG_TOKEN;

		/*
		 * We can also set a reply queue so that the core can acknowledge this
		 * message without having to know which core it came from.
		 */
		MessageQ_setReplyQueue(messageQ, msg);

		/*
		 * Now we actually send the message to the next core that we've chosen.
		 */

		/* TODO: IPC #2 - Pass the token to the destination core
		 * Add the code to send the message to the destination core.  This is
		 * done by putting the message in the destination core's queue.  Don't
		 * forget that the ID of the destination core's queue is stored at
		 * element "nextCore" in the array msgQueueIds, and is NOT the same
		 * as the core number.
		 */


	}

	while (TRUE){
		msgType messageType;
		MessageQ_Msg ack;
		MessageQ_QueueId ackQueueId;
		Int currentTokenCount;

		/* TODO: IPC #3 - Get a Message from the local queue.
		 * Take the message from the local queue and store it in the variable
		 * message.  The function call return value should be stored in the
		 * variable status.  Hint: The parameters passed to this function
		 * specify a time out size.  We want to configure this call to
		 * never time out, and block eternally until a message is received.
		 */


		if (status < 0){
			System_abort("This should not occur since the timeout is forever\n");
		}

		/*
		 * Read the Message Type from the received message, along with the current
		 * token count.
		 */
		messageType = ((myMsg*)msg)->messageType;
		currentTokenCount = ((myMsg*)msg)->tokenCount;

		/*
		 * Now, check what type of message it is and take action.  Here are the
		 * actions to be taken.
		 *
		 * MSG_TOKEN
		 * 	- Acknowledge that token is received to sending core.
		 * 	- If token count is less than MAX_MESSAGES
		 * 		- Increment the token count.
		 * 		- Forward the token on to the next random core
		 *	- If token count is equal to MAX Messages
		 *		- Free the Token message.
		 *		- Send a Done Message to all other cores.
		 *		- Break out of the infinite loop.
		 *
		 * MSG_ACK
		 * 	- Free the Ack message
		 * MSG_DONE
		 *  - Free the Done Message
		 *  - Break Out of infinite loop
		 */
		switch (messageType){
		case MSG_TOKEN:
			System_printf("Token Received - Count = %d\n", currentTokenCount);

			/*
			 * TODO: IPC #4 - Get the Reply Queue for the token
			 * Store the ID of the reply queue in the variable ackQueueId.
			 * This function allows us to not have to figure out which core
			 * sent this message.  This is the analogous function to the
			 * MessageQ_setReplyQueue() function that was set before the
			 * message was sent.  This data is stored in the MessageQ_MsgHeader
			 * element that's included with the message
			 */


			/*
			 * TODO: IPC #5 - Allocate the acknowledge message
			 * Allocate the acknowledge message and store the pointer to it
			 * in the variable ack.
			 */


			// Set the Message Type of the new Message to MSG_ACK
			if (ack==NULL){
				System_abort("MessageQ Alloc Failed\n");
			}

			// Set the Message Type of the new Message to MSG_ACK
			((myMsg*)ack)->messageType = MSG_ACK;

			/*
			 * TODO: IPC #6 - Send the Acknowledge message
			 * Don't forget that we've already stored the reply queue ID in
			 * ackQueueId above.
			 */


			/*
			 * Now handle the actions required by the status of the message. First
			 * we must check to see if we're at the Token Passing limit.  So we'll
			 * compare the current Token count with MAX_MESSAGES.
			 */

			/*
			 * If the current token count is the max, then we must free the current
			 * message and then allocate new DONE messages to be sent to the other
			 * cores.
			 */
			if (currentTokenCount == NUM_MESSAGES){
				/*
				 * TODO: IPC #7 - Free the memory used by the token message
				 * Don't forget that the pointer to this memory is in the
				 * variable msg.
				 */


				/*
				 * Now allocate and send ALL cores a DONE message.  We don't need to
				 * worry about special handling of the current core.  It will just
				 * send itself a DONE message and handle it just as the other cores
				 * do
				 */
				/*
				 * TODO: IPC #8 - Note that this core will send itself a message.
				 * There's nothing to be added here.  just note that this
				 * routine is blindly sending done messages to all of the cores
				 * and not taking into account it's own core number.  So, this
				 * core will send one of these messages to itself.
				 */
				for (coreCount =0; coreCount < MAX_NUM_CORES; coreCount++){
					msg = MessageQ_alloc(HEAP_ID, sizeof(myMsg));
					if (msg == NULL){
						System_abort("MessageQ Alloc Failed\n");
					}

					// Set the Message Type to MSG_DONE
					((myMsg*)msg)->messageType = MSG_DONE;

					// Now send it to the selected core
					status = MessageQ_put(msgQueueIds[coreCount], msg);
				}
				break;
			}

			/*
			 * If we're not at the last message, then we must increment the
			 * tokenCount and pass the message on to a random core.  Don't
			 * forget to set the reply queue so we can get an acknowledge.
			 */
			nextCore = findNextCore(selfId);
			((myMsg*)msg)->tokenCount = currentTokenCount + 1;

			/*
			 * TODO: IPC #9- Set the reply queue for the token message.
			 * We need to be sure to set the reply queue each time.
			 * Otherwise, the wrong core will receive the acknowledge.
			 */


			// Put the message on the proper queue
			status = MessageQ_put(msgQueueIds[nextCore], msg);

			break;
		case MSG_ACK:
			System_printf("Ack Received\n");
			/*
			 * All we need to do in this case is free the Ack message
			 */
			MessageQ_free(msg);
			break;
		case MSG_DONE:
			System_printf("Done Received\n");
			/*
			 * If we receive the Done message we just need to free the message, and
			 * then exit SYS/BIOS because the application is complete.
			 */
			MessageQ_free(msg);
			BIOS_exit(0);
			break;
		default:
			System_printf("Invalid Message Type Received\n");
			return;
		}


	}
}


/******************************************************************************
 * FUNCTION TO SELECT THE DESTINATION CORE (other than itself)
 *****************************************************************************/
Int findNextCore(Int currentCore){
	Int nextCore;

	do {
		nextCore = rand() % MAX_NUM_CORES;
	}while (nextCore == currentCore);
	return nextCore;
}
