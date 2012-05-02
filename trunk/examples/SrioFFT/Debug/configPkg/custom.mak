## THIS IS A GENERATED FILE -- DO NOT EDIT
.configuro: .libraries,e66 linker.cmd \
  package/cfg/srio_fft_pe66.oe66 \

linker.cmd: package/cfg/srio_fft_pe66.xdl
	$(SED) 's"^\"\(package/cfg/srio_fft_pe66cfg.cmd\)\"$""\"C:/dev/keystone-workshop/examples/SrioFFT/Debug/configPkg/\1\""' package/cfg/srio_fft_pe66.xdl > $@
