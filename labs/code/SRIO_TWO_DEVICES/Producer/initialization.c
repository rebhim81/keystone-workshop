/**
 *   @file  initialization.c
 *
 *
 *
 *  \par
 *  NOTE:
 *      (C) Copyright 2009 Texas Instruments, Inc.
 * 
 *  Redistribution and use in source and binary forms, with or without 
 *  modification, are permitted provided that the following conditions 
 *  are met:
 *
 *
 *
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
#include <ti/drv/qmss/qmss_firmware.h>

#include <ti\drv\qmss\device\qmss_device.c>
#include <ti\drv\cppi\device\cppi_device.c>



/**********************************************************************
 ************************** Global Variables **************************
 **********************************************************************/

/* Memory used for the descriptors. */
#pragma DATA_ALIGN (host_region, 16)
Uint8   host_region[NUM_HOST_DESC * SIZE_HOST_DESC/2];
#pragma DATA_ALIGN (host_region1, 16)
Uint8   host_region1[NUM_HOST_DESC * SIZE_HOST_DESC/2];
Qmss_InitCfg   qmssInitConfig;

/* Global Varialble which keeps track of the core number executing the
 * application. */
UInt32          coreNum = 0xFFFF;

#pragma DATA_ALIGN   (isSRIOInitialized, 128)
#pragma DATA_SECTION (isSRIOInitialized, ".srioSharedMem");
volatile Uint32     isSRIOInitialized    = 0;

#pragma DATA_ALIGN   (isSRIOSocketsCreated, 128)
#pragma DATA_SECTION (isSRIOSocketsCreated, ".srioSharedMem");
volatile Uint32     isSRIOSocketsCreated = 0;
#pragma DATA_ALIGN   (isSRIOSocketsCreated, 128)
#pragma DATA_SECTION (isSRIOSocketsCreated, ".srioSharedMem");
volatile Uint32     runFlag  = 1;
#pragma DATA_ALIGN   (buffer9, 128)
long    buffer9[2*OUTPUT_SIZE] ;
long *pp1 = buffer9  ;
int bufferCounter   =0  ;
long   t1, t2   ;





/* Memory used for the accumulator list. */
#pragma DATA_ALIGN (gHiPriAccumList, 16)
UInt32              gHiPriAccumList[32];





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
    result = Qmss_init (&qmssInitConfig, &qmssGblCfgParams[0]);

    if (result != QMSS_SOK)
    {
        System_printf ("Error initializing Queue Manager SubSystem error code : %d\n", result);
        return -1;
    }

    /* Start the QMSS. */
    if (Qmss_start() != QMSS_SOK)
    {
        System_printf ("Error: Unable to start the QMSS\n");
        return -1;
    }

    /* Memory Region 0 Configuration */
    memRegInfo.descBase         = (UInt32 *)l2_global_address((UInt32)host_region);
    memRegInfo.descSize         = SIZE_HOST_DESC;
    memRegInfo.descNum          = NUM_HOST_DESC /2 ;
    memRegInfo.manageDescFlag   = Qmss_ManageDesc_MANAGE_DESCRIPTOR;
    memRegInfo.memRegion        = 0   ; //Qmss_MemRegion_MEMORY_REGION_NOT_SPECIFIED;
    memRegInfo.startIndex       = 0   ;

    /* Initialize and inset the memory region. */
    result = Qmss_insertMemoryRegion (&memRegInfo); 
    if (result < QMSS_SOK)
    {
        System_printf ("Error inserting memory region: %d\n", result);
        return -1;
    }


    /* Memory Region 1 Configuration */
    memRegInfo.descBase         = (UInt32 *)l2_global_address((UInt32)host_region1);
    memRegInfo.descSize         = SIZE_HOST_DESC;
    memRegInfo.descNum          = NUM_HOST_DESC /2 ;
    memRegInfo.manageDescFlag   = Qmss_ManageDesc_MANAGE_DESCRIPTOR;
    memRegInfo.memRegion        = 1   ; //Qmss_MemRegion_MEMORY_REGION_NOT_SPECIFIED;
    memRegInfo.startIndex       = NUM_HOST_DESC /2    ;

    /* Initialize and inset the memory region. */
    result = Qmss_insertMemoryRegion (&memRegInfo);
    if (result < QMSS_SOK)
    {
        System_printf ("Error inserting memory region: %d\n", result);
        return -1;
    }


    /* Initialize CPPI CPDMA */
    result = Cppi_init (&cppiGblCfgParams[0]);

    if (result != CPPI_SOK)
    {
        System_printf ("Error initializing Queue Manager SubSystem error code : %d\n", result);
        return -1;
    }

    /* CPPI and Queue Manager are initialized. */
//  Ran Katzur  7    System_printf ("Debug: Queue Manager and CPPI are initialized.\n");
//  Ran Katzur  8    System_printf ("Debug: Host Region 0x%x\n", host_region);
    return 0;
}

/**
 *  @b Description
 *  @n  
 *      The function tests multicore
 *
 *  @param[in]  hSrioDrv
 *      Handle to the SRIO driver 
 *
 *  @retval
 *      Success     - 0
 *  @retval
 *      Error       - <0
 */








#if 1
  Int32 masterTaskInitialization(Srio_DrvHandle hSrioDrv)

  {   //    1

#ifdef  DEBUG1
      System_printf ("**********************************************\n");
      System_printf ("******** Multicore Testing (Core %d) *********\n", coreNum);
      System_printf ("**********************************************\n");
#endif
      /* Open SRIO Socket in non- Blocking Mode */
      srioSocket =  Srio_sockOpen (hSrioDrv, Srio_SocketType_TYPE11, FALSE);
      if (srioSocket == NULL)
      {
          System_printf ("Error: Unable to open socket1\n");
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
          System_printf ("Error: socket1 bind failed\n");
          return -1;
      }

      /* Get a transmit buffer from the SRIO Driver. */
      hDrvBuffer = Srio_allocTransmitBuffer(hSrioDrv, &txData, &allocatedLen);

  //    System_printf("transmit buffer handler %x txData %x allocatedLen %d \n", hDrvBuffer,
  //    		txData,allocatedLen );

      if (allocatedLen == 0)
       {
           System_printf ("core %d Error: Producer Memory Allocation failed.\n", coreNum);
           return -1;
       }

      if (hDrvBuffer == NULL)
      {
          System_printf ("Error: Producer Memory Allocation failed.\n");
          return -1;
      }

      /* Create the transmit data payload. */
      for (idx = 0; idx < 100; idx++)
          txData[idx] = 0xff;

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

 //     System_printf ("------------------------------------------------------\n");


      System_printf (" This is Core 0, at this point ALL cores finished create and bind \n");
  //////////////////////////////////////////////////////////////////////////////////////////////////
        to.type11.tt       = TRUE;
        to.type11.letter   = 2;
        to.type11.mbox     = 3;
        firstSendStart =  1 ;//  change in srio_drv.h    3  ;
        return  (0)    ;
  }


#endif


  Int32 slaveTaskInitialization(Srio_DrvHandle hSrioDrv)
  {

 //     System_printf ("******** Multicore Testing (Core %d) *********\n", coreNum);


      /* Open SRIO Socket in Blocking Mode */
      srioSocket =  Srio_sockOpen (hSrioDrv, Srio_SocketType_TYPE11, TRUE);
      if (srioSocket == NULL)
      {
          System_printf ("Error: Unable to open socket1\n");
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
          System_printf ("Error: socket1 bind failed\n");
          return -1;
      }

      /* Get a transmit buffer from the SRIO Driver. */
      hDrvBuffer = Srio_allocTransmitBuffer(hSrioDrv, &txData, &allocatedLen);

  //    System_printf("transmit buffer handler %x txData %x allocatedLen %d \n", hDrvBuffer,
  //    		txData,allocatedLen );

      if (allocatedLen == 0)
       {
           System_printf ("core %d Error: Producer Memory Allocation failed.\n", coreNum);
           return -1;
       }

      if (hDrvBuffer == NULL)
      {
          System_printf ("Error: Producer Memory Allocation failed.\n");
          return -1;
      }

      /* Create the transmit data payload. */
      for (idx = 0; idx < 100; idx++)
          txData[idx] = 0xff;

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
        myStatus =        LAST_PROCESS   ;

        xx = coreNum * 17   ;
        CACHE_invL1d ((void *) &runFlag, 128, CACHE_WAIT);

        return (0)   ;
  }





  int initializeMain(int coreNum)
  {

	    /* Initialize the system only if the core was configured to do so. */
	    if (coreNum == CORE_SYS_INIT)
	    {
//	        System_printf ("Debug(Core %d): System Initialization for CPPI & QMSS\n", coreNum);

	        /* System Initialization */
	        if (system_init() < 0)
	            return (-1);

	        /* Power on SRIO peripheral before using it */
	        if (enable_srio () < 0)
	        {
	            System_printf ("Error: SRIO PSC Initialization Failed\n");
	            return(-1);
	        }

		    /* Device Specific SRIO Initializations: This should always be called before
	         * initializing the SRIO Driver. */
	    	if (SrioDevice_init() < 0)
	        	return(-1);

	        /* Initialize the SRIO Driver */
	        if (Srio_init () < 0)
	        {
	            System_printf ("Error: SRIO Driver Initialization Failed\n");
	            return(-1);
	        }

	    	/* SRIO Driver is operational at this time. */
	        System_printf ("Debug(Core %d): SRIO Driver has been initialized\n", coreNum);

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
	            System_printf ("Error: Unable to start the QMSS\n");
	            return (-1) ;
	        }

//	        System_printf ("Debug(Core %d): SRIO can now be used.\n", coreNum);
	    }
  return (0);
  }






