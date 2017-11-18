################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../NicolaCode/Bluetooth\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).c \
../NicolaCode/Bluetooth.c \
../NicolaCode/ConsoleManager.c \
../NicolaCode/DebugInterface.c \
../NicolaCode/Flash-SDCard.c \
../NicolaCode/LCD_Display\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).c \
../NicolaCode/LCD_Display.c \
../NicolaCode/PSPLComms\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).c \
../NicolaCode/PSPLComms.c \
../NicolaCode/RadioInterface\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).c \
../NicolaCode/RadioInterface.c \
../NicolaCode/RemoteProtocolHandler\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).c \
../NicolaCode/RemoteProtocolHandler.c \
../NicolaCode/xsdps.c 

OBJS += \
./NicolaCode/Bluetooth\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).o \
./NicolaCode/Bluetooth.o \
./NicolaCode/ConsoleManager.o \
./NicolaCode/DebugInterface.o \
./NicolaCode/Flash-SDCard.o \
./NicolaCode/LCD_Display\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).o \
./NicolaCode/LCD_Display.o \
./NicolaCode/PSPLComms\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).o \
./NicolaCode/PSPLComms.o \
./NicolaCode/RadioInterface\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).o \
./NicolaCode/RadioInterface.o \
./NicolaCode/RemoteProtocolHandler\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).o \
./NicolaCode/RemoteProtocolHandler.o \
./NicolaCode/xsdps.o 

C_DEPS += \
./NicolaCode/Bluetooth\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).d \
./NicolaCode/Bluetooth.d \
./NicolaCode/ConsoleManager.d \
./NicolaCode/DebugInterface.d \
./NicolaCode/Flash-SDCard.d \
./NicolaCode/LCD_Display\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).d \
./NicolaCode/LCD_Display.d \
./NicolaCode/PSPLComms\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).d \
./NicolaCode/PSPLComms.d \
./NicolaCode/RadioInterface\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).d \
./NicolaCode/RadioInterface.d \
./NicolaCode/RemoteProtocolHandler\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).d \
./NicolaCode/RemoteProtocolHandler.d \
./NicolaCode/xsdps.d 


# Each subdirectory must supply rules for building sources it contributes
NicolaCode/Bluetooth\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).o: ../NicolaCode/Bluetooth\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -DDEBUG_CODE -Wall -O0 -g3 -I../../NicolaRadio_bsp/ps7_cortexa9_0/include -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/include" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/portable" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/NicolaInclude" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/PS_PL_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"NicolaCode/Bluetooth (Graham NAYLOR's conflicted copy 2017-08-02).d" -MT"NicolaCode/Bluetooth\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

NicolaCode/%.o: ../NicolaCode/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -DDEBUG_CODE -Wall -O0 -g3 -I../../NicolaRadio_bsp/ps7_cortexa9_0/include -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/include" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/portable" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/NicolaInclude" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/PS_PL_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

NicolaCode/LCD_Display\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).o: ../NicolaCode/LCD_Display\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -DDEBUG_CODE -Wall -O0 -g3 -I../../NicolaRadio_bsp/ps7_cortexa9_0/include -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/include" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/portable" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/NicolaInclude" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/PS_PL_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"NicolaCode/LCD_Display (Graham NAYLOR's conflicted copy 2017-08-02).d" -MT"NicolaCode/LCD_Display\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

NicolaCode/PSPLComms\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).o: ../NicolaCode/PSPLComms\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -DDEBUG_CODE -Wall -O0 -g3 -I../../NicolaRadio_bsp/ps7_cortexa9_0/include -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/include" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/portable" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/NicolaInclude" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/PS_PL_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"NicolaCode/PSPLComms (Graham NAYLOR's conflicted copy 2017-08-02).d" -MT"NicolaCode/PSPLComms\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

NicolaCode/RadioInterface\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).o: ../NicolaCode/RadioInterface\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -DDEBUG_CODE -Wall -O0 -g3 -I../../NicolaRadio_bsp/ps7_cortexa9_0/include -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/include" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/portable" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/NicolaInclude" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/PS_PL_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"NicolaCode/RadioInterface (Graham NAYLOR's conflicted copy 2017-08-02).d" -MT"NicolaCode/RadioInterface\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

NicolaCode/RemoteProtocolHandler\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).o: ../NicolaCode/RemoteProtocolHandler\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -DDEBUG_CODE -Wall -O0 -g3 -I../../NicolaRadio_bsp/ps7_cortexa9_0/include -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/include" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/src/portable" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/NicolaRadio/NicolaInclude" -I"/home/gnaylor/Dropbox/N3workingG/TE0722Rebuild/N3Vivado/N3Z_TD_FIFO/N3Z_TD_FIFO.sdk/PS_PL_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"NicolaCode/RemoteProtocolHandler (Graham NAYLOR's conflicted copy 2017-08-02).d" -MT"NicolaCode/RemoteProtocolHandler\ (Graham\ NAYLOR's\ conflicted\ copy\ 2017-08-02).d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


