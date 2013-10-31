## THIS IS A GENERATED FILE -- DO NOT EDIT
.configuro: .libraries,e66 linker.cmd \
  package/cfg/SRIOMulticore_fft_1_pe66.oe66 \

linker.cmd: package/cfg/SRIOMulticore_fft_1_pe66.xdl
	$(SED) 's"^\"\(package/cfg/SRIOMulticore_fft_1_pe66cfg.cmd\)\"$""\"C:/projects/SRIOExample/SRIO_fft_singleSRIO_working/.config/xconfig_SRIOMulticore_fft_1/\1\""' package/cfg/SRIOMulticore_fft_1_pe66.xdl > $@
