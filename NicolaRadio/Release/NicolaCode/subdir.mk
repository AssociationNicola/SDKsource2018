################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../NicolaCode/Bluetooth.c \
../NicolaCode/ConsoleManager.c \
../NicolaCode/DebugInterface.c \
../NicolaCode/Flash-SDCard.c \
../NicolaCode/LCD_Display.c \
../NicolaCode/PSPLComms.c \
../NicolaCode/RadioInterface.c \
../NicolaCode/RemoteProtocolHandler.c 

OBJS += \
./NicolaCode/Bluetooth.o \
./NicolaCode/ConsoleManager.o \
./NicolaCode/DebugInterface.o \
./NicolaCode/Flash-SDCard.o \
./NicolaCode/LCD_Display.o \
./NicolaCode/PSPLComms.o \
./NicolaCode/RadioInterface.o \
./NicolaCode/RemoteProtocolHandler.o 

C_DEPS += \
./NicolaCode/Bluetooth.d \
./NicolaCode/ConsoleManager.d \
./NicolaCode/DebugInterface.d \
./NicolaCode/Flash-SDCard.d \
./NicolaCode/LCD_Display.d \
./NicolaCode/PSPLComms.d \
./NicolaCode/RadioInterface.d \
./NicolaCode/RemoteProtocolHandler.d 


# Each subdirectory must supply rules for building sources it contributes
NicolaCode/%.o: ../NicolaCode/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -Os -I../../NicolaRadio_bsp/ps7_cortexa9_0/include -I"D:\Documents\NicolaRadio\N3Z_TD_FIFO\N3Z_TD_FIFO.sdk\NicolaRadio\src" -I"D:\Documents\NicolaRadio\N3Z_TD_FIFO\N3Z_TD_FIFO.sdk\NicolaRadio\src\include" -I"D:\Documents\NicolaRadio\N3Z_TD_FIFO\N3Z_TD_FIFO.sdk\NicolaRadio\src\portable" -I"D:\Documents\NicolaRadio\N3Z_TD_FIFO\N3Z_TD_FIFO.sdk\NicolaRadio\NicolaInclude" -I"D:\Documents\NicolaRadio\N3Z_TD_FIFO\N3Z_TD_FIFO.sdk\PS_PL_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


