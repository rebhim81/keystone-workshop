#
_XDCBUILDCOUNT = 
ifneq (,$(findstring path,$(_USEXDCENV_)))
override XDCPATH = C:/ti/edma3_lld_02_11_05_02/packages;C:/ti/framework_components_3_22_00_05/packages;C:/ti/framework_components_3_22_00_05/examples;C:/ti/ipc_1_24_03_32/packages;C:/ti/mcsdk_bios_3_00_00_07/demos;C:/ti/pdk_C6678_1_1_2_5/packages;C:/ti/bios_6_33_05_46/packages;C:/projects/developNew/MPAX_registersDemo;C:/ti/ccsv5/ccs_base
override XDCROOT = C:/ti/xdctools_3_24_05_48
override XDCBUILDCFG = ./config.bld
endif
ifneq (,$(findstring args,$(_USEXDCENV_)))
override XDCARGS = 
override XDCTARGETS = 
endif
#
ifeq (0,1)
PKGPATH = C:/ti/edma3_lld_02_11_05_02/packages;C:/ti/framework_components_3_22_00_05/packages;C:/ti/framework_components_3_22_00_05/examples;C:/ti/ipc_1_24_03_32/packages;C:/ti/mcsdk_bios_3_00_00_07/demos;C:/ti/pdk_C6678_1_1_2_5/packages;C:/ti/bios_6_33_05_46/packages;C:/projects/developNew/MPAX_registersDemo;C:/ti/ccsv5/ccs_base;C:/ti/xdctools_3_24_05_48/packages;..
HOSTOS = Windows
endif
