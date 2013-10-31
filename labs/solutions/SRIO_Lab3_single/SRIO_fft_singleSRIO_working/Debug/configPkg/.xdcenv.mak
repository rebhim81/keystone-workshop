#
_XDCBUILDCOUNT = 
ifneq (,$(findstring path,$(_USEXDCENV_)))
override XDCPATH = C:/ti/pdk_C6678_1_1_0_3/packages;C:/ti/ipc_1_24_03_32/packages;C:/ti/bios_6_33_06_50/packages;C:/ti/xdais_7_21_01_07/packages;C:/ti/xdais_7_21_01_07/examples;C:/ti/edma3_lld_02_11_05_02/packages;C:/ti/dsplib_c66x_3_1_0_0/packages;C:/ti/ccsv5/ccs_base
override XDCROOT = C:/ti/xdctools_3_23_04_60
override XDCBUILDCFG = ./config.bld
endif
ifneq (,$(findstring args,$(_USEXDCENV_)))
override XDCARGS = 
override XDCTARGETS = 
endif
#
ifeq (0,1)
PKGPATH = C:/ti/pdk_C6678_1_1_0_3/packages;C:/ti/ipc_1_24_03_32/packages;C:/ti/bios_6_33_06_50/packages;C:/ti/xdais_7_21_01_07/packages;C:/ti/xdais_7_21_01_07/examples;C:/ti/edma3_lld_02_11_05_02/packages;C:/ti/dsplib_c66x_3_1_0_0/packages;C:/ti/ccsv5/ccs_base;C:/ti/xdctools_3_23_04_60/packages;..
HOSTOS = Windows
endif
