################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
MAPX_utilities.obj: ../MAPX_utilities.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/CCSv5_4/ccsv5/tools/compiler/c6000_7.4.2/bin/cl6x" -mv6600 --abi=eabi -g --include_path="C:/ti/CCSv5_4/ccsv5/tools/compiler/c6000_7.4.2/include" --display_error_number --diag_warning=225 --preproc_with_compile --preproc_dependency="MAPX_utilities.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

configPkg/compiler.opt: ../MPAX.cfg
	@echo 'Building file: $<'
	@echo 'Invoking: XDCtools'
	"C:/ti/CCSv5_4/xdctools_3_25_00_48/xs" --xdcpath="C:/ti/edma3_lld_02_11_04_01/packages;C:/ti/framework_components_3_22_00_05/packages;C:/ti/framework_components_3_22_00_05/examples;C:/ti/ipc_1_24_02_27/packages;C:/ti/mcsdk_bios_3_00_00_07/demos;C:/ti/pdk_C6678_1_1_2_5/packages;C:/ti/bios_6_33_04_39/packages;C:/projects/developNew/MPAX_registersDemo;C:/ti/CCSv5_4/ccsv5/ccs_base;" xdc.tools.configuro -o configPkg -t ti.targets.elf.C66 -p ExampleMPAX -r whole_program -b "C:/projects/developNew/MPAX_registersDemo/ExampleMPAX/custom/vlfft/evmc6678l/core0/config.bld" -c "C:/ti/CCSv5_4/ccsv5/tools/compiler/c6000_7.4.2" "$<"
	@echo 'Finished building: $<'
	@echo ' '

configPkg/compiler.opt: C:/projects/developNew/MPAX_registersDemo/ExampleMPAX/custom/vlfft/evmc6678l/core0/config.bld
configPkg/linker.cmd: configPkg/compiler.opt C:/projects/developNew/MPAX_registersDemo/ExampleMPAX/custom/vlfft/evmc6678l/core0/config.bld
configPkg/: configPkg/compiler.opt C:/projects/developNew/MPAX_registersDemo/ExampleMPAX/custom/vlfft/evmc6678l/core0/config.bld

testMPAX1.obj: ../testMPAX1.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/CCSv5_4/ccsv5/tools/compiler/c6000_7.4.2/bin/cl6x" -mv6600 --abi=eabi -g --include_path="C:/ti/CCSv5_4/ccsv5/tools/compiler/c6000_7.4.2/include" --display_error_number --diag_warning=225 --preproc_with_compile --preproc_dependency="testMPAX1.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


