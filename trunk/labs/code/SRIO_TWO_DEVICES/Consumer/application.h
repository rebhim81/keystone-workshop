/*
 * application.h
 *
 *  Created on: Nov 10, 2011
 *      Author: a0270985
 */

#ifndef APPLICATION_H_
#define APPLICATION_H_
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include <stdio.h>




extern   short    twiddle_128[256]  ;
extern  short     twiddle_256[512]  ;
extern  short     twiddle_512[1024]  ;
extern  short     twiddle_1024[2048]  ;
extern  short     twiddle_64[128]  ;
extern  short     twiddle_32[64]  ;

extern unsigned char parameter1   ;

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

extern void   initializeBufferControl(short* in1, bufferControl_t control[], int numberBUffers) ;
extern short * getNextfreeBuffer(bufferControl_t control[]);
extern void   freeBuffer(short * in, bufferControl_t control[]);

extern short fftBuffer[MAX_FFT_SIZE*2*NUM_FFT_BUFFER]  ;
extern short * prepareData(short *buffer, int *N ) ;
extern void    generateShortInput (int numberOfElements, int numSinWaves, short *p_out) ;
extern void    seperateRealImg (int N, short *y, short *Y_real , short * y_imag) ;


extern void  DSP_fft16x16(const short *restrict, int, short *restrict, short *restrict);

extern int gen_twiddle_fft16x16 ( short *w,int n);


extern   short  z_short[8][2*MAX_FFT_SIZE] ;
extern   short  xxx[8][2*MAX_FFT_SIZE] ;

extern   short  y_short[8][MAX_FFT_SIZE] ;


extern   short  x_short[8][MAX_FFT_SIZE] ;









#endif /* APPLICATION_H_ */
