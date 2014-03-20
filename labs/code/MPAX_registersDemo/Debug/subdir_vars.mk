################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CMD_SRCS += \
../mpax.cmd 

CFG_SRCS += \
../MPAX.cfg 

C_SRCS += \
../MAPX_utilities.c \
../testMPAX1.c 

OBJS += \
./MAPX_utilities.obj \
./testMPAX1.obj 

GEN_SRCS += \
./configPkg/compiler.opt \
./configPkg/linker.cmd 

C_DEPS += \
./MAPX_utilities.pp \
./testMPAX1.pp 

GEN_MISC_DIRS += \
./configPkg/ 

GEN_CMDS += \
./configPkg/linker.cmd 

GEN_OPTS += \
./configPkg/compiler.opt 

GEN_SRCS__QUOTED += \
"configPkg\compiler.opt" \
"configPkg\linker.cmd" 

GEN_MISC_DIRS__QUOTED += \
"configPkg\" 

C_DEPS__QUOTED += \
"MAPX_utilities.pp" \
"testMPAX1.pp" 

OBJS__QUOTED += \
"MAPX_utilities.obj" \
"testMPAX1.obj" 

C_SRCS__QUOTED += \
"../MAPX_utilities.c" \
"../testMPAX1.c" 

GEN_OPTS__FLAG += \
--cmd_file="./configPkg/compiler.opt" 

GEN_CMDS__FLAG += \
-l"./configPkg/linker.cmd" 


