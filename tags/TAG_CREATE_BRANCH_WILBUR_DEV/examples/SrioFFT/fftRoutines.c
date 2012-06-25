/*
 * fftRoutines.c
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
#include <fftRoutines.h>
#include <masterTask.h>
#include <stdint.h>
#include <math.h>

/*
 * Extern Variables
 */
extern int32_t 				firstSendStart;

/*
 * File Level Globals
 */

#pragma DATA_ALIGN   (x_ref_float, 128)
#pragma DATA_SECTION (x_ref_float, ".fftInput");
float  x_ref_float[2*MAX_FFT_SIZE] ;

#pragma DATA_ALIGN   (xxx, 128)
#pragma DATA_SECTION (xxx, ".fftInput");
int16_t  xxx[8][2*MAX_FFT_SIZE] ;

#pragma DATA_ALIGN   (z_short, 128)
#pragma DATA_SECTION (z_short, ".fftInput");
int16_t  z_short[8][2*MAX_FFT_SIZE] ;

#pragma DATA_ALIGN   (y_short, 128)
#pragma DATA_SECTION (y_short, ".fftInput");
int16_t  y_short[8][MAX_FFT_SIZE] ;

#pragma DATA_ALIGN   (x_short, 128)
#pragma DATA_SECTION (x_short, ".fftInput");
int16_t  x_short[8][MAX_FFT_SIZE] ;

int16_t	z_short[8][2 * MAX_FFT_SIZE] ;
int16_t	xxx[8][2 * MAX_FFT_SIZE] ;
int16_t	y_short[8][MAX_FFT_SIZE] ;
int16_t	x_short[8][MAX_FFT_SIZE] ;



   short  cccc  = 0    ;
void generateShortInput (int numberOfElements, int numSinWaves, short *p_out)
{

    //int32_t i, j;
	int32_t i;
    //float sinWaveIncFreq;
    //float sinWaveMag  ;

    //float  pi  ;

#if  0
    pi = 4.0 * (float)atan(1.0)  ;

    /* Calculate the incremental freq for each sin wave */

    sinWaveIncFreq = (pi)/(numSinWaves*(float)1.0);

    /* Calculate the magnitude for each sin wave */

    sinWaveMag = (float)1.0/(numSinWaves * (float)1.0*numberOfElements);

    /* Create the input array as sum of the various sin wave data */

    for (j = 0; j < numSinWaves; j++) {

        for (i = 0; i < numberOfElements; i++) {

            x_ref_float[2*i] += sinWaveMag * (float)cos(sinWaveIncFreq*j*i);

            x_ref_float[2*i + 1] = (float) 0.0;

        }
    }

    /* Convert the floating point data to reference fixed point data */

    for (i = 0; i < numberOfElements; i++) {
       *p_out++  = (short)  (x_ref_float[2*i] * CONVERT_TO_SHORT) ;
        *p_out++ = (short) ( x_ref_float[2*i + 1] * CONVERT_TO_SHORT);

    }
#else

    *p_out++ = 0   ;
    *p_out++ = 0  ;
    for (i = 1; i < numberOfElements; i++) {
    	cccc = cccc + 1   ;
       *p_out++  =  cccc ;
     	cccc = cccc + 1   ;
        *p_out++ = cccc;
    }


#endif

}






void seperateRealImg (int N, short *y, short *y_real , short * y_imag)
{
    int32_t i, j;

    for (i = 0, j = 0; j < N; i+=2, j++)
    {

        y_real[j] = y[i];

        y_imag[j] = y[i + 1];

    }

}


