/*
 * test.h
 *
 *  Created on: Feb 10, 2012
 *      Author: a0270985
 */

#ifndef TEST_H_
#define TEST_H_

#include  <stdio.h>
#include <stdlib.h>
#include <math.h>

#include <time.h>

#include <stdio.h>
#include "c6x.h"

#include <csl_cacheAux.h>



#define  NUMBER_OF_ELEMENTS     32768   // 512 // 16384    //(8192)
#define  NUMBER_OF_FILTERS        (4)
#define  MAX_FILTER_SIZE          16






extern void	 generateData(float *pp1, int N)  ;
extern void printPower(float * outputEnergy1, int N  ) ;
extern  void naturalC_filters(float *inputComplex, int N_E, float *output ) ;
extern  void intrinsicC_filters(float *inputComplex, int N_E, float *output ) ;
extern void 	compareValues(float *p1, float *p2, int  nn ) ;
extern __float2_t   complexMultiply(__float2_t x, __float2_t  y)   ;


#endif /* TEST_H_ */
