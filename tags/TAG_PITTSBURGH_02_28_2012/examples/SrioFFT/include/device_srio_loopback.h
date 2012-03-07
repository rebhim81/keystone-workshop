/*
 * device_srio_loopback.h
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

#ifndef DEVICE_SRIO_LOOPBACK_H_
#define DEVICE_SRIO_LOOPBACK_H_
#include <c6x.h>

#define DEVICE_ID1_16BIT	0xBEEF
#define DEVICE_ID1_8BIT		0xAB
#define DEVICE_ID2_16BIT	0x4560
#define DEVICE_ID2_8BIT		0xCD
#define DEVICE_ID3_16BIT	0x1234
#define DEVICE_ID3_8BIT		0x12
#define DEVICE_ID4_16BIT	0x5678
#define DEVICE_ID4_8BIT		0x56
#define DEVICE_ID5_16BIT	0x1357
#define DEVICE_ID5_8BIT		0x13
#define DEVICE_ID6_16BIT	0x9bdf
#define DEVICE_ID6_8BIT		0x9B
#define DEVICE_ID7_16BIT	0x147a
#define DEVICE_ID7_8BIT		0x14
#define DEVICE_ID8_16BIT	0xd147
#define DEVICE_ID8_8BIT		0xd1

/*
 * Module Definitions
 */
int32_t SrioDevice_init (void);



#endif /* DEVICE_SRIO_LOOPBACK_H_ */
