################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/portable/port.c 

S_UPPER_SRCS += \
../src/portable/portASM.S 

OBJS += \
./src/portable/port.o \
./src/portable/portASM.o 

S_UPPER_DEPS += \
./src/portable/portASM.d 

C_DEPS += \
./src/portable/port.d 


# Each subdirectory must supply rules for building sources it contributes
src/portable/%.o: ../src/portable/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -DDEBUG_CODE -Wall -O0 -g3 -I../../NicolaRadio_bsp/ps7_cortexa9_0/include -I"/home/gnaylor/Github/SDKsource/NicolaRadio/src" -I"/home/gnaylor/Github/SDKsource/NicolaRadio/src/include" -I"/home/gnaylor/Github/SDKsource/NicolaRadio/src/portable" -I"/home/gnaylor/Github/SDKsource/NicolaRadio/NicolaInclude" -I"/home/gnaylor/Github/SDKsource/PS_PL_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/portable/%.o: ../src/portable/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -DDEBUG_CODE -Wall -O0 -g3 -I../../NicolaRadio_bsp/ps7_cortexa9_0/include -I"/home/gnaylor/Github/SDKsource/NicolaRadio/src" -I"/home/gnaylor/Github/SDKsource/NicolaRadio/src/include" -I"/home/gnaylor/Github/SDKsource/NicolaRadio/src/portable" -I"/home/gnaylor/Github/SDKsource/NicolaRadio/NicolaInclude" -I"/home/gnaylor/Github/SDKsource/PS_PL_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


