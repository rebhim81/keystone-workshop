################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
STMHelper.obj: C:/development_tools/libraries/STMLib/src/STMHelper.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv5/tools/compiler/c6000/bin/cl6x" -mv6600 --symdebug:none -O3 --include_path="C:/dev/vlfft/vlfft/vlfft/vlfftInc" --include_path="C:/ti/ccsv5/tools/compiler/c6000/include" --include_path="C:/development_tools/libraries/STMLib/include" --include_path="C:/development_tools/libraries/STMLib/src" --display_error_number --diag_warning=225 --abi=eabi --preproc_with_compile --preproc_dependency="STMHelper.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

configPkg/compiler.opt: ../vlfft_evmc6678l.cfg
	@echo 'Building file: $<'
	@echo 'Invoking: XDCtools'
	"C:/ti/xdctools_3_23_01_43/xs" --xdcpath="C:/ti/ipc_1_24_02_27/packages;C:/dev/keystone-workshop/examples/vlfft/evmc6678l/../;C:/ti/bios_6_33_02_31/packages;C:/ti/edma3_lld_02_11_02_04/packages;C:/ti/mcsdk_2_00_07_19/demos;" xdc.tools.configuro -o configPkg -t ti.targets.elf.C66 -p custom.vlfft.evmc6678l.core0 -r debug -c "C:/ti/ccsv5/tools/compiler/c6000" "$<"
	@echo 'Finished building: $<'
	@echo ' '

configPkg/linker.cmd: configPkg/compiler.opt
configPkg/: configPkg/compiler.opt


