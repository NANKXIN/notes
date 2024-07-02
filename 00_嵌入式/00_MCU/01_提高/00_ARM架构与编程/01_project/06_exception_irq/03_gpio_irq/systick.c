#include "uart.h"
#include "systick.h"
#include "exception.h"
#include "string.h"


void SysTickInit(void)
{
	SysTick_Type *SYSTICK = (SysTick_Type *)SYSTICK_ADDR_BASE;
	
	// ��������
	SYSTICK->VAL = SYSYTICK_VAL;	// ��ǰֵ
	SYSTICK->LOAD = SYSYTICK_VAL;	// ����ֵ
	// ѡ��ʱ��Դ��ʹ�ܶ�ʱ����ʹ���쳣
	SYSTICK->CTRL |= (1U << 2U);	// ������ʱ��
	SYSTICK->CTRL |= (1U << 1U);	// ʹ���쳣
	SYSTICK->CTRL |= (1U << 0U);	// ʹ�ܶ�ʱ��
}

void SysTick_Handler(void)
{
	// ����쳣
	SCB_Type *SCB = (SCB_Type *)SCB_BASE_ADDR;
	SCB->ICSR |= SCB_ICSR_PENDSTCLR_Msk;
	// ����
	static unsigned int cnt = 0U;
	put_s_hex("systick cnt = ", cnt++);
}

