/*
 *  ======== InterProcessorCommunication.c ========
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
#include <ti/sysbios/family/c66/Cache.h>
#include <ti/sysbios/knl/Task.h>

/* Get Globals from .cfg Header */
#include <xdc/cfg/global.h>

/* CSL Modules */
#include <ti/csl/csl_cacheAux.h>

/* QMSS Modules */
#include <ti/drv/qmss/qmss_drv.h>
#include <ti/drv/qmss/qmss_firmware.h>

/* CPPI Modules */
#include <ti/drv/cppi/cppi_drv.h>

/* Transport Headers */
#include <ti/transport/ipc/qmss/transports/TransportQmss.h>

#include "InterProcessorCommunication.h"
#include "IpcMulticoreNavigator_osal.h"

#include <ti/drv/cppi/device/cppi_device.c>
#include <ti/drv/qmss/device/qmss_device.c>


/*
 * Extern Variables
 */


#define NUM_MONOLITHIC_DESC				numDescriptors
#define SIZE_MONOLITHIC_DESC			descriptorSize
#define MONOLITHIC_DESC_DATA_OFFSET		16

/* Descriptor Pool [Size of descriptor * Number of descriptors] */
#pragma DATA_SECTION(monolithicDesc, ".desc");
#pragma DATA_ALIGN(monolithicDesc, 16);
uint8_t monolithicDesc[SIZE_MONOLITHIC_DESC * NUM_MONOLITHIC_DESC];

#define NUM_MSGS_TO_PREALLOC (16)
#pragma DATA_SECTION(txMsgPtrs, ".msgQ_ptrs");
myMsg *txMsgPtrs[NUM_MSGS_TO_PREALLOC];
#pragma DATA_SECTION(rxMsgPtrs, ".msgQ_ptrs");
myMsg *rxMsgPtrs[NUM_MSGS_TO_PREALLOC];
/*
 * Preprocessor definitions
 */
#define MAX_NUM_CORES 		8
#define NUM_MESSAGES 		100
#define MASTER_CORE			0
#define TOKEN_START_CORE	0
#define HEAP_ID				0
#define HEAP_NAME			"myHeapBuf"

/*
 * Global Variables
 */
Error_Block 		eb;
uint16_t 			thisCoreNumber;
char 				localQueueName[10];
char 				remoteQueueName[10];
char 				msgQueueNames[MAX_NUM_CORES][10];

/*******************************************************************************
 * MAIN FUNCTION
 ******************************************************************************/
Int main(Int argc, Char* argv[])
{
	Int status;
	Task_Params tskParams;

	/*
	 * Initialize the Task Parameters and dynamically create the
	 * task. Set the task function to be task_fxn.
	 */
	Task_Params_init(&tskParams);
	tskParams.stackSize = 4096;
	Task_create((Task_FuncPtr)task_fxn, &tskParams, &eb);

	/*
	 * Store the core number of this core in a global variable called
	 * "thisCoreNumber"
	 */
	thisCoreNumber = MultiProc_self();

	/*
	 * We use this function to generate the seed for our future random core
	 * number generation
	 */
	srand(time(NULL));

	/*
	 * Call IPC Start to sync the cores.  If it fails, we must abort
	 */
	status = Ipc_start();
	if (status < 0){
		System_abort("Ipc_start failed\n");
	}

	/*
	 * Call Bios Start to enable interrupts and start SYS/BIOS
	 * We should immediately begin executing the task_fxn.
	 */
	BIOS_start();

	return (0);
}

/*******************************************************************************
 * TASK_FXN
 ******************************************************************************/
void task_fxn()
{
	HeapBufMP_Params 	heapBufParams;
	HeapBufMP_Handle	heapHandle;
	MessageQ_Msg 		msg;
	MessageQ_Handle		messageQ;
	MessageQ_QueueId	msgQueueIds[MAX_NUM_CORES];
	Int 				status;
	uint8_t				coreCount, nextCore;

	/*
	 * When we use IPC, the core that is designated the "Master" needs to do
	 * some initial setup.  When using Shared Memory for IPC, the master must
	 * create a Shared Heap buffer and then the slave cores must open it.
	 * Anything done within the "if" portion of the following function occurs
	 * only on the MASTER core.  Anything done in the "else" portion occurs
	 * on all of the SLAVE cores.
	 */
	if (MASTER_CORE == thisCoreNumber){
		/*
		 * Create the Shared Heap Buffer
		 */
		HeapBufMP_Params_init(&heapBufParams);
		heapBufParams.regionId = 0;
		heapBufParams.name = HEAP_NAME;
		heapBufParams.blockSize = sizeof(myMsg);		// Specify block size as size of messages
		heapBufParams.numBlocks = 2 * MAX_NUM_CORES;	// Specifies amount of space we need to
														// reserve in the shared memory.  The most
														// any core will need at a time is 2 blocks,
														// 1 for a Token or Done and 1 for a Reply

		/*
		 * Create the Heap.  if it fails, we must abort
		 */
		heapHandle = HeapBufMP_create(&heapBufParams);
		if (heapHandle == NULL){
			System_abort("HeapBufMP_create failed\n");
		}

		/*
		 * Initialize the QMSS and CPPI
		 */
		System_printf("Begin System Init\n");
		status = systemInit();
		System_printf("End System Init\n");
		if (status != 0){
			System_printf("Error (%d) while initializing QMSS\n", status);
		}

	}else{
		/*
		 * On the slave cores, we must open the Global Heap.  We'll just spin
		 * here until the heap is opened.  The task will sleep for one tick if
		 * the buffer is not opened before it tries again in order to minimize
		 * contention.
		 */
		do {
			status = HeapBufMP_open(HEAP_NAME, &heapHandle);
			if (status < 0){
				Task_sleep(1);
			}
		}while (status < 0);
	}

	/*
	 * Once the heap is opened, we must register it with the MessageQ module.
	 * Since we're only using a single heap in this example, HEAP_ID is zero.
	 */
	MessageQ_registerHeap((IHeap_Handle)heapHandle, HEAP_ID);

	/*
	 * Now, on each core, we create the local Message Queue.  This can be
	 * thought of as creating a local mailbox where we'll look for messages
	 * that are sent to this core.  The IPC module keeps track of the queues
	 * based on the MultiProc's name.  So, we create a string with that name
	 * and it's the local queue name.  If we cannot create the local message
	 * Queue, we must abort.
	 */
	System_sprintf(localQueueName, "%s", MultiProc_getName(MultiProc_self()));
	messageQ = MessageQ_create(localQueueName, NULL);
	if (messageQ == NULL){
		System_abort("MessageQ create failed\n");
	}

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
	if (thisCoreNumber == TOKEN_START_CORE){
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
		msg = MessageQ_alloc(HEAP_ID, sizeof(myMsg));

		if (msg == NULL){
			System_abort("MessageQ_alloc failed\n");
		}

		/*
		 * Now randomly select the next processor to send the.  This function
		 * simply selects a random core number and ensures it's not the same as
		 * the current core number.
		 */
		nextCore = findNextCore(thisCoreNumber);

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
		status = MessageQ_put(msgQueueIds[nextCore], msg);

	}  // End Token Start Core Only


	/*
	 * Now, all the cores just wait for messages to arrive in their mailbox and
	 * will take action once messages are received.  We'll use the function
	 * MessageQ_get and spin forever until a message is received in order to
	 * check for messages.  In other applications, we might use an interrupt
	 * to notify the core that there are messages in the mailbox.  We'll read
	 * and act on messages in an infinite loop and only exit the loop whenever
	 * a done message is received.  MessageQ_get should never fail, as it should
	 * only return on success, but we'll check for a fail status anyway.
	 */
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
		status = MessageQ_get(messageQ, &msg, MessageQ_FOREVER);

		if (status < 0){
			System_abort("This should not occur since the timeout is forever");
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
			ackQueueId = MessageQ_getReplyQueue(msg);


			/*
			 * TODO: IPC #5 - Allocate the acknowledge message
			 * Allocate the acknowledge message and store the pointer to it
			 * in the variable ack.
			 */
			ack = MessageQ_alloc(HEAP_ID, sizeof(myMsg));

			if (ack == NULL){
				System_abort("MessageQ Alloc Failed\n");
			}

			// Set the Message Type of the new Message to MSG_ACK
			((myMsg*)ack)->messageType = MSG_ACK;

			/*
			 * TODO: IPC #6 - Send the Acknowledge message
			 * Don't forget that we've already stored the reply queue ID in
			 * ackQueueId above.
			 */
			status = MessageQ_put(ackQueueId, ack);

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
				MessageQ_free(msg);

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
				for (coreCount = 0; coreCount < MAX_NUM_CORES; coreCount++){
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
			nextCore = findNextCore(thisCoreNumber);
			((myMsg*)msg)->tokenCount = currentTokenCount + 1;

			/*
			 * TODO: IPC #9- Set the reply queue for the token message.
			 * We need to be sure to set the reply queue each time.
			 * Otherwise, the wrong core will receive the acknowledge.
			 */
			MessageQ_setReplyQueue(messageQ, msg);

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
		}

	}
}



Int findNextCore(Int currentCore){
	Int nextCore;

	do {
		nextCore = rand() % MAX_NUM_CORES;
	}while (nextCore == currentCore);

	return nextCore;
}


/**
 *  @b Description
 *  @n
 *      This configures the descriptor region and initializes CPPI, and QMSS.
 *      This function should only be called once per chip.
 *
 *  @retval
 *      Success     - 0
 *  @retval
 *      Error       - <0
 */
int32_t systemInit (Void)
{
  Qmss_InitCfg qmssInitConfig;   /* QMSS configuration */
  Qmss_MemRegInfo memInfo; /* Memory region configuration information */
  Qmss_Result result;
  UInt32 coreNum;

  coreNum =  MultiProc_self();

  System_printf ("\n-----------------------Initializing---------------------------\n");

  System_printf ("Core %d : L1D cache size %d. L2 cache size %d.\n", coreNum, CACHE_getL1DSize(), CACHE_getL2Size());

  memset ((Void *) &qmssInitConfig, 0, sizeof (Qmss_InitCfg));

  /* Set up the linking RAM. Use the internal Linking RAM.
   * LLD will configure the internal linking RAM address and maximum internal linking RAM size if
   * a value of zero is specified.
   * Linking RAM1 is not used */
  qmssInitConfig.linkingRAM0Base = 0;
  qmssInitConfig.linkingRAM0Size = 0;
  qmssInitConfig.linkingRAM1Base = 0;
  qmssInitConfig.maxDescNum      = NUM_MONOLITHIC_DESC /*+ total of other descriptors here */;

#ifdef xdc_target__bigEndian
  qmssInitConfig.pdspFirmware[0].pdspId = Qmss_PdspId_PDSP1;
  qmssInitConfig.pdspFirmware[0].firmware = (void *) &acc48_be;
  qmssInitConfig.pdspFirmware[0].size = sizeof (acc48_be);
#else
  qmssInitConfig.pdspFirmware[0].pdspId = Qmss_PdspId_PDSP1;
  qmssInitConfig.pdspFirmware[0].firmware = (void *) &acc48_le;
  qmssInitConfig.pdspFirmware[0].size = sizeof (acc48_le);
#endif

  /* Initialize Queue Manager SubSystem */
  result = Qmss_init (&qmssInitConfig, &qmssGblCfgParams[0]);
  if (result != QMSS_SOK)
  {
      System_printf ("Error Core %d : Initializing Queue Manager SubSystem error code : %d\n", coreNum, result);
      return -1;
  }

  result = Cppi_init (&cppiGblCfgParams[0]);
  if (result != CPPI_SOK)
  {
      System_printf ("Error Core %d : Initializing CPPI LLD error code : %d\n", coreNum, result);
  }

  System_printf("Hello World\n");
  //System_printf ("address of monolithicDesc[] = 0x%x. Converted=0x%x\n", monolithicDesc, l2_global_address ((UInt32) monolithicDesc));

  /* Setup memory region for monolithic descriptors */
  memset ((Void *) &monolithicDesc, 0, SIZE_MONOLITHIC_DESC * NUM_MONOLITHIC_DESC);
  memInfo.descBase       = (UInt32 *) monolithicDesc;	/* descriptor pool is in MSMC */
  memInfo.descSize       = SIZE_MONOLITHIC_DESC;
  memInfo.descNum        = NUM_MONOLITHIC_DESC;
  memInfo.manageDescFlag = Qmss_ManageDesc_MANAGE_DESCRIPTOR;
  memInfo.memRegion      = (Qmss_MemRegion) descriptorMemRegion;
  memInfo.startIndex     = 0;

  result = Qmss_insertMemoryRegion (&memInfo);
  if (result < QMSS_SOK)
  {
      System_printf ("Error Core %d : Inserting memory region %d error code : %d\n", coreNum, memInfo.memRegion, result);
      return -1;
  }
  else
  {
      System_printf ("Core %d : Memory region %d inserted\n", coreNum, result);
  }

  /* Writeback the descriptor pool.  Writeback all data cache.
    * Wait until operation is complete. */
  Cache_wb (monolithicDesc,
                     SIZE_MONOLITHIC_DESC * NUM_MONOLITHIC_DESC,
                     Cache_Type_ALLD, TRUE);

  return 0;
}
