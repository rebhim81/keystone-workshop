/*
 * MAPX_utilities.c
 *
 *  Created on: Jan 29, 2013
 *      Author: a0270985
 *
 *      This file has a set of utilities to manipulate the MPAX registers
 *      The first application is to give any core private memory in DDR
 *
 */

#include <stdio.h>
#include <c6x.h>
#include <ti/csl/csl_chip.h>
#include <ti/csl/csl_cacheAux.h>
#include <ti/csl/csl_psc.h>
#include <ti/csl/csl_pscAux.h>
#include <ti/csl/csl_semAux.h>

void stay()
{
	while (1)    	asm ("    NOP (9)")  ;
}
void ranDelay(Int32 N)
{
	int  i,j,k    ;
	for (k=0; k<N; k++)
	{
		for (j=0; j<1000; j++)
		{
			for (i=0; i < 2500; i++)
				asm ("    NOP (9)")  ;
		}
	}
}

void  printDone(int coreNum)
{
	 printf("Core %d is Done   -> %d   \n",coreNum)  ;
}

void printValueUnsigned (unsigned int xx)
{
	 printf("Unsigned Value   -> %08x   \n",xx)  ;
}

void printMPAXRegisters()
{
	int   i   ;
	uint32_t x1, x2   ;
	volatile uint32_t* lvMarPtr;

   lvMarPtr = (volatile uint32_t*)0x08000000;
   for (i=0; i < 16; i++)
   {
	   x1 = *lvMarPtr++   ;
	   x2 = *lvMarPtr++   ;
	   printf("MPAX register %d -> %08x %08x  \n", i,x1,x2)  ;
   }
}


void printMPAXOneRegisters(int nn)
{
	int   i   ;
	uint32_t x1, x2   ;
	volatile uint32_t* lvMarPtr;

   lvMarPtr = (volatile uint32_t*)0x08000000;
   for (i=0; i < 16; i++)
   {
	   x1 = *lvMarPtr++   ;
	   x2 = *lvMarPtr++   ;
	   if (i==nn)  printf("MPAX register %d -> %08x %08x  \n", i,x1,x2)  ;
   }
}




/*
 *
 *  AddNewMPAXSegment(int registerNumber,
 *                    unsigned int LogicBaseAddress,
 *                    unsigned int PhysicBaseAddress,
 *                    unsigned int  permissions,
 *                    int logOfSize)
 *
 *  Where
 *  registerNumber - from 0 to 15  (MPAX register = memory segment)
 *  LogicBaseAddress    32-bits of base address of logical memory
 *  PhysicBaseAddress    32-bits MSB of base address of physical memory
 *  permissions    -   see table 7-3 at CorePac user guide:  S-Supervisor, U user, read, write execute
 *                      Reserved Reserved SR SW SX UR UW UX
 *  logOfSize - as appeared in table 7-4 of corepac user guide, that is -
 *                         1 minus the log of the size, minimum 4k (12 -1 = 11 = 01011  )
 *                                                      maximum 4G (32 - 1 = 31 = 1 1111 )
 *
 *  Note:
 *  default Values of the MPAX registers

	  Register 0      H 0000001e   L   000000bf

	  segment size 5 LST of H   0 1e -> 2GB
	  Base address (logic) 0x00000 000
	  Physical address 0 0000 0000
	  Permission      bf -> 1011 1111

	  Register 1     H 8000001e  L  800000bf
	  segment size 5 LST of H   0 1e -> 2GB
	  Base address (logic) 0x80000 000
	  Physical address 8 0000 0000
	  Permission      bf -> 1011 1111

	  register 2    H 2100000b   L 100000ff
	  segment size 5 LST of H   0 b -> 4KB
	  Base address (logic) 0x2100000 0
	  Physical address 1 0000 0000
	  Permission      ff -> 1111 1111


     Note2   - when multiple registers points to the same logical address,
	 the higher register is the one that does the translation



 */
void  AddNewMPAXSegment(int registerNumber,
                    unsigned int LogicBaseAddress,
                     unsigned int PhysicBaseAddress,
                     unsigned int  permissions,
                     int logOfSize)
{

	int   i   ;
	uint32_t xH, xL   ;
	uint32_t  a1,a2,a3   ;
	volatile uint32_t* lvMarPtr;

   lvMarPtr = (volatile uint32_t*)0x08000000;

///    Build xH   logical base address and size
   a1 = (unsigned int) LogicBaseAddress   ;
   a2 = a1 & 0xfffff000     ;   // last 12 bits are 0
   a3 = (unsigned int) logOfSize  ;
   if (a3 < 11)
   {
	   printf("wrong size value \n")  ;
	   exit(1)     ;
   }
   if (a3 > 31)
   {
	   printf("wrong size value \n")  ;
	   exit (1)    ;
   }
   xH = a2 | a3    ;   //  logical address and size

   a1 = (unsigned int) PhysicBaseAddress   ;
   a2 = a1 & 0xffffff00     ;   // last 8 bits are 0
   a3 = (unsigned int) permissions  ;

   if (a3 > 0x3f)
   {
	   printf("wrong permission value \n")  ;
	   exit (1)    ;
   }
   xL = a2 | a3    ;   //   PHysical address and permission

   //   find the pointer to the register
   i = 2 * registerNumber    ;
   lvMarPtr =   lvMarPtr +   i   ;
   *lvMarPtr++ =   xL    ;
   *lvMarPtr++ =   xH    ;


}


/*********************************************************************
 *
 * privateDDRNoCache(unsigned int baseAddress,
 *                   int logOfSize,
 *                   int numberOfCores,
 *                   int firstRegisterNumber,
 *                   int core)
 *
 * Where
 * baseAddress - the base address of the area that is dedicated for private memory.
 *               must be on MAR region boundary
 * logOfSize        - log base 2 - 1 size of private memory for each core.
 *                    The total size of the memory is size *numberOfCores
 *             - must be one of the values in table 7-4 of CorePac user guide, between 11 and 31
 * numberOfCores  - how many private segments will be defined
 * firstRegisterNumber - the first MPAX register to be used, just in case we call this function multiple times
 *
 * Note  - The function uses the MAR registers to disable cache of the private memory.
 *         If the base address is not on MAR register boundary, the behavior is undefined
 *
 *
 * Note - iThis function must be called from all cores
 *
 */

void privateDDRNoCache(unsigned int baseAddress,
		int logOfSize,
		int numberOfCores,
		int firstRegisterNumber,
		int core)
{
	unsigned int physicalAddress , logicalAddress  ;
	int   i  ;
	unsigned int permissions = 0x3f   ;
	volatile uint32_t* lvMarPtr;
	unsigned int a1, a2, a3, a4 , a5  ;
	unsigned int marValue , marCount  ;
	unsigned int size    ;



	logicalAddress = baseAddress  ;


/* Physical address translation:
*  logical 8000 0000   - 8 0000 0000
*  logical ffff ffff   - 8 7fff ffff
*
*  so building the physical address from logical address is done as follows
*  step 1 mask out bit 31 (most MSB) of logical address
*  Step 2 - shift by 4
*  Step 3 - or with 8000 0000
*  Step 4  - add the core based offset, This is the size multiple by the core number shifted by 4
*  Step 5 - mask out the lower 8 bits to zero
*  *****************************************************/
	a1 = logicalAddress & 0x7fffffff     ;  //  step  1
	a2 = a1 >> 4                         ;  //  Step 2
	a3 = a2 | 0x80000000                 ; // Step 3

	size = (1 << logOfSize)    ;
	a4 = (size * core) >> 4       ;      //  step 4
	a5 = a3 + a4                  ;      //  Step 4
	physicalAddress = a5 & 0xfffffff0  ;  //  Step 5

	AddNewMPAXSegment(firstRegisterNumber,
			logicalAddress,
			physicalAddress,
			permissions,
			logOfSize - 1)   ;

//   next find the MAR register and disable cache and pre-fetch
    marValue = logicalAddress >> 24    ;  // each MAR register covers 16M = 24 bits
	lvMarPtr = (volatile uint32_t*)0x01848000; //


//  How many MAR registers are involved?  - this is the size divide by 16M

    marCount = (size >> 24)  + 1    ;
   lvMarPtr = (volatile uint32_t*)lvMarPtr + marValue ;
   for (i=0; i < marCount; i++)
   {
        *lvMarPtr++   =   0    ;
   }

}
