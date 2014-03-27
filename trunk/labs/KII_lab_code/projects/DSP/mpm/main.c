/*
 * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *    Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 *    Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the
 *    distribution.
 *
 *    Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

/*
 * This is a unit test code for the DSP image loaded by MPM server
 * main.c
 * Version: 02.00.00.00
 */
#include <c6x.h>
#include <stdio.h>
#include <stdint.h>
#include <xdc/std.h>
#include <xdc/runtime/System.h>

#define CORE_NO (DNUM + 1)

int global_variable = 0;

void main(void)
{

	int  i,j,k,l,m   ;
	i = 5;
	for (m=0; m < 1000; m++)
	{
		j = i + m;
		i = i + 3 * j  ;
		if ( i > 5000)
		{
			System_printf("Hello, I am core %d and i is more than 5000 %d\n",CORE_NO , i);
			System_printf("and m is  %d\n", m);
			i = 5  ;
		}
	}

	System_printf("Main started on core %d\n", CORE_NO);




	while(1){
		if(global_variable != CORE_NO) {
			global_variable = CORE_NO;
			System_printf("Setting 'global_variable' to %d\n", CORE_NO);
		}
	}
}
