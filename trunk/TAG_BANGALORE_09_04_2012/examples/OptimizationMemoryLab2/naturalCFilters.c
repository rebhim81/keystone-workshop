/*
 * application.c
 *
 *  Created on: Mar 7, 2012
 *      Author: a0270985
 */

#include "test.h"



 void naturalC_filters(float *inputComplex, int N_E, float *output )
  {
 	 int i,j   ;

 	 float x_real [MAX_FILTER_SIZE]  ;
 	 float x_imag [MAX_FILTER_SIZE]  ;

 	 float y_real   ;
 	 float y_imag   ;

 	 float z_real   ;
 	 float z_imag   ;



 	 float *p_in    ;
 	 int filter_size   ;
 	 float sum_r, sum_i   ;
 	 float total_sum  ;



//////////////////////////////////////////////////////////////////////////////////////
///      First filter,  coefficients are (1/2 -1/2) (-1/2 1/2)
 	 p_in = inputComplex  ;
 	 filter_size = 2   ;
 	 x_real[0] = 0.5   ;
 	 x_imag[0] = -0.5 ;

 	 x_real[1] = -0.5   ;
 	 x_imag[1] = 0.5 ;

 	 for (i=0; i < N_E; i = i + 2*filter_size)
 	 {
 		 sum_r = 0.0   ;
 		 sum_i = 0.0  ;
 		 for (j=0; j < filter_size; j++)
 		 {
 			 y_real = *p_in++   ;
 			 y_imag = *p_in++  ;
 			 z_real = y_real * x_real[j] - y_imag * x_imag[j] ;
			 z_imag = y_real * x_imag[j] + y_imag * x_real[j] ;
			 sum_r = sum_r + z_real   ;
			 sum_i = sum_i + z_imag   ;
 		 }

 	 }
 	 total_sum = sum_r * sum_r + sum_i * sum_i    ;
 	 *output++ = total_sum  ;

 /////   End of filter 1
 //////////////////////////////////////////////////////////////////////////////////

 	//////////////////////////////////////////////////////////////////////////////////////
 	///      Second filter,  coefficients are (1/4 -1/4) (1/2 -1/2) (-1/4 1/4) (-1/2 1/2)
 	 	 p_in = inputComplex  ;
 	 	 filter_size = 4   ;
 	 	 x_real[0] = 0.25   ;
 	 	 x_imag[0] = -0.25 ;

 	 	 x_real[1] = 0.5   ;
 	 	 x_imag[1] = -0.5 ;

	 	 x_real[2] = -0.25   ;
 	 	 x_imag[2] = 0.25 ;

 	 	 x_real[3] = -0.5   ;
 	 	 x_imag[3] = 0.5 ;



 	 	 for (i=0; i < N_E; i = i + 2*filter_size)
 	 	 {
 	 		 sum_r = 0.0   ;
 	 		 sum_i = 0.0  ;
 	 		 for (j=0; j < filter_size; j++)
 	 		 {
 	 			 y_real = *p_in++   ;
 	 			 y_imag = *p_in++  ;
 	 			 z_real = y_real * x_real[j] - y_imag * x_imag[j] ;
 				 z_imag = y_real * x_imag[j] + y_imag * x_real[j] ;
 				 sum_r = sum_r + z_real   ;
 				 sum_i = sum_i + z_imag   ;
 	 		 }

 	 	 }
 	 	 total_sum = sum_r * sum_r + sum_i * sum_i    ;
 	 	 *output++ = total_sum  ;

 	 /////   End of filter 2
 	 //////////////////////////////////////////////////////////////////////////////////

 	 	//////////////////////////////////////////////////////////////////////////////////////
 	 	///      third filter,  coefficients are (1/4 -1/4) (1/2 -1/2) (-1/4 1/4) (-1/2 1/2)
 	 	 	 p_in = inputComplex  ;
 	 	 	 filter_size = 8   ;
 	 	 	 x_real[0] = 0.5   ;
 	 	 	 x_imag[0] = -0.5 ;

 	 	 	 x_real[1] = 1.0   ;
 	 	 	 x_imag[1] = -1.0 ;

 		 	 x_real[2] = 0.5   ;
 	 	 	 x_imag[2] = -0.5 ;

 	 	 	 x_real[3] = 0.0   ;
 	 	 	 x_imag[3] = 0.0 ;

	 	 	 x_real[4] = -0.5   ;
 	 	 	 x_imag[4] = 0.5 ;

 	 	 	 x_real[5] = -1.0   ;
 	 	 	 x_imag[5] = 1.0 ;

 		 	 x_real[6] = -0.5   ;
 	 	 	 x_imag[6] = 0.5 ;

 	 	 	 x_real[7] = 0.0   ;
 	 	 	 x_imag[7] = 0.0 ;

 	 	 	 for (i=0; i < N_E; i = i + 2*filter_size)
 	 	 	 {
 	 	 		 sum_r = 0.0   ;
 	 	 		 sum_i = 0.0  ;
 	 	 		 for (j=0; j < filter_size; j++)
 	 	 		 {
 	 	 			 y_real = *p_in++   ;
 	 	 			 y_imag = *p_in++  ;
 	 	 			 z_real = y_real * x_real[j] - y_imag * x_imag[j] ;
 	 				 z_imag = y_real * x_imag[j] + y_imag * x_real[j] ;
 	 				 sum_r = sum_r + z_real   ;
 	 				 sum_i = sum_i + z_imag   ;
 	 	 		 }

 	 	 	 }
 	 	 	 total_sum = sum_r * sum_r + sum_i * sum_i    ;
 	 	 	 *output++ = total_sum  ;

 	 	 /////   End of filter 3
 	 	 //////////////////////////////////////////////////////////////////////////////////
	 	 	 p_in = inputComplex  ;
 	 	 	 filter_size = 16   ;
 	 	 	 x_real[0] = 0.25   ;
 	 	 	 x_imag[0] = -0.25 ;

 	 	 	 x_real[1] = 0.5   ;
 	 	 	 x_imag[1] = -0.5 ;

 		 	 x_real[2] = 0.75   ;
 	 	 	 x_imag[2] = -0.75 ;

 	 	 	 x_real[3] = 1.0   ;
 	 	 	 x_imag[3] = -1.0 ;

	 	 	 x_real[4] = 0.75   ;
 	 	 	 x_imag[4] = -0.75 ;

 	 	 	 x_real[5] = 0.5   ;
 	 	 	 x_imag[5] = -0.5 ;

 		 	 x_real[6] = 0.25   ;
 	 	 	 x_imag[6] = -0.25 ;

 	 	 	 x_real[7] = 0.0   ;
 	 	 	 x_imag[7] = 0.0 ;

	 	 	 x_real[8] = -0.25   ;
 	 	 	 x_imag[8] = 0.25 ;

 	 	 	 x_real[9] = -0.5   ;
 	 	 	 x_imag[9] = 0.5 ;

 		 	 x_real[10] = -0.75   ;
 	 	 	 x_imag[10] = 0.75 ;

 	 	 	 x_real[11] = -1.0   ;
 	 	 	 x_imag[11] = 1.0 ;

	 	 	 x_real[12] = -0.75   ;
 	 	 	 x_imag[12] = 0.75 ;

 	 	 	 x_real[13] = -0.5   ;
 	 	 	 x_imag[13] = 0.5 ;

 		 	 x_real[14] = -0.25   ;
 	 	 	 x_imag[14] = 0.25 ;

 	 	 	 x_real[15] = 0.0   ;
 	 	 	 x_imag[15] = 0.0 ;






 	 	 	 for (i=0; i < N_E; i = i + 2*filter_size)
 	 	 	 {
 	 	 		 sum_r = 0.0   ;
 	 	 		 sum_i = 0.0  ;
 	 	 		 for (j=0; j < filter_size; j++)
 	 	 		 {
 	 	 			 y_real = *p_in++   ;
 	 	 			 y_imag = *p_in++  ;
 	 	 			 z_real = y_real * x_real[j] - y_imag * x_imag[j] ;
 	 				 z_imag = y_real * x_imag[j] + y_imag * x_real[j] ;
 	 				 sum_r = sum_r + z_real   ;
 	 				 sum_i = sum_i + z_imag   ;
 	 	 		 }

 	 	 	 }
 	 	 	 total_sum = sum_r * sum_r + sum_i * sum_i    ;
 	 	 	 *output++ = total_sum  ;

 	 	 /////   End of filter 3
 	 	 //////////////////////////////////////////////////////////////////////////////////

  }



