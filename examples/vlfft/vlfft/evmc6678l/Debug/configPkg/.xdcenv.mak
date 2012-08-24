#
_XDCBUILDCOUNT = 
ifneq (,$(findstring path,$(_USEXDCENV_)))
override XDCPATH = C:/ti/ipc_1_24_02_27/packages;C:/dev/keystone-workshop/trunk/examples/vlfft/vlfft;C:/ti/bios_6_33_02_31/packages;C:/ti/edma3_lld_02_11_02_04/packages;C:/ti/mcsdk_2_00_09_21/demos;C:/ti/ccsv5/ccs_base
override XDCROOT = C:/ti/xdctools_3_23_01_43
override XDCBUILDCFG = ./config.bld
endif
ifneq (,$(findstring args,$(_USEXDCENV_)))
override XDCARGS = 
override XDCTARGETS = 
endif
#
ifeq (0,1)
PKGPATH = C:/ti/ipc_1_24_02_27/packages;C:/dev/keystone-workshop/trunk/examples/vlfft/vlfft;C:/ti/bios_6_33_02_31/packages;C:/ti/edma3_lld_02_11_02_04/packages;C:/ti/mcsdk_2_00_09_21/demos;C:/ti/ccsv5/ccs_base;C:/ti/xdctools_3_23_01_43/packages;..
HOSTOS = Windows
endif
