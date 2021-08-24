################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../PDM2PCM/App/pdm2pcm.c 

C_DEPS += \
./PDM2PCM/App/pdm2pcm.d 

OBJS += \
./PDM2PCM/App/pdm2pcm.o 


# Each subdirectory must supply rules for building sources it contributes
PDM2PCM/App/%.o: ../PDM2PCM/App/%.c PDM2PCM/App/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu17 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../PDM2PCM/App -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Drivers/STM32F4xx_HAL_Driver/Inc -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Middlewares/ST/STM32_Audio/Addons/PDM/Inc -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Drivers/CMSIS/Include -Ofast -ffunction-sections -fdata-sections -Wall -fsingle-precision-constant -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

