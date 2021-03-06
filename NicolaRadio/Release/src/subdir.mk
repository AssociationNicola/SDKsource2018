################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript-release.ld \
../src/lscript.ld 

C_SRCS += \
../src/FreeRTOS_tick_config.c \
../src/event_groups.c \
../src/heap_4.c \
../src/list.c \
../src/main.c \
../src/platform.c \
../src/printf-stdarg.c \
../src/ps7_init_Nicola.c \
../src/queue.c \
../src/tasks.c \
../src/timers.c 

S_UPPER_SRCS += \
../src/FreeRTOS_asm_vectors.S 

OBJS += \
./src/FreeRTOS_asm_vectors.o \
./src/FreeRTOS_tick_config.o \
./src/event_groups.o \
./src/heap_4.o \
./src/list.o \
./src/main.o \
./src/platform.o \
./src/printf-stdarg.o \
./src/ps7_init_Nicola.o \
./src/queue.o \
./src/tasks.o \
./src/timers.o 

S_UPPER_DEPS += \
./src/FreeRTOS_asm_vectors.d 

C_DEPS += \
./src/FreeRTOS_tick_config.d \
./src/event_groups.d \
./src/heap_4.d \
./src/list.d \
./src/main.d \
./src/platform.d \
./src/printf-stdarg.d \
./src/ps7_init_Nicola.d \
./src/queue.d \
./src/tasks.d \
./src/timers.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -Os -I../../NicolaRadio_bsp/ps7_cortexa9_0/include -I"/home/gnaylor/N3Z_TD_FIFO.sdk/NicolaRadio/src" -I"/home/gnaylor/N3Z_TD_FIFO.sdk/NicolaRadio/src/include" -I"/home/gnaylor/N3Z_TD_FIFO.sdk/NicolaRadio/src/portable" -I"/home/gnaylor/N3Z_TD_FIFO.sdk/NicolaRadio/NicolaInclude" -I"/home/gnaylor/N3Z_TD_FIFO.sdk/PS_PL_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -Os -I../../NicolaRadio_bsp/ps7_cortexa9_0/include -I"/home/gnaylor/N3Z_TD_FIFO.sdk/NicolaRadio/src" -I"/home/gnaylor/N3Z_TD_FIFO.sdk/NicolaRadio/src/include" -I"/home/gnaylor/N3Z_TD_FIFO.sdk/NicolaRadio/src/portable" -I"/home/gnaylor/N3Z_TD_FIFO.sdk/NicolaRadio/NicolaInclude" -I"/home/gnaylor/N3Z_TD_FIFO.sdk/PS_PL_wrapper_hw_platform_0" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


