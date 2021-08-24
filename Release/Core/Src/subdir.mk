################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/crc.c \
../Core/Src/dma.c \
../Core/Src/gpio.c \
../Core/Src/i2s.c \
../Core/Src/main.c \
../Core/Src/stm32f4xx_hal_msp.c \
../Core/Src/stm32f4xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32f4xx.c \
../Core/Src/usart.c 

C_DEPS += \
./Core/Src/crc.d \
./Core/Src/dma.d \
./Core/Src/gpio.d \
./Core/Src/i2s.d \
./Core/Src/main.d \
./Core/Src/stm32f4xx_hal_msp.d \
./Core/Src/stm32f4xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32f4xx.d \
./Core/Src/usart.d 

OBJS += \
./Core/Src/crc.o \
./Core/Src/dma.o \
./Core/Src/gpio.o \
./Core/Src/i2s.o \
./Core/Src/main.o \
./Core/Src/stm32f4xx_hal_msp.o \
./Core/Src/stm32f4xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32f4xx.o \
./Core/Src/usart.o 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../PDM2PCM/App -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Drivers/STM32F4xx_HAL_Driver/Inc -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Middlewares/ST/STM32_Audio/Addons/PDM/Inc -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -fsingle-precision-constant -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

