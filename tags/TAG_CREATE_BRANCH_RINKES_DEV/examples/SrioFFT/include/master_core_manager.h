/*
 * master_core_manager.h
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

#ifndef MASTER_CORE_MANAGER_H_
#define MASTER_CORE_MANAGER_H_
/*
 * #includes
 */
#include <c6x.h>
/*
 * Typedefs and enums
 */
typedef enum {
	CORE_STATE_MASTER,
	CORE_STATE_UNKNOWN,
	CORE_STATE_PENDING,
	CORE_STATE_READY,
	CORE_STATE_BUSY,
	CORE_STATE_COMPLETE
}CORE_STATE;


typedef enum {
	CORE_IS_AVAILABLE,
	CORE_NOT_AVAILABLE
}CORE_AVAILABLE;

typedef enum {
	CORE_STATUS_OK,
	CORE_STATUS_ERROR
}CORE_STATUS;

/*
 * Module Functions
 */
void coreStateInit(uint8_t);
CORE_AVAILABLE getAvaliableCore(uint8_t*);
CORE_AVAILABLE getReadyCore(uint8_t*);
CORE_AVAILABLE getAvailableCore(uint8_t*);
CORE_STATUS markCorePending(uint8_t);
CORE_STATUS markCoreReady(uint8_t);
CORE_STATUS markCoreBusy(uint8_t);
CORE_STATUS markCoreComplete(uint8_t);
CORE_STATE getCoreState(uint8_t);


#endif /* MASTER_CORE_MANAGER_H_ */
