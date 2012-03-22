#
_XDCBUILDCOUNT = 
ifneq (,$(findstring path,$(_USEXDCENV_)))
override XDCPATH = C:/ti/ipc_1_24_00_16/packages;C:/dev/example_apps/vlfft/vlfft;C:/ti/bios_6_32_05_54/packages;C:/ti/edma3_lld_02_11_02_04/packages;C:/ti/mcsdk_2_00_05_17/demos
override XDCROOT = C:/ti/xdctools_3_22_04_46
override XDCBUILDCFG = ./config.bld
endif
ifneq (,$(findstring args,$(_USEXDCENV_)))
override XDCARGS = 
override XDCTARGETS = 
endif
#
ifeq (0,1)
PKGPATH = C:/ti/ipc_1_24_00_16/packages;C:/dev/example_apps/vlfft/vlfft;C:/ti/bios_6_32_05_54/packages;C:/ti/edma3_lld_02_11_02_04/packages;C:/ti/mcsdk_2_00_05_17/demos;C:/ti/xdctools_3_22_04_46/packages;..
HOSTOS = Windows
endif
