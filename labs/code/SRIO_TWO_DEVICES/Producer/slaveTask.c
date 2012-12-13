/**
 *   @file  mastertask.c
 *
 *  
 *  \par  acc32_le
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

/**********************************************************************
 ************************** LOCAL Definitions *************************
 **********************************************************************/






 Int32 test_multicoreUser (Srio_DrvHandle hSrioDrv)
{   //    1


/*     The algorithm here is different
 *     The thread sends one message and goes to sleep
 */
       if ( slaveTaskInitialization( hSrioDrv) < 0 )
    	   return (-1)  ;


#if  0
       while (messageValue != END_PROCESSING )
       {



          num_bytes = Srio_sockRecv (srioSocket, (Srio_DrvBuffer*)&ptr_rxDataPayload, &from);

          if (num_bytes > 0)
          {  //  3    num_bytes



            messageValue = ptr_rxDataPayload[0] ;
    	     System_printf("core %d recieve message %x\n", coreNum, messageValue);
            Srio_freeRxDrvBuffer(srioSocket, (Srio_DrvBuffer)ptr_rxDataPayload);
            //   if messageValue is a request,  send a knowledgement
            //   if messageValue is TOKEN  -  start processing
            //   else - print I do not understand
                sendToCore = 0  ;
                to.type11.id       = coreDeviceID[sendToCore];
                txData[0] =  0xa + coreNum ;
  //              txData_int[1] = (int) processingBuffer ;
                System_printf(" core %d sends back message  %x \n",coreNum , txData[0])  ;
                   /* Send the data out from the producer core to the consumer core. */
                 if (Srio_sockSend (srioSocket, hDrvBuffer, SEND_SIZE , &to) < 0)
                 {
                       System_printf ("Error: SRIO Socket send failed\n");
                       return -1;
                 }
          }  //  2   coreNum
       }


#endif


 //   System_printf(" code  %d  DONE   runFlag = %d \n", coreNum, runFlag);
    /* Close the sockets */
    Srio_sockClose (srioSocket);
 
    /* We are done with the test. */
//    System_printf ("Debug(Core %d): Multicore Test Passed\n", coreNum);
    return (0);
}


