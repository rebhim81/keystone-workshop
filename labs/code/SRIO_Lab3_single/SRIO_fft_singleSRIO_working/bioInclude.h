/**
 *   @file  bioInclude.h
 *
 *  Contains all the common information to all the source code for
 *  the bio exqample
 *
 *  \par
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

#ifndef   __BIO_INCLUDE
#define   __BIO_INCLUDE


#include <math.h>
#include <stdlib.h>
#include <time.h>
#include <stdio.h>

#include <xdc/std.h>
#include <string.h>
#include <xdc/runtime/IHeap.h>
#include <xdc/runtime/System.h>
#include <xdc/runtime/Memory.h> 
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/heaps/HeapBuf.h>
#include <ti/sysbios/heaps/HeapMem.h>
#include <ti/sysbios/family/c64p/Hwi.h>
#include <ti/sysbios/family/c64p/EventCombiner.h> 

/* IPC includes */ 
#include <ti/ipc/GateMP.h>
#include <ti/ipc/Ipc.h>
#include <ti/ipc/ListMP.h>
#include <ti/ipc/SharedRegion.h>
#include <ti/ipc/MultiProc.h>
#include <xdc/cfg/global.h>

/* SRIO Driver Include File. */
#include <ti/drv/srio/srio_drv.h>

/* CPPI/QMSS Include Files. */
#include <ti/drv/cppi/cppi_drv.h>
#include <ti/drv/qmss/qmss_drv.h>


/* CSL Include Files */
#include <ti/csl/csl_chip.h>
#include <ti/csl/csl_cacheAux.h>
#include <ti/csl/csl_psc.h>
#include <ti/csl/csl_pscAux.h>
#include <ti/csl/csl_semAux.h>
#include "DSP_fft16x16.h"

/**********************************************************************
 ************************** LOCAL Definitions *************************
 **********************************************************************/

#define NUM_HOST_DESC               64   // 512    //   32
#define SIZE_HOST_DESC              48
#define SRIO_MAX_MTU				2048   //  1040 //1024   //  512

/* Defines the core number responsible for system initialization. */
#define   CORE_SYS_INIT    0
#define   FREE             0
#define   BUSY             1
#define   TOKEN            0xaa
#define   READY            0xcc
#define   NACK             0xbb
#define   END_PROCESSING   0xFA
#define   RANDOM_BASE      20
#define   RANDOM_INTERVAL  50
#define   NUMBER_PRINTS    5
#define   PROCESSING_BASE         30
#define   PROCESSING_INTERVAL     200
#define   DATA_ARRIVE_BASE        5
#define   DATA_ARRIVE_INTERVAL    2
////////////////////////////////////////////////////
///       user core states
#define   LAST_PROCESS             1
#define   LAST_REQUEST             2
//////////////////////////////////////////////////
#define   ITERATIONS               100////0   ///
#define   OUTPUT_SIZE               20 ////
#define   SHOW_SIZE                 20
#define   RESULT_SHIFT              10
#define   ADD_VALUE               (1<< (RESULT_SHIFT+1))
#define   BUFFER_SIZE             100
#define   SEND_SIZE               272

/* Number of cores for which the test is being executed. */
#define NUM_CORES                      8
#define NUM_CORES_MAX                 8

/* SRIO Application Hardware Semaphore. */
#define SRIO_APP_HW_SEM             5

/**********************************************************************
 ************************** Global Variables **************************
 **********************************************************************/

/* Memory used for the descriptors. */

extern Uint8   host_region[NUM_HOST_DESC * SIZE_HOST_DESC];

extern Qmss_InitCfg   qmssInitConfig;

/* Global Varialble which keeps track of the core number executing the
 * application. */
extern UInt32          coreNum ;


extern volatile Uint32     isSRIOInitialized  ;


extern volatile Uint32     isSRIOSocketsCreated ;

extern volatile Uint32     runFlag ;

extern long    buffer9[2*OUTPUT_SIZE] ;
extern long *pp1  ;
extern int bufferCounter   ;
extern long   t1, t2   ;



extern UInt32              gHiPriAccumList[32];

/* These are the device identifiers used used in the TEST Application */
extern const uint32_t DEVICE_ID1_16BIT   ;
extern const uint32_t DEVICE_ID1_8BIT    ;
extern const uint32_t DEVICE_ID2_16BIT   ;
extern const uint32_t DEVICE_ID2_8BIT    ;
extern const uint32_t DEVICE_ID3_16BIT   ;
extern const uint32_t DEVICE_ID3_8BIT   ;
extern const uint32_t DEVICE_ID4_16BIT   ;
extern const uint32_t DEVICE_ID4_8BIT   ;

///    Added by Ran katzur

extern const uint32_t DEVICE_ID5_16BIT   ;
extern const uint32_t DEVICE_ID5_8BIT     ;
extern const uint32_t DEVICE_ID6_16BIT   ;
extern const uint32_t DEVICE_ID6_8BIT    ;
extern const uint32_t DEVICE_ID7_16BIT   ;
extern const uint32_t DEVICE_ID7_8BIT    ;
extern const uint32_t DEVICE_ID8_16BIT   ;
extern const uint32_t DEVICE_ID8_8BIT    ;

extern Srio_SockHandle         srioSocket;
extern Srio_SockBindAddrInfo   bindInfo;
extern short *                  txData_int;
extern UInt8 *                  txData_char;
extern Srio_SockAddrInfo       to;
extern Srio_SockAddrInfo       from;
extern UInt16                  idx;
extern Int32                   num_bytes;
extern UInt8*                  ptr_rxDataPayload;
extern Int32                   sendToCore;

extern Srio_DrvBuffer          hDrvBuffer;
extern UInt32                  allocatedLen;
extern UInt16                  coreDeviceID[NUM_CORES_MAX];
extern Int32                   messageSource   ;
extern int                     coreLoop    ;
extern Int32                   randomValue   ;
extern volatile Int32          x_v   ;
extern int firstSendStart      ;
extern Int32                   iterationCounter   ;
extern UInt32                  myBuffer[BUFFER_SIZE]   ;
extern int                     messageValue, xx   ;
extern int    myStatus, processingCounter, recvFromCore ;

extern   short    twiddle_128[256]  ;
extern  short     twiddle_256[512]  ;
extern  short     twiddle_512[1024]  ;
extern  short     twiddle_1024[2048]  ;
extern  short     twiddle_64[128]  ;
extern  short     twiddle_32[64]  ;







/**********************************************************************
 ************************* Extern Definitions *************************
 **********************************************************************/

extern UInt32 malloc_counter;
extern UInt32 free_counter;

extern int32_t SrioDevice_init (void);
extern Void* Osal_srioDataBufferMalloc(UInt32 numBytes);

/* QMSS device specific configuration */
//extern Qmss_GlobalConfigParams  qmssGblCfgParams;

/* CPPI device specific configuration */
//extern Cppi_GlobalConfigParams  cppiGblCfgParams;

/* OSAL Data Buffer Memory Initialization. */
extern int32_t Osal_dataBufferInitMemory(uint32_t dataBufferSize);

extern  long  x_min   ;
extern  unsigned int x1  ;

extern    Srio_DrvConfig  cfg;
extern     Srio_DrvHandle  hSrioDriver;
extern    UInt8           isAllocated;


/**********************************************************************
 ************************ SRIO TEST FUNCTIONS *************************
 **********************************************************************/

extern  void ranDelay(Int32 N);



extern UInt16  coreNumberFromId(UInt16 coreDeviceID[], UInt16 value);

extern UInt16  IdFromCore(UInt16 coreDeviceID[], UInt16 value);



extern void disableCaches();


extern void         	printMessages(int coreNum, unsigned char *ptr);
extern void             printStartEnd(short buffer[], int N)  ;



extern UInt32 l2_global_address (Uint32 addr);

extern Void myStartupFxn (Void) ;



extern  Int32 enable_srio (void);
extern  Int32 system_init (Void);

extern volatile int coreZeroFlag   ;
extern int initializeMain(int coreNum);
extern Int32 slaveTaskInitialization(Srio_DrvHandle hSrioDrv, short **) ;

/*   The  requestProcessingData function signals to the system that there is enough data to processa  */
/*   The return value is zero if the data can be sent to processing and -1 if error    */
/*   The argument is a pointer to the data in the global adress mode   (in real life - DDR) */

extern int requestProcessingData(short * data1, int N)   ;
extern  Int32 masterTaskInitialization(Srio_DrvHandle hSrioDrv)  ;



/*  The freeState function tells the system that the core finished its processing and is ready  */
/*  for new processing.  The return address is not defined yet.  The argument is a pointer to a */
/*   structure that contains the information about the next processing, including a      */
/*   call back function pointer  that can be supplied to the control                     */
/*   and a pointer to the processed data. The return address is either zero if there is no   */
/*   error or an error code    */


extern int freeState(void *newProcessingObject)  ;

/*  The callBackSlave function starts a processing session on the salve from a controller    */
/*   The implementation can initiating a SWI or anything else                                */
/*  The return address is not defined yet.  The argument is a pointer to a */
/*   structure that contains the information about the next processing, including */
/*   a pointer to the processed data. The return address is either zero if there is no   */
/*   error or an error code    */


extern int callBackSlave(void *newProcessingObject)  ;

extern  Int32 test_multicoreMaster (Srio_DrvHandle hSrioDrv);

extern Int32 test_multicoreUser (Srio_DrvHandle hSrioDrv);

extern  Void multicoreTestTask(UArg arg0, UArg arg1);
/*****************************************************************************
 *   The FFT part
 */

#define  MAX_FFT_POWER    9  //  10
#define  MIN_FFT_POWER    5
#define  MAX_FFT_SIZE     (1 << MAX_FFT_POWER)
#define  FREE_BUFFER       0
#define  USE_BUFFER        1
#define   MAX_SIM          4

#define  NUM_FFT_BUFFER   16
#define  CONVERT_TO_SHORT    (float) 32767.0


typedef  struct {
	int   status   ;
	short * pointer ;
}bufferControl_t   ;


extern bufferControl_t controlVector[NUM_FFT_BUFFER];

extern void initializeBufferControl(short* in1, bufferControl_t control[], int numberBUffers) ;
extern short * getNextfreeBuffer(bufferControl_t control[]);
extern void freeBuffer(short * in, bufferControl_t control[]);

extern short fftBuffer[MAX_FFT_SIZE*2*NUM_FFT_BUFFER]  ;
extern short * prepareData(short *buffer, int *N ) ;
extern void generateShortInput (int numberOfElements, int numSinWaves, short *p_out) ;
extern seperateRealImg (int N, short *y, short *Y_real , short * y_imag) ;


extern void  DSP_fft16x16(const short *restrict, int, short *restrict, short *restrict);

extern int gen_twiddle_fft16x16 ( short *w,int n);


extern   short  z_short[8][2*MAX_FFT_SIZE] ;
extern   short  xxx[8][2*MAX_FFT_SIZE] ;

extern   short  y_short[8][MAX_FFT_SIZE] ;


extern   short  x_short[8][MAX_FFT_SIZE] ;


#endif
