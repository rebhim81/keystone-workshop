#include <stdio.h>
#include <sched.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>

volatile unsigned int k;

int my_thread(void *arg)
{
	int thr_num = (int)arg;

	printf("We just started this thread [%d]; cpu[%d]\n", thr_num, sched_getcpu());
	while(1)
	{
		sleep(1);
//		delay(1000);
		printf("[%d] Thread [%d] runs on cpu[%d]\n", time(NULL), thr_num, sched_getcpu());
	}

	return 0;
}

#define STACK_SIZE 0x10000

int main()
{
	char *stack;
	int j;

	printf("[%d] We are going to clone a new thread\n", sched_getcpu());

	for (j=1; j<5; j++)
	{ 	
		if ((stack = malloc(STACK_SIZE)) == NULL)
		{
			printf("Cannot allocate stack for a new thread [%d]\n", j);
			return -1;
		}	

		if (clone(my_thread, stack+STACK_SIZE, CLONE_VM | CLONE_FS | CLONE_SIGHAND , (void *) j ) == -1)
		{
			printf("Cannot start a new thread [%d]\n", j);
			return -1;
		}	
	}

	printf("[%d] main on[%d]: just started a new thread\n", time(NULL),  sched_getcpu());
	while(1)
	{
		sleep(1);
//		delay(1000);
		printf("[%d] main run on cpu [%d]\n", time(NULL),  sched_getcpu());
	}
	
	return 0;
}


