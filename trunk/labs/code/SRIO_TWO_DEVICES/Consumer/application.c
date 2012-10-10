/*
 * application.c
 *
 *  Created on: Nov 10, 2011
 *      Author: a0270985
 */

#include  "bioInclude.h"
#include "application.h"
#include <dsplib.h>



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


void applicationCode (unsigned char *p, char parameter1, int coreNum)
{
	//    parameter1 is the power of 2 in the fft
        int  processingSize   ;
        const short *restrict  pw    ;
        processingSize = 1 << parameter1   ;
//                System_printf (" 12  processingBuffer %x \n", processingBuffer);

        *p = *(p+1)   ;
        *(p+1) = 0   ;
        memcpy(fftInputBuffer[coreNum], p,4*processingSize)  ;




        if (processingSize == 32)   pw =  (const short *restrict)twiddle_32 ;
        if (processingSize == 64)    pw =  (const short *restrict)twiddle_64 ;
        if (processingSize == 128)    pw =  (const short *restrict)twiddle_128 ;
        if (processingSize == 256)    pw =  (const short *restrict)twiddle_256 ;
        if (processingSize == 512)    pw =  (const short *restrict)twiddle_512 ;
        if (processingSize == 1024)    pw =  (const short *restrict)twiddle_1024 ;

//                printStartEnd(xxx[coreNum], 2*processingSize);
        DSP_fft16x16(pw, processingSize,  fftInputBuffer[coreNum] , fftOutputBuffer[coreNum] );

        seperateRealImg (processingSize, fftOutputBuffer[coreNum], x_short[coreNum] , y_short[coreNum]);
        System_printf("fft size %d output %x real %x imag %x \n",
         processingSize	 ,fftOutputBuffer[coreNum], x_short[coreNum] , y_short[coreNum] )  ;
///
///      If TOKEN is received, the core is going to do processing for a long but random time
//                  srand ( coreNum *12345 + time(NULL) );
//                  randomValue = PROCESSING_BASE + ( rand() % PROCESSING_INTERVAL )  ;
//                 System_printf("core %d random Delay %d \n",coreNum, randomValue  );
        ranDelay  (processingSize);



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



