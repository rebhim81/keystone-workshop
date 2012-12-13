/**
 *   @file  mastertask.c
 *
 *  
 *  \par   CSL_SRIO_Open
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
#include "application.h"
/**********************************************************************
 ************************** LOCAL Definitions *************************
 **********************************************************************/



#if  1


 Int32 test_multicoreMaster (Srio_DrvHandle hSrioDrv)
{   //    1
	 int  firstSendStart   =   0 ;
	 int tokenFlag   ;

	 char parameter1   ;int size  ;


	  if ( masterTaskInitialization(hSrioDrv)  < 0 )
		  return  (-1) ;
      iterationCounter = ITERATIONS   ;
 //     while (iterationCounter--)   //   always run
      iterationCounter = 0  ;
      while (1)   //   always run
      {


    	  generateApplicationData(fftInputBuffer[0], &parameter1)  ;
    	  size = 1 << parameter1    ;



        while (num_bytes = Srio_sockRecv (srioSocket, (Srio_DrvBuffer*)&ptr_rxDataPayload, &from) != 0 )
        {

 // Ran Katzur  	       System_printf("Producer discard messages %x from core  %x\n",  messageValue, from.type11.id);
           Srio_freeRxDrvBuffer(srioSocket, (Srio_DrvBuffer)ptr_rxDataPayload);
        }
         for (coreLoop=firstSendStart; coreLoop<NUM_CORES; coreLoop++)
         {
                sendToCore   =  CORE_SYS_INIT + coreLoop ;
                txData[0] = coreLoop * 17 ;
                txData[1] = parameter1    ;
                to.type11.id       = coreDeviceID[sendToCore];
              if (Srio_sockSend (srioSocket, hDrvBuffer, SEND_SIZE, &to) < 0)
              {
                 System_printf ("Error: SRIO Socket send failed\n");
                 return -1;
              }
//Ran katzur                 System_printf("Producer send Message %d to Slave %d \n",iterationCounter,  coreLoop);
               ranDelay(3)  ;
         }    //   send messages to all cores
///////////////see if you got an answer and print it

         tokenFlag = 0  ;
         while (tokenFlag == 0)  //  wait to get READY from someone
          {
                  while ((num_bytes = Srio_sockRecv (srioSocket, (Srio_DrvBuffer*)&ptr_rxDataPayload, &from))==0)
                  {
                  }
                                //    A message was received
                  if (num_bytes > 0)
                  {
                         messageSource = from.type11.id ;


 //            	     System_printf("has  message from core %d with address %x \n",
 //            	    		 coreNumberFromId(coreDeviceID,from.type11.id), *ppp);
            	     if ( ptr_rxDataPayload[0]  == READY)  tokenFlag = 1   ;
                    Srio_freeRxDrvBuffer(srioSocket, (Srio_DrvBuffer)ptr_rxDataPayload);
                  }
          }



            sendToCore   = coreNumberFromId(coreDeviceID, messageSource);

//          System_printf("TOKEN  to core %d    \n", sendToCore	 );
                                       /* Send the data out. */
            to.type11.id       = coreDeviceID[sendToCore];

            memcpy(txData, fftInputBuffer[0], 4* size)   ;

 //           fillDataShort (txData, SRIO_MAX_MTU ) ;
            txData[1] = txData[0]  ;
             txData[0] = TOKEN ;


           if (size < 128) size = 128 ; // segmentation socket must have more than 256 bytes
           if (Srio_sockSend (srioSocket, hDrvBuffer, 4 * size, &to) < 0)
           {
                      System_printf ("Error: SRIO Socket send failed\n");
                      return -1;
           }
 //          printStartEndShort(txData, SEND_SIZE)   ;








           iterationCounter++   ;


     }





    /* Close the sockets */
    Srio_sockClose (srioSocket);

    /* We are done with the test. */
//    System_printf ("Debug(Core %d): Multicore Test Passed\n", coreNum);
    return 0;
}


#endif
