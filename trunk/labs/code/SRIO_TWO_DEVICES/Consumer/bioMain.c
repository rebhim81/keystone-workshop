/**
 *   @file  bioMain.c  Qmss_init
 *
 *   @brief   
 *      This is an example application which showcases master to multiple slaves 
 *      model using SRIO type 11 messages 
 *      The program can be easily modified for any other master slave communication
 *      model
 *
 *
 *
 *
 *
 *  \par  \
 *  NOTE:
 *      (C) Copyright 2009 Texas Instruments, Inc.
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
 *  beef
 *  \par
*/

#include "bioInclude.h"


int threadInitialization()
{
 
    
    /* Initialize the OSAL Data Buffer */
    if (Osal_dataBufferInitMemory(SRIO_MAX_MTU) < 0)
    	return (-1) ;
 
    /* Initialize the SRIO Driver Configuration. */
    memset ((Void *)&cfg, 0, sizeof(Srio_DrvConfig));

    /* Setup the SRIO Driver Managed Configuration. */
    cfg.bAppManagedConfig                   = FALSE;

    /* Driver Managed: Receive Configuration */
    cfg.u.drvManagedCfg.bIsRxCfgValid             = 1;
    cfg.u.drvManagedCfg.rxCfg.rxMemRegion         = Qmss_MemRegion_MEMORY_REGION0;
    cfg.u.drvManagedCfg.rxCfg.numRxBuffers        =  4  ;
    cfg.u.drvManagedCfg.rxCfg.rxMTU               = SRIO_MAX_MTU;

    /* Accumulator Configuration. */ 
    {
	    int32_t coreToQueueSelector[NUM_CORES];

        /* This is the table which maps the core to a specific receive queue. */
	    {
	    	int  ii   ;
	    	for (ii=0; ii < NUM_CORES ; ii++)
	    	{
	    		coreToQueueSelector[ii] = 704 + ii ;
	    	}
	    }


	    /* Since we are programming the accumulator we want this queue to be a HIGH PRIORITY Queue */
	    cfg.u.drvManagedCfg.rxCfg.rxCompletionQueue = Qmss_queueOpen (Qmss_QueueType_HIGH_PRIORITY_QUEUE, 
                                                                         coreToQueueSelector[coreNum], 
                                                                         &isAllocated);
		if (cfg.u.drvManagedCfg.rxCfg.rxCompletionQueue < 0)
		{
			System_printf ("Error: Unable to open the SRIO Receive Completion Queue\n");
			return (-1) ;
		}

		/* Accumulator Configuration is VALID. */
		cfg.u.drvManagedCfg.rxCfg.bIsAccumlatorCfgValid = 1;	

		/* Accumulator Configuration. */      
	    cfg.u.drvManagedCfg.rxCfg.accCfg.channel             = coreNum;
	    cfg.u.drvManagedCfg.rxCfg.accCfg.command             = Qmss_AccCmd_ENABLE_CHANNEL;
	    cfg.u.drvManagedCfg.rxCfg.accCfg.queueEnMask         = 0;
	    cfg.u.drvManagedCfg.rxCfg.accCfg.queMgrIndex         = coreToQueueSelector[coreNum];
	    cfg.u.drvManagedCfg.rxCfg.accCfg.maxPageEntries      = 2;
	    cfg.u.drvManagedCfg.rxCfg.accCfg.timerLoadCount      = 0;
	    cfg.u.drvManagedCfg.rxCfg.accCfg.interruptPacingMode = Qmss_AccPacingMode_LAST_INTERRUPT;
	    cfg.u.drvManagedCfg.rxCfg.accCfg.listEntrySize       = Qmss_AccEntrySize_REG_D;
	    cfg.u.drvManagedCfg.rxCfg.accCfg.listCountMode       = Qmss_AccCountMode_ENTRY_COUNT;
	    cfg.u.drvManagedCfg.rxCfg.accCfg.multiQueueMode      = Qmss_AccQueueMode_SINGLE_QUEUE;

        /* Initialize the accumulator list memory */
        memset ((Void *)&gHiPriAccumList[0], 0, sizeof(gHiPriAccumList));
        cfg.u.drvManagedCfg.rxCfg.accCfg.listAddress = l2_global_address((UInt32)&gHiPriAccumList[0]);
    }

    /* Driver Managed: Transmit Configuration */
    cfg.u.drvManagedCfg.bIsTxCfgValid             = 1;
    cfg.u.drvManagedCfg.txCfg.txMemRegion         = Qmss_MemRegion_MEMORY_REGION0;
    cfg.u.drvManagedCfg.txCfg.numTxBuffers        =   4;
    cfg.u.drvManagedCfg.txCfg.txMTU               = SRIO_MAX_MTU;

    /* Start the SRIO Driver */
    hSrioDriver = Srio_start(&cfg);
    if (hSrioDriver == NULL)
    {
        System_printf ("Error: SRIO Driver Start Failed\n");
        return (-1) ;
    }

    /* SRIO Driver is operational at this time. */
 //   System_printf ("Debug: SRIO Driver has been started Instance Handle 0x%p\n", hSrioDriver);

    /* Hook up the SRIO interrupts with the core. */
    EventCombiner_dispatchPlug (48, (EventCombiner_FuncPtr)Srio_rxCompletionIsr, (UArg)hSrioDriver, TRUE);
	EventCombiner_enableEvent(48);

    /* Map the event id to hardware interrupt 8. */
    Hwi_eventMap(8, 48);

    /* Enable interrupt 8. */
    Hwi_enableInterrupt(8);

    /* SRIO Driver is operational at this time. */
//    System_printf ("Debug: SRIO Driver ISR has been registered\n");
    return (0)  ;
}
/**
 *  @b Description
 *  @n  
 *      This is the Multicore Test task
 *
 *  @retval
 *      Not Applicable.
 */
 Void multicoreTestTask(UArg arg0, UArg arg1)
{
    if (threadInitialization() < 0 )
	     return    ;
    /* Run the Multicore Test */
 //   if (coreNum == CORE_SYS_INIT)
 //   {
//       if (test_multicoreMaster (hSrioDriver) < 0)
//       {
//           System_printf ("Error: Multicore Tests failed\n");
//           return;
//       }
//    }
//    else
    {
       if (test_multicoreUser (hSrioDriver) < 0)
       {
           System_printf ("Error: Multicore Tests failed\n");
           return;
       }
    }

 
 
    System_printf ("Debug(Core %d): Multicore Example successful.\n", coreNum);    
    exit(1)   ;
    return;
}

/*    The util_init() function initializes the media in which messages
*     are moving.  The first case is the SRIO,  but it can be replaced 
*     by any other messaging mechnism                                */




/*    The startSlaveUtil() function initializes the Slave media in which messages
*     are moving.  The first case is the SRIO,  but it can be replaced 
*     by any other messaging mechnism                                */

int startSlaveUtil()
{
       if (Qmss_start() != QMSS_SOK)
        {
            System_printf ("Error: Unable to start the QMSS\n");
            return  (-1);
        }
        return (0)  ;
}

/**
 *  @b Description
 *  @n  
 *      Entry point for the example
 *
 *  @retval
 *      Not Applicable.
 */
Void main(Void)
{
    Task_Params     taskParams;

    /* Get the core number. */
	coreNum = CSL_chipReadReg (CSL_CHIP_DNUM);
#ifdef  DEBUG1
    System_printf ("****************************************************\n");
    System_printf ("******  Multicore Loopback Testing (Core %d) *******\n", coreNum);
    System_printf ("****************************************************\n");
#endif
    /* Initialize the heap in shared memory. Using IPC module to do that */ 
    Ipc_start();
    CACHE_wbAllL1d(CACHE_WAIT);
    disableCaches()   ;
    initializeMain(coreNum) ;
    /* Initialize the system only if the core was configured to do so. */



    /* Create the Multicore Test Task. */
    Task_Params_init(&taskParams);
    Task_create(multicoreTestTask, &taskParams, NULL);

    /* Start the BIOS */
    BIOS_start();
}
