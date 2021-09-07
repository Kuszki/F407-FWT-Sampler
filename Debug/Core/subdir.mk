################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Core/user.cpp 

OBJS += \
./Core/user.o 

CPP_DEPS += \
./Core/user.d 


# Each subdirectory must supply rules for building sources it contributes
Core/%.o: ../Core/%.cpp Core/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++17 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../PDM2PCM/App -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Drivers/STM32F4xx_HAL_Driver/Inc -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Middlewares/ST/STM32_Audio/Addons/PDM/Inc -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I/home/kuszki/.stm_libs/STM32Cube_FW_F4_V1.26.2/Drivers/CMSIS/Include -Og -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fsingle-precision-constant -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
