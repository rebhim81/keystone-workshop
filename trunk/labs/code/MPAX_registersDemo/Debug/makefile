################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

CG_TOOL_ROOT := C:/ti/CCSv5_4/ccsv5/tools/compiler/c6000_7.4.2

ORDERED_OBJS += \
$(GEN_CMDS__FLAG) \
"./ExampleMPAX/custom/vlfft/evmc6670l/core0/package/package_custom.vlfft.evmc6670l.core0.obj" \
"./ExampleMPAX/custom/vlfft/evmc6678l/core0/package/package_custom.vlfft.evmc6678l.core0.obj" \
"./ExampleMPAX/package/package_ExampleMPAX.obj" \
"./testMPAX1.obj" \
"./MAPX_utilities.obj" \
-l"libc.a" \
-lti.csl.ae66 \
-lti.csl.intc.ae66 \
"../mpax.cmd" \

-include ../makefile.init

RM := DEL /F
RMDIR := RMDIR /S/Q

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir_vars.mk
-include ExampleMPAX/package/subdir_vars.mk
-include ExampleMPAX/custom/vlfft/evmc6678l/core0/package/subdir_vars.mk
-include ExampleMPAX/custom/vlfft/evmc6670l/core0/package/subdir_vars.mk
-include subdir_rules.mk
-include ExampleMPAX/package/subdir_rules.mk
-include ExampleMPAX/custom/vlfft/evmc6678l/core0/package/subdir_rules.mk
-include ExampleMPAX/custom/vlfft/evmc6670l/core0/package/subdir_rules.mk
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
all: MPAX1.out

# Tool invocations
MPAX1.out: $(OBJS) $(CMD_SRCS) $(GEN_CMDS)
	@echo 'Building target: $@'
	@echo 'Invoking: C6000 Linker'
	"C:/ti/CCSv5_4/ccsv5/tools/compiler/c6000_7.4.2/bin/cl6x" -mv6600 --abi=eabi -g --display_error_number --diag_warning=225 -z -m"MPAX1.map" -i"C:/ti/CCSv5_4/ccsv5/tools/compiler/c6000_7.4.2/lib" -i"C:/ti/pdk_C6678_1_1_2_5/packages/ti/csl/lib" -i"C:/ti/CCSv5_4/ccsv5/tools/compiler/c6000_7.4.2/include" --reread_libs --warn_sections --display_error_number --rom_model -o "MPAX1.out" $(ORDERED_OBJS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(GEN_SRCS__QUOTED)$(GEN_MISC_FILES__QUOTED)$(C6000_EXECUTABLE_OUTPUTS__QUOTED)$(GEN_OPTS__QUOTED)$(GEN_CMDS__QUOTED) "MPAX1.out"
	-$(RMDIR) $(GEN_MISC_DIRS__QUOTED)
	-$(RM) "MAPX_utilities.pp" "testMPAX1.pp" "ExampleMPAX\package\package_ExampleMPAX.pp" "ExampleMPAX\custom\vlfft\evmc6678l\core0\package\package_custom.vlfft.evmc6678l.core0.pp" "ExampleMPAX\custom\vlfft\evmc6670l\core0\package\package_custom.vlfft.evmc6670l.core0.pp" 
	-$(RM) "MAPX_utilities.obj" "testMPAX1.obj" "ExampleMPAX\package\package_ExampleMPAX.obj" "ExampleMPAX\custom\vlfft\evmc6678l\core0\package\package_custom.vlfft.evmc6678l.core0.obj" "ExampleMPAX\custom\vlfft\evmc6670l\core0\package\package_custom.vlfft.evmc6670l.core0.obj" 
	-@echo 'Finished clean'
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
