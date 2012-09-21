#ifndef IPCMULTICORENAVIGATORINIT_H_
#define IPCMULTICORENAVIGATORINIT_H_
#include <xdc/std.h>
#include <xdc/cfg/global.h>

#include <xdc/runtime/System.h>
#include <xdc/runtime/IHeap.h>


#include <ti/ipc/MultiProc.h>
#include <ti/ipc/MessageQ.h>
#include <ti/ipc/SharedRegion.h>

#include <ti/platform/platform.h>

#include <ti/sysbios/Bios.h>
#include <ti/sysbios/family/c66/Cache.h>

#include <ti/csl/csl_chip.h>
#include <stdlib.h>
#include <time.h>

Int32 systemInit (Void);
void initPlatform(void);

#endif /* IPCMULTICORENAVIGATORINIT_H_ */
