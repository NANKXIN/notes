#include "key.h"
#include "string.h"
#include "exti.h"
#include "nvic.h"


void KeyInit(void)
{
	AFIO_TypeDef *afio = (AFIO_TypeDef *)0x40010000;
	unsigned int *pRcc;
	unsigned int *pGpioe;
	
	pRcc = (unsigned int *)(0x40021000 + 0x18);		// APB2ENR
	*pRcc |= (1 << 0);  // ʹ�� IO ����ʱ��
	*pRcc |= (1 << 6);	// ʹ�� GPIOE ʱ��
	
	// ���� GPIOE3 Ϊ��������
	pGpioe = (unsigned int *)(0x40011800 + 0x00);	// CPL
	*pGpioe &= ~(0x0F << 12);	// mode3 = 0b00 cnf3 = 0b00
	*pGpioe |= (2 << 14);		// cnf3 = 0b10
	// ���� GPIOE3 ����
	pGpioe = (unsigned int *)(0x40011800 + 0x10);	// BSRR
	*pGpioe |= (1 << 3);
	
	/* 2. ����Ϊ EXTI3 */
	afio->EXTICR[0] &= ~(0x0F << 12);	// EXTI3 = 0b0000
	afio->EXTICR[0] |= (0x04 << 12);	// EXTI3 = 0b0100 - GPIOE
}

void EXTI3_IRQHandler(void)
{
	unsigned int *pGpioe = (unsigned int *)(0x40011800 + 0x08);  // IDR
	
	if ((*pGpioe & (1 << 3)) == 0)
	{
		puts("KEY pressed!\n\r");
	}
	else
	{
		puts("KEY released!\n\r");
	}
	
	/* ����ж� */
	ExtiClear(3);
	NvicClear(9);
}








