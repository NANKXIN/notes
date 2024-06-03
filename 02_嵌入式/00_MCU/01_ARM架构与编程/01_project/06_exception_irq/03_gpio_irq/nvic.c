#include "nvic.h"



void NvicInit(void)
{
	NVIC_Type * nvic = (NVIC_Type *)0xE000E100;
	
	/* 1. ʹ�� EXTI3 �ж� */
	nvic->ISER[0] |= (1 << 9);
}

void NvicClear(int bit)
{
	NVIC_Type * nvic = (NVIC_Type *)0xE000E100;
	
	if (bit <= 31)
	{
		nvic->ICPR[0] |= (1 << bit);
	}
}






