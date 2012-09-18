

#include "test.h"

__float2_t   complexMultiply(__float2_t x, __float2_t  y)
{
	return _complex_mpysp(y,x);
}



#define EPSILON          0.010

void 	compareValues(float *p1, float *p2, int  nn )
{
	int   i;
	int flag = 0;
	float  d , x, y;
	for (i=0; i < nn; i++)
	{
		x = *p1++;
		y =  *p2++;
		d = x - y;
		if (d < 0.0) d = -d;
		if (d > x*EPSILON)
		{
		    printf("error i = %d x = %f     y = %f  \n", x,y);
		    flag = 1;
		}
	}
	if (flag == 0)
	{
		  printf("no error was found  !!!   \n");
	}
}


void printPower(float * output, int N  )
{
	int i;
	for (i=0; i<N; i++)
	{
		printf("power of filter %d is %f  \n", i, *output++);
	}
}


void generateData( float *pp1, int N)

{
	int i;
    float *p;
    long x;
    float  y;
    p = (float *) pp1;
	for (i=0; i<N; i++)
	{

		x = rand() - RAND_MAX/2;
		y = (float) (x);
		*p++ = y;


	}
}


