#
_XDCBUILDCOUNT = 
ifneq (,$(findstring path,$(_USEXDCENV_)))
override XDCPATH = C:/ti/pdk_C6678_1_0_0_15/packages;C:/ti/ipc_1_23_01_26/packages;C:/ti/ndk_2_20_04_26/packages;C:/ti/bios_6_32_04_49/packages;C:/ti/xdais_7_21_01_07/packages;C:/ti/xdais_7_21_01_07/examples;C:/ti/edma3_lld_02_11_02_04/packages;C:/ti/dsplib_c66x_3_0_0_8/packages
override XDCROOT = C:/ti/xdctools_3_22_04_46
override XDCBUILDCFG = ./config.bld
endif
ifneq (,$(findstring args,$(_USEXDCENV_)))
override XDCARGS = 
override XDCTARGETS = 
endif
#
ifeq (0,1)
PKGPATH = C:/ti/pdk_C6678_1_0_0_15/packages;C:/ti/ipc_1_23_01_26/packages;C:/ti/ndk_2_20_04_26/packages;C:/ti/bios_6_32_04_49/packages;C:/ti/xdais_7_21_01_07/packages;C:/ti/xdais_7_21_01_07/examples;C:/ti/edma3_lld_02_11_02_04/packages;C:/ti/dsplib_c66x_3_0_0_8/packages;C:/ti/xdctools_3_22_04_46/packages;..
HOSTOS = Windows
endif
