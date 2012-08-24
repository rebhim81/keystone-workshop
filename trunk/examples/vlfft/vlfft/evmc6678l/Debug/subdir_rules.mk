################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
configPkg/compiler.opt: ../vlfft_evmc6678l.cfg
	@echo 'Building file: $<'
	@echo 'Invoking: XDCtools'
	"C:/ti/xdctools_3_23_01_43/xs" --xdcpath="C:/ti/ipc_1_24_02_27/packages;C:/dev/keystone-workshop/trunk/examples/vlfft/vlfft/evmc6678l/../;C:/ti/bios_6_33_02_31/packages;C:/ti/edma3_lld_02_11_02_04/packages;C:/ti/mcsdk_2_00_09_21/demos;C:/ti/ccsv5/ccs_base;" xdc.tools.configuro -o configPkg -t ti.targets.elf.C66 -p custom.vlfft.evmc6678l.core0 -r debug -c "C:/ti/C6000 Code Generation Tools 7.3.5" "$<"
	@echo 'Finished building: $<'
	@echo ' '

configPkg/linker.cmd: configPkg/compiler.opt
configPkg/: configPkg/compiler.opt


