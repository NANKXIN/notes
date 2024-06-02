#include "uart.h"
#include "systick.h"
#include "exception.h"
#include "string.h"


void SysTickInit(void)
{
	SysTick_Type *SYSTICK = (SysTick_Type *)SYSTICK_ADDR_BASE;
	
	// 设置周期
	SYSTICK->VAL = SYSYTICK_VAL;	// 当前值
	SYSTICK->LOAD = SYSYTICK_VAL;	// 重载值
	// 选择时钟源，使能定时器，使能异常
	SYSTICK->CTRL |= (1U << 2U);	// 处理器时钟
	SYSTICK->CTRL |= (1U << 1U);	// 使能异常
	SYSTICK->CTRL |= (1U << 0U);	// 使能定时器
}

void SysTick_Handler(void)
{
	// 清除异常
	SCB_Type *SCB = (SCB_Type *)SCB_BASE_ADDR;
	SCB->ICSR |= SCB_ICSR_PENDSTCLR_Msk;
	// 测试
	static unsigned int cnt = 0U;
	put_s_hex("systick cnt = ", cnt++);
}

