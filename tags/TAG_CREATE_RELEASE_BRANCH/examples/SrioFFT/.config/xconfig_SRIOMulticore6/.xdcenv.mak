#
_XDCBUILDCOUNT = 
ifneq (,$(findstring path,$(_USEXDCENV_)))
override XDCPATH = C:/PROGRA~1/TEXASI~1/pdk_C6678_1_0_0_12/packages;C:/PROGRA~1/TEXASI~1/ipc_1_23_01_26/packages;C:/PROGRA~1/TEXASI~1/ndk_2_20_04_26/packages;C:/PROGRA~1/TEXASI~1/omp_1_00_00_15_eng/packages;C:/PROGRA~1/TEXASI~1/bios_6_32_01_38/packages;C:/PROGRA~1/TEXASI~1/xdais_7_20_00_07/packages;C:/PROGRA~1/TEXASI~1/xdais_7_20_00_07/examples;C:/PROGRA~1/TEXASI~1/edma3_lld_02_11_02_04/packages;C:/PROGRA~1/TEXASI~1/pdk_C6678_1_0_0_12/packages/ti/drv/Example2/srioMUlticore_6/.config
override XDCROOT = C:/PROGRA~1/TEXASI~1/xdctools_3_22_01_21
override XDCBUILDCFG = ./config.bld
endif
ifneq (,$(findstring args,$(_USEXDCENV_)))
override XDCARGS = 
override XDCTARGETS = 
endif
#
ifeq (0,1)
PKGPATH = C:/PROGRA~1/TEXASI~1/pdk_C6678_1_0_0_12/packages;C:/PROGRA~1/TEXASI~1/ipc_1_23_01_26/packages;C:/PROGRA~1/TEXASI~1/ndk_2_20_04_26/packages;C:/PROGRA~1/TEXASI~1/omp_1_00_00_15_eng/packages;C:/PROGRA~1/TEXASI~1/bios_6_32_01_38/packages;C:/PROGRA~1/TEXASI~1/xdais_7_20_00_07/packages;C:/PROGRA~1/TEXASI~1/xdais_7_20_00_07/examples;C:/PROGRA~1/TEXASI~1/edma3_lld_02_11_02_04/packages;C:/PROGRA~1/TEXASI~1/pdk_C6678_1_0_0_12/packages/ti/drv/Example2/srioMUlticore_6/.config;C:/PROGRA~1/TEXASI~1/xdctools_3_22_01_21/packages;..
HOSTOS = Windows
endif
