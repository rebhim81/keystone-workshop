/*
 * initialization.c
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
#include <initialization.h>
#include <device_srio_loopback.h>
#include <multicoreLoopback_osal.h>
#include <gen_twiddle_fft16x16.h>

/* Bios Files */
#include <xdc/runtime/System.h>
#include <ti/sysbios/family/c64p/Hwi.h>
#include <ti/sysbios/family/c64p/EventCombiner.h>

/* CSL Include Files */
#include <ti/csl/csl_chip.h>
#include <ti/csl/csl_cacheAux.h>
#include <ti/csl/csl_psc.h>
#include <ti/csl/csl_pscAux.h>
#include <ti/csl/csl_semAux.h>


#include <ti/drv/qmss/qmss_firmware.h>


/*
 * Extern Variables
 */
extern uint8_t coreNum;
extern Qmss_GlobalConfigParams  qmssGblCfgParams;
extern Cppi_GlobalConfigParams  cppiGblCfgParams;
extern Srio_DrvConfig cfg;
extern uint8_t isAllocated;

/*
 * File Level Globals
 */
Srio_DrvHandle hSrioDriver;
uint16_t coreDeviceID[NUM_CORES_MAX];

Srio_SockHandle			srioSocket;
Srio_SockBindAddrInfo	bindInfo;
int16_t*				txData_int;
uint8_t*				txData_char;
Srio_SockAddrInfo		to;
Srio_SockAddrInfo		from;
uint16_t				idx;
int32_t					sendToCore;

Srio_DrvBuffer          hDrvBuffer;
uint32_t				allocatedLen;

int32_t 				firstSendStart;
int32_t 				recvFromCore;




/*
 * Global Variables that keep track of the core number executing the
 * application.
 */

#pragma DATA_ALIGN (isSRIOInitialized, 128)
#pragma DATA_SECTION (isSRIOInitialized, ".srioSharedMem");
volatile uint32_t isSRIOInitialized    = 0;

#pragma DATA_ALIGN (isSRIOSocketsCreated, 128)
#pragma DATA_SECTION (isSRIOSocketsCreated, ".srioSharedMem");
volatile uint32_t isSRIOSocketsCreated = 0;

#pragma DATA_ALIGN (isSRIOSocketsCreated, 128)
#pragma DATA_SECTION (isSRIOSocketsCreated, ".srioSharedMem");
volatile uint32_t runFlag = 1;

/* Memory used for the accumulator list. */
#pragma DATA_ALIGN (gHiPriAccumList, 16)
uint32_t gHiPriAccumList[32];

/* Twiddle Tables */
#pragma	DATA_ALIGN	(twiddle_32, 128)
#pragma	DATA_SECTION	(twiddle_32, ".twiddleFactor");
int16_t	twiddle_32[64];

#pragma DATA_ALIGN	(twiddle_64, 128)
#pragma DATA_SECTION	(twiddle_64, ".twiddleFactor");
int16_t twiddle_64[128];

#pragma DATA_ALIGN	(twiddle_128, 128)
#pragma DATA_SECTION	(twiddle_128, ".twiddleFactor");
int16_t twiddle_128[256];

#pragma DATA_ALIGN	(twiddle_256, 128)
#pragma DATA_SECTION	(twiddle_256, ".twiddleFactor");
int16_t twiddle_256[512];

#pragma DATA_ALIGN	(twiddle_512, 128)
#pragma DATA_SECTION	(twiddle_512, ".twiddleFactor");
int16_t twiddle_512[1024];

#pragma DATA_ALIGN	(twiddle_1024, 128)
#pragma DATA_SECTION	(twiddle_1024, ".twiddleFactor");
int16_t twiddle_1024[2048];


/**********************************************************************
 ************************** Global Variables **************************
 **********************************************************************/

/* Memory used for the descriptors. */
#pragma DATA_ALIGN (host_region, 16)
uint8_t   host_region[NUM_HOST_DESC * SIZE_HOST_DESC];

Qmss_InitCfg   qmssInitConfig;

Int32 enable_srio (void)
{
#ifndef SIMULATOR_SUPPORT
    /* SRIO power do is turned OFF by default. It needs to be turned on before doing any
     * SRIO device register access. This not required for the simulator. */

    /* Set SRIO Power do to ON */
    CSL_PSC_enablePowerDomain (CSL_PSC_PD_SRIO);

    /* Enable the clocks too for SRIO */
    CSL_PSC_setModuleNextState (CSL_PSC_LPSC_SRIO, PSC_MODSTATE_ENABLE);

    /* Start the state transition */
    CSL_PSC_startStateTransition (CSL_PSC_PD_SRIO);

    /* Wait until the state transition process is completed. */
    while (!CSL_PSC_isStateTransitionDone (CSL_PSC_PD_SRIO));

    /* Return SRIO PSC status */
    if ((CSL_PSC_getPowerDomainState(CSL_PSC_PD_SRIO) == PSC_PDSTATE_ON) &&
        (CSL_PSC_getModuleState (CSL_PSC_LPSC_SRIO) == PSC_MODSTATE_ENABLE))
    {
        /* SRIO ON. Ready for use */            
        return 0;
    }
    else
    {
        /* SRIO Power on failed. Return error */            
        return -1;            
    }
#else
    /* PSC is not supported on simulator. Return success always */
    return 0;
#endif
}

/**
 *  @b Description
 *  @n  
 *      System Initialization Code. This is added here only for illustrative
 *      purposes and needs to be invoked once during initialization at 
 *      system startup.
 *
 *  @retval
 *      Success     -   0
 *  @retval
 *      Error       -   <0
 */
  Int32 system_init (Void)
{
    Int32               result;
    Qmss_MemRegInfo     memRegInfo;

    /* Initialize the QMSS Configuration block. */
    memset (&qmssInitConfig, 0, sizeof (Qmss_InitCfg));

    /* Set up the linking RAM. Use the internal Linking RAM. 
     * LLD will configure the internal linking RAM address and maximum internal linking RAM size if 
     * a value of zero is specified. Linking RAM1 is not used */
    qmssInitConfig.linkingRAM0Base = 0;
    qmssInitConfig.linkingRAM0Size = 0;
    qmssInitConfig.linkingRAM1Base = 0;
    qmssInitConfig.maxDescNum      = NUM_HOST_DESC;   

#ifdef xdc_target__bigEndian
    qmssInitConfig.pdspFirmware[0].pdspId   = Qmss_PdspId_PDSP1;
    qmssInitConfig.pdspFirmware[0].firmware = &acc48_be;
    qmssInitConfig.pdspFirmware[0].size     = sizeof (acc48_be);
#else
    qmssInitConfig.pdspFirmware[0].pdspId   = Qmss_PdspId_PDSP1;
    qmssInitConfig.pdspFirmware[0].firmware = &acc48_le;
    qmssInitConfig.pdspFirmware[0].size     = sizeof (acc48_le);
#endif    

    /* Initialize Queue Manager Sub System */
    result = Qmss_init (&qmssInitConfig, &qmssGblCfgParams);
    if (result != QMSS_SOK)
    {
#if (VERBOSE_LEVEL > 1)
        System_printf ("Error initializing Queue Manager SubSystem error code : %d\n", result);
#endif
        return -1;
    }

    /* Start the QMSS. */
    if (Qmss_start() != QMSS_SOK)
    {
#if (VERBOSE_LEVEL > 1)
        System_printf ("Error: Unable to start the QMSS\n");
#endif
        return -1;
    }

    /* Memory Region 0 Configuration */
    memRegInfo.descBase         = (UInt32 *)l2_global_address((UInt32)host_region);
    memRegInfo.descSize         = SIZE_HOST_DESC;
    memRegInfo.descNum          = NUM_HOST_DESC;
    memRegInfo.manageDescFlag   = Qmss_ManageDesc_MANAGE_DESCRIPTOR;
    memRegInfo.memRegion        = Qmss_MemRegion_MEMORY_REGION_NOT_SPECIFIED;    

    /* Initialize and inset the memory region. */
    result = Qmss_insertMemoryRegion (&memRegInfo); 
    if (result < QMSS_SOK)
    {
#if (VERBOSE_LEVEL > 1)
        System_printf ("Error inserting memory region: %d\n", result);
#endif
        return -1;
    }

    /* Initialize CPPI CPDMA */
    result = Cppi_init (&cppiGblCfgParams);
    if (result != CPPI_SOK)
    {
#if (VERBOSE_LEVEL > 1)
        System_printf ("Error initializing Queue Manager SubSystem error code : %d\n", result);
#endif
        return -1;
    }

    /* CPPI and Queue Manager are initialized. */
    return 0;
}










  Int32 masterTaskInitialization(Srio_DrvHandle hSrioDrv)

  {   //    1


 //     System_printf ("**********************************************\n");
 //     System_printf ("******** Multicore Testing (Core %d) *********\n", coreNum);
 //     System_printf ("**********************************************\n");

      /* Open SRIO Socket in non- Blocking Mode */
      srioSocket =  Srio_sockOpen (hSrioDrv, Srio_SocketType_TYPE11, FALSE);
      if (srioSocket == NULL)
      {
#if (VERBOSE_LEVEL > 1)
          System_printf ("Error: Unable to open socket1\n");
#endif
          return -1;
      }
      /* Initialize the core Device IDs: Each core has a seperate device ID. */
      coreDeviceID[0] = DEVICE_ID1_16BIT;
      coreDeviceID[1] = DEVICE_ID2_16BIT;
      coreDeviceID[2] = DEVICE_ID3_16BIT;
      coreDeviceID[3] = DEVICE_ID4_16BIT;
      coreDeviceID[4] = DEVICE_ID5_16BIT;
      coreDeviceID[5] = DEVICE_ID6_16BIT;
      coreDeviceID[6] = DEVICE_ID7_16BIT;
      coreDeviceID[7] = DEVICE_ID8_16BIT;

      /* Initialize the core bindings; we use the same mailbox & letter identifiers. */
      bindInfo.type11.tt       = TRUE;
      bindInfo.type11.id       = coreDeviceID[coreNum];
      bindInfo.type11.letter   = 2;
      bindInfo.type11.mbox     =  3;
      bindInfo.type11.segMap   = 0x1  ;   //    0x0;

      /* Bind the SRIO socket */
      if (Srio_sockBind (srioSocket, &bindInfo) < 0)
      {
#if (VERBOSE_LEVEL > 1)
          System_printf ("Error: socket1 bind failed\n");
#endif
          return -1;
      }

      /* Get a transmit buffer from the SRIO Driver. */
      hDrvBuffer = Srio_allocTransmitBuffer(hSrioDrv, &txData_char, &allocatedLen);
      txData_int = (short *)txData_char   ;
 //     System_printf("transmit buffer handler %x txData_int %x allocatedLen %d \n", hDrvBuffer,
//      		txData_int,allocatedLen );

      if (allocatedLen == 0)
       {
#if (VERBOSE_LEVEL > 1)
           System_printf ("core %d Error: Producer Memory Allocation failed.\n", coreNum);
#endif
           return -1;
       }

      if (hDrvBuffer == NULL)
      {
#if (VERBOSE_LEVEL > 1)
          System_printf ("Error: Producer Memory Allocation failed.\n");
#endif
          return -1;
      }

      /* Create the transmit data payload. */
      for (idx = 0; idx < 10; idx++)
          txData_int[idx] = 0xff;

      /* The global variable is a shared resource which is being accessed from multiple cores.
       * So here we need to protect it and ensure that there is only 1 core which is accessing
       * it at a time. We use a Hardware Semaphore to protect this. */

      while ((CSL_semAcquireDirect (SRIO_APP_HW_SEM)) == 0);

      /* Invalidate the cache and make sure you get the latest from the memory. */
      CACHE_invL1d ((void *) &isSRIOSocketsCreated, 128, CACHE_WAIT);

      /* The core has created the sockets:*/
      isSRIOSocketsCreated++;

      /* The SRIO Socket has been created. Writeback the contents to the cache. */
      CACHE_wbL1d ((void *) &isSRIOSocketsCreated, 128, CACHE_WAIT);

      CACHE_invL1d ((void *) &runFlag, 128, CACHE_WAIT);
      runFlag = 1 ;
       CACHE_wbL1d ((void *) &runFlag, 128, CACHE_WAIT);

      /* Release the hardware semaphore. */
      CSL_semReleaseSemaphore (SRIO_APP_HW_SEM);

      /* We can proceed with the data transmission & reception tests only after all the
       * cores have created and bound their SRIO sockets. This is a simple counter running
       * in shared memory which allows us to SYNC up the socket creation. Wait till all the
       * cores have created the sockets */
      while (isSRIOSocketsCreated != NUM_CORES)
          CACHE_invL1d ((void *) &isSRIOSocketsCreated, 128, CACHE_WAIT);
#if (VERBOSE_LEVEL > 2)
      System_printf ("------------------------------------------------------\n");


      System_printf (" This is Core 0, at this point ALL cores finished create and bind \n");
#endif
  //////////////////////////////////////////////////////////////////////////////////////////////////
        to.type11.tt       = TRUE;
        to.type11.letter   = 2;
        to.type11.mbox     = 3;
        firstSendStart =  1 ;//  change in srio_drv.h    3  ;
        return  (0)    ;
  }




  Int32 slaveTaskInitialization(Srio_DrvHandle hSrioDrv, short ** P)
  {

 //     System_printf ("******** Multicore Testing (Core %d) *********\n", coreNum);

      *P = NULL   ;
//			int32_t xx;
//			int32_t myStatus;
      /* Open SRIO Socket in Blocking Mode */
      srioSocket =  Srio_sockOpen (hSrioDrv, Srio_SocketType_TYPE11, TRUE);
      if (srioSocket == NULL)
      {
#if (VERBOSE_LEVEL > 1)
          System_printf ("Error: Unable to open socket1\n");
#endif
          return -1;
      }

      /* Initialize the core Device IDs: Each core has a seperate device ID. */
      coreDeviceID[0] = DEVICE_ID1_16BIT;
      coreDeviceID[1] = DEVICE_ID2_16BIT;
      coreDeviceID[2] = DEVICE_ID3_16BIT;
      coreDeviceID[3] = DEVICE_ID4_16BIT;
      coreDeviceID[4] = DEVICE_ID5_16BIT;
      coreDeviceID[5] = DEVICE_ID6_16BIT;
      coreDeviceID[6] = DEVICE_ID7_16BIT;
      coreDeviceID[7] = DEVICE_ID8_16BIT;

      /* Initialize the core bindings; we use the same mailbox & letter identifiers. */
      bindInfo.type11.tt       = TRUE;
      bindInfo.type11.id       = coreDeviceID[coreNum];
      bindInfo.type11.letter   = 2;
      bindInfo.type11.mbox     =  3;
      bindInfo.type11.segMap   = 0x1;

      /* Bind the SRIO socket */
      if (Srio_sockBind (srioSocket, &bindInfo) < 0)
      {
#if (VERBOSE_LEVEL > 1)
          System_printf ("Error: socket1 bind failed\n");
#endif
          return -1;
      }

      /* Get a transmit buffer from the SRIO Driver. */
      hDrvBuffer = Srio_allocTransmitBuffer(hSrioDrv, &txData_char, &allocatedLen);
      txData_int = (short *)txData_char ;
 //     System_printf("transmit buffer handler %x txData_int %x allocatedLen %d \n", hDrvBuffer,
 //     		txData_int,allocatedLen );

      if (allocatedLen == 0)
       {
#if (VERBOSE_LEVEL > 1)
           System_printf ("core %d Error: Producer Memory Allocation failed.\n", coreNum);
#endif
           return -1;
       }

      if (hDrvBuffer == NULL){
#if (VERBOSE_LEVEL > 1)
          System_printf ("Error: Producer Memory Allocation failed.\n");
#endif
          return -1;
      }

      /* Create the transmit data payload. */
      for (idx = 0; idx < 10; idx++)
          txData_int[idx] = 0xff;
       *P = txData_int   ;
      /* The global variable is a shared resource which is being accessed from multiple cores.
       * So here we need to protect it and ensure that there is only 1 core which is accessing
       * it at a time. We use a Hardware Semaphore to protect this. */

      while ((CSL_semAcquireDirect (SRIO_APP_HW_SEM)) == 0);

      /* Invalidate the cache and make sure you get the latest from the memory. */
      CACHE_invL1d ((void *) &isSRIOSocketsCreated, 128, CACHE_WAIT);

      /* The core has created the sockets:*/
      isSRIOSocketsCreated++;

      /* The SRIO Socket has been created. Writeback the contents to the cache. */
      CACHE_wbL1d ((void *) &isSRIOSocketsCreated, 128, CACHE_WAIT);

      /* Release the hardware semaphore. */
      CSL_semReleaseSemaphore (SRIO_APP_HW_SEM);

      /* We can proceed with the data transmission & reception tests only after all the
       * cores have created and bound their SRIO sockets. This is a simple counter running
       * in shared memory which allows us to SYNC up the socket creation. Wait till all the
       * cores have created the sockets */
      while (isSRIOSocketsCreated != NUM_CORES)
          CACHE_invL1d ((void *) &isSRIOSocketsCreated, 128, CACHE_WAIT);

   //   System_printf ("------------------------------------------------------\n");


          /* Any other core besides the starting core will initally wait for data to arrive */
        sendToCore   = CORE_SYS_INIT;
        recvFromCore = CORE_SYS_INIT;

        to.type11.tt       = TRUE;
        to.type11.id       = coreDeviceID[sendToCore];
        to.type11.letter   = 2;
        to.type11.mbox     =  3;
//        myStatus =        LAST_PROCESS   ;

//        xx = coreNum * 17   ;
        CACHE_invL1d ((void *) &runFlag, 128, CACHE_WAIT);

        return (0)   ;
  }





  int initializeMain(int coreNum)
  {

	    /* Initialize the system only if the core was configured to do so. */
	    if (coreNum == CORE_SYS_INIT)
	    {
#if (VERBOSE_LEVEL > 1)
	        System_printf ("Debug(Core %d): System Initialization for CPPI & QMSS\n", coreNum);
#endif

	        /* System Initialization */
	        if (system_init() < 0)
	            return (-1);

	        /* Power on SRIO peripheral before using it */
	        if (enable_srio () < 0)
	        {
#if (VERBOSE_LEVEL > 1)
	            System_printf ("Error: SRIO PSC Initialization Failed\n");
#endif
	            return(-1);
	        }

		    /* Device Specific SRIO Initializations: This should always be called before
	         * initializing the SRIO Driver. */
	    	if (SrioDevice_init() < 0)
	        	return(-1);

	        /* Initialize the SRIO Driver */
	        if (Srio_init () < 0)
	        {
#if (VERBOSE_LEVEL > 1)
	            System_printf ("Error: SRIO Driver Initialization Failed\n");
#endif
	            return(-1);
	        }


	 //    Prepare the twiddle factor vectors in the DDR



	            gen_twiddle_fft16x16 (  twiddle_32 , 32);
	 	        CACHE_wbL1d ((void *) twiddle_32, 64, CACHE_WAIT);
	            gen_twiddle_fft16x16 (  twiddle_64 , 64);
	 	        CACHE_wbL1d ((void *) twiddle_64, 128, CACHE_WAIT);
	            gen_twiddle_fft16x16 (  twiddle_128 , 128);
	 	        CACHE_wbL1d ((void *) twiddle_128, 256, CACHE_WAIT);
	            gen_twiddle_fft16x16 (  twiddle_256 , 256);
	 	        CACHE_wbL1d ((void *) twiddle_256, 512, CACHE_WAIT);
	            gen_twiddle_fft16x16 (  twiddle_512 , 512);
	 	        CACHE_wbL1d ((void *) twiddle_512, 1024, CACHE_WAIT);
	            gen_twiddle_fft16x16 (  twiddle_1024 , 1024);
	 	        CACHE_wbL1d ((void *) twiddle_1024, 2048, CACHE_WAIT);
	    	/* SRIO Driver is operational at this time. */
//	        System_printf ("Debug(Core %d): SRIO Driver has been initialized\n", coreNum);

	        /* Write to the SHARED memory location at this point in time. The other cores cannot execute
	         * till the SRIO Driver is up and running. */
	        isSRIOInitialized = 1;

	        /* The SRIO IP block has been initialized. We need to writeback the cache here because it will
	         * ensure that the rest of the cores which are waiting for SRIO to be initialized would now be
	         * woken up. */
	        CACHE_wbL1d ((void *) &isSRIOInitialized, 128, CACHE_WAIT);
	    }
	    else
	    {
	        /* TODO: Testing this.... */
//	        System_printf ("Debug(Core %d): Waiting for SRIO to be initialized.\n", coreNum);

	        /* All other cores loop around forever till the SRIO is up and running.
	         * We need to invalidate the cache so that we always read this from the memory. */
	        while (isSRIOInitialized == 0)
	            CACHE_invL1d ((void *) &isSRIOInitialized, 128, CACHE_WAIT);

	        /* Start the QMSS. */
	        if (Qmss_start() != QMSS_SOK)
	        {
#if (VERBOSE_LEVEL > 1)
	            System_printf ("Error: Unable to start the QMSS\n");
#endif
	            return (-1) ;
	        }

//	        System_printf ("Debug(Core %d): SRIO can now be used.\n", coreNum);
	    }
  return (0);
  }


  int32_t threadInitialization()
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
  #if (VERBOSE_LEVEL > 1)
  			System_printf ("Error: Unable to open the SRIO Receive Completion Queue\n");
  #endif
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

  //    System_printf("driver result  %x  \n",hSrioDriver );
      if (hSrioDriver == NULL)
      {
  #if (VERBOSE_LEVEL > 1)
          System_printf ("Error: SRIO Driver Start Failed\n");
  #endif
          return (-1) ;
      }

      /* SRIO Driver is operational at this time. */
  //    System_printf ("Debug: SRIO Driver has been started Instance Handle 0x%p\n", hSrioDriver);

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

void disableCaches()
{
	CACHE_setL2Size(CACHE_0KCACHE)  ;
	CACHE_setL1DSize(CACHE_L1_0KCACHE)  ;
}

uint32_t l2_global_address (uint32_t addr)
{
	uint32_t corenum;

	/* Get the core number. */
	corenum = CSL_chipReadReg(CSL_CHIP_DNUM);

	/* Compute the global address. */
	return (addr + (0x10000000 + (corenum*0x1000000)));
}

void ranDelay(int32_t N)
{
#ifndef DISABLE_DELAY
	int  i,j,k    ;
	for (k=0; k<N; k++)
	{
		for (j=0; j<1000; j++)
		{
			for (i=0; i < 2000; i++)
				asm ("    NOP (9)")  ;
		}
	}
#endif
}
