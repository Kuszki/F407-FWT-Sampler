#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "main.h"
#include "crc.h"
#include "dma.h"
#include "i2s.h"
#include "pdm2pcm.h"
#include "usart.h"
#include "gpio.h"

#define DATA_SIZE 64
#define INPUT_SIZE 512

extern "C"
{
	void SystemClock_Config(void);
}

extern I2S_HandleTypeDef hi2s2;
extern DMA_HandleTypeDef hdma_spi2_rx;

extern UART_HandleTypeDef huart2;
extern DMA_HandleTypeDef hdma_usart2_rx;
extern DMA_HandleTypeDef hdma_usart2_tx;

extern PDM_Filter_Handler_t PDM1_filter_handler;
extern PDM_Filter_Config_t PDM1_filter_config;

volatile int doSend = 0;
volatile int doReq = 0;

const size_t isize = INPUT_SIZE;
const size_t osize = DATA_SIZE;

uint16_t* ibuffer = nullptr;
uint16_t* obuffer = nullptr;

uint8_t dummy = 0;

int main(void)
{
	/* FPU initialization */
	SCB->CPACR |= ((3 << 10*2) | (3 << 11*2));

	ibuffer = new uint16_t[isize];
	obuffer = new uint16_t[osize];

	for (size_t i = 0; i < osize; ++i) obuffer[i] = 0;
	for (size_t i = 0; i < isize; ++i) ibuffer[i] = 0;

	/* Reset of all peripherals, Initializes the Flash interface and the Systick. */
	HAL_Init();

	/* Configure the system clock */
	SystemClock_Config();

	/* Initialize all configured peripherals */
	MX_GPIO_Init();
	MX_DMA_Init();
	MX_I2S2_Init();
	MX_USART2_UART_Init();
	MX_CRC_Init();
	MX_PDM2PCM_Init();

	HAL_Delay(1000);
	HAL_I2S_Receive_DMA(&hi2s2, ibuffer, isize);

	HAL_UART_Receive_IT(&huart2, &dummy, 1);

	while (1) if (doReq)
	{
		HAL_Delay(1000);

		doReq = 0;
		doSend = 4;
	}
}

void HAL_I2S_RxHalfCpltCallback(I2S_HandleTypeDef *hi2s)
{
	PDM_Filter(ibuffer, obuffer, &PDM1_filter_handler);

	if (doSend)
	{
		HAL_UART_Transmit_DMA(&huart2, (uint8_t*) obuffer, osize*2);
		--doSend;
	}
}

void HAL_I2S_RxCpltCallback(I2S_HandleTypeDef *hi2s)
{
	PDM_Filter(ibuffer + isize/2, obuffer, &PDM1_filter_handler);

	if (doSend)
	{
		HAL_UART_Transmit_DMA(&huart2, (uint8_t*) obuffer, osize*2);
		--doSend;
	}
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
	HAL_GPIO_TogglePin(GPIOD, LD4_Pin);

	HAL_UART_Receive_IT(huart, &dummy, 1);

	if (!doSend) doReq = 1;
}

void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart)
{
	HAL_GPIO_TogglePin(GPIOD, LD4_Pin);
}
