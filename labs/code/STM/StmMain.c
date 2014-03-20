/**
 * 
*/


//#include <xdc/runtime/Log.h>
//#include <xdc/runtime/Diags.h>
#include "system_trace.h"
extern STMHandle *pSTMHandle;


#define   MAX_LOOP    100000

void main(Void)
{
    long a1, a2, a3, a4, a5  ;

    int i, i1, i2   ;
    

    initializeMain(0);

    a1 = 5  ;
    i1 = 0   ;

    for (i=0 ; i < MAX_LOOP ; i++)
    {
    	a2 = a1 + i   ;

    	a3 = a2 *3    ;
    	a1 = a3 + a2   ;
    	if (a1 > 128)
    	{
    		//   print i, a1, a2 and a3
    		//   print x1, x2, x3 x4
    	 STMXport_logMsg1(pSTMHandle, STMCH_STATUS,
    			        "i value  %d \0", i);
    	 STMXport_logMsg2(pSTMHandle, STMCH_STATUS,
    			        "a1  %d a2   %d  \0", a1, a2);
    	 STMXport_logMsg1(pSTMHandle, STMCH_STATUS,
    			        "a3  %d \0", a3);
     	 STMXport_logMsg0(pSTMHandle, STMCH_STATUS,
       			 "End a IF changes  \0");


    		a1 = 5    ;

         	 STMXport_logMsg1(pSTMHandle, STMCH_STATUS,
           			 "DONE  number %d !!!!  \0", i1);
         	 i1++  ;
    	}

    }



}
