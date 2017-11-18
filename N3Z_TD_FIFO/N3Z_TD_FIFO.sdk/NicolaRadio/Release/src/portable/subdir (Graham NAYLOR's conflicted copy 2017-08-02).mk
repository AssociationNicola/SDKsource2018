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
	arm-none-eabi-gcc -Wall -O0 -I../../NicolaRadio_bsp/ps7_cortexa9_0/include -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/include" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/portable" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/NicolaInclude" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/PS_PL_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/portable/%.o: ../src/portable/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -I../../NicolaRadio_bsp/ps7_cortexa9_0/include -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/include" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/portable" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/NicolaInclude" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/PS_PL_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


