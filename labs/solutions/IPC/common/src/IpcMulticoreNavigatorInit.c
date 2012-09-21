#include "../include/IpcMulticoreNavigatorInit.h"

/* Multicore Navigator Specific */
/* Queue Manager */
#include <ti/drv/qmss/qmss_drv.h>
#include <ti/drv/qmss/qmss_firmware.h>
#include <ti/transport/ipc/qmss/transports/TransportQmss.h>

/* Packet DMA */
#include <ti/drv/cppi/cppi_drv.h>

/* Include the Device Configuration Files */
#include <ti/drv/qmss/device/qmss_device.c>
#include <ti/drv/cppi/device/cppi_device.c>

#define NUM_MONOLITHIC_DESC 	numDescriptors
#define SIZE_MONOLITHIC_DESC	descriptorSize
#define MONOLITHIC_DESC_DATA_OFFSET 16

/* Descriptor Pool */
#pragma DATA_SECTION (monolithicDesc, ".desc");
#pragma DATA_ALIGN (monolithicDesc, 16);
Uint8	monolithicDesc[SIZE_MONOLITHIC_DESC * NUM_MONOLITHIC_DESC];

/******************************************************************************
 * SYSTEM INITIALIZATION
 *****************************************************************************/
Int32 systemInit (Void)
{
  Qmss_InitCfg qmssInitConfig;   /* QMSS configuration */
  Qmss_MemRegInfo memInfo; /* Memory region configuration information */
  Qmss_Result result;
  UInt32 coreNum;

  coreNum = CSL_chipReadReg (CSL_CHIP_DNUM);

  memset ((Void *) &qmssInitConfig, 0, sizeof (Qmss_InitCfg));

  /* Set up the linking RAM. Use the internal Linking RAM.
   * LLD will configure the internal linking RAM address and maximum internal linking RAM size if
   * a value of zero is specified.
   * Linking RAM1 is not used */
  qmssInitConfig.linkingRAM0Base = 0;
  qmssInitConfig.linkingRAM0Size = 0;
  qmssInitConfig.linkingRAM1Base = 0;
  qmssInitConfig.maxDescNum      = NUM_MONOLITHIC_DESC /*+ total of other descriptors here */;

#ifdef xdc_target__bigEndian
  qmssInitConfig.pdspFirmware[0].pdspId = Qmss_PdspId_PDSP1;
  qmssInitConfig.pdspFirmware[0].firmware = (void *) &acc48_be;
  qmssInitConfig.pdspFirmware[0].size = sizeof (acc48_be);
#else
  qmssInitConfig.pdspFirmware[0].pdspId = Qmss_PdspId_PDSP1;
  qmssInitConfig.pdspFirmware[0].firmware = (void *) &acc48_le;
  qmssInitConfig.pdspFirmware[0].size = sizeof (acc48_le);
#endif

  /* Initialize Queue Manager SubSystem */
  result = Qmss_init (&qmssInitConfig, &qmssGblCfgParams[0]);
  if (result != QMSS_SOK)
  {
      System_printf ("Error Core %d : Initializing Queue Manager SubSystem error code : %d\n", coreNum, result);
      return -1;
  }

  result = Cppi_init (&cppiGblCfgParams[0]);
  if (result != CPPI_SOK)
  {
      System_printf ("Error Core %d : Initializing CPPI LLD error code : %d\n", coreNum, result);
  }


  /* Setup memory region for monolithic descriptors */
  memset ((Void *) &monolithicDesc, 0, SIZE_MONOLITHIC_DESC * NUM_MONOLITHIC_DESC);
  memInfo.descBase       = (UInt32 *) monolithicDesc;	/* descriptor pool is in MSMC */
  memInfo.descSize       = SIZE_MONOLITHIC_DESC;
  memInfo.descNum        = NUM_MONOLITHIC_DESC;
  memInfo.manageDescFlag = Qmss_ManageDesc_MANAGE_DESCRIPTOR;
  memInfo.memRegion      = (Qmss_MemRegion) descriptorMemRegion;
  memInfo.startIndex     = 0;

  result = Qmss_insertMemoryRegion (&memInfo);
  if (result < QMSS_SOK)
  {
      System_printf ("Error Core %d : Inserting memory region %d error code : %d\n", coreNum, memInfo.memRegion, result);
      return -1;
  }
  else
  {
      System_printf ("Core %d : Memory region %d inserted\n", coreNum, result);
  }

  /* Writeback the descriptor pool.  Writeback all data cache.
    * Wait until operation is complete. */
  Cache_wb (monolithicDesc, SIZE_MONOLITHIC_DESC * NUM_MONOLITHIC_DESC, Cache_Type_ALLD, TRUE);

  return 0;
}

void initPlatform(void)
{
  platform_init_flags  pFormFlags;
  platform_init_config pFormConfig;
  /* Status of the call to initialize the platform */
  UInt32 pFormStatus;

  /* Only run on single core */
  if (CSL_chipReadReg (CSL_CHIP_DNUM) == 0)
  {
    /*
     * You can choose what to initialize on the platform by setting the following
     * flags. Things like the DDR, PLL, etc should have been set by the boot loader.
    */
    memset( (void *) &pFormFlags,  0, sizeof(platform_init_flags));
    memset( (void *) &pFormConfig, 0, sizeof(platform_init_config));

    pFormFlags.pll = 0; /* PLLs for clocking  	*/
    pFormFlags.ddr  = 0; /* External memory 		*/
    pFormFlags.tcsl = 1; /* Time stamp counter 	*/
    pFormFlags.phy  = 0; /* Ethernet 			*/
    pFormFlags.ecc  = 0; /* Memory ECC 			*/

    pFormConfig.pllm = 0;	/* Use libraries default clock divisor */

    pFormStatus = platform_init(&pFormFlags, &pFormConfig);

    /* If we initialized the platform okay */
    if (pFormStatus != Platform_EOK)
    {
  	 /* Initialization of the platform failed. */
  	 System_printf("Platform failed to initialize. Error code %d \n", pFormStatus);
    }
  }
}
