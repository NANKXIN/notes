#include "exti.h"



void ExtiInit(void)
{
	EXTI_TypeDef *exti = (EXTI_TypeDef *)0x40010400;
	
	exti->RTSR |= (1 << 3);		// line 3 rising
	exti->FTSR |= (1 << 3);		// line 3 falling
	
	exti->IMR |= (1 << 3);		// line 3 not masked(фа╠н)
}

void ExtiClear(int bit)
{
	EXTI_TypeDef * exti = (EXTI_TypeDef *)0x40010400;
	exti->PR |= (1 << bit);
}








