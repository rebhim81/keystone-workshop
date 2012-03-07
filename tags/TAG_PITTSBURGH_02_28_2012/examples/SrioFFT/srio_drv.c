/*
 * srio_drv.c
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

/**************************************************************************
 *************************** Include Files ********************************
 **************************************************************************/

/* SRIO Types and OSAL defintions: These files can be overriden by customers
 * to point to their copies. Because of this the files have not been explicitly 
 * specified to include the driver path.*/
#include <stdint.h>
#include  <stdio.h>

/* SRIO Driver Includes. */
#include <ti/drv/srio/include/listlib.h>
#include <ti/drv/srio/srio_drv.h>
#include <ti/drv/srio/srio_types.h>
#include <ti/drv/srio/srio_osal.h>

/* CSL SRIO Functional Layer */
#include <ti/csl/csl_srio.h>
#include <ti/csl/csl_srioAux.h>
#include <ti/csl/csl_srioAuxPhyLayer.h>

/* CPPI/QMSS Include */
#include <ti/drv/qmss/qmss_drv.h>
#include <ti/drv/cppi/cppi_drv.h>
#include <ti/drv/cppi/cppi_desc.h>
#include <ti/csl/csl_pscAux.h>

/**********************************************************************
 ************************** Local Definitions *************************
 **********************************************************************/

#define   NUMBER_BRR    8   //   Ran Katzur      4
/**
 * @brief   Maximum number of Doorbell registers.
 */
#define MAX_DOORBELL_REG           8  //   Ran Katzur 4

/**
 * @brief   Maximum number of Doorbell bits per register.
 */
#define MAX_DOORBELL_BIT            16

/**********************************************************************
 ************************** Local Structures **************************
 **********************************************************************/

/**
 * @brief 
 *  Enumeration which describes the state of the SRIO Socket
 *
 * @details
 *  The SRIO Sockets in the system can be in any of the following states
 *  as described in the enumeration.
 */
typedef enum Srio_SocketState
{
    /**
     * @brief   Socket is free and available and can be used.
     */
    Srio_SocketState_FREE         = 0x0,

    /**
     * @brief   Socket has been allocated but has no local binding information
     * associated with it.
     */
    Srio_SocketState_ALLOCATED    = 0x1,

    /**
     * @brief   Socket has been allocated and is associated with local binding
     * information.
     */
    Srio_SocketState_BOUND        = 0x2   
}Srio_SocketState;

/**
 * @brief 
 *  The structure describes the SRIO Socket Data payload structure 
 *
 * @details
 *  This structure is associated with each SRIO socket and is used to store
 *  a list of all pending packets which have been received on the socket
 *  but have still not been picked up by the application.
 */
typedef struct Srio_SockDataPacket
{
    /**
     * @brief   Links to the chain of packets
     */
    Srio_ListNode       links;

    /**
     * @brief   Pointer to the data buffer for Normal sockets and pointer
     * to the BD for RAW sockets.
     */
    Srio_DrvBuffer      drvBuffer;

    /**
     * @brief   Number of bytes of data available in the data buffer.
     */
    uint32_t            numBytes;

    /**
     * @brief   Socket address information which indicates source of the rxed packet
     */    
    Srio_SockAddrInfo   addrInfo;
}Srio_SockDataPacket;

struct Srio_Socket;

/** 
 * @brief 
 *  The structure describes the SRIO Driver Instance
 *
 * @details
 *  The SRIO driver can have multiple instances each of which is bound to 
 *  a specific SRIO channel. 
 */
typedef struct Srio_DriverInst
{
    /**
     * @brief   SRIO Receive channel handle returned by the CPPI library.
     */
    Cppi_ChHnd          rxChHnd;

    /**
     * @brief   SRIO Transmit channel handle returned by the CPPI library.
     */
    Cppi_ChHnd          txChHnd;

    /**
     * @brief   CPPI Flow Handle.
     */    
    Cppi_FlowHnd        flowHandle;

    /**
     * @brief   SRIO Receive Queue. The BD's in this queue are used to receive
     * data packets 
     */
    Qmss_QueueHnd       rxQueue;

    /**
     * @brief   SRIO Receive Completion Queue. Once a packet has been received it
     * is removed from the above queue and placed into the completion queue waiting
     * for the driver to service it.
     */
    Qmss_QueueHnd       rxCompletionQueue;

    /**
     * @brief   SRIO Transmit Queue. The queue is the well defined SRIO Tx queue and
     * is used to send data packets.
     */
    Qmss_QueueHnd       txQueue;

    /**
     * @brief   SRIO Transmit Free Queue. The queue contains a list of buffer descriptors 
     * which are available and can be used by the driver for transmission.
     */
    Qmss_QueueHnd       txFreeQueue;

    /**
     * @brief   This is the Socket to Doorbell Database which maps DIO sockets to a specific
     * Doorbell register and Doorbell bit. 
     */
    void*               socketDoorbellDatabase[MAX_DOORBELL_REG][MAX_DOORBELL_BIT];

    /**
     * @brief   The flag which indicates if the Accumulator is programmed or not. 
     * Accumulator is only programmed if the receive completion queue passed to the
     * configuration is NULL.
     */
    uint16_t            isAccumulatorProgrammed;

    /**
     * @brief   The accumulator channel which has been programmed.
     */
    uint32_t            accChannel;    

    /**
     * @brief   Receive Ping Completion Accumulator List address. 
     */
    uint32_t            rxPingAddress;

    /**
     * @brief   Receive Pong Completion Accumulator List address. 
     */
    uint32_t            rxPongAddress;

    /**
     * @brief   Receive Pong Completion Accumulator List address. 
     */
    uint16_t            rxUsePingList;

    /**
     * @brief   Normal Socket: Receive Descriptor Size.
     */
    int32_t             rxDescSize;

    /**
     * @brief   Normal Socket: Transmit Descriptor Size.
     */
    int32_t             txDescSize;

    /**
     * @brief   Each Driver instance has a list of sockets which can be opened on them.
     */
    void*               socketList;    

    /**
     * @brief   Counter which keeps track of the number of interrupts.
     */
    uint32_t            accInterrupts;

    /**
     * @brief   SRIO Driver configuration block passed by the driver user during 
     * initialization
     */
    Srio_DrvConfig      cfg;
}Srio_DriverInst;

/**
 * @brief 
 *  The structure describes the SRIO SOCKET 
 *
 * @details
 *  The structure is used to store all the SRIO socket information which is required
 *  to send and receive data.
 */
typedef struct Srio_Socket
{
    /**
     * @brief   Links to other sockets.
     */
    Srio_ListNode           links;

    /**
     * @brief   Socket Valid
     */
    Srio_SocketState        state;

    /**
     * @brief   Socket type.
     */
    Srio_SocketType         type;

    /**
     * @brief   The flag indicates if the socket is operating in RAW or NORMAL Mode.
     */
    uint16_t                isRawSocket;

    /**
     * @brief   Pointer to the SRIO driver instance.
     */
    Srio_DriverInst*        ptr_SrioDrvInst;

    /**
     * @brief   Semaphore Handle associated with the socket.
     */
    void*                   semHandle;

    /**
     * @brief   Sockets can be made blocking or non-blocking.
     * By default all sockets are blocking unless modified through the socket options API
     */
    uint16_t                blockingSocket;

    /**
     * @brief   Socket Index which points to the corresponding entry in the GLOBAL SRIO 
     * MCB which had been allocated for this purpose.
     */
    uint16_t                sockIndex;

    /**
     * @brief   Map Index. Each SOCKET is mapped to an entry in the MAP table.
     * which maps incomming message to the appropriate CPPI queue.
     */
    uint16_t                mapIndex;

    /**
     * @brief   Local binding information.
     */
    Srio_SockAddrInfo       addrInfo;

    /**
     * @brief   This is the max number of pending packets which can be enqueued in the 
     * SRIO socket. Packets received after this limit is exceeded are dropped.
     */
    uint16_t                maxPendingPackets;

    /**
     * @brief   LSU Transfer Information: This is applicable only for DIO sockets.
     */
    SRIO_LSU_TRANSFER       lsuTransfer;

    /**
     * @brief   Doorbell LSU Transfer Information: This is applicable only for DIO sockets.
     */
    SRIO_LSU_TRANSFER       doorbellTransfer;

    /**
     * @brief   DIO Transaction Identifier: Applicable only for DIO sockets. A value of
     * 0xFF implies that there is no outstanding transaction pending.
     */
    uint8_t                 dioTransId;

    /**
     * @brief   DIO Context Bit: Applicable only for DIO sockets. A value of 0xFF implies
     * that there is no outstanding transaction pending.
     */
    uint8_t                 dioContext;

    /**
     * @brief   DIO Completion Code: This is the completion code for the last pending
     * transaction.
     */
    uint8_t                 dioCompletionCode;

    /**
     * @brief   List of all pending data packets available on the socket.
     */
    Srio_SockDataPacket*    pendingPkts;

    /**
     * @brief   List of all free data packets available on the socket. This list is 
     * initialized when is a socket is created with all the memory upfront. Packets
     * received are dequeued from this list and placed into the pendingPkts list
     * above.
     */
    Srio_SockDataPacket*    freePkts;

    /**
     * @brief   Raw Receive Driver Buffer cleanup API to be called if driver buffers
     * associated with the socket need to be cleaned up. This can happen in the case
     * of errors or if the sockets are getting closed and there is still some pending
     * data available in the socket lists.
     */
    void                    (*rawRxFreeDrvBuffer)(Srio_DrvBuffer hDrvBuffer);

    /**
     * @brief   Completion Code Error Counter. This counter is incremented to keep
     * track of error counters detected in the buffer descriptor when a packet is
     * received.
     */
    uint32_t                ccRxErrorCounter;

    /**
     * @brief   Receive buffer overrun counters are valid only for normal mode 
     * sockets and are incremented because the OSAL layer was unable to allocate
     * memory for the received packet.
     */
    uint32_t                rxBufferOverrun;

    /**
     * @brief   Each socket is programmed to keep only a "configurable" number of
     * packets. This error counter indicates that the socket receive buffers were
     * overrun and there was no place to receive the new packet.
     */
    uint32_t                sockRxOverrun;
}Srio_Socket;

/** 
 * @brief 
 *  The structure describes the SRIO Driver MCB
 *
 * @details
 *  The structure is used to store the SRIO driver information which is shared 
 *  across multiple instances. 
 */
typedef struct Srio_DriverMCB
{
    /**
     * @brief   SRIO Handle for the CSL Functional layer.
     */        
    CSL_SrioHandle      hSrio;

    /**
     * @brief   SRIO CPPI handle returned by the CPPI library  
     */
    Cppi_Handle         cppiHnd;

    /**
     * @brief   SRIO Socket Database: Each socket is associated with a unique 
     * mapping entry and these entries are shared across all cores.
     */
    uint8_t            sockStatusTable[NUM_SRIO_TYPE9_TYPE11_SOCKETS + NUM_DIO_SOCKETS];

    /**
     * @brief  Type9 and Type11 share the same queue id mapping register. This 
     * variable keeps track of the status of the mapping and which queue 
     * map entry is free and available.
     */
    uint8_t            mappingStatusType9Type11[NUM_SRIO_TYPE9_TYPE11_SOCKETS];

    /**
     * @brief  For DIO sockets each socket is mapped to an LSU. This keeps track
     * of the status of the LSU.
     */
    uint8_t            lsuStatus[NUM_DIO_SOCKETS];

    /**
     * @brief  Padding to align this on the 128 byte cache line boundary.
     */
    uint8_t             pad[104];
}Srio_DriverMCB;

/**********************************************************************
 ************************* GLOBAL Variables ***************************
 **********************************************************************/

/** @brief Global Variable which maintains SRIO Driver persistent info. This is shared
 * across multiple cores and we need to align this on the L2 Cache Line Boundary. */
#pragma DATA_ALIGN   (gSRIODriverMCB, 128)
#pragma DATA_SECTION (gSRIODriverMCB, ".srioSharedMem");
Srio_DriverMCB        gSRIODriverMCB;

/** @brief Global Variable which describes the SRIO Driver Version Information */
const char gSrioDriverVersionStr[] = SRIO_DRV_VERSION_STR ":" __DATE__  ":" __TIME__;

/**********************************************************************
 *********************** SRIO DRIVER FUNCTIONS ************************
 **********************************************************************/

/** @addtogroup SRIO_LLD_FUNCTION
 @{ */

/**
 *  @b Description
 *  @n  
 *      The function is called to process a received buffer descriptor. 
 *      This is internally called by the ISR and can also be called by
 *      applications if they have processed the interrupt by themselves 
 *      and have been able to retreive a SRIO buffer descriptor which they
 *      wish to process.
 *
 *  @param[in]  ptr_srioDrvInst
 *      Driver Instance 
 *  @param[in]  ptrDesc
 *      Received Buffer descriptor to be processed.
 *
 *  @retval
 *      Not Applicable
 */
void Srio_processReceivedBD(Srio_DriverInst* ptr_srioDrvInst, Cppi_Desc* ptrDesc)
{
    uint32_t*               srioInfo;
    uint32_t                psLen;
    uint16_t                dstID;
    uint16_t                srcID;
    uint8_t                 mbox;
    uint8_t                 letter;
    uint8_t                 cos;
    uint8_t                 ccType11;
    uint8_t                 ccType9;
    uint8_t                 pri;
    uint8_t                 ttType11;
    uint8_t                 ttType9;
    uint16_t                streamId;
    uint8_t*                ptr_replinishBuffer;
    Srio_Socket*            ptrSocket;
    Srio_SockDataPacket*    ptr_sockData;
    Qmss_QueueHnd           returnQueueHnd;
    void*                   criticalSectionInfo;
    uint16_t                bDropPacket = 1;

    /* OSAL Hook: Before accessing the descriptor invalidate the descriptor if required. */
    Srio_osalBeginDescriptorAccess ((Srio_DrvHandle)ptr_srioDrvInst, (void *)ptrDesc, ptr_srioDrvInst->rxDescSize);

    /* Get the protocol specific data */
    Cppi_getPSData (Cppi_getDescType(ptrDesc), Cppi_PSLoc_PS_IN_DESC, ptrDesc, (uint8_t**)&srioInfo, &psLen);

    /* Get the Source ID, Destination Id, Mailbox, Letter, CoS and Stream Id information 
     * from the protocol specific information. At this time we dont know if this is a type9
     * or type11 message; so we extract all the information. 
     *  - Destination & Source Id are at the same location for both Type9 and Type11. */
    CSL_SRIO_ExtractType11PSInfo(srioInfo, &dstID, &srcID, &mbox, &letter, &ttType11, &pri, &ccType11);
    CSL_SRIO_ExtractType9PSInfo (srioInfo, &dstID, &srcID, &cos, &ccType9, &ttType9, &pri, &streamId);

    /* CRITICAL SECTION: Cycle through the list of sockets associated with the driver instance. */
    criticalSectionInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioDrvInst);
    ptrSocket = (Srio_Socket*)Srio_listGetHead((Srio_ListNode**)&ptr_srioDrvInst->socketList);
    Srio_osalExitSingleCoreCriticalSection(ptr_srioDrvInst, criticalSectionInfo);
 
    /* We now need to match this information with a socket (only Type9 & Type11 sockets are handled here) */
    while (ptrSocket != NULL)
    {
        /* Is the socket bound? */
        if (ptrSocket->state != Srio_SocketState_BOUND)
        {
            /* No. We cannot receive data on UNBOUND Sockets; so lets go to the next socket in the list. */
            criticalSectionInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioDrvInst);
            ptrSocket = (Srio_Socket*)Srio_listGetNext ((Srio_ListNode*)ptrSocket);
            Srio_osalExitSingleCoreCriticalSection(ptr_srioDrvInst, criticalSectionInfo);
            continue;
        }

        /* Matching binding information is socket type based. */
        if (ptrSocket->type == Srio_SocketType_TYPE11)
        {
            Srio_Type11AddrInfo* ptr_localAddr11Info;

            /* Get the local binding information of the socket. */
            ptr_localAddr11Info = (Srio_Type11AddrInfo *)&ptrSocket->addrInfo;

            /* YES; match the properties with the local binding. */
            if ((ptr_localAddr11Info->id   != dstID) || (ptr_localAddr11Info->letter != letter) ||
                (ptr_localAddr11Info->mbox != mbox))
            {
                /* No Match has been found; move to the next socket. */
                criticalSectionInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioDrvInst);
                ptrSocket = (Srio_Socket*)Srio_listGetNext ((Srio_ListNode*)ptrSocket);
                Srio_osalExitSingleCoreCriticalSection(ptr_srioDrvInst, criticalSectionInfo);
                continue;
            }

            /* Ensure that the BD had a successful completion code. */
            if (ccType11 != 0)
            {
                /* Error: Completion Code was non-zero increment the error counter */
                ptrSocket->ccRxErrorCounter++;
                break;
            }

            /* CRITICAL SECTION: Get a pointer to the socket pending data packet. If we dont 
             * get an entry then we have exceeded the max limit of pending packets. This packet 
             * needs to be dropped. */
            criticalSectionInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioDrvInst);
            ptr_sockData = (Srio_SockDataPacket *)Srio_listRemove ((Srio_ListNode**)&ptrSocket->freePkts);
            Srio_osalExitSingleCoreCriticalSection(ptr_srioDrvInst, criticalSectionInfo);
            if (ptr_sockData == NULL)
            {
                /* Error: Socket was full and the packet was not received because there was no space. */
                ptrSocket->sockRxOverrun++;
                break;
            }

            /* Populate the source of the received packet. */
            ptr_sockData->addrInfo.type11.id    = srcID;
            ptr_sockData->addrInfo.type11.tt    = ttType11;
            ptr_sockData->addrInfo.type11.letter= letter;
            ptr_sockData->addrInfo.type11.mbox  = mbox;
        }
        else
        {
            Srio_Type9AddrInfo* ptr_localAddr9Info;

            /* Get the local binding information of the socket. */
            ptr_localAddr9Info = (Srio_Type9AddrInfo *)&ptrSocket->addrInfo;

            /* YES; match the properites with the local binding. */
            if ((ptr_localAddr9Info->id != dstID) || (ptr_localAddr9Info->cos != cos) ||
                (ptr_localAddr9Info->streamId != streamId))
            {
                /* No Match has been found; move to the next socket. */
                ptrSocket = (Srio_Socket*)Srio_listGetNext ((Srio_ListNode*)ptrSocket);
                continue;
            }

            /* Ensure that the BD had a successful completion code. */
            if (ccType9 != 0)
            {
                /* Error: Completion Code was non-zero increment the error counter */
                ptrSocket->ccRxErrorCounter++;
                break;
            }

            /* CRITICAL SECTION: Get a pointer to the socket pending data packet. If we dont 
             * get an entry then we have exceeded the max limit of pending packets. This packet 
             * needs to be dropped. */
            criticalSectionInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioDrvInst);
            ptr_sockData = (Srio_SockDataPacket *)Srio_listRemove ((Srio_ListNode**)&ptrSocket->freePkts);
            Srio_osalExitSingleCoreCriticalSection(ptr_srioDrvInst, criticalSectionInfo);
            if (ptr_sockData == NULL)
            {
                /* Error: Socket was full and the packet was not received because there was no space. */
                ptrSocket->sockRxOverrun++;
                break;
            }

            /* Populate the source of the received packet. */
            ptr_sockData->addrInfo.type9.id        = srcID;
            ptr_sockData->addrInfo.type9.tt        = ttType9;
            ptr_sockData->addrInfo.type9.cos       = cos;
            ptr_sockData->addrInfo.type9.streamId  = streamId;
        }

        /* Add this to the socket data queue. */
        criticalSectionInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioDrvInst);
        Srio_listCat ((Srio_ListNode**)&ptrSocket->pendingPkts, (Srio_ListNode**)&ptr_sockData);
        Srio_osalExitSingleCoreCriticalSection(ptr_srioDrvInst, criticalSectionInfo);

        /* Determine if the socket is RAW Type11 */
        if (ptrSocket->isRawSocket == 0)
        {
            /* Normal Mode: We need to put a new buffer into the BD. */
            ptr_replinishBuffer = (uint8_t *)Srio_osalDataBufferMalloc(ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.rxMTU);
            if (ptr_replinishBuffer == NULL)
            {
                /* Error: OOM memory; place the dequeued packet back into the free list. */
                ptrSocket->ccRxErrorCounter++;
                criticalSectionInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioDrvInst);
                Srio_listAdd ((Srio_ListNode**)&ptrSocket->freePkts, (Srio_ListNode*)ptr_sockData);
                Srio_osalExitSingleCoreCriticalSection(ptr_srioDrvInst, criticalSectionInfo);
                break;
            }

            /* Populate the fields. */
            Cppi_getData (Cppi_DescType_HOST, ptrDesc, (uint8_t**)&ptr_sockData->drvBuffer,
                          (uint32_t*)&ptr_sockData->numBytes);

            /* Set the new data buffer into the descriptor. */
            Cppi_setData (Cppi_DescType_HOST, ptrDesc, (uint8_t*)ptr_replinishBuffer,
                          ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.rxMTU);
            Cppi_setOriginalBufInfo (Cppi_DescType_HOST, ptrDesc, (uint8_t*)ptr_replinishBuffer,
                          ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.rxMTU);

            /* OSAL Hook: The descriptor has been modified and we need to write it back to the cache. */
            Srio_osalEndDescriptorAccess ((Srio_DrvHandle)ptr_srioDrvInst, (void *)ptrDesc, 
                                          ptr_srioDrvInst->rxDescSize);

            /* Packet has been successfully processed. */
            bDropPacket = 0;

            /* Get the return queue handle from the descriptor. */
            returnQueueHnd = Qmss_getQueueHandle(Cppi_getReturnQueue(Cppi_DescType_HOST, ptrDesc));

            /* Recycle the descriptor by placing the descriptor back to the receive free queue. */
            Qmss_queuePushDescSize (returnQueueHnd, (uint32_t*)ptrDesc, ptr_srioDrvInst->rxDescSize);
        }
        else
        {
            /* RAW Mode: Store the descriptor information. */ 
            ptr_sockData->drvBuffer = (Srio_DrvBuffer)ptrDesc;
            ptr_sockData->numBytes  = Cppi_getPacketLen(Cppi_getDescType(ptrDesc), ptrDesc);

            /* Packet has been successfully processed. */
            bDropPacket = 0;
        }

        /* Data is available and has been posted on the socket pending list. If the socket is
         * a blocking socket; we need to wake it because data is now available for it to receive. */
        if (ptrSocket->blockingSocket == 1)
            Srio_osalPostSem (ptrSocket->semHandle);

        /* This descriptor has been handled; we are done. */
        break;
    }

    /* Did we break out the loop because of an error? */
    if (bDropPacket == 1)
    {
        /* Error: Did we get a matching socket? */
        if (ptrSocket == NULL)
        {
            /* No Matching socket found; this could happen if SRIO is running in promiscuous mode. 
             * We need to address how this should be handled. */
            while(1);
        }
        else
        {
            /* Matching socket was found; but there was an error while processing the BD: CC Error,
             * Overrun etc. */
            if (ptrSocket->isRawSocket == 1)
            {
                /* RAW Socket: Inform the application to take appropriate action. */
                ptrSocket->rawRxFreeDrvBuffer((Srio_DrvBuffer)ptrDesc);
            }
            else
            {
                /* NORMAL Socket: In this case we recycle the BD back into the receive free queue; the error
                 * has been recorded in the socket stats. Get the return queue handle. */
                returnQueueHnd = Qmss_getQueueHandle(Cppi_getReturnQueue(Cppi_DescType_HOST, ptrDesc));
                Qmss_queuePushDescSize (returnQueueHnd, (uint32_t*)ptrDesc, ptr_srioDrvInst->rxDescSize);
            }
        }
    }
    return;
}

/**
 *  @b Description
 *  @n  
 *      The function is the SRIO ISR handler which is used to handle the data 
 *      management interrupts after a packet has received. SRIO Driver users
 *      need to ensure that this ISR is plugged with their OS Interrupt Management
 *      API.
 *
 *  @param[in]  hSrioDrv
 *      SRIO Driver Handle
 *
 *  @retval
 *      Not Applicable
 */
void Srio_rxCompletionIsr (Srio_DrvHandle hSrioDrv)
{
    Srio_DriverInst*        ptr_srioDrvInst;
    uint32_t*               rxCompletionQueueList;
    uint32_t                count;
    uint32_t                index;
    Cppi_Desc*              ptrDesc;

    /* Get the SRIO Driver Instance */
    ptr_srioDrvInst = (Srio_DriverInst*)hSrioDrv;

    /* Check if accumulator is programmed or not */
    if (ptr_srioDrvInst->isAccumulatorProgrammed == 1)
    {
        /* Increment the number of interrupts which were detected. */
        ptr_srioDrvInst->accInterrupts++;

        /* Interrupt Mode: Get the pointer to the Receive Completion Queue(Use PING or PONG) */
        if (ptr_srioDrvInst->rxUsePingList == 1)
        {
            /* PING: Get the receive completion queue list. Next time we will use PONG */
            rxCompletionQueueList = (uint32_t*)ptr_srioDrvInst->rxPingAddress;
            ptr_srioDrvInst->rxUsePingList = 0;
        }
        else
        {
            /* PONG: Get the receive completion queue list. Next time we will use PING */
            rxCompletionQueueList = (uint32_t*)ptr_srioDrvInst->rxPongAddress;
            ptr_srioDrvInst->rxUsePingList = 1;
        }

        /* Determine the number of pending packets. */
        count = *rxCompletionQueueList;

        /* Run through all the buffer descriptors */
        for (index = 0; index < count; index++)
        {
            /* Read the host descriptor. */
            ptrDesc = (Cppi_Desc*)QMSS_DESC_PTR(rxCompletionQueueList[index + 1]);
            if (ptrDesc == NULL)
            	break;
 
            /* Process the received buffer descriptor. */
            Srio_processReceivedBD (ptr_srioDrvInst, ptrDesc);
 
            /* Clear the accumulator entry. */
            rxCompletionQueueList[index + 1] = 0;
        }

        /* Clear INTD */
        Qmss_ackInterrupt(ptr_srioDrvInst->accChannel, 1);
        Qmss_setEoiVector(Qmss_IntdInterruptType_HIGH, ptr_srioDrvInst->accChannel);
    }
    else
    {
        /* Polled Mode: */
        count = Qmss_getQueueEntryCount(ptr_srioDrvInst->rxCompletionQueue);

        /* Run through all the buffer descriptors */
        for (index = 0; index < count; index++)
        {
            /* Pop the buffer descriptor from the receive completion queue */
            ptrDesc = (Cppi_Desc*)QMSS_DESC_PTR(Qmss_queuePop(ptr_srioDrvInst->rxCompletionQueue));
            if (ptrDesc == NULL)
                break;

            /* Process the received buffer descriptor. */
            Srio_processReceivedBD (ptr_srioDrvInst, ptrDesc);
        }
    }
    return;
}
/**
 *  @b Description
 *  @n  
 *      The function is the SRIO DIO ISR handler which is used to handle the 
 *      DIO Interrupts. SRIO Driver users need to ensure that this ISR is 
 *      plugged with their OS Interrupt Management API. The function expects
 *      the Interrupt Destination information to be passed along to the API 
 *      because the DIO Doorbell interrupt destination mapping is configurable
 *      during SRIO device initialization.
 *
 *  @param[in]  hSrioDrv
 *      SRIO Driver Handle
 *  @param[in]  intDstDoorbell
 *      This is an array of the interrupt destination to which the doorbells are
 *      routed to. 
 *
 *  @retval
 *      Not Applicable
 */
void Srio_dioCompletionIsr 
(
    Srio_DrvHandle  hSrioDrv, 
    uint8_t         intDstDoorbell[]
)
{
    Srio_DriverInst*        ptr_srioDrvInst;
    Srio_Socket*            ptrSocket;
    uint32_t                intStatus;
    uint8_t                 doorbellReg;
    uint8_t                 doorbellBit;
    void*                   criticalSectionInfo;
    Srio_SockDataPacket*    ptr_sockData;

    /* Get the SRIO Driver Instance */
    ptr_srioDrvInst = (Srio_DriverInst*)hSrioDrv;

    /* Cycle through all the doorbells */
    for (doorbellReg = 0; doorbellReg < MAX_DOORBELL_REG; doorbellReg++)
    {
        /* Get the interrupt status register */
        CSL_SRIO_GetInterruptStatusDecode (gSRIODriverMCB.hSrio, intDstDoorbell[doorbellReg], &intStatus);

        /* Are there any interrupts pending? */
        if (intStatus != 0)
        {
            /* YES. Now run through and determine which all bits were pending? */
            for (doorbellBit = 0; doorbellBit < MAX_DOORBELL_BIT; doorbellBit++)
            {
                /* Is the Doorbell bit pending? */
                if (intStatus & (1 << doorbellBit))
                {
                    /* YES. Determine the socket information to which this doorbell is mapped to. */
                    ptrSocket = ptr_srioDrvInst->socketDoorbellDatabase[doorbellReg][doorbellBit];

                    /* Did we get a matching socket? */
                    if (ptrSocket == NULL)
                        continue;

                    /* Dequeue a packet from the Free queue. */
                    criticalSectionInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioDrvInst);
                    ptr_sockData = (Srio_SockDataPacket *)Srio_listRemove ((Srio_ListNode**)&ptrSocket->freePkts);
                    Srio_osalExitSingleCoreCriticalSection(ptr_srioDrvInst, criticalSectionInfo);

                    /* Was there space to receive in the socket to receive the doorbell? */
                    if (ptr_sockData == NULL)
                    {
                        /* Error: Socket was full and the doorbell was not received */
                        ptrSocket->sockRxOverrun++;
                        continue;
                    }

                    /* Store the doorbell information */
                    ptr_sockData->drvBuffer = (Srio_DrvBuffer)(SRIO_SET_DBELL_INFO(doorbellReg, doorbellBit));
                    ptr_sockData->numBytes  = 1;
 
                    /* Add this to the socket data queue. */
                    criticalSectionInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioDrvInst);
                    Srio_listCat ((Srio_ListNode**)&ptrSocket->pendingPkts, (Srio_ListNode**)&ptr_sockData);
                    Srio_osalExitSingleCoreCriticalSection(ptr_srioDrvInst, criticalSectionInfo);

                    /* Data is available and has been posted on the socket pending list. If the socket is
                     * a blocking socket; we need to wake it because data is now available for it to receive. */
                    if (ptrSocket->blockingSocket == 1)
                        Srio_osalPostSem (ptrSocket->semHandle);
                }
            }
            /* Clear the doorbell interrupts. */
            CSL_SRIO_ClearDoorbellPendingInterrupt(gSRIODriverMCB.hSrio, doorbellReg, intStatus);
        }
    }
    return;
}

/**
 *  @b Description
 *  @n  
 *      Utility function used internally to clean the socket data list.
 *
 *  @param[in]  ptr_srioSocket
 *      Pointer to the SRIO socket for which the socket data queues need to be flushed.
 *
 *  @retval
 *      Not Applicable
 */
static void Srio_flushSockData (Srio_Socket* ptr_srioSocket)
{
    Srio_SockDataPacket*   ptr_sockData;

    /* Cycle through the pending list and clean memory. 
     *  - Socket Data on the pending list has a valid data buffer or buffer descriptor. */
    ptr_sockData = (Srio_SockDataPacket *)Srio_listRemove ((Srio_ListNode**)&ptr_srioSocket->pendingPkts);
    while (ptr_sockData != NULL)
    {
        /* Cleanup the memory associated with the driver buffer. */
        Srio_freeRxDrvBuffer(ptr_srioSocket, ptr_sockData->drvBuffer);

        /* Cleanup the memory. */
        Srio_osalFree(ptr_sockData, sizeof(Srio_SockDataPacket));

        /* Cycle through the next pending packet. */
        ptr_sockData = (Srio_SockDataPacket *)Srio_listRemove ((Srio_ListNode**)&ptr_srioSocket->pendingPkts);
    }

    /* Now cycle through the free list and clean memory. 
     *  - Socket data on the free list does not have a valid data buffer or descriptors 
     *    and thus requires no cleanup. */
    ptr_sockData = (Srio_SockDataPacket *)Srio_listRemove ((Srio_ListNode**)&ptr_srioSocket->freePkts);
    while (ptr_sockData != NULL)
    {
        /* Cleanup the memory. */
        Srio_osalFree(ptr_sockData, sizeof(Srio_SockDataPacket));

        /* Cycle through the next pending packet. */
        ptr_sockData = (Srio_SockDataPacket *)Srio_listRemove ((Srio_ListNode**)&ptr_srioSocket->freePkts);
    }
    return;
}

/**
 *  @b Description
 *  @n  
 *      Utility function used internally to initialize the socket data list. The number
 *      of socket data packets allocated matches the MAX pending.
 *
 *  @param[in]  ptr_srioSocket
 *      Pointer to the SRIO socket for which the socket data queues need to be initialized.
 *
 *  @retval
 *      Success - 0 
 *  @retval
 *      Error   - <0 
 */
static int32_t Srio_initSockData (Srio_Socket* ptr_srioSocket)
{
    uint16_t                count;
    Srio_SockDataPacket*    ptr_sockData;

    /* Populate the free socket data list. */
    for (count = 0; count < ptr_srioSocket->maxPendingPackets; count++)
    {
        /* Allocate memory for the socket data */ 
        ptr_sockData = (Srio_SockDataPacket *)Srio_osalMalloc(sizeof(Srio_SockDataPacket));
        if (ptr_sockData == NULL)
        {
            /* Flush out all the data currently allocated. */
            Srio_flushSockData(ptr_srioSocket);
            return -1;
        }

        /* Initialize the allocated block. */
        memset ((void *)ptr_sockData, 0, sizeof(Srio_SockDataPacket));

        /* Add this to the free list. */
        Srio_listAdd ((Srio_ListNode**)&ptr_srioSocket->freePkts, (Srio_ListNode*)ptr_sockData);
    }

    /* Socket data was successfully initialized. */
    return 0;
}

/**
 *  @b Description
 *  @n  
 *      This is the SRIO Driver Initialization API which needs to be 
 *      invoked by the users to initialize the SRIO peripheral. This call
 *      is *mandatory* and should be called before calling any of the 
 *      other driver API's. 
 *
 *      This should only be called *ONCE* for the device.
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
int32_t Srio_init (void)
{
    Cppi_CpDmaInitCfg   srioCPDMACfg;
    uint16_t            idx;

    /* Invalidate the Cache Contents. */
    Srio_osalBeginMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));

    /* Initialize the Driver MCB. */
    memset ((void *)&gSRIODriverMCB, 0, sizeof(Srio_DriverMCB));

    /* Initialize the SRIO CSL Functional layer. */
    gSRIODriverMCB.hSrio = CSL_SRIO_Open (0);
    if (gSRIODriverMCB.hSrio == NULL)
        return -1;

    if (CSL_PSC_isModuleResetIsolationEnabled(CSL_PSC_LPSC_SRIO))


            CSL_PSC_disableModuleResetIsolation(CSL_PSC_LPSC_SRIO);
    /* Initialize the SRIO CPDMA config structure. */
    memset ((void *)&srioCPDMACfg, 0, sizeof(Cppi_CpDmaInitCfg));

    /* Setup the SRIO CPDMA Configuration. */
    srioCPDMACfg.dmaNum = Cppi_CpDma_SRIO_CPDMA;

    /* Open the SRIO CPDMA. */
    gSRIODriverMCB.cppiHnd = Cppi_open (&srioCPDMACfg);
    if (gSRIODriverMCB.cppiHnd == NULL)
    {
        Srio_osalLog ("Error: Initializing CPPI for SRIO CPDMA\n");
        return -1;
    }

    /* Disable the SRIO-CPDMA Loopback mode in the CPPI */
    if (Cppi_setCpdmaLoopback (gSRIODriverMCB.cppiHnd, 0) != CPPI_SOK)
    {
        Srio_osalLog ("Error: SRIO CPDMA Loopback mode failed\n");
        return -1;
    }

    /* Initialize the SRIO Receive Mapping Table for Type9 and Type11; no sockets are open at this time */
    for (idx = 0; idx < NUM_SRIO_TYPE9_TYPE11_SOCKETS; idx++) 
    {
        SRIO_MESSAGE        messageType11;
        SRIO_TYPE9_MESSAGE  messageType9;

        /* This will ensure that the RXU Mapping registers for Type11 are configured 
         * to the reset values */
        messageType11.mbxMask = CSL_SRIO_RIO_RXU_MAP_L_MBX_MASK_RESETVAL;
        messageType11.ltrMask = CSL_SRIO_RIO_RXU_MAP_L_LTR_MASK_RESETVAL;        
        messageType11.mbx     = CSL_SRIO_RIO_RXU_MAP_L_MBX_RESETVAL;
        messageType11.ltr     = CSL_SRIO_RIO_RXU_MAP_L_LTR_RESETVAL;
        messageType11.srcId   = CSL_SRIO_RIO_RXU_MAP_L_SRCID_RESETVAL;
        messageType11.dstId   = CSL_SRIO_RIO_RXU_MAP_H_DEST_ID_RESETVAL;
        messageType11.dstProm = CSL_SRIO_RIO_RXU_MAP_H_DEST_PROM_RESETVAL;
        messageType11.tt      = CSL_SRIO_RIO_RXU_MAP_H_TT_RESETVAL;
        messageType11.srcProm = CSL_SRIO_RIO_RXU_MAP_H_SRC_PROM_RESETVAL;
        messageType11.segMap  =  CSL_SRIO_RIO_RXU_MAP_H_SEG_MAP_RESETVAL;
        messageType11.flowId  = 0x0;
 
        /* Configure the Type11 Mapping */
        CSL_SRIO_MapMessageToQueue (gSRIODriverMCB.hSrio, idx, &messageType11, 0x0);

        /* This will ensure that the RXU Mapping registers for Type9 are configured 
         * to the reset values. */
        messageType9.cosMask    = CSL_SRIO_RIO_RXU_TYPE9_MAP0_COS_MASK_RESETVAL;
        messageType9.cos        = CSL_SRIO_RIO_RXU_TYPE9_MAP0_COS_RESETVAL;
        messageType9.srcId      = CSL_SRIO_RIO_RXU_TYPE9_MAP0_SRCID_RESETVAL;
        messageType9.dstId      = CSL_SRIO_RIO_RXU_TYPE9_MAP1_DEST_ID_RESETVAL;
        messageType9.dstProm    = CSL_SRIO_RIO_RXU_TYPE9_MAP1_DEST_PROM_RESETVAL;
        messageType9.tt         = CSL_SRIO_RIO_RXU_TYPE9_MAP1_TT_RESETVAL;
        messageType9.srcProm    = CSL_SRIO_RIO_RXU_TYPE9_MAP1_SRC_PROM_RESETVAL;
        messageType9.streamId   = CSL_SRIO_RIO_RXU_TYPE9_MAP2_STRM_ID_RESETVAL;
        messageType9.streamMask = CSL_SRIO_RIO_RXU_TYPE9_MAP2_STRM_MASK_RESETVAL;
        messageType9.flowId     = 0;

        /* Configure the Type9 Mapping */
        CSL_SRIO_MapType9MessageToQueue (gSRIODriverMCB.hSrio, idx, &messageType9, 0x0);

        /* The socket is not being used. */
        gSRIODriverMCB.mappingStatusType9Type11[idx] = 0;
    }

    /* Initialize the SRIO Receive Mapping Table for DIO; no sockets are open at this time */
    for (idx = 0; idx < NUM_DIO_SOCKETS; idx++) 
        gSRIODriverMCB.lsuStatus[idx] = 0;

#ifdef SIMULATOR_SUPPORT
    /* We need to enable all the SRIO Receive and Transmit Channels in the SRIO Simulator. */    
    {
        uint16_t            index = 1;
        Cppi_RxChInitCfg    rxCfg;
        Cppi_TxChInitCfg    txCfg;
        Cppi_ChHnd          chHnd;
        uint8_t             isAllocated;
        
        /* We have already initialized 1 channel; here we do the remaining... */
        for (index = 0; index < 16; index++)
        {
            /* Open the SRIO Receive Channel */
            rxCfg.channelNum = CPPI_PARAM_NOT_SPECIFIED;
            rxCfg.rxEnable   = Cppi_ChState_CHANNEL_DISABLE;
            chHnd = Cppi_rxChannelOpen (gSRIODriverMCB.cppiHnd, &rxCfg, &isAllocated);
            if (chHnd == NULL)
            {
                Srio_osalLog ("Error: Opening SRIO Rx channel %d failed\n", rxCfg.channelNum);
                return -1;
            }

            /* Enable the channel */
            if (Cppi_channelEnable (chHnd) < 0)
            {
                Srio_osalLog ("Error: Enabling SRIO Rx Channel %d failed\n", index);
                return -1;
            }

            /* Open the SRIO Transmit Channel */
            txCfg.channelNum   = CPPI_PARAM_NOT_SPECIFIED;
            txCfg.priority     = 0;
            txCfg.txEnable     = Cppi_ChState_CHANNEL_DISABLE;
            txCfg.filterEPIB   = 0;
            txCfg.filterPS     = 0;
            txCfg.aifMonoMode  = 0;
            chHnd = Cppi_txChannelOpen (gSRIODriverMCB.cppiHnd, &txCfg, &isAllocated);
            if (chHnd == NULL)
            {
                Srio_osalLog ("Error: Opening SRIO Tx channel %d failed\n", txCfg.channelNum);
                return -1;
            }

            /* Enable the channel. */
            if (Cppi_channelEnable (chHnd) < 0)
            {
                Srio_osalLog ("Error: Enabling SRIO Tx Channel %d failed\n", index);
                return -1;
            }
        }
    }    
#endif

    /* Once the SRIO has been initialized we need to writeback the contents of the 
     * SRIO Master Control Block back into the cache. */
    Srio_osalEndMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));

    /* Initialization was successful. */
    return 0;
}

/**
 *  @b Description
 *  @n  
 *      Utility API which gets the descriptor size for a specific memory region.
 *
 *  @param[in]  memRegion
 *      Memory Region for which the descriptor size is required.
 *
 *  @retval
 *      Success -   Descriptor size corresponding to the memory region
 *  @retval
 *      Error   -   <0
 */
static int32_t Srio_getDescSize (Qmss_MemRegion memRegion)
{
    Qmss_MemRegCfg      memRegionInfo;
    uint16_t            index;

    /* Get all the memory region configuration */
    if (Qmss_getMemoryRegionCfg (&memRegionInfo) != QMSS_SOK)
        return -1;

    /* Cycle through allthe memory regions. */
    for (index = 0; index < QMSS_MAX_MEM_REGIONS; index++)
    {
        /* Did we get a match? If so return the descriptor size */
        if (memRegionInfo.memRegInfo[index].memRegion == memRegion)
            return memRegionInfo.memRegInfo[index].descSize;
    }

    /* No match was found we return error */
    return -1;
} 

/**
 *  @b Description
 *  @n  
 *      The API handles driver managed configuration. It uses the information 
 *      specified in the configuration to program the accumulator, setup the 
 *      receive flow and the driver receive buffer pools.
 *
 *  @param[in]  ptr_srioDrvInst
 *      Driver Instance being created
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
static int32_t Srio_processDrvConfig(Srio_DriverInst* ptr_srioDrvInst)
{
    Cppi_DescCfg        descCfg;
    Qmss_QueueHnd       srioTempQueue;
    uint8_t             isAllocated;
    Qmss_Queue          queueInfo;
    uint8_t*            ptr_dataBuffer;
    uint16_t            idx;
    Cppi_RxFlowCfg      rxFlowCfg;
    uint32_t            numAllocated;
    Cppi_HostDesc*      ptrHostDesc;
    Qmss_Result         result;

    /***********************************************************************
     *********************** Receive Configuration *************************
     ***********************************************************************/
 
    /* Check if we need to configure the receive path or not? */
    if (ptr_srioDrvInst->cfg.u.drvManagedCfg.bIsRxCfgValid == 1)
    {
        /* Basic Validations: Ensure that a valid receive completion queue has
         * been specified. */
        if (ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.rxCompletionQueue == NULL)
            return -1;

        /* Basic Validations: Get the receive descriptor size. */
        ptr_srioDrvInst->rxDescSize = Srio_getDescSize(ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.rxMemRegion);
        if (ptr_srioDrvInst->rxDescSize < 0)
            return -1;

        /* Remember the receive completion queue */
        ptr_srioDrvInst->rxCompletionQueue = ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.rxCompletionQueue;

        /* Open the SRIO Receive Queue; this should support starvation. */
        ptr_srioDrvInst->rxQueue = Qmss_queueOpen (Qmss_QueueType_STARVATION_COUNTER_QUEUE, 
                                                   QMSS_PARAM_NOT_SPECIFIED, &isAllocated);
        if (ptr_srioDrvInst->rxQueue < 0)
        {
            Srio_osalLog ("Error: SRIO Receive Queue failed to open\n");
            return -1;
        }

        /* Get the Queue Information for the Receive Queue */
	    queueInfo = Qmss_getQueueNumber(ptr_srioDrvInst->rxQueue);
	    
	    /* Initialize the receive buffer descriptors. All receive descriptors need 
	     * to be initialized such that after completion the return queue number is 
	     * the Receive Queue.  */
        descCfg.memRegion                 = ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.rxMemRegion;
	    descCfg.descNum                   = ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.numRxBuffers;
	    descCfg.destQueueNum              = QMSS_PARAM_NOT_SPECIFIED;
	    descCfg.queueType                 = Qmss_QueueType_GENERAL_PURPOSE_QUEUE;
	    descCfg.initDesc                  = Cppi_InitDesc_INIT_DESCRIPTOR;
	    descCfg.descType                  = Cppi_DescType_HOST;
	    descCfg.returnQueue               = queueInfo;
	    descCfg.epibPresent               = Cppi_EPIB_NO_EPIB_PRESENT;
	    descCfg.returnPushPolicy          = Qmss_Location_HEAD;
	    descCfg.cfg.host.returnPolicy     = Cppi_ReturnPolicy_RETURN_ENTIRE_PACKET;
	    descCfg.cfg.host.psLocation       = Cppi_PSLoc_PS_IN_DESC;
	    srioTempQueue = Cppi_initDescriptor (&descCfg, &numAllocated);

//	    printf("temp receive allocated %d \n",numAllocated);
	    if (srioTempQueue < 0)
	    {
	        Srio_osalLog ("Error: Initializing receive descriptor failed :%d \n", srioTempQueue);
	        return -1;
        }
	    
	    /* Pop off all descriptors from the temp Queue and move them to the Receive Queue. */
	    for (idx = 0; idx < ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.numRxBuffers; idx++)
	    {
	        /* Get a host descriptor from the free GP queue. */
	        ptrHostDesc = (Cppi_HostDesc *)Qmss_queuePop(srioTempQueue);
	        if (ptrHostDesc == NULL)
	        {
	            Srio_osalLog ("Error: Receive Queue Configuration Failed\n");
	            return -1;
            }

	        /* Allocate memory for the receive data buffer. */
	        ptr_dataBuffer = (uint8_t*)Srio_osalDataBufferMalloc (ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.rxMTU);
	        if (ptr_dataBuffer == NULL)
	        {
	            Srio_osalLog ("Error: Receive Data Buffer Allocation Failed\n");
	            return -1;
            }

	        /* Set the data and payload length. */
	        Cppi_setData (Cppi_DescType_HOST, (Cppi_Desc*)ptrHostDesc, (uint8_t*)ptr_dataBuffer, 
                          ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.rxMTU);
            Cppi_setOriginalBufInfo (Cppi_DescType_HOST, (Cppi_Desc*)ptrHostDesc, (uint8_t*)ptr_dataBuffer, 
	                      ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.rxMTU);

            /* OSAL Hook: Writeback the contents of the descriptor. */
            Srio_osalEndDescriptorAccess ((Srio_DrvHandle)ptr_srioDrvInst, (void *)ptrHostDesc, 
                                          ptr_srioDrvInst->rxDescSize);

            /* Debug Message */
	        Srio_osalLog ("Debug: DrvConfig Rx host descriptor 0x%p Buffer: 0x%p Return Queue 0x%x\n", 
                           ptrHostDesc, ptr_dataBuffer, 
                           Qmss_getQueueHandle(Cppi_getReturnQueue(Cppi_DescType_HOST, (Cppi_Desc*)ptrHostDesc)));

	        /* Add the packet descriptor to the SRIO Receive Queue. */
            Qmss_queuePushDescSize (ptr_srioDrvInst->rxQueue, (uint32_t*)ptrHostDesc, ptr_srioDrvInst->rxDescSize);
        }

	    /* We are done with the temporary Queue at this stage. */
	    Qmss_queueClose (srioTempQueue);

        /***********************************************************************
         ******************** Accumulator Configuration ************************
         ***********************************************************************/

        /* Check if we need to configure the accumulator? */
        if (ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.bIsAccumlatorCfgValid == 1)
        {
            /* YES. Program the accumulator. */
            result = Qmss_programAccumulator (Qmss_PdspId_PDSP1, 
                                              &ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.accCfg);
            if (result != QMSS_ACC_SOK)
            {
                Srio_osalLog ("Error: Program Accumulator failed 0x%x\n", result);
        		return -1;
            }

            /* Remember the accumulator channel which is being programmed. */
            ptr_srioDrvInst->accChannel = ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.accCfg.channel;

            /* Use the Ping List in the beginning. */
            ptr_srioDrvInst->rxUsePingList = 1;

            /* Initialize the PING & PONG Completion Address. */
            ptr_srioDrvInst->rxPingAddress = ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.accCfg.listAddress;
            ptr_srioDrvInst->rxPongAddress = ptr_srioDrvInst->rxPingAddress + 
                                             ptr_srioDrvInst->cfg.u.drvManagedCfg.rxCfg.accCfg.maxPageEntries*4;

            /* Accumulator has been programmed */
            ptr_srioDrvInst->isAccumulatorProgrammed = 1;

            /* Debug Message: */
            Srio_osalLog ("Debug: DrvConfig Ping: 0x%x Pong: 0x%x\n", ptr_srioDrvInst->rxPingAddress,
                           ptr_srioDrvInst->rxPongAddress);
        }
        else
        {
            /* NO. The accumulator has not been programmed */
            ptr_srioDrvInst->isAccumulatorProgrammed = 0;
        }

        /* Create the Receive Flow
	     *  - Returns all packets to the SRIO Rx Completion Queue 
         *  - Uses the SRIO Rx Free Queue to pick free descriptors. 
	     *  - Protocol Specific Information is present 
	     *  - Only Host Descriptors are supported. 
	     *  - All other fields in the flow configuration is 0 */
        memset ((void *)&rxFlowCfg, 0, sizeof(Cppi_RxFlowCfg));

        /* Get the Queue Information for the Receive Completion Queue */
        queueInfo = Qmss_getQueueNumber(ptr_srioDrvInst->rxCompletionQueue);

	    rxFlowCfg.flowIdNum          = -1;
	    rxFlowCfg.rx_dest_qnum       = queueInfo.qNum;  /* Received Packets should be put in the Rx Completion Queue */
	    rxFlowCfg.rx_dest_qmgr       = queueInfo.qMgr;
	    rxFlowCfg.rx_sop_offset      = 0x0;
	    rxFlowCfg.rx_ps_location     = 0x0;
	    rxFlowCfg.rx_desc_type       = 0x1;   /* This is HOST Descriptor */
	    rxFlowCfg.rx_error_handling  = 0x0;
	    rxFlowCfg.rx_psinfo_present  = 0x1;   /* Protocol Specific Information present */
	    rxFlowCfg.rx_einfo_present   = 0x0;

	    rxFlowCfg.rx_dest_tag_lo     = 0x0;
	    rxFlowCfg.rx_dest_tag_hi     = 0x0;
	    rxFlowCfg.rx_src_tag_lo      = 0x0;
	    rxFlowCfg.rx_src_tag_hi      = 0x0;

	    rxFlowCfg.rx_dest_tag_lo_sel = 0x0;
	    rxFlowCfg.rx_dest_tag_hi_sel = 0x0;
	    rxFlowCfg.rx_src_tag_lo_sel  = 0x0;
	    rxFlowCfg.rx_src_tag_hi_sel  = 0x0;

        /* Disable Receive size thresholds. */
        rxFlowCfg.rx_size_thresh0_en = 0x0;
        rxFlowCfg.rx_size_thresh1_en = 0x0;
        rxFlowCfg.rx_size_thresh2_en = 0x0;

	    /* Use the Receive Queue for picking all descriptors. */
	    queueInfo = Qmss_getQueueNumber(ptr_srioDrvInst->rxQueue);
	    rxFlowCfg.rx_fdq1_qnum       = queueInfo.qNum;
	    rxFlowCfg.rx_fdq1_qmgr       = queueInfo.qMgr;
	    rxFlowCfg.rx_fdq2_qnum       = queueInfo.qNum;
	    rxFlowCfg.rx_fdq2_qmgr       = queueInfo.qMgr;
	    rxFlowCfg.rx_fdq3_qnum       = queueInfo.qNum;
	    rxFlowCfg.rx_fdq3_qmgr       = queueInfo.qMgr;

        /* Use the Receive Queue for picking the SOP packet also. */
	    rxFlowCfg.rx_fdq0_sz0_qnum   = queueInfo.qNum;
	    rxFlowCfg.rx_fdq0_sz0_qmgr   = queueInfo.qMgr;

        /* There are no size thresholds configured. */
        rxFlowCfg.rx_size_thresh0    = 0x0;
	    rxFlowCfg.rx_size_thresh1    = 0x0;
        rxFlowCfg.rx_size_thresh2    = 0x0;

        /* The other threshold queues do not need to be configured */
	    rxFlowCfg.rx_fdq0_sz1_qnum   = 0x0;
	    rxFlowCfg.rx_fdq0_sz1_qmgr   = 0x0;
	    rxFlowCfg.rx_fdq0_sz2_qnum   = 0x0;
	    rxFlowCfg.rx_fdq0_sz2_qmgr   = 0x0;
	    rxFlowCfg.rx_fdq0_sz3_qnum   = 0x0;
	    rxFlowCfg.rx_fdq0_sz3_qmgr   = 0x0;

        /* Configure the Receive Flow */
        ptr_srioDrvInst->flowHandle = Cppi_configureRxFlow (gSRIODriverMCB.cppiHnd, &rxFlowCfg, &isAllocated);
        if (ptr_srioDrvInst->flowHandle == NULL)
        {
            Srio_osalLog ("Error: Receive Flow Configuration failed\n");
            return -1;
        }

        /* Debug Message: */
        Srio_osalLog ("Debug: DrvConfig Rx Free Queue: 0x%x Rx Completion Queue: 0x%x Flow Id: %d\n", 
                       ptr_srioDrvInst->rxQueue, ptr_srioDrvInst->rxCompletionQueue, 
                       Cppi_getFlowId(ptr_srioDrvInst->flowHandle));
    }

    /***********************************************************************
     ********************** Transmit Configuration *************************
     ***********************************************************************/

    /* Check if we need to configure the transmit buffers or not? */
    if (ptr_srioDrvInst->cfg.u.drvManagedCfg.bIsTxCfgValid == 1)
    {
        /* YES: Get the transmit descriptor size. */
        ptr_srioDrvInst->txDescSize = Srio_getDescSize(ptr_srioDrvInst->cfg.u.drvManagedCfg.txCfg.txMemRegion);
        if (ptr_srioDrvInst->txDescSize < 0)
            return -1;

        /* Open the SRIO Transmit Free Queue; this should support starvation. */
        ptr_srioDrvInst->txFreeQueue = Qmss_queueOpen (Qmss_QueueType_STARVATION_COUNTER_QUEUE, 
                                                       QMSS_PARAM_NOT_SPECIFIED, &isAllocated);
        if (ptr_srioDrvInst->txFreeQueue < 0)
        {
            Srio_osalLog ("Error: SRIO Transmit Completion Queue failed to open\n");
            return NULL;
        }

	    /* Get the Queue Information for the Transmit Free Queue */
	    queueInfo = Qmss_getQueueNumber(ptr_srioDrvInst->txFreeQueue);
	
	    /* Initialize the Transmit descriptors. We want all the transmit descriptors to go
	     * back to the Transmit Free Queue after transmission. */
	    descCfg.memRegion                 = ptr_srioDrvInst->cfg.u.drvManagedCfg.txCfg.txMemRegion;
	    descCfg.descNum                   = ptr_srioDrvInst->cfg.u.drvManagedCfg.txCfg.numTxBuffers;
	    descCfg.destQueueNum              = QMSS_PARAM_NOT_SPECIFIED;
	    descCfg.queueType                 = Qmss_QueueType_GENERAL_PURPOSE_QUEUE;
	    descCfg.initDesc                  = Cppi_InitDesc_INIT_DESCRIPTOR;
	    descCfg.descType                  = Cppi_DescType_HOST;
	    descCfg.returnQueue               = queueInfo;
	    descCfg.epibPresent               = Cppi_EPIB_NO_EPIB_PRESENT;
	    descCfg.returnPushPolicy          = Qmss_Location_HEAD;
	    descCfg.cfg.host.returnPolicy     = Cppi_ReturnPolicy_RETURN_ENTIRE_PACKET;
	    descCfg.cfg.host.psLocation       = Cppi_PSLoc_PS_IN_DESC;

	    /* Initialize the descriptors and place all of them into the general purpose temporary queue */
	    srioTempQueue  = Cppi_initDescriptor (&descCfg, &numAllocated);
	    if (srioTempQueue < 0)
	    {
	        Srio_osalLog ("Error: Initializing transmit descriptor failed :%d \n", srioTempQueue);
	        return NULL;
	    }

	    /* Pop off all descriptors from the temp Queue and move them to the Transmit Free Queue. */
	    for (idx = 0; idx < ptr_srioDrvInst->cfg.u.drvManagedCfg.txCfg.numTxBuffers; idx++)
	    {
	        /* Get a host descriptor from the free GP queue. */  
            ptrHostDesc = (Cppi_HostDesc *)QMSS_DESC_PTR(Qmss_queuePop(srioTempQueue));
	        if (ptrHostDesc == NULL)
	        {
	            Srio_osalLog ("Error: Transmit Queue Configuration Failed\n");
	            return NULL;
	        }

	        /* Allocate memory for the transmit data buffer. */
	        ptr_dataBuffer = (uint8_t*)Srio_osalDataBufferMalloc(ptr_srioDrvInst->cfg.u.drvManagedCfg.txCfg.txMTU);
 //           printf(" ");
//	        printf(" allocating buffer  %x   descriptor location %x \n",ptr_dataBuffer,ptrHostDesc );
	        if (ptr_dataBuffer == NULL)
	        {
	            Srio_osalLog ("Error: Transmit Data Buffer Allocation Failed\n");
	            return NULL;
	        }

	        /* Set the data and payload length. */
	        Cppi_setData (Cppi_DescType_HOST, (Cppi_Desc*)ptrHostDesc, (uint8_t*)ptr_dataBuffer, 
                          ptr_srioDrvInst->cfg.u.drvManagedCfg.txCfg.txMTU);
			Cppi_setOriginalBufInfo (Cppi_DescType_HOST, (Cppi_Desc*)ptrHostDesc, (uint8_t*)ptr_dataBuffer, 
	                      ptr_srioDrvInst->cfg.u.drvManagedCfg.txCfg.txMTU);

            /* OSAL Hook: Writeback the contents of the descriptor. */
            Srio_osalEndDescriptorAccess ((Srio_DrvHandle)ptr_srioDrvInst, (void *)ptrHostDesc, 
                                          ptr_srioDrvInst->txDescSize);

	        /* Debug Message */
	        Srio_osalLog ("Debug: DrvConfig Tx host descriptor 0x%p Buffer: 0x%p\n", ptrHostDesc, ptr_dataBuffer);

	        /* Add the packet descriptor to the SRIO Transmit Free Queue. */
	        Qmss_queuePushDescSize (ptr_srioDrvInst->txFreeQueue, (uint32_t*)ptrHostDesc, ptr_srioDrvInst->txDescSize);
	    }

	    /* We are done with the temporary Queue at this stage. */
	    Qmss_queueClose (srioTempQueue);

        /* Debug Message: */
        Srio_osalLog ("Debug: DrvConfig Tx Free Queue: 0x%x Tx Queue: 0x%x\n",ptr_srioDrvInst->txFreeQueue, 
                       ptr_srioDrvInst->txQueue);
    }

    /* Driver Managed Configuration has been successfully handled. */
    return 0;
}

/**
 *  @b Description
 *  @n  
 *      The API handles application managed configuration. It uses the 
 *      information specified in the configuration to program the accumulator &  
 *      setup the receive flows.
 *
 *  @param[in]  ptr_srioDrvInst
 *      Driver Instance being created
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
static int32_t Srio_processAppConfig(Srio_DriverInst* ptr_srioDrvInst)
{
    uint8_t     isAllocated;
    Qmss_Result result;
    Qmss_Queue  queueInfo;

    /* Do we need to program the receive flow configuration? */
    if (ptr_srioDrvInst->cfg.u.appManagedCfg.bIsRxFlowCfgValid == 1)
    {
        /* YES. Ensure that a valid RAW Receive Cleanup API has been provided. */
        if (ptr_srioDrvInst->cfg.u.appManagedCfg.rawRxFreeDrvBuffer == NULL)
            return -1;

        /* Get the Receive Completion Queue which is being used; we can get 
         * this information from the Receive Flow Configuration. */
        queueInfo.qNum = ptr_srioDrvInst->cfg.u.appManagedCfg.rxFlowCfg.rx_dest_qnum;
	    queueInfo.qMgr = ptr_srioDrvInst->cfg.u.appManagedCfg.rxFlowCfg.rx_dest_qmgr;
        ptr_srioDrvInst->rxCompletionQueue = Qmss_getQueueHandle (queueInfo);
        if (ptr_srioDrvInst->rxCompletionQueue == NULL)
        {
            Srio_osalLog ("Error: Invalid Receive Completion Queue\n");
            return -1;
        }

        /* Configure the Receive Flow */
        ptr_srioDrvInst->flowHandle = Cppi_configureRxFlow (gSRIODriverMCB.cppiHnd, 
                                                            &ptr_srioDrvInst->cfg.u.appManagedCfg.rxFlowCfg, 
                                                            &isAllocated);
        if (ptr_srioDrvInst->flowHandle == NULL)
        {
            Srio_osalLog ("Error: Receive Flow Configuration failed\n");
            return -1;
        }

        /* Does the application configuration program the accumulator? */
        if (ptr_srioDrvInst->cfg.u.appManagedCfg.bIsAccumlatorCfgValid == 1)
        {
            /* YES. Program the accumulator. */
            result = Qmss_programAccumulator (Qmss_PdspId_PDSP1, &ptr_srioDrvInst->cfg.u.appManagedCfg.accCfg);
            if (result != QMSS_ACC_SOK)
            {
                Srio_osalLog ("Error: Program Accumulator for Rx Queue failed 0x%x\n", result);
        		return -1;
            }

            /* Remember the accumulator channel which is being programmed. */
            ptr_srioDrvInst->accChannel = ptr_srioDrvInst->cfg.u.appManagedCfg.accCfg.channel;

            /* Use the Ping List in the beginning. */
            ptr_srioDrvInst->rxUsePingList = 1;

            /* Initialize the PING & PONG Completion Address. */
            ptr_srioDrvInst->rxPingAddress = ptr_srioDrvInst->cfg.u.appManagedCfg.accCfg.listAddress;
            ptr_srioDrvInst->rxPongAddress = ptr_srioDrvInst->rxPingAddress + 
                                             ptr_srioDrvInst->cfg.u.appManagedCfg.accCfg.maxPageEntries*4;

            /* Accumulator has been programmed */
            ptr_srioDrvInst->isAccumulatorProgrammed = 1;
        }
        else
        {
            /* Accumulator has NOT been programmed */
            ptr_srioDrvInst->isAccumulatorProgrammed = 0;
        }
    }

    /* Debug Message: */
    Srio_osalLog ("Debug: AppConfig Tx Queue: 0x%x Flow Id: %d\n", ptr_srioDrvInst->txQueue,
                  Cppi_getFlowId(ptr_srioDrvInst->flowHandle));
    
    /* Application Managed Configuration has been processed successfully. */
    return 0;
}

/**
 *  @b Description
 *  @n  
 *      This API is responsible for creating and initializing an instance
 *      of the SRIO driver. Application developers need to ensure that they
 *      create a driver instance before they can use any of the other SRIO
 *      driver APIs.
 *
 *  @param[in]  ptr_cfg
 *      Pointer to the SRIO driver configuration block.
 *
 *  @retval
 *      Success - Valid SRIO Driver Instance Handle
 *  @retval
 *      Error   - NULL
 */
Srio_DrvHandle Srio_start (Srio_DrvConfig* ptr_cfg)
{
    Srio_DriverInst*    ptr_srioDrvInst;
    uint8_t             isAllocated;
    int32_t             result;
    Cppi_CpDmaInitCfg   srioCPDMACfg;
    void*               multiCoreCSInfo;

    /* Basic Parameter Validation: Ensure that a valid configuration block was passed */
    if (ptr_cfg == NULL)
        return NULL;

    /* Allocate memory for the SRIO driver instance. */
    ptr_srioDrvInst = (Srio_DriverInst *)Srio_osalMalloc (sizeof(Srio_DriverInst));
    if (ptr_srioDrvInst == NULL)
        return NULL;

    /* Initialize the allocated block of memory */
    memset ((void *)ptr_srioDrvInst, 0, sizeof(Srio_DriverInst));

    /* Copy the configuration block into the driver instance */
    memcpy ((void *)&ptr_srioDrvInst->cfg, (void*)ptr_cfg, sizeof(Srio_DrvConfig));

    /* Setup the SRIO CPDMA Configuration and open the SRIO CPDMA instance; this needs to be done
     * for each instance also; since this can be done on each core.  */
    srioCPDMACfg.dmaNum = Cppi_CpDma_SRIO_CPDMA;
    if (Cppi_open (&srioCPDMACfg) == NULL)
    {
        Srio_osalLog ("Error: Initializing CPPI for SRIO CPDMA\n");
        return NULL;
    }

    /* Invalidate the Cache Contents. */
    Srio_osalBeginMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));

#ifndef SIMULATOR_SUPPORT
    /* On the actual device we enable the SRIO Receive and Transmit channels for each driver
     * instance. */
    {
        Cppi_RxChInitCfg    rxCfg;
        Cppi_TxChInitCfg    txCfg;
                
        /* Open the SRIO Receive Channel and keep it disabled */
        rxCfg.channelNum = CPPI_PARAM_NOT_SPECIFIED;
        rxCfg.rxEnable   = Cppi_ChState_CHANNEL_DISABLE;
        ptr_srioDrvInst->rxChHnd = Cppi_rxChannelOpen (gSRIODriverMCB.cppiHnd, &rxCfg, &isAllocated);
        if (ptr_srioDrvInst->rxChHnd == NULL)
        {
            Srio_osalLog ("Error: Opening SRIO Rx channel %d failed\n", rxCfg.channelNum);        
            return NULL;
        }

        /* Open the SRIO Transmit Channel and keep it disabled. */
        txCfg.channelNum   = CPPI_PARAM_NOT_SPECIFIED;
        txCfg.priority     = 0;
        txCfg.txEnable     = Cppi_ChState_CHANNEL_DISABLE;
        txCfg.filterEPIB   = 0;
        txCfg.filterPS     = 0;
        txCfg.aifMonoMode  = 0;
        ptr_srioDrvInst->txChHnd = Cppi_txChannelOpen (gSRIODriverMCB.cppiHnd, &txCfg, &isAllocated);
        if (ptr_srioDrvInst->txChHnd == NULL)
        {
            Srio_osalLog ("Error: Opening SRIO Tx channel %d failed\n", txCfg.channelNum);
            return NULL;
        }
    }
#endif

    /* Open the SRIO Transmit Queue; this should lie within the SRIO queue region. */
    ptr_srioDrvInst->txQueue = Qmss_queueOpen (Qmss_QueueType_SRIO_QUEUE , QMSS_PARAM_NOT_SPECIFIED, &isAllocated);
    if (ptr_srioDrvInst->txQueue < 0)
    {
        Srio_osalLog ("Error: SRIO Transmit Queue failed to open\n");
        return NULL;
    }

    /* CRITICAL Section Start: */
    multiCoreCSInfo  = Srio_osalEnterMultipleCoreCriticalSection();

    /* Process the configuration. */
    if (ptr_srioDrvInst->cfg.bAppManagedConfig == 0)
        result = Srio_processDrvConfig(ptr_srioDrvInst);
    else
        result = Srio_processAppConfig(ptr_srioDrvInst);

    /* CRITICAL Section End: */
    Srio_osalExitMultipleCoreCriticalSection (multiCoreCSInfo);

    /* Check the results. */
    if (result < 0)
        return NULL;

    /* Configure the Transmit Queue Threshold. */
    Qmss_setQueueThreshold (ptr_srioDrvInst->txQueue, 1, 1);

#ifndef SIMULATOR_SUPPORT
    /* Enable the Receive and Transmit Channels. */
    if (Cppi_channelEnable (ptr_srioDrvInst->rxChHnd) < 0)
    {
        Srio_osalLog ("Error: Enabling SRIO Rx Channel failed\n");
        return NULL;
    }
    if (Cppi_channelEnable (ptr_srioDrvInst->txChHnd) < 0)
    {
        Srio_osalLog ("Error: Enabling SRIO Tx Channel failed\n");
        return NULL;
    }
#endif
    Srio_osalLog ("Debug: SRIO Driver Instance 0x%p has been created\n", ptr_srioDrvInst);

    /* Return the SRIO Driver Handle. */
    return (Srio_DrvHandle)ptr_srioDrvInst;
}

/**
 *  @b Description
 *  @n  
 *      The function is used to open a SRIO socket. This API needs to be invoked by 
 *      the driver users to send and receive data.
 *
 *  @param[in]  hSrio
 *      Handle to the SRIO driver instance.
 *  @param[in]  type
 *      Socket type.
 *  @param[in]  isBlocking
 *      Socket is blocking or not? Set to 1 to create a blocking socket else 0
 *      for a non blocking socket
 *
 *  @retval
 *      Success - Valid Socket handle 
 *  @retval
 *      Error   - NULL
 */
Srio_SockHandle Srio_sockOpen 
(
    Srio_DrvHandle  hSrio,
    Srio_SocketType type,
    uint16_t        isBlocking
)
{
    Srio_Socket*     ptr_srioSocket = NULL;
    Srio_DriverInst* ptr_SrioDrvInst;
    uint8_t          idx;
    uint8_t          errorFlag = 1;
    uint8_t          startIndex;
    uint8_t          endIndex;
    void*            multiCoreCSInfo;
    void*            singleCoreCSInfo;

    /* Get the pointer to the SRIO Driver Instance. */
    ptr_SrioDrvInst = (Srio_DriverInst *)hSrio;
    if (ptr_SrioDrvInst == NULL)
        return NULL;

    /* Basic Validations: RAW Sockets can only be opened on APPLICATION Managed Configuration */
    if ((type == Srio_SocketType_RAW_TYPE9) || (type == Srio_SocketType_RAW_TYPE11))
    {
        /* RAW Socket is being opened.  Proceed only for Application Managed Configuration */
        if (ptr_SrioDrvInst->cfg.bAppManagedConfig == 0)
            return NULL;
    }

    /* Basic Validations: NORMAL Sockets can only be opened on DRIVER Managed Configuration */
    if ((type == Srio_SocketType_TYPE9) || (type == Srio_SocketType_TYPE11))
    {
        /* NORMAL Socket is being opened. Proceed only for Driver Managed Configuration. */
        if (ptr_SrioDrvInst->cfg.bAppManagedConfig == 1)
            return NULL;
    }

    /* Allocate memory for the SRIO Socket. */
    ptr_srioSocket = (Srio_Socket*)Srio_osalMalloc (sizeof(Srio_Socket));
    if (ptr_srioSocket == NULL)
        return NULL;

    /* CRITICAL Section Start: The SOCKET Table is a shared resource which needs to be
     * protected from the following:
     *  a) Multiple Cores 
     *  b) Single Core (Multiple Thread) */
    multiCoreCSInfo  = Srio_osalEnterMultipleCoreCriticalSection();
    singleCoreCSInfo = Srio_osalEnterSingleCoreCriticalSection(hSrio);

    /* Invalidate the Cache Contents. */
    Srio_osalBeginMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));

    /* Ensure that opening the socket does not take us beyond the IP limits. */
    if (type == Srio_SocketType_DIO)
    {
        /* DIO sockets start after the Messaging sockets. */
        startIndex = NUM_SRIO_TYPE9_TYPE11_SOCKETS;
        endIndex   = NUM_SRIO_TYPE9_TYPE11_SOCKETS+NUM_DIO_SOCKETS;
    }
    else
    {
        /* Messaging Sockets start first */
        startIndex = 0;
        endIndex   = NUM_SRIO_TYPE9_TYPE11_SOCKETS;
    }

    /* Search through all the entries in the socket database for a free block. */ 
	for (idx = startIndex; idx < endIndex; idx++)
    {
        /* Check if this entry is free or not in the Global SRIO MCB? */
        if (gSRIODriverMCB.sockStatusTable[idx] == 0)
        {
            /* Initialize the memory block. */
            memset ((void *)ptr_srioSocket, 0, sizeof(Srio_Socket));

            /* Set the socket type and raw flag status. */
            if (type == Srio_SocketType_RAW_TYPE9)
            {
                ptr_srioSocket->type        = Srio_SocketType_TYPE9;
                ptr_srioSocket->isRawSocket = 1;
            }
            else if (type == Srio_SocketType_RAW_TYPE11)
            {
                ptr_srioSocket->type        = Srio_SocketType_TYPE11;
                ptr_srioSocket->isRawSocket = 1;
            }
            else
            {        
                ptr_srioSocket->type        = type;
                ptr_srioSocket->isRawSocket = 0;
            }

            /* Initialize the SRIO socket. */
            ptr_srioSocket->ptr_SrioDrvInst   = ptr_SrioDrvInst;
            ptr_srioSocket->maxPendingPackets = DEFAULT_SRIO_MAX_PENDING_PACKETS;

            /* Remember the allocated index. */
            ptr_srioSocket->sockIndex       = idx;

            /* Set the Cleanup API for RAW Sockets. */
            if (ptr_srioSocket->isRawSocket == 1)
                ptr_srioSocket->rawRxFreeDrvBuffer = ptr_SrioDrvInst->cfg.u.appManagedCfg.rawRxFreeDrvBuffer;          

            /* Initialize the DIO Socket parameters */
            if (ptr_srioSocket->type == Srio_SocketType_DIO)
            {
                /* There are no pending transactions at this time. */
                ptr_srioSocket->dioTransId        = 0xFF;
                ptr_srioSocket->dioContext        = 0xFF;
                ptr_srioSocket->dioCompletionCode = 0x0;
            }

            /* Initialize the SOCKET Data */
            if (Srio_initSockData(ptr_srioSocket) == 0)
            {
                /* SRIO socket data was initialized successfully. 
                 * Initialize the rest of the socket fields. */
                ptr_srioSocket->blockingSocket = isBlocking;

                /* Only if the socket is blocking do we create a semaphore associated with it. */
                if (ptr_srioSocket->blockingSocket == 1)
                    ptr_srioSocket->semHandle = (void*)Srio_osalCreateSem();

                /* Inform the Global SRIO MCB that the SOCKET has now been taken over. */
                gSRIODriverMCB.sockStatusTable[idx] = 1;

                /* No Error has been detected */
                errorFlag = 0;

                /* Writeback the cache. */
                Srio_osalEndMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));
                break;
            }
            else
            {
                /* Error: Failed to initialize the internal socket data. Socket open has failed */
                break;
            }
        }
    }

    /* Are there any errors in getting a socket? */
    if (errorFlag == 0)
        Srio_listAdd ((Srio_ListNode**)&ptr_SrioDrvInst->socketList, (Srio_ListNode*)ptr_srioSocket);

    /* CRITICAL Section End */
    Srio_osalExitSingleCoreCriticalSection   (hSrio, singleCoreCSInfo);
    Srio_osalExitMultipleCoreCriticalSection (multiCoreCSInfo);

    /* Did we get an error or not? */
    if (errorFlag == 1)
    {
        /* YES. We need to clean the allocated socket block. */
        Srio_osalFree(ptr_srioSocket, sizeof(Srio_Socket));
        return (Srio_SockHandle)NULL;
    }

    /* Return the socket block. */	
	return (Srio_SockHandle)ptr_srioSocket;
}

/**
 *  @b Description
 *  @n  
 *      This is an internal function which is used to validate if the socket
 *      can be bound to the specified device id or not. Sockets can only be
 *      bound to the device id which is located either in the BRR or in the 
 *      Device ID CSR Register 
 *
 *  @param[in]  id
 *      Device Id which is to be checked.
 *  @param[in]  tt
 *      16 bit or 8 bit identifier.
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
static int32_t Srio_validateBindingId (uint16_t id, uint8_t tt)
{
    uint16_t    portIndex;
    uint16_t    brrIndex;
    uint8_t     enableStatus;
    uint8_t     maintRouting;
    uint8_t     privateStatus;
    uint16_t    pattern;
    uint16_t    match;
    uint8_t     baseID8Bit;
    uint16_t    baseID16Bit;

    /* Get the Device Identifier CSR */
    CSL_SRIO_GetDeviceIDCSR (gSRIODriverMCB.hSrio, &baseID8Bit, &baseID16Bit);

    /* Is this a 16 bit or 8 bit identifier? */
    if (tt == 0)
    {
        /* Identifer is 8 bit. So mask off the higher order 8 bits. */
        id = id & 0xFF;

        /* Check against the Device Identifier CSR. */
        if (baseID8Bit == id)
            return 0;
    }
    else
    {
        /* Identifier is 16 bits. Check against the Device Identifier CSR. */
        if (baseID16Bit == id)
            return 0;
    }

    /* Cycle thorugh all the ports. */
    for (portIndex = 0; portIndex < 4; portIndex++)
    {
        /* Cycle through all the BRR Entries for each port. */
        for (brrIndex = 0; brrIndex < 4; brrIndex++)
        {
            /* Get the TLM Port Base Routing Information. */
            CSL_SRIO_GetTLMPortBaseRoutingInfo(gSRIODriverMCB.hSrio, portIndex, 
                                               brrIndex, &enableStatus, 
                                               &maintRouting, &privateStatus);

            /* Proceed only if the BRR has been enabled for routing inbound packets. */
            if (enableStatus == 1)
            {
                /* Now we need to get the base routing pattern and match information. */
                CSL_SRIO_GetTLMPortBaseRoutingPatternMatch(gSRIODriverMCB.hSrio, portIndex, 
                                                           brrIndex, &pattern, &match);

                /* Do we have a match or not? */
                if ((pattern & match) == id)
                    return 0;
            }
        }
    }

    /* Control comes here indicates no match was found. */
    return -1;
}

/**
 *  @b Description
 *  @n  
 *      This is an internal function which is used to validate if the socket
 *      can be bound to the specified device id or not. The function is used 
 *      to validate the src id map for DIO sockets. DIO sockets use the SrcID
 *      map index for the source id while Type9 and Type11 sockets take the
 *      actual soruce id. 
 *
 *  @param[in]  idMap
 *      Source Id map which is to be validated.
 *  @param[in]  tt
 *      16 bit or 8 bit identifier.
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
static int32_t Srio_validateDIOBindingId (uint16_t idMap, uint8_t tt)
{
    uint16_t    portIndex;
    uint16_t    brrIndex;
    uint8_t     enableStatus;
    uint8_t     maintRouting;
    uint8_t     privateStatus;
    uint16_t    counter = 1;
    uint8_t     baseID8Bit;
    uint16_t    baseID16Bit;
    uint8_t     startBRRIndex;

    /* Are we trying to validate the first idMap */
    if (idMap == 0)
    {
        /* Get the Device Identifier CSR */
        CSL_SRIO_GetDeviceIDCSR (gSRIODriverMCB.hSrio, &baseID8Bit, &baseID16Bit);

        /* 8 bit or 16 bit */
        if (tt == 0)
        {
            /* 8Bit: If we have a non-zero 8bit identifier present we are good */
            if (baseID8Bit != 0)
                return 0;
            return -1;
        }
        else
        {
            /* 16Bit: If we have a non-zero 16bit identifier present we are good */
            if (baseID16Bit != 0)
                return 0;
            return -1;                
        }
    }

    /* For all other idMaps we need to check the BRR Routing Table; so cycle through all the ports. */
    for (portIndex = 0; portIndex < 4; portIndex++)
    {
        /* For Port0; BRR Entry 0 is not used; so we skip and start from Entry 1. */
        if (portIndex == 0)
            startBRRIndex = 1;
        else
            startBRRIndex = 0;

        /* Cycle through all the BRR Entries for each port. */
        for (brrIndex = startBRRIndex; brrIndex < 4; brrIndex++)
        {
            /* Is this the entry we are looking for? */
            if (counter == idMap)
            {
                /* YES. Get the TLM Port Base Routing Information. */
                CSL_SRIO_GetTLMPortBaseRoutingInfo(gSRIODriverMCB.hSrio, portIndex,
                                                   brrIndex, &enableStatus,
                                                   &maintRouting, &privateStatus);

                /* If the BRR Entry has been enabled; then this entry can be used. */
                if (enableStatus == 1)
                    return 0;

                /* BRR Entry is not enabled; this entry cannot be used */
                return -1;
            }

            /* Increment the counter */
            counter++;
        }
    }
    /* Control comes here indicates no match was found. */
    return -1;
}

/**
 *  @b Description
 *  @n  
 *      The function is used to bind the SRIO socket to the local properties 
 *      as specified. The binding information is required for Type9 and Type11
 *      sockets but for DIO sockets there is no binding required and so the
 *      information can be passed as NULL
 *
 *  @param[in]  srioSock
 *      Socket handle which is to be bound.
 *  @param[in]  ptr_bindInfo
 *      Pointer to the binding information.
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
int32_t Srio_sockBind (Srio_SockHandle srioSock, Srio_SockBindAddrInfo* ptr_bindInfo)
{
    Srio_DriverInst*    ptr_srioDrvInst;
    Srio_Socket*        ptr_srioSocket;
    uint8_t             idx;
    Qmss_Queue          queueInfo;
    void*               multiCoreCSInfo;
    void*               singleCoreCSInfo;

    /* Get the socket information. */
    ptr_srioSocket = (Srio_Socket *)srioSock;

    /* Validations: Make sure a valid socket handle is passed. */ 
    if (ptr_srioSocket == NULL)
        return -1;

    /* We dont allow multiple bindings; close and reopen a socket again */
    if (ptr_srioSocket->state == Srio_SocketState_BOUND)
        return -1;

    /* Get the pointer to the SRIO driver instance */
    ptr_srioDrvInst = ptr_srioSocket->ptr_SrioDrvInst;

    /* Is this a Type11 socket? */
    if (ptr_srioSocket->type == Srio_SocketType_TYPE11)
    {
        SRIO_MESSAGE             message;
        Srio_Type11BindAddrInfo* ptr_addr11Info = (Srio_Type11BindAddrInfo*)ptr_bindInfo;

        /* Validations: Type11 Sockets need a valid binding information */
        if (ptr_addr11Info == NULL)
            return -1;
       
        /* Validations: Make sure that the ID we are binding too matches what has been configured 
         * in the BRR Routing or in the Device ID. We can only bind to the device identifiers which
         * have been configured in the SRIO IP. Failure to do will result in the response packets
         * getting dropped  */
        if (Srio_validateBindingId(ptr_addr11Info->id, ptr_addr11Info->tt) < 0)
            return -1;

        /* CRITICAL Section Start: The BIND Table is a shared resource which needs to be
         * protected from the following:
         *  a) Multiple Cores 
         *  b) Single Core (Multiple Thread) */
        multiCoreCSInfo  = Srio_osalEnterMultipleCoreCriticalSection();
        singleCoreCSInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioDrvInst);

        /* Invalidate the Cache Contents. */
        Srio_osalBeginMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));

        /* Copy the binding information to the socket. */
        memcpy ((void *)&ptr_srioSocket->addrInfo, (void *)ptr_bindInfo, sizeof(Srio_SockAddrInfo));

        /* Now we need to find and create an appropriate mapping @ the SRIO layer */
        for (idx = 0; idx < NUM_SRIO_TYPE9_TYPE11_SOCKETS; idx++)
        {
            /* Did we find a free entry in the Type9-Type11 mapping table? */
            if (gSRIODriverMCB.mappingStatusType9Type11[idx] == 0)
            {
                /* Ok we have a free entry. Populate the SRIO Message and create the
                 * Receive mapping. The mapping is consulted when a packet is received by
                 * the SRIO IP block. In that case the destination id, letter & mask of
                 * the received packet should match. We ignore the SOURCE ID since the
                 * packets can come from anywhere. */
                message.mbx     = ptr_addr11Info->mbox;
                message.ltr     = ptr_addr11Info->letter;
                message.mbxMask = 0x3F;
                message.ltrMask = 0x3;
                message.segMap  = (uint8_t)ptr_addr11Info->segMap;
                message.tt      = (uint8_t)ptr_addr11Info->tt;
                message.dstProm = 0x0;
                message.dstId   = ptr_addr11Info->id;
                message.flowId  = (uint8_t)Cppi_getFlowId(ptr_srioDrvInst->flowHandle);
                message.srcProm = 0x1;
                message.srcId   = 0x0;

                /* Get the Queue Information for the Receive Completion Queue */
                queueInfo = Qmss_getQueueNumber(ptr_srioDrvInst->rxCompletionQueue);

                /* Create the mapping */
                CSL_SRIO_MapMessageToQueue (gSRIODriverMCB.hSrio, idx, &message, queueInfo.qNum);

                /* Remember the index. */
                ptr_srioSocket->mapIndex = idx;

                /* Map the entry as used. */
                gSRIODriverMCB.mappingStatusType9Type11[ptr_srioSocket->mapIndex] = 1;

                /* Writeback the cache. */
                Srio_osalEndMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));

                /* We have found the match. */
                break;
            }
        }

        /* CRITICAL Section End */
        Srio_osalExitSingleCoreCriticalSection   (ptr_srioDrvInst, singleCoreCSInfo);
        Srio_osalExitMultipleCoreCriticalSection (multiCoreCSInfo);

        /* Did we get a free entry? */
        if (idx < NUM_SRIO_TYPE9_TYPE11_SOCKETS)
        {
            /* Good; binding was successful */
            ptr_srioSocket->state = Srio_SocketState_BOUND;
            return 0;
        }

        /* Binding could not be done; report failure. */
        return -1;
    }
    else if (ptr_srioSocket->type == Srio_SocketType_TYPE9)
    {
        SRIO_TYPE9_MESSAGE      message9;
        Srio_Type9BindAddrInfo* ptr_addr9Info = (Srio_Type9BindAddrInfo*)ptr_bindInfo;

        /* Validations: Type9 Sockets need a valid binding information */
        if (ptr_addr9Info == NULL)
            return -1;

        /* Validations: Make sure that the ID we are binding too matches what has been configured 
         * in the BRR Routing or in the Device ID. We can only bind to the device identifiers which
         * have been configured in the SRIO IP. */
        if (Srio_validateBindingId(ptr_addr9Info->id, ptr_addr9Info->tt) < 0)
            return -1;      

        /* CRITICAL Section Start: The BIND Table is a shared resource which needs to be
         * protected from the following:
         *  a) Multiple Cores 
         *  b) Single Core (Multiple Thread) */
        multiCoreCSInfo  = Srio_osalEnterMultipleCoreCriticalSection();
        singleCoreCSInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioDrvInst);

        /* Invalidate the Cache Contents. */
        Srio_osalBeginMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));

        /* Copy the binding information to the socket. */
        memcpy ((void *)&ptr_srioSocket->addrInfo, (void *)ptr_bindInfo, sizeof(Srio_SockAddrInfo));

        /* Now we need to find and create an appropriate mapping @ the SRIO layer */
        for (idx = 0; idx < NUM_SRIO_TYPE9_TYPE11_SOCKETS; idx++)
        {
            /* Did we find a free entry in the Type9 mapping table? */
            if (gSRIODriverMCB.mappingStatusType9Type11[idx] == 0)
            {
                /* Ok we have a free entry. Populate the SRIO Message and create the
                 * Receive mapping. The mapping is consulted when a packet is received by 
                 * the SRIO IP block. In that case the destination id, cos and stream id of 
                 * the received packet should match. We ignore the SOURCE ID; the packets 
                 * can come from anywhere. */
                message9.cos        = ptr_addr9Info->cos;
                message9.cosMask    = 0xFF;
                message9.tt         = ptr_addr9Info->tt;
                message9.srcProm    = 0x1;
                message9.srcId      = 0x0;              
                message9.dstProm    = 0x0;
                message9.dstId      = ptr_addr9Info->id;
                message9.streamId   = ptr_addr9Info->streamId;
                message9.streamMask = 0xFFFF;
                message9.flowId     = (uint8_t)Cppi_getFlowId(ptr_srioDrvInst->flowHandle);

                /* Get the Queue Information for the Receive Completion Queue */
                queueInfo = Qmss_getQueueNumber(ptr_srioDrvInst->rxCompletionQueue);

                /* Create the mapping */
                CSL_SRIO_MapType9MessageToQueue (gSRIODriverMCB.hSrio, idx, &message9, queueInfo.qNum);

                /* Remember the index. */
                ptr_srioSocket->mapIndex = idx;

                /* Map the entry as used. */
                gSRIODriverMCB.mappingStatusType9Type11[ptr_srioSocket->mapIndex] = 1;

                /* Writeback the cache. */
                Srio_osalEndMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));

                /* We have found the match. */
                break;
            }
        }

        /* CRITICAL Section End */
        Srio_osalExitSingleCoreCriticalSection   (ptr_srioDrvInst, singleCoreCSInfo);
        Srio_osalExitMultipleCoreCriticalSection (multiCoreCSInfo);

        /* Did we get a free entry? */
        if (idx < NUM_SRIO_TYPE9_TYPE11_SOCKETS)
        {
            /* Good; binding was successful */
            ptr_srioSocket->state = Srio_SocketState_BOUND;
            return 0;
        }

        /* Binding could not be done; report failure. */
        return -1;
    }
    else if (ptr_srioSocket->type == Srio_SocketType_DIO)
    {
        Srio_DioBindAddrInfo* ptr_dioInfo = (Srio_DioBindAddrInfo*)ptr_bindInfo;

        /* Validations: Make sure valid binding information was passed */
        if (ptr_dioInfo == NULL)
            return -1;

        /* Validations: Ensure that the Doorbell register & bits are in the correct range */       
        if ((ptr_dioInfo->doorbellReg > (MAX_DOORBELL_REG - 1)) || (ptr_dioInfo->doorbellBit > (MAX_DOORBELL_BIT -1)))
            return -1;

        /* Validations: Make sure that the ID we are binding too matches what has been configured 
         * in the BRR Routing or in the Device ID. Failure to do will result in the response packets
         * getting dropped  */
        if (Srio_validateDIOBindingId(ptr_dioInfo->srcIDMap, ptr_dioInfo->idSize) < 0)
            return -1;

        /* CRITICAL Section Start: The LSU BIND Table is a shared resource which needs to be
         * protected from the following:
         *  a) Multiple Cores 
         *  b) Single Core (Multiple Thread) */
        multiCoreCSInfo  = Srio_osalEnterMultipleCoreCriticalSection();
        singleCoreCSInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioDrvInst);

        /* Invalidate the Cache Contents. */
        Srio_osalBeginMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));        

        /* Now we need to find and create an appropriate mapping @ the SRIO layer */
        for (idx = 0; idx < NUM_DIO_SOCKETS; idx++)
        {
            /* Did we find a free entry in the DIO mapping table? */
            if (gSRIODriverMCB.lsuStatus[idx] == 0)
            {
                /* Remember the index. */
                ptr_srioSocket->mapIndex = idx;

                /* Map the entry as used. */
                gSRIODriverMCB.lsuStatus[ptr_srioSocket->mapIndex] = 1;

                /* Writeback the cache. */
                Srio_osalEndMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));
                break;
            }
        }

        /* CRITICAL Section End */
        Srio_osalExitSingleCoreCriticalSection   (ptr_srioDrvInst, singleCoreCSInfo);
        Srio_osalExitMultipleCoreCriticalSection (multiCoreCSInfo);

        /* Did we get a free entry? If not then the binding failed. */
        if (idx == NUM_DIO_SOCKETS)
            return -1;

        /* Initialize the LSU Transfer Information. */
        ptr_srioSocket->lsuTransfer.doorbellValid   = ptr_dioInfo->doorbellValid;
        ptr_srioSocket->lsuTransfer.intrRequest     = ptr_dioInfo->intrRequest;
        ptr_srioSocket->lsuTransfer.supInt          = ptr_dioInfo->supInt;
        ptr_srioSocket->lsuTransfer.xambs           = ptr_dioInfo->xambs;
        ptr_srioSocket->lsuTransfer.priority        = ptr_dioInfo->priority;
        ptr_srioSocket->lsuTransfer.outPortID       = ptr_dioInfo->outPortID;
        ptr_srioSocket->lsuTransfer.idSize          = ptr_dioInfo->idSize;
        ptr_srioSocket->lsuTransfer.srcIDMap        = ptr_dioInfo->srcIDMap;
        ptr_srioSocket->lsuTransfer.hopCount        = ptr_dioInfo->hopCount;
        ptr_srioSocket->lsuTransfer.doorbellInfo    = CSL_FMKR(3, 0, ptr_dioInfo->doorbellBit) |
                                                      CSL_FMKR(6, 5, ptr_dioInfo->doorbellReg);

        /* Initialize the LSU Transfer Information for the Doorbell. */
		ptr_srioSocket->doorbellTransfer.rapidIOMSB    = 0;
        ptr_srioSocket->doorbellTransfer.rapidIOLSB    = 0;
        ptr_srioSocket->doorbellTransfer.dspAddress    = 0;
        ptr_srioSocket->doorbellTransfer.bytecount     = 0;
        ptr_srioSocket->doorbellTransfer.doorbellValid = 0;
        ptr_srioSocket->doorbellTransfer.idSize        = ptr_dioInfo->idSize;
        ptr_srioSocket->doorbellTransfer.intrRequest   = ptr_dioInfo->intrRequest;
        ptr_srioSocket->doorbellTransfer.supInt        = 0;
        ptr_srioSocket->doorbellTransfer.xambs         = 0;
        ptr_srioSocket->doorbellTransfer.priority      = ptr_dioInfo->priority;
        ptr_srioSocket->doorbellTransfer.outPortID     = ptr_dioInfo->outPortID;
        ptr_srioSocket->doorbellTransfer.srcIDMap      = ptr_dioInfo->srcIDMap;
        ptr_srioSocket->doorbellTransfer.ttype         = 0;
        ptr_srioSocket->doorbellTransfer.ftype         = Srio_Ftype_DOORBELL;
        ptr_srioSocket->doorbellTransfer.hopCount      = 0;

        /* Good; binding was successful */
        ptr_srioSocket->state = Srio_SocketState_BOUND;
        return 0;
    }

    /* Invalid Socket Type */
    return -1;
}

/**
 *  @b Description
 *  @n  
 *      The function is used to allocate a transmit buffer. Applications needs to
 *      call this API and get a data buffer from the internal Transmit buffer pool.
 *
 *  @param[in]   hSrioDrv
 *      SRIO Driver Instance
 *  @param[out]  ptrData
 *      Data Buffer Address which has been allocated 
 *  @param[out]  bufferLen
 *      Allocated buffer Length
 *
 *  @retval
 *      Success - Allocated Driver Buffer Handle
 *  @retval
 *      Error   - NULL
 */
Srio_DrvBuffer Srio_allocTransmitBuffer(Srio_DrvHandle hSrioDrv, uint8_t** ptrData, uint32_t* bufferLen)
{
    Srio_DriverInst*    ptr_srioDrvInst;
    Cppi_HostDesc*      ptrHostDesc;

    /* Get the pointer to the SRIO driver instance */
    ptr_srioDrvInst = (Srio_DriverInst *)hSrioDrv;

#ifdef SRIO_DRV_DEBUG
    /* Check if there is a transmit free queue associated or not? This is determined 
     * during configuration if a valid number of transmit buffers were passed for the
     * driver instance or not? */
    if (ptr_srioDrvInst->txFreeQueue == NULL)
        return NULL;
#endif

    /* Get the host descriptor from the transmit free queue. */
    ptrHostDesc = (Cppi_HostDesc *)QMSS_DESC_PTR(Qmss_queuePop(ptr_srioDrvInst->txFreeQueue));
    if (ptrHostDesc == NULL)
        return NULL;

    /* Get the data buffer associated with the descriptor. */
    Cppi_getData (Cppi_DescType_HOST, (Cppi_Desc*)ptrHostDesc, ptrData, bufferLen);

    /* Return the driver buffer. */
    return (Srio_DrvBuffer)ptrHostDesc;
}

/**
 *  @b Description
 *  @n  
 *      The function is used to cleanup an allocated transmit buffer. This API needs to be called 
 *      only if there is an application error between the allocation and send API. If the send API
 *      has been called; the buffers are automatically cleaned up and this API should *not* be
 *      called.
 *
 *  @param[in]   hSrioDrv
 *      SRIO Driver Instance
 *  @param[in]   hDrvBuffer
 *      Handle to the allocated driver buffer to be cleaned up.
 *
 *  @retval
 *      Not Applicable
 */
void Srio_freeTransmitBuffer(Srio_DrvHandle hSrioDrv, Srio_DrvBuffer hDrvBuffer)
{
    Srio_DriverInst*    ptr_srioDrvInst;

    /* Get the pointer to the SRIO driver instance */
    ptr_srioDrvInst = (Srio_DriverInst *)hSrioDrv;

    /* Check if there is a transmit free queue associated or not? This is determined 
     * during configuration if a valid number of transmit buffers were passed for the
     * driver instance or not? */
    if (ptr_srioDrvInst->txFreeQueue == NULL)
        return;

    /* Push the host descriptor to the transmit free queue. */
    Qmss_queuePushDescSize (ptr_srioDrvInst->txFreeQueue, (uint32_t*)hDrvBuffer, ptr_srioDrvInst->txDescSize);
    return;
}

/**
 *  @b Description
 *  @n  
 *      The function is used to send data on the specified SRIO sockets. Application
 *      developers should have created and bound the socket before calling this.
 *
 *      For messaging sockets (Type9 and Type11) the API handles both cases
 *      - Normal Sockets 
 *          The application should allocate SRIO Driver buffers  using the 
 *          'Srio_allocTransmitBuffer' API. The allocated driver buffer should then
 *          be populated by the application with the payload and then passed to this 
 *          API for transmission.
 *      - Raw Sockets    
 *          The application should pass the pointer to the buffer descriptor 
 *          to be transmitted. Ensure that the length of the the data buffer being
 *          transmitted is double word multiple as specified by Rapid IO.
 *
 *      For DIO Sockets the pointer to the driver buffer points to the location in 
 *      local memory which is involved in the DIO tranfer. To send a doorbell using
 *      the API the hDrvBuffer contains in the upper 16 bits the doorbell register
 *      and in the lower 16 bits contains the doorbell bit. The SRIO driver provides
 *      the SRIO_SET_DBELL_INFO macro for this.
 *  @sa
 *      Srio_allocTransmitBuffer, SRIO_SET_DBELL_INFO
 *
 *  @param[in]  srioSock
 *      Socket handle on which data is to be sent.
 *  @param[in]  hDrvBuffer
 *      This is the pointer to the driver buffer to be transmitted. (In the case of sending a
 *      DIO Doorbell the value is a combination of the DOORBELL register and DOORBELL bit) 
 *  @param[in]  numBytes
 *      Number of bytes to be sent. For RAW sockets this should be the size of the descriptor
 *      which is to be pushed into the transmit queue.
 *  @param[in]  to
 *      The address to which the data is to be sent.
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0 (In the case of DIO sockets this is the completion code)
 */
int32_t Srio_sockSend
(
    Srio_SockHandle         srioSock,
    Srio_DrvBuffer          hDrvBuffer,
    uint32_t                numBytes,
    Srio_SockAddrInfo*      to
)
{
    Srio_DriverInst*        ptr_srioDrvInst;
    Srio_Socket*   			ptr_srioSocket;
    uint32_t                srioInfo[2];

    /* Get the socket information. */
    ptr_srioSocket = (Srio_Socket *)srioSock;

#ifdef SRIO_DRV_DEBUG
    /* Validations: Make sure the arguments passed are valid */
    if ((hDrvBuffer == NULL) || (ptr_srioSocket == NULL) || (numBytes == 0) || (to == NULL))
        return -1;

    /* Make sure that the socket is bound */
    if (ptr_srioSocket->state != Srio_SocketState_BOUND)
        return -1;
#endif

    /* Get the pointer to the SRIO driver instance */
    ptr_srioDrvInst = ptr_srioSocket->ptr_SrioDrvInst;

    /* Check the type of socket? */
    if (ptr_srioSocket->type == Srio_SocketType_TYPE11)
    {
        Srio_Type11AddrInfo*   ptr_addr11Info;
        Srio_Type11AddrInfo*   ptr_localAddr11Info;

        /* Get the address information to where the packet is to be sent. */
        ptr_addr11Info = (Srio_Type11AddrInfo *)to;
 
        /* Get the address information to which the socket is bound. */
        ptr_localAddr11Info = (Srio_Type11AddrInfo *)&ptr_srioSocket->addrInfo;

        /* Create the SRIO Protocol Specific Information: We always support MAX Packet Size & infinite retries. */
        CSL_SRIO_SetType11PSInfo(srioInfo, ptr_addr11Info->id, ptr_localAddr11Info->id, 
                                 ptr_addr11Info->mbox, ptr_addr11Info->letter, ptr_addr11Info->tt, 0xe, 0x0);

        /* Determine if the socket is RAW or not? */
        if (ptr_srioSocket->isRawSocket == 0)
        {
        	/* Normal Mode Socket */
			Cppi_HostDesc* ptrHostDesc = (Cppi_HostDesc *)hDrvBuffer;

            /* At the end of the Host Descriptor add the SRIO specific information. */
            Cppi_setPSData (Cppi_DescType_HOST, (Cppi_Desc*)hDrvBuffer, (uint8_t*)&srioInfo[0], 8);

            /* Set the packet type: This has to be set to 31 for Type11 */
            Cppi_setPacketType(Cppi_DescType_HOST, (Cppi_Desc*)hDrvBuffer, 31);

            /* Ensure that the number of bytes being transmitted is a multiple of double-word. 
             * This is as per the specification. */
            numBytes = ((numBytes + 7) & ~0x7);
 
            /* Configure the packet length */
            Cppi_setPacketLen (Cppi_DescType_HOST, (Cppi_Desc *)hDrvBuffer, numBytes);
            Cppi_setDataLen (Cppi_DescType_HOST, (Cppi_Desc*)ptrHostDesc, numBytes);

            /* OSAL Hook: Once the descriptors have been populated; let the OSAL know that we are done. */
            Srio_osalEndDescriptorAccess ((Srio_DrvHandle)ptr_srioDrvInst, (void *)ptrHostDesc, 
                                            ptr_srioDrvInst->txDescSize);

            /* Push the transmit buffer descriptor into the Transmit Queue. */
            Qmss_queuePushDescSize (ptr_srioDrvInst->txQueue, (uint32_t*)hDrvBuffer, ptr_srioDrvInst->txDescSize);
        }
        else
        {
            /* Raw Mode Socket: Get the descriptor Type. */
            Cppi_DescType descType = Cppi_getDescType((Cppi_Desc*)hDrvBuffer);

            /* Set the protocol specific information. */
            Cppi_setPSData (descType, (Cppi_Desc*)hDrvBuffer, (uint8_t*)&srioInfo[0], 8);

            /* Set the packet type: This has to be set to 31 for Type11 */
            Cppi_setPacketType(descType, (Cppi_Desc*)hDrvBuffer, 31);

            /* OSAL Hook: Once the descriptors have been populated; let the OSAL know that we are done. */
            Srio_osalEndDescriptorAccess ((Srio_DrvHandle)ptr_srioDrvInst, (void *)hDrvBuffer, 
                                           ptr_srioDrvInst->txDescSize);

            /* Push the buffer descriptor into the transmit queue.*/
            Qmss_queuePushDescSize (ptr_srioDrvInst->txQueue, (uint32_t*)hDrvBuffer, numBytes);
        }

        /* The packet has been successfully transmitted. */
        return 0;
    }
    else if (ptr_srioSocket->type == Srio_SocketType_TYPE9)
    {
        /* Type9 Socket */
        Srio_Type9AddrInfo*   ptr_addr9Info;
        Srio_Type9AddrInfo*   ptr_localAddr9Info;

        /* Get the address information to where the packet is to be sent. */
        ptr_addr9Info = (Srio_Type9AddrInfo*)to;

        /* Get the address information to which the socket is bound. */
        ptr_localAddr9Info = (Srio_Type9AddrInfo *)&ptr_srioSocket->addrInfo;

        /* Create the SRIO Protocol Specific Information: We set the COS MASK to be 1 always. */
        CSL_SRIO_SetType9PSInfo(srioInfo, ptr_addr9Info->id, ptr_localAddr9Info->id, ptr_addr9Info->cos, 
                                0x1, ptr_addr9Info->tt, ptr_addr9Info->streamId);

        /* Determine if the socket is RAW or not? */
        if (ptr_srioSocket->isRawSocket == 0)
        {
        	/* Normal Mode Socket */
			Cppi_HostDesc* ptrHostDesc = (Cppi_HostDesc *)hDrvBuffer;

            /* Set the packet type: This has to be set to 30 for Type9 */
            Cppi_setPacketType(Cppi_DescType_HOST, (Cppi_Desc*)hDrvBuffer, 30);

            /* At the end of the Host Descriptor add the SRIO specific information. */
            Cppi_setPSData (Cppi_DescType_HOST, (Cppi_Desc*)hDrvBuffer, (uint8_t*)&srioInfo[0], 8);

            /* Ensure that the number of bytes being transmitted is a multiple of double-word. 
             * This is as per the specification. */
            numBytes = ((numBytes + 7) & ~0x7);
 
            /* Configure the packet length */
            Cppi_setPacketLen (Cppi_DescType_HOST, (Cppi_Desc *)hDrvBuffer, numBytes);
            Cppi_setDataLen (Cppi_DescType_HOST, (Cppi_Desc*)ptrHostDesc, numBytes);

            /* OSAL Hook: Once the descriptors have been populated; let the OSAL know that we are done. */
            Srio_osalEndDescriptorAccess ((Srio_DrvHandle)ptr_srioDrvInst, (void *)ptrHostDesc,
                                           ptr_srioDrvInst->txDescSize);

            /* Push the transmit buffer descriptor into the Transmit Queue. */
            Qmss_queuePushDescSize (ptr_srioDrvInst->txQueue, (uint32_t*)hDrvBuffer, ptr_srioDrvInst->txDescSize);
        }
        else
        {
            /* Raw Mode Socket: Get the descriptor Type. */
            Cppi_DescType descType = Cppi_getDescType((Cppi_Desc*)hDrvBuffer);

            /* Set the protocol specific information. */
            Cppi_setPSData (descType, (Cppi_Desc*)hDrvBuffer, (uint8_t*)&srioInfo[0], 8);

            /* Set the packet type: This has to be set to 30 for Type9 */
            Cppi_setPacketType(descType, (Cppi_Desc*)hDrvBuffer, 30);

            /* OSAL Hook: Once the descriptors have been populated; let the OSAL know that we are done. */
            Srio_osalEndDescriptorAccess ((Srio_DrvHandle)ptr_srioDrvInst, (void *)hDrvBuffer, 
                                           ptr_srioDrvInst->txDescSize);

            /* Push the buffer descriptor into the transmit queue.*/
            Qmss_queuePushDescSize (ptr_srioDrvInst->txQueue, (uint32_t*)hDrvBuffer, numBytes);
        }

        /* The packet has been successfully transmitted. */
        return 0;
    }
    else if (ptr_srioSocket->type == Srio_SocketType_DIO)
    {
        Srio_DioAddrInfo*       ptr_DioAddrInfo;
        uint8_t                 context;

        /* Get the DIO Address Information. */
        ptr_DioAddrInfo = (Srio_DioAddrInfo *)to;

        /* Make sure there is space in the Shadow registers to write */ 
        while (1)
        {
            if (CSL_SRIO_IsLSUFull (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex) == 0)
                break;
        }

        /* Get the LSU Context and Transaction Information. */
        CSL_SRIO_GetLSUContextTransaction (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex,
                                           &ptr_srioSocket->dioContext, &ptr_srioSocket->dioTransId);

        /* Setup the LSU for the data transfer: Is this a DOORBELL or not? */
        if (ptr_DioAddrInfo->ftype != Srio_Ftype_DOORBELL)
        {
            /* Non-Doorbell: Configure the LSU appropriately. */
            CSL_SRIO_SetLSUReg0 (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex, ptr_DioAddrInfo->rapidIOMSB);
            CSL_SRIO_SetLSUReg1 (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex, ptr_DioAddrInfo->rapidIOLSB);
            CSL_SRIO_SetLSUReg2 (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex, (uint32_t)hDrvBuffer);
            CSL_SRIO_SetLSUReg3 (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex,
                                 numBytes, ptr_srioSocket->lsuTransfer.doorbellValid);
            CSL_SRIO_SetLSUReg4 (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex,
                                ptr_DioAddrInfo->dstID,
                                ptr_srioSocket->lsuTransfer.srcIDMap,
                                ptr_srioSocket->lsuTransfer.idSize,
                                ptr_srioSocket->lsuTransfer.outPortID,
                                ptr_srioSocket->lsuTransfer.priority,
                                ptr_srioSocket->lsuTransfer.xambs,
                                ptr_srioSocket->lsuTransfer.supInt,
                                ptr_srioSocket->lsuTransfer.intrRequest);
            CSL_SRIO_SetLSUReg5 (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex,
                                ptr_DioAddrInfo->ttype,
                                ptr_DioAddrInfo->ftype,
                                ptr_srioSocket->lsuTransfer.hopCount,
                                ptr_srioSocket->lsuTransfer.doorbellInfo);
        }
        else
        {
            /* Doorbell: Configure the LSU appropriately. */
            uint8_t     doorbellBit;
            uint8_t     doorbellReg;
            uint16_t    doorbellInfo;

            /* Extract the doorbell register and bit information. */
            doorbellReg = SRIO_GET_DBELL_REG((uint32_t)hDrvBuffer);
            doorbellBit = SRIO_GET_DBELL_BIT((uint32_t)hDrvBuffer);

#ifdef SRIO_DRV_DEBUG    
            /* Validations: Ensure that the Doorbell register & bits are in the correct range */
            if ((doorbellReg > (MAX_DOORBELL_REG - 1)) || (doorbellBit > (MAX_DOORBELL_BIT - 1)))
                return -1;
#endif
            /* Calculate the doorbell information. */
            doorbellInfo = CSL_FMKR(3, 0, doorbellBit) | CSL_FMKR(6, 5, doorbellReg);

            /* Configure the LSU to send the Doorbell. */
            CSL_SRIO_SetLSUReg0 (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex, 0x0);
            CSL_SRIO_SetLSUReg1 (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex, 0x0);
            CSL_SRIO_SetLSUReg2 (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex, 0x0);
            CSL_SRIO_SetLSUReg3 (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex,
                                0,
                                ptr_srioSocket->doorbellTransfer.doorbellValid);
            CSL_SRIO_SetLSUReg4 (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex,
                                ptr_DioAddrInfo->dstID,
                                ptr_srioSocket->doorbellTransfer.srcIDMap,
                                ptr_srioSocket->doorbellTransfer.idSize,
                                ptr_srioSocket->doorbellTransfer.outPortID,
                                ptr_srioSocket->doorbellTransfer.priority,
                                ptr_srioSocket->doorbellTransfer.xambs,
                                ptr_srioSocket->doorbellTransfer.supInt,
                                ptr_srioSocket->doorbellTransfer.intrRequest);
            CSL_SRIO_SetLSUReg5 (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex,
                                ptr_DioAddrInfo->ttype,
                                ptr_DioAddrInfo->ftype,
                                ptr_srioSocket->doorbellTransfer.hopCount,
                                doorbellInfo);
        }

        /* Is this a blocking socket? */
        if (ptr_srioSocket->blockingSocket == 1)
        {
            /* Blocking Socket: Wait till the transfer is complete. */
            while (1)
            {
                /* Get the status of the transaction. */
                CSL_SRIO_GetLSUCompletionCode (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex,
                                               ptr_srioSocket->dioTransId,
                                               &ptr_srioSocket->dioCompletionCode, &context);

                /* Have we completed our transfer */
                if (context == ptr_srioSocket->dioContext)
                {
                    /* YES. There is no more pending transactions. */
                    ptr_srioSocket->dioTransId = 0xFF;
                    ptr_srioSocket->dioContext = 0xFF;

                    /* Return the completion code. */
                    if (ptr_srioSocket->dioCompletionCode == 0)
                        return 0;

                    /* Return the error completion code. */
                    return -(ptr_srioSocket->dioCompletionCode);
                }
            }
        }
        else
        {
            /* Non-Blocking Socket: Transfer was successfully initiated. */
            return 0;
        }
    }

    /* No other socket type is supported. */
    return -1;
}

/**
 *  @b Description
 *  @n  
 *      The function is used to receive data from the SRIO socket. For blocking
 *      sockets this API will block and will only return once data is received
 *      for non-blocking sockets the API will return 0 if no data is available.
 *      If data is available on the socket; the receive API will pass back the
 *      data to the callee. For Raw Sockets data is passed up as a buffer
 *      descriptor while for normal sockets the data is passed as pointer to 
 *      the data payload.
 *
 *      The callee is responsible for cleaning the associated receive packet 
 *      buffer. 
 *  @sa
 *      Srio_freeRxDrvBuffer, SRIO_GET_DBELL_REG, SRIO_GET_DBELL_BIT
 *
 *  @param[in]  srioSock
 *      Socket handle on which data is to be received.
 *  @param[in]  hDrvBuffer
 *      Handle to the driver buffer where the received data will be placed.
 *      For Normal sockets this points to the data buffer; for RAW sockets this
 *      points to the descriptor and for DIO sockets this has the DOORBELL 
 *      information.
 *  @param[out] from
 *      Populated with the address information of the received packet
 *
 *  @retval
 *      Success - Number of bytes of data received.
 *  @retval
 *      Error   - <0
 */
int32_t Srio_sockRecv
(
    Srio_SockHandle     srioSock,
    Srio_DrvBuffer*     hDrvBuffer,
    Srio_SockAddrInfo*  from
)
{
    Srio_Socket*            ptr_srioSocket;
    Srio_SockDataPacket*    ptr_sockData;
    int32_t                 numBytesRxed;
    void*                   criticalSectionInfo;

    /* Get the socket information. */
    ptr_srioSocket = (Srio_Socket *)srioSock;

#ifdef SRIO_DRV_DEBUG
    /* Validations: Make sure the arguments passed are valid */
    if ((ptr_srioSocket == NULL) || (hDrvBuffer == NULL) || (from == NULL))
        return -1;

    /* Make sure that the socket is bound */
    if (ptr_srioSocket->state != Srio_SocketState_BOUND)
        return -1;
#endif

    /* Loop around here forever */
    while (1)
    {
        /* Check if there are any pending packets on the socket waiting to be picked up. */
        criticalSectionInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioSocket->ptr_SrioDrvInst);
        ptr_sockData = (Srio_SockDataPacket *)Srio_listRemove ((Srio_ListNode**)&ptr_srioSocket->pendingPkts);
        Srio_osalExitSingleCoreCriticalSection(ptr_srioSocket->ptr_SrioDrvInst, criticalSectionInfo);
        if (ptr_sockData == NULL)
        {
            /* NO data available; so lets check if the socket is blocking or not? */
            if (ptr_srioSocket->blockingSocket == 1)
            {
                /* Socket is blocking and no data available. Wait for the semaphore to be available */
                Srio_osalPendSem (ptr_srioSocket->semHandle);

                /* Control comes here when the blocking socket was woken up because of 
                 * received data. So here we loop again and read the pending packet list */
                continue;
            }
            else
            {
                /* Socket is non-blocking and no data available; so here we return 0 */
                return 0;
            }
        }

        /* Record the number of bytes which have been received and the data payload */
        numBytesRxed = ptr_sockData->numBytes;
        *hDrvBuffer  = (Srio_DrvBuffer)ptr_sockData->drvBuffer;

        /* Copy the received packet information. */
        memcpy ((void*)from, (void*)&ptr_sockData->addrInfo, sizeof(Srio_SockAddrInfo));

        /* Move the packet back to the free list. */
        criticalSectionInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioSocket->ptr_SrioDrvInst);
        Srio_listAdd ((Srio_ListNode**)&ptr_srioSocket->freePkts, (Srio_ListNode*)ptr_sockData);
        Srio_osalExitSingleCoreCriticalSection(ptr_srioSocket->ptr_SrioDrvInst, criticalSectionInfo);

        /* Return the number of bytes received. */
        return numBytesRxed;
    }
}

/**
 *  @b Description
 *  @n  
 *      The function is used to clean the memory of a received SRIO packet.
 *
 *  @param[in]  srioSock
 *      SRIO socket on which the data was received
 *  @param[in]  hDrvBuffer
 *      The SRIO Driver buffer which was received by the application and now needs
 *      to be cleaned up.
 *
 *  @retval
 *  	Success     -   0
 *  @retval
 *  	Error       -   <0
 */
void Srio_freeRxDrvBuffer (Srio_SockHandle srioSock, Srio_DrvBuffer hDrvBuffer)
{
    Srio_Socket*    ptr_srioSocket;

    /* Get the socket information. */
    ptr_srioSocket = (Srio_Socket *)srioSock;
    
#ifdef SRIO_DRV_DEBUG
    if (ptr_srioSocket == NULL)
        return;
#endif

    /* Check if the socket is operating in Raw or Normal Mode? */
    if (ptr_srioSocket->isRawSocket == 0)
    {
        /* Normal Mode: Free up the received packet. */
        Srio_osalDataBufferFree ((uint8_t*)hDrvBuffer, ptr_srioSocket->ptr_SrioDrvInst->cfg.u.drvManagedCfg.rxCfg.rxMTU);
    }
    else
    {
        /* Raw Mode: Call the application specified cleanup API. */
        ptr_srioSocket->rawRxFreeDrvBuffer(hDrvBuffer);
    }
    return;
}

/**
 *  @b Description
 *  @n  
 *      The function is used to set the various configuration parameters in the 
 *      SRIO Driver.
 *
 *  @param[in]  srioSock
 *      Socket handle which needs to be configured.
 *  @param[in]  option
 *      The configuration command which is to be executed by this API
 *  @param[in]  optval
 *      The configuration data which is passed. Type of data passed is configuration command
 *      specific.
 *  @param[in]  optlen
 *      The size of the configuration data.
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
int32_t Srio_setSockOpt
(
    Srio_SockHandle     srioSock,
    Srio_Opt            option,
    void*               optval,
    int32_t             optlen
)
{
    Srio_Socket*        ptr_srioSocket;
    Srio_DriverInst*    ptr_srioDrvInst;

    /* Get the socket information. */
    ptr_srioSocket = (Srio_Socket *)srioSock;

#ifdef SRIO_DRV_DEBUG
    /* Basic Validations: Make sure a valid socket and configuration data was passed */
    if ((ptr_srioSocket == NULL) || (optval == NULL) || (optlen == 0))
        return -1;
#endif

    switch (option)
    {
        case Srio_Opt_PENDING_PKT_COUNT:
        {
            /* This option takes a 'uint16_t' configuration data */
            if (optlen == sizeof(uint16_t)) 
            {
                /* Flush Pending/Free Data Packets */
                Srio_flushSockData(ptr_srioSocket);

                /* Data looks good; set the max pending packet list. */
                ptr_srioSocket->maxPendingPackets = *(uint16_t *)optval;

                /* Reinitialize the list as per the new limits. */
                Srio_initSockData(ptr_srioSocket);

                /* Command has been processed successfully. */
                return 0;
            }
            break;
        }
        case Srio_Opt_REGISTER_DOORBELL:
        {
            uint8_t     doorbellBit;
            uint8_t     doorbellReg;
            uint16_t    doorbellInfo;
            void*       csInfo;

#ifdef SRIO_DRV_DEBUG
            /* Option is valid only for DIO sockets. */
            if (ptr_srioSocket->type != Srio_SocketType_DIO)
                break;

            /* This option takes a 'uint16_t' configuration data */
            if (optlen != sizeof(uint16_t)) 
                break;
#endif
            /* Get the doorbell information. */
            doorbellInfo = *(uint16_t *)optval;

            /* Extract the doorbell register and bit information. */
            doorbellReg = SRIO_GET_DBELL_REG((uint32_t)doorbellInfo);
            doorbellBit = SRIO_GET_DBELL_BIT((uint32_t)doorbellInfo);

#ifdef SRIO_DRV_DEBUG
            /* Validate the doorbell register and bit parameters passed. */
            if ((doorbellReg > (MAX_DOORBELL_REG - 1)) || (doorbellBit > (MAX_DOORBELL_BIT -1)))
                return -1;
#endif
            /* Get the pointer to the SRIO driver instance */
            ptr_srioDrvInst = ptr_srioSocket->ptr_SrioDrvInst;

            /* Register the doorbell and socket together. We can only map 1 socket
             * to a doorbell register and bit. So ensure that there is no existing
             * socket associated */
            if (ptr_srioDrvInst->socketDoorbellDatabase[doorbellReg][doorbellBit] != NULL)
                return -1;

            /* Single Core critical section: Map the socket */
            csInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_srioDrvInst);
            ptr_srioDrvInst->socketDoorbellDatabase[doorbellReg][doorbellBit] = (void*)ptr_srioSocket;
            Srio_osalExitSingleCoreCriticalSection(ptr_srioDrvInst, csInfo);

            /* Socket has been registered successfully. */
            return 0;
        }
    }

    /* Control comes here indicating that there was an error. */
    return -1;
}

/**
 *  @b Description
 *  @n  
 *      The function is used to get the various configuration parameters in the 
 *      SRIO Driver.
 *
 *  @param[in]  srioSock
 *      Socket handle for which configuration is required
 *  @param[in]  option
 *      The configuration command which is to be executed by this API
 *  @param[out]  optval
 *      The configuration data which is to be retreived and populated
 *  @param[in]  optlen
 *      The size of the data buffer
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
int32_t Srio_getSockOpt
(
    Srio_SockHandle     srioSock,
    Srio_Opt            option, 
    void*               optval, 
    int32_t             optlen
)
{
    Srio_Socket*    ptr_srioSocket;

    /* Get the socket information. */
    ptr_srioSocket = (Srio_Socket *)srioSock;

#ifdef SRIO_DRV_DEBUG
    /* Basic Validations: Make sure a valid socket and configuration data was passed */
    if ((ptr_srioSocket == NULL) || (optval == NULL) || (optlen == 0))
        return -1;
#endif

    switch (option)
    {
        case Srio_Opt_PENDING_PKT_COUNT:
        {
            /* This option takes a 'uint16_t' configuration data */
            if (optlen == sizeof(uint16_t)) 
            {
                /* Data looks good; set the max pending packet list. */
                *(uint16_t *)optval = ptr_srioSocket->maxPendingPackets;
                return 0;
            }
            break;
        }
        case Srio_Opt_DIO_SOCK_COMP_CODE:
        {
            uint8_t     dioCompletionCode;
            uint8_t     context;

#ifdef SRIO_DRV_DEBUG
            /* Option is valid only for DIO sockets. */
            if (ptr_srioSocket->type != Srio_SocketType_DIO)
                break;

            /* This option takes a 'uint8_t' configuration data */
            if (optlen != sizeof(uint8_t)) 
                break;
#endif
            /* Is there a pending DIO transaction on the socket? */
            if (ptr_srioSocket->dioTransId == 0xFF)
            {
                /* NO. We simply return the last completion code. */
                *(uint8_t *)optval = ptr_srioSocket->dioCompletionCode;
                return 0;
            }

            /* Get the status of the socket transaction. */
            CSL_SRIO_GetLSUCompletionCode (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex,
                                           ptr_srioSocket->dioTransId, &dioCompletionCode, &context);

            /* Check if this matches our context? */ 
            if (context == ptr_srioSocket->dioContext)
            {
                /* Yes this is our result. There are no more pending transactions. */
                ptr_srioSocket->dioTransId = 0xFF;
                ptr_srioSocket->dioContext = 0xFF;
                ptr_srioSocket->dioCompletionCode = dioCompletionCode;
                *(uint8_t *)optval = dioCompletionCode;
            }
            else
            {
                /* No. This is not our result the context does not match. */
                *(uint8_t *)optval = 0xFF;
            }

            /* Option has been successfully handled. */
            return 0; 
        }
    }

    /* Control comes here indicating that there was an error. */
    return -1;
}

/**
 *  @b Description
 *  @n  
 *      The function is used to close a SRIO socket.
 *
 *  @param[in]  srioSock
 *      Socket handle to be closed.
 *
 *  @retval
 *      Success - 0
 *  @retval
 *      Error   - <0
 */
int32_t Srio_sockClose (Srio_SockHandle srioSock)
{
    Srio_Socket*        ptr_srioSocket;
    Srio_DriverInst*    ptr_SrioDrvInst;
    void*               csInfo;

    /* Get the socket information. */
    ptr_srioSocket = (Srio_Socket *)srioSock;

    /* Validations: Make sure the arguments passed are valid. */
    if (ptr_srioSocket == NULL)
        return -1;

    /* Get the socket driver instance. */
    ptr_SrioDrvInst = ptr_srioSocket->ptr_SrioDrvInst;

    /* CRITICAL SECTION: Remove the socket from the list of sockets associated with the driver instance. */
    csInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_SrioDrvInst);
    Srio_listRemoveNode ((Srio_ListNode**)&ptr_SrioDrvInst->socketList, (Srio_ListNode*)ptr_srioSocket);
    Srio_osalExitSingleCoreCriticalSection(ptr_SrioDrvInst, csInfo);

    /* Flush the socket data. */
    Srio_flushSockData (ptr_srioSocket);

    /* If the socket was a blocking socket; we delete the semaphore */
    if (ptr_srioSocket->blockingSocket == 1)
        Srio_osalDeleteSem (ptr_srioSocket->semHandle);

    /* Determine the type of the socket which is being closed. */
    if (ptr_srioSocket->type == Srio_SocketType_TYPE11)
    {
        SRIO_MESSAGE    messageType11;

        /* This will ensure that the RXU Mapping registers for Type11 are configured 
         * to the reset values */
        messageType11.mbxMask = CSL_SRIO_RIO_RXU_MAP_L_MBX_MASK_RESETVAL;
        messageType11.ltrMask = CSL_SRIO_RIO_RXU_MAP_L_LTR_MASK_RESETVAL;        
        messageType11.mbx     = CSL_SRIO_RIO_RXU_MAP_L_MBX_RESETVAL;
        messageType11.ltr     = CSL_SRIO_RIO_RXU_MAP_L_LTR_RESETVAL;
        messageType11.srcId   = CSL_SRIO_RIO_RXU_MAP_L_SRCID_RESETVAL;
        messageType11.dstId   = CSL_SRIO_RIO_RXU_MAP_H_DEST_ID_RESETVAL;
        messageType11.dstProm = CSL_SRIO_RIO_RXU_MAP_H_DEST_PROM_RESETVAL;
        messageType11.tt      = CSL_SRIO_RIO_RXU_MAP_H_TT_RESETVAL;
        messageType11.srcProm = CSL_SRIO_RIO_RXU_MAP_H_SRC_PROM_RESETVAL;
        messageType11.segMap  = 1  ;  //   CSL_SRIO_RIO_RXU_MAP_H_SEG_MAP_RESETVAL;
        messageType11.flowId  = 0x0;
 
        /* Configure the Type11 Mapping; this will unbind the socket and place the RXU Entry back to the 
         * reset values. */
        CSL_SRIO_MapMessageToQueue (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex, &messageType11, 0x0);

        /* CRITICAL Section Start: The SOCKET Table is a shared resource and here we need to protect
         * this only from other cores doing a concurrent read or write operation. This is because the
         * SOCKET Map and BIND Index was guranteed to be unique (During sockOpen and sockBind). When
         * we are closing the socket we need to ensure that only other SOCK Open & Binds on other cores
         * dont happen at the same time as we free up this socket. */
        csInfo = Srio_osalEnterMultipleCoreCriticalSection();

        /* Invalidate the Cache Contents. */
        Srio_osalBeginMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));

        /* Clear the socket status mapping. */
        gSRIODriverMCB.sockStatusTable[ptr_srioSocket->sockIndex] = 0;

        /* Clear the binding mapping. */
        gSRIODriverMCB.mappingStatusType9Type11[ptr_srioSocket->mapIndex] = 0;

        /* Writeback the cache. */
        Srio_osalEndMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));

        /* CRITICAL Section End */
        Srio_osalExitMultipleCoreCriticalSection (csInfo);
    }
    else if (ptr_srioSocket->type == Srio_SocketType_TYPE9)
    {
        SRIO_TYPE9_MESSAGE  messageType9;

        /* This will ensure that the RXU Mapping registers for Type9 are configured 
         * to the reset values. */
        messageType9.cosMask    = CSL_SRIO_RIO_RXU_TYPE9_MAP0_COS_MASK_RESETVAL;
        messageType9.cos        = CSL_SRIO_RIO_RXU_TYPE9_MAP0_COS_RESETVAL;
        messageType9.srcId      = CSL_SRIO_RIO_RXU_TYPE9_MAP0_SRCID_RESETVAL;
        messageType9.dstId      = CSL_SRIO_RIO_RXU_TYPE9_MAP1_DEST_ID_RESETVAL;
        messageType9.dstProm    = CSL_SRIO_RIO_RXU_TYPE9_MAP1_DEST_PROM_RESETVAL;
        messageType9.tt         = CSL_SRIO_RIO_RXU_TYPE9_MAP1_TT_RESETVAL;
        messageType9.srcProm    = CSL_SRIO_RIO_RXU_TYPE9_MAP1_SRC_PROM_RESETVAL;
        messageType9.streamId   = CSL_SRIO_RIO_RXU_TYPE9_MAP2_STRM_ID_RESETVAL;
        messageType9.streamMask = CSL_SRIO_RIO_RXU_TYPE9_MAP2_STRM_MASK_RESETVAL;
        messageType9.flowId     = 0;

        /* Configure the Type9 Mapping; this will unbind the socket and place the RXU Entry back to the 
         * reset values. */
        CSL_SRIO_MapType9MessageToQueue (gSRIODriverMCB.hSrio, ptr_srioSocket->mapIndex, &messageType9, 0x0);

        /* CRITICAL Section Start: The SOCKET Table is a shared resource and here we need to protect
         * this only from other cores doing a concurrent read or write operation. This is because the
         * SOCKET Map and BIND Index was guranteed to be unique (During sockOpen and sockBind). When
         * we are closing the socket we need to ensure that only other SOCK Open & Binds on other cores
         * dont happen at the same time as we free up this socket. */
        csInfo = Srio_osalEnterMultipleCoreCriticalSection();

        /* Invalidate the Cache Contents. */
        Srio_osalBeginMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));

        /* Clear the socket status mapping. */
        gSRIODriverMCB.sockStatusTable[ptr_srioSocket->sockIndex] = 0;

        /* Clear the binding mapping. */
        gSRIODriverMCB.mappingStatusType9Type11[ptr_srioSocket->mapIndex] = 0;

        /* Writeback the cache. */
        Srio_osalEndMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));

        /* CRITICAL Section End */
        Srio_osalExitMultipleCoreCriticalSection (csInfo);
    }
    else 
    {
        /* DIO Socket. */
        uint8_t     doorbellReg = 0;
        uint8_t     doorbellBit = 0;

        /* CRITICAL Section Start: The Socket Doorbell Database is a shared resource across the
         * same core. We need to ensure that this is protected while we remove all references of 
         * the socket from the database. */
        csInfo = Srio_osalEnterSingleCoreCriticalSection(ptr_SrioDrvInst);
        for (doorbellReg = 0; doorbellReg < MAX_DOORBELL_REG; doorbellReg++)
        {
            for (doorbellBit = 0; doorbellBit < MAX_DOORBELL_BIT; doorbellBit++)
            {
                /* Is this Doorbell register and bit mapped to our socket. */
                if (ptr_SrioDrvInst->socketDoorbellDatabase[doorbellReg][doorbellBit] == ptr_srioSocket)    
                    ptr_SrioDrvInst->socketDoorbellDatabase[doorbellReg][doorbellBit] = NULL;
            }
        }
        Srio_osalExitSingleCoreCriticalSection(ptr_SrioDrvInst, csInfo);

        /* CRITICAL Section Start: The SOCKET Table is a shared resource and here we need to protect
         * this only from other cores doing a concurrent read or write operation. This is because the
         * SOCKET Map and BIND Index was guranteed to be unique (During sockOpen and sockBind). When
         * we are closing the socket we need to ensure that only other SOCK Open & Binds on other cores
         * dont happen at the same time as we free up this socket. */
        csInfo = Srio_osalEnterMultipleCoreCriticalSection();

        /* Invalidate the Cache Contents. */
        Srio_osalBeginMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));
 
        /* Clear the mapping */
        gSRIODriverMCB.lsuStatus[ptr_srioSocket->mapIndex] = 0;
        gSRIODriverMCB.sockStatusTable[ptr_srioSocket->sockIndex] = 0;

        /* Writeback the cache. */
        Srio_osalEndMemAccess(&gSRIODriverMCB, sizeof(gSRIODriverMCB));

        /* CRITICAL Section End */
        Srio_osalExitMultipleCoreCriticalSection (csInfo);
    }

    /* The socket memory can now be cleaned up. */
    Srio_osalFree(ptr_srioSocket, sizeof(Srio_Socket));
    return 0;
}

/**
 *  @b Description
 *  @n  
 *      The function is used to get the version information of the SRIO Driver.
 *
 *  @retval
 *      Version Information.
 */
uint32_t Srio_getVersion (void)
{
    return SRIO_DRV_VERSION_ID;
}

/**
 *  @b Description
 *  @n  
 *      The function is used to get the version string for the SRIO driver.
 *
 *  @retval
 *      Version String.
 */
const char* Srio_getVersionStr (void)
{
    return gSrioDriverVersionStr;
}

/**
@}
*/

