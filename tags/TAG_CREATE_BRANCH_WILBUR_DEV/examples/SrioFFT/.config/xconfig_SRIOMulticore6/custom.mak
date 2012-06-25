## THIS IS A GENERATED FILE -- DO NOT EDIT
.configuro: .libraries,e66 linker.cmd \
  package/cfg/SRIOMulticore6_pe66.oe66 \

linker.cmd: package/cfg/SRIOMulticore6_pe66.xdl
	$(SED) 's"^\"\(package/cfg/SRIOMulticore6_pe66cfg.cmd\)\"$""\"C:/Program Files/Texas Instruments/pdk_C6678_1_0_0_12/packages/ti/drv/Example2/srioMUlticore_6/.config/xconfig_SRIOMulticore6/\1\""' package/cfg/SRIOMulticore6_pe66.xdl > $@
