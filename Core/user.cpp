#include <stdlib.h>
#include <string.h>

#include "main.h"
#include "dma.h"
#include "i2s.h"
#include "gpio.h"
#include "usart.h"

extern "C"
{
	void SystemClock_Config(void);
}

extern I2S_HandleTypeDef hi2s2;
extern UART_HandleTypeDef huart2;
extern DMA_HandleTypeDef hdma_spi2_rx;

volatile bool doSend = false;
volatile bool doReq = false;

uint8_t dummy = 0;

int main(void)
{
	/* FPU initialization */
	SCB->CPACR |= ((3 << 10*2) | (3 << 11*2));

	const size_t size = 16384;
	uint16_t* buffer = (uint16_t*) malloc(size);

//	const char* str = "Twoja stara\n";
//	const size_t strLen = strlen(str);

	/* Reset of all peripherals, Initializes the Flash interface and the Systick. */
	HAL_Init();

	/* Configure the system clock */
	SystemClock_Config();

	/* Initialize all configured peripherals */
	MX_GPIO_Init();
	MX_DMA_Init();
	MX_I2S2_Init();
	MX_USART2_UART_Init();

	HAL_I2S_Receive_DMA(&hi2s2, buffer, size);
	HAL_UART_Receive_IT(&huart2, &dummy, 1);

	while (1) if (doSend && doReq)
	{
//		HAL_UART_Transmit(&huart2, str, strLen, 1000);
//		HAL_Delay(10000);

		HAL_UART_Transmit_DMA(&huart2, (uint8_t*) buffer, size*2);

		doSend = doReq = false;
	}
}

void HAL_I2S_RxHalfCpltCallback(I2S_HandleTypeDef *hi2s)
{

}

void HAL_I2S_RxCpltCallback(I2S_HandleTypeDef *hi2s)
{
	HAL_GPIO_TogglePin(GPIOD, LD3_Pin);

	if (!doSend) doSend = true;
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
	HAL_GPIO_TogglePin(GPIOD, LD4_Pin);

	if (!doReq) doReq = true;

	HAL_UART_Receive_IT(huart, &dummy, 1);
}

void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart)
{
	HAL_GPIO_TogglePin(GPIOD, LD4_Pin);
}
