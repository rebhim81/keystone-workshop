/*
 * application.c
 *
 *  Created on: Nov 10, 2011
 *      Author: a0270985  DSP_fft16x16
 */

#include  "bioInclude.h"
#include "application.h"



#pragma DATA_ALIGN   (twiddle_32, 128)
#pragma DATA_SECTION (twiddle_32, ".twiddleFactor");
short     twiddle_32[64]  ;

#pragma DATA_ALIGN   (twiddle_64, 128)
#pragma DATA_SECTION (twiddle_64, ".twiddleFactor");
short      twiddle_64[128]  ;


#pragma DATA_ALIGN   (twiddle_128, 128)
#pragma DATA_SECTION (twiddle_128, ".twiddleFactor");
short     twiddle_128[256]  ;

#pragma DATA_ALIGN   (twiddle_256, 128)
#pragma DATA_SECTION (twiddle_256, ".twiddleFactor");
short      twiddle_256[512]  ;

#pragma DATA_ALIGN   (twiddle_512, 128)
#pragma DATA_SECTION (twiddle_512, ".twiddleFactor");
short      twiddle_512[1024]  ;


#pragma DATA_ALIGN   (twiddle_1024, 128)
#pragma DATA_SECTION (twiddle_1024, ".twiddleFactor");
short      twiddle_1024[2048]  ;



#pragma DATA_ALIGN   (fftInputBuffer, 128)
#pragma DATA_SECTION (fftInputBuffer, ".fftInput");
short      fftInputBuffer[8][SRIO_MAX_MTU/2]  ;   //  move from char to short


#pragma DATA_ALIGN   (fftOutputBuffer, 128)
#pragma DATA_SECTION (fftOutputBuffer, ".fftInput");
short      fftOutputBuffer[8][SRIO_MAX_MTU/2]  ;   //  move from char to short

#pragma DATA_ALIGN   (x_ref_float, 128)
#pragma DATA_SECTION (x_ref_float, ".fftInput");
   float  x_ref_float[2*MAX_FFT_SIZE] ;





#pragma DATA_ALIGN   (y_short, 128)
#pragma DATA_SECTION (y_short, ".fftInput");
   short  y_short[8][MAX_FFT_SIZE] ;

#pragma DATA_ALIGN   (x_short, 128)
#pragma DATA_SECTION (x_short, ".fftInput");
   short  x_short[8][MAX_FFT_SIZE] ;



void generateApplicationData(short *pp,  char *parameter1)
{
	int numberOfElements;
	int numSinWaves  ;




	    int32_t i, j;

	    float sinWaveIncFreq;
	    float sinWaveMag  ;

	    float  pi  ;

	    int   powerOfSize, size, numberOfSin   ;
	    int   interval   ;
	    interval = rand()  % (MAX_FFT_POWER-MIN_FFT_POWER + 1 );
	    powerOfSize = interval + MIN_FFT_POWER    ;
	    *parameter1 = powerOfSize  ;
	    size = 1 << powerOfSize ;
	    numberOfElements = size  ;
	    numSinWaves = 3 + rand() % MAX_SIM     ;
	    //	System_printf(" generating input size %d #sin %d buffer %x \n",size, numberOfSin, buffer );



	    pi = 4.0 * (float)atan(1.0)  ;

	    /* Calculate the incremental freq for each sin wave */

	    sinWaveIncFreq = (pi)/(numSinWaves*(float)1.0);

	    /* Calculate the magnitude for each sin wave */

	    sinWaveMag = (float)1.0/(numSinWaves * (float)1.0*numberOfElements);

	    /* Create the input array as sum of the various sin wave data */

	    for (j = 0; j < numSinWaves; j++)
	    {

	        for (i = 0; i < numberOfElements; i++)
	        {

	            x_ref_float[2*i] += sinWaveMag * (float)cos(sinWaveIncFreq*j*i);

	            x_ref_float[2*i + 1] = (float) 0.0;

	        }
	    }

	    /* Convert the floating point data to reference fixed point data */

	    for (i = 0; i < numberOfElements; i++)
	    {
	    	*pp++   = (short)  (x_ref_float[2*i] * CONVERT_TO_SHORT) ;
	    	*pp++   = (short) ( x_ref_float[2*i + 1] * CONVERT_TO_SHORT);

	    }




}

