/*
 * srio_fft.c
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
#include <masterTask.h>
#include <slaveTask.h>
#include <initialization.h>


/* Bios Files */
#include <xdc/runtime/System.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/BIOS.h>

/* CSL Include Files */
#include <ti/csl/csl_chip.h>
#include <ti/csl/csl_cacheAux.h>

/* IPC includes */
#include <ti/ipc/MultiProc.h>
#include <ti/ipc/Ipc.h>

/*
 * System Trace Lib
 */
#include <system_trace.h>

/*
 * File Level Globals
 */
uint8_t coreNum = 0xFF;
Srio_DrvConfig cfg;
//Srio_DrvHandle hSrioDriver;
uint8_t isAllocated;

Void myStartupFxn (Void)
{
	MultiProc_setLocalId (CSL_chipReadReg (CSL_CHIP_DNUM));
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
#if (VERBOSE_LEVEL > 1)
            System_printf ("Error: Unable to start the QMSS\n");
#endif
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
	Task_Handle		coreTask;
	Task_Handle		procTask;
    Task_Params     taskParams;

    /* Get the core number. */
	coreNum = CSL_chipReadReg (CSL_CHIP_DNUM);

//    System_printf ("****************************************************\n");
//    System_printf ("******  Multicore Loopback Testing (Core %d) *******\n", coreNum);
//    System_printf ("****************************************************\n");

    /* Initialize the heap in shared memory. Using IPC module to do that */ 
    Ipc_start();
    CACHE_wbAllL1d(CACHE_WAIT);
    disableCaches()   ;
    initializeMain(coreNum) ;
    /* Initialize the system only if the core was configured to do so. */

    /* Initialize System Trace */
    initializeSTM();


    /* Create the Multicore Test Task. */
    Task_Params_init(&taskParams);

    if (coreNum == CORE_SYS_INIT){
    	coreTask = Task_create(masterCoreTask, &taskParams, NULL);
    	if (coreTask == NULL){
    		System_printf("Error Creating Core Task\n");
    	}
    	procTask = Task_create(masterProcTask, &taskParams, NULL);
    }else{
    	procTask = Task_create(slaveTask, &taskParams, NULL);
    }

	if (procTask == NULL){
		System_printf("Error Creating Core Task\n");
	}


    /* Start the BIOS */
    BIOS_start();
}
