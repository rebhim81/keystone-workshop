/*
 * firMain.c
 *
 *      This file applies different types of filters on a long sequence
 *      of complex single precision elements and sum it
 *
 *      The algorithm is the following:
 *
 *      First a complex single precision vector of size INPUT_SIZE is built using the routine
 *      generateData(__float2_t *pp1, int N)
 *      Next a complex filter of size 2 with coefficients (1/2 1/4) (-1/2 -1/4) is applied and the energy of the
 *      result vector is summed and returned
 *      Next a complex filter of size 4 is applied, and then size 8 and then size 16
 *
 *      We run two functions for each value -
 *      The first one is standard C
 *      The second one is C with intrinsic
 *      We compare the results and  print out the time
 *
 *
 */

#include "test.h"

#pragma DATA_SECTION (inputComplex, ".L2")
#pragma DATA_ALIGN (inputComplex,32768)

float inputComplex[2*NUMBER_OF_ELEMENTS];

#pragma DATA_SECTION (outputEnergy1, ".DDR")
float outputEnergy1[NUMBER_OF_FILTERS];

#pragma DATA_SECTION (outputEnergy2, ".DDR")
float outputEnergy2[NUMBER_OF_FILTERS];

void main()
{
	int nn;
	long t1, t2, t_dif;
	t1 = clock();
	t2 = clock();
	t_dif = t2 - t1;

	CACHE_setL1DSize(CACHE_L1_32KCACHE);
//	CACHE_setL2Size(CACHE_L2_128KCACHE);


	generateData( (float *) inputComplex, 2*NUMBER_OF_ELEMENTS);

    nn  = NUMBER_OF_ELEMENTS;

//	for (nn=512; nn <= NUMBER_OF_ELEMENTS; nn = nn * 2)
	{
	   t1 = clock();
	   naturalC_filters(inputComplex, nn, outputEnergy1 );
	   t2 = clock();

	   printf("natural C code size   %d  time %d \n",nn,  t2 - t1 - t_dif);
	}
//	printPower(outputEnergy1, NUMBER_OF_FILTERS  );

//	for (nn=512; nn <= NUMBER_OF_ELEMENTS; nn = nn * 2)
	{
	   t1 = clock();
	   intrinsicC_filters(inputComplex, nn, outputEnergy2 );
	   t2 = clock();

	   printf("intrinsic C code size   %d  time %d \n",nn,  t2 - t1 - t_dif);


	}

	compareValues(outputEnergy1, outputEnergy2,NUMBER_OF_FILTERS );
	printf("   \n\n    DONE    \n\n" );



}

