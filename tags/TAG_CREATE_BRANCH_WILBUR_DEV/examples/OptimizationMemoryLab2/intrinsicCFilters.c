/*
 * application.c
 *
 *  Created on: Mar 7, 2012
 *      Author: a0270985
 */

#include "test.h"





 void intrinsicC_filters(float *inputComplex, int N_E, float *output )
  {
 	 int i,j   ;


 	 __float2_t  x[MAX_FILTER_SIZE]   ;
 	 __float2_t  y,z   ;





 	__float2_t *p_in    ;
 	 int filter_size   ;
 	 __float2_t  sum  ;
 	 float total_sum  ;



//////////////////////////////////////////////////////////////////////////////////////
///      First filter,  coefficients are (1/2 -1/2) (-1/2 1/2)
 	 p_in = (__float2_t *) inputComplex  ;
 	 filter_size = 2   ;
 	 x[0] =  _ftof2(0.5, -0.5) ;
 	 x[1] =  _ftof2(-0.5, 0.5) ;

//#pragma MUST_ITERATE (128)
 	 for (i=0; i < N_E; i = i + 2*filter_size)
 	 {
 		 sum =_ftof2(0.0, 0.0) ;

 		 for (j=0; j < filter_size; j++)
 		 {

 			 y = _mem8_f2(p_in++)  ;
 	       	 z = complexMultiply(y,x[j])   ;
 	       	 sum = _daddsp(sum, z)    ;
 		 }

 	 }
 	 total_sum =  _hif2(sum) *  _hif2(sum) +    _lof2(sum) *_lof2(sum)  ;
 	 *output++ = total_sum  ;

 /////   End of filter 1
 //////////////////////////////////////////////////////////////////////////////////

 	//////////////////////////////////////////////////////////////////////////////////////
 	///      Second filter,  coefficients are (1/4 -1/4) (1/2 -1/2) (-1/4 1/4) (-1/2 1/2)
 	 	 p_in = (__float2_t *)inputComplex  ;
 	 	 filter_size = 4   ;


 	 	 x[0] =  _ftof2(0.25, -0.25) ;
 	 	 x[1] =  _ftof2(0.5, -0.5) ;
	 	 x[2] =  _ftof2(-0.25, 0.25) ;
 	 	 x[3] =  _ftof2(-0.5, 0.5) ;
//#pragma MUST_ITERATE (64)
 	 	 for (i=0; i < N_E; i = i + 2*filter_size)
 	 	 {
 	 		 sum =_ftof2(0.0, 0.0) ;

 	 		 for (j=0; j < filter_size; j++)
 	 		 {

 	 			 y = _mem8_f2(p_in++)  ;
 	 	       	 z = complexMultiply(y,x[j])   ;
 	 	       	 sum = _daddsp(sum, z)    ;
 	 		 }

 	 	 }
 	 	 total_sum =  _hif2(sum) *  _hif2(sum) +    _lof2(sum) *_lof2(sum)  ;
 	 	 *output++ = total_sum  ;


 	 /////   End of filter 2
 	 //////////////////////////////////////////////////////////////////////////////////

 	 	//////////////////////////////////////////////////////////////////////////////////////
 	 	///      third filter,  coefficients are (1/4 -1/4) (1/2 -1/2) (-1/4 1/4) (-1/2 1/2)
 	 	 	 p_in = (__float2_t *) inputComplex  ;
 	 	 	 filter_size = 8   ;

	 	 	 x[0] =  _ftof2(0.5, -0.5) ;

	 	 	 x[1] =  _ftof2(1.0, -1.0) ;

		 	 x[2] =  _ftof2(0.5, -0.5) ;

 		 	 x[3] =  _ftof2(0.0, 0.0) ;


	 	 	 x[4] =  _ftof2(-0.5, 0.5) ;

	 	 	 x[5] =  _ftof2(-1.0, 1.0) ;


		 	 x[6] =  _ftof2(-0.5, 0.5) ;
		 	 x[7] =  _ftof2(0.0, 0.0) ;





//#pragma MUST_ITERATE (32)
 	 	 	 for (i=0; i < N_E; i = i + 2*filter_size)
 	 	 	 {
 	 	 		 sum =_ftof2(0.0, 0.0) ;

 	 	 		 for (j=0; j < filter_size; j++)
 	 	 		 {

 	 	 			 y = _mem8_f2(p_in++)  ;
 	 	 	       	 z = complexMultiply(y,x[j])   ;
 	 	 	       	 sum = _daddsp(sum, z)    ;
 	 	 		 }

 	 	 	 }
 	 	 	 total_sum =  _hif2(sum) *  _hif2(sum) +    _lof2(sum) *_lof2(sum)  ;
 	 	 	 *output++ = total_sum  ;


 	 	 /////   End of filter 3
 	 	 //////////////////////////////////////////////////////////////////////////////////











 	 	 	 p_in = (__float2_t *) inputComplex  ;
 	 	 	 filter_size = 16   ;

	 	 	 x[0] =  _ftof2(0.25, -0.25) ;
		 	 x[1] =  _ftof2(0.5, -0.5) ;
		 	 x[2] =  _ftof2(0.75, -0.75) ;
	 	 	 x[3] =  _ftof2(1.0, -1.0) ;
		 	 x[4] =  _ftof2(0.75, -0.75) ;
		 	 x[5] =  _ftof2(0.5, -0.5) ;
	 	 	 x[6] =  _ftof2(0.25, -0.25) ;
 		 	 x[7] =  _ftof2(0.0, 0.0) ;
	 	 	 x[8] =  _ftof2(-0.25, 0.25) ;
		 	 x[9] =  _ftof2(-0.5, 0.5) ;
		 	 x[10] =  _ftof2(-0.75, 0.75) ;
	 	 	 x[11] =  _ftof2(-1.0, 1.0) ;
		 	 x[12] =  _ftof2(-0.75, 0.75) ;
		 	 x[13] =  _ftof2(-0.5, 0.5) ;
	 	 	 x[14] =  _ftof2(-0.25, 0.25) ;
		 	 x[15] =  _ftof2(0.0, 0.0) ;





//#pragma MUST_ITERATE (16)
 	 	 	 for (i=0; i < N_E; i = i + 2*filter_size)
 	 	 	 {
 	 	 		 sum =_ftof2(0.0, 0.0) ;

 	 	 		 for (j=0; j < filter_size; j++)
 	 	 		 {

 	 	 			 y = _mem8_f2(p_in++)  ;
 	 	 	       	 z = complexMultiply(y,x[j])   ;
 	 	 	       	 sum = _daddsp(sum, z)    ;
 	 	 		 }

 	 	 	 }
 	 	 	 total_sum =  _hif2(sum) *  _hif2(sum) +    _lof2(sum) *_lof2(sum)  ;
 	 	 	 *output++ = total_sum  ;

 	 	 /////   End of filter 3
 	 	 //////////////////////////////////////////////////////////////////////////////////

  }



