/*
 * fftRoutines.c
 *
 *  Created on: Sep 30, 2011   DSP_fft16x16
 *      Author: a0270985
 */


#include <stdint.h>
#include <math.h>
#include "bioInclude.h"




   short  cccc  = 0    ;
void generateShortInput (int numberOfElements, int numSinWaves, short *p_out)
{

    int32_t i, j;

    float sinWaveIncFreq;
    float sinWaveMag  ;

    float  pi  ;

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








