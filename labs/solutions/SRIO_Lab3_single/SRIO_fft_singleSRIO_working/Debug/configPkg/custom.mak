## THIS IS A GENERATED FILE -- DO NOT EDIT
.configuro: .libraries,e66 linker.cmd \
  package/cfg/SRIOMulticore_fft_1_pe66.oe66 \

linker.cmd: package/cfg/SRIOMulticore_fft_1_pe66.xdl
	$(SED) 's"^\"\(package/cfg/SRIOMulticore_fft_1_pe66cfg.cmd\)\"$""\"C:/Users/a0270985/Documents/a_training/customer/keystone-workshop/labs/solutions/SRIO_Lab3_single/SRIO_fft_singleSRIO_working/Debug/configPkg/\1\""' package/cfg/SRIOMulticore_fft_1_pe66.xdl > $@
