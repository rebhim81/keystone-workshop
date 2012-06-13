################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

CG_TOOL_ROOT := C:/ti/ccsv5/tools/compiler/c6000

ORDERED_OBJS += \
$(GEN_CMDS__FLAG) \
"./system_trace.obj" \
"./srio_fft.obj" \
"./srio_drv.obj" \
"./slaveTask.obj" \
"./qmss_drv.obj" \
"./qmss_device.obj" \
"./multicoreLoopback_osal.obj" \
"./master_core_manager.obj" \
"./masterTask.obj" \
"./initialization.obj" \
"./gen_twiddle_fft16x16.obj" \
"./fftRoutines.obj" \
"./device_srio_loopback.obj" \
"./cppi_device.obj" \
"./commonTask.obj" \
"./STMHelper.obj" \
-ldsplib.ae66 \
-lstm_d.c66xx_elf.lib \
-l"libc.a" \
"../srio_fft.cmd" \

-include ../makefile.init

RM := DEL /F
RMDIR := RMDIR /S/Q

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir_vars.mk
-include subdir_rules.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(S62_DEPS)),)
-include $(S62_DEPS)
endif
ifneq ($(strip $(C64_DEPS)),)
-include $(C64_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(S55_DEPS)),)
-include $(S55_DEPS)
endif
ifneq ($(strip $(C67_DEPS)),)
-include $(C67_DEPS)
endif
ifneq ($(strip $(C??_DEPS)),)
-include $(C??_DEPS)
endif
ifneq ($(strip $(CLA_DEPS)),)
-include $(CLA_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(S??_DEPS)),)
-include $(S??_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(C62_DEPS)),)
-include $(C62_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(ASM_UPPER_DEPS)),)
-include $(ASM_UPPER_DEPS)
endif
ifneq ($(strip $(K_DEPS)),)
-include $(K_DEPS)
endif
ifneq ($(strip $(C43_DEPS)),)
-include $(C43_DEPS)
endif
ifneq ($(strip $(S67_DEPS)),)
-include $(S67_DEPS)
endif
ifneq ($(strip $(SA_DEPS)),)
-include $(SA_DEPS)
endif
ifneq ($(strip $(S43_DEPS)),)
-include $(S43_DEPS)
endif
ifneq ($(strip $(OPT_DEPS)),)
-include $(OPT_DEPS)
endif
ifneq ($(strip $(S64_DEPS)),)
-include $(S64_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(C55_DEPS)),)
-include $(C55_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: SrioFFT.out

# Tool invocations
SrioFFT.out: $(OBJS) $(CMD_SRCS) $(GEN_CMDS)
	@echo 'Building target: $@'
	@echo 'Invoking: C6000 Linker'
	"C:/ti/ccsv5/tools/compiler/c6000/bin/cl6x" -mv6600 -g --define=_LITTLE_ENDIAN --define=DISABLE_DELAY --define=_TMS320C6600 --define=TMS320C6600 --define=VERBOSE_LEVEL=0 --display_error_number --diag_warning=225 --abi=eabi -z -m"SrioFFT.map" --warn_sections -i"C:/ti/ccsv5/tools/compiler/c6000/lib" -i"C:/development_tools/libraries/STMLib/lib" -i"C:/ti/ccsv5/tools/compiler/c6000/include" -i"C:/ti/dsplib_c66x_3_0_0_8/lib" --reread_libs --rom_model -o "SrioFFT.out" $(ORDERED_OBJS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(GEN_SRCS__QUOTED)$(GEN_MISC_FILES__QUOTED)$(C6000_EXECUTABLE_OUTPUTS__QUOTED)$(GEN_OPTS__QUOTED)$(GEN_CMDS__QUOTED) "SrioFFT.out"
	-$(RMDIR) $(GEN_MISC_DIRS__QUOTED)
	-$(RM) "STMHelper.pp" "commonTask.pp" "cppi_device.pp" "device_srio_loopback.pp" "fftRoutines.pp" "gen_twiddle_fft16x16.pp" "initialization.pp" "masterTask.pp" "master_core_manager.pp" "multicoreLoopback_osal.pp" "qmss_device.pp" "qmss_drv.pp" "slaveTask.pp" "srio_drv.pp" "srio_fft.pp" "system_trace.pp" 
	-$(RM) "STMHelper.obj" "commonTask.obj" "cppi_device.obj" "device_srio_loopback.obj" "fftRoutines.obj" "gen_twiddle_fft16x16.obj" "initialization.obj" "masterTask.obj" "master_core_manager.obj" "multicoreLoopback_osal.obj" "qmss_device.obj" "qmss_drv.obj" "slaveTask.obj" "srio_drv.obj" "srio_fft.obj" "system_trace.obj" 
	-@echo 'Finished clean'
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
