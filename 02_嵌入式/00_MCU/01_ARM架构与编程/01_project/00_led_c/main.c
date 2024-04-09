


void delay(unsigned int cnt)
{
	while (cnt--)
	{
	}
}

int mymain()
{
	unsigned int *pReg;
	
	// 使能GPIO
	pReg = (unsigned int *)(0x40021000U + 0x18U);
	*pReg |= (1UL << 3U);
	// 设置GPIOB0为输出引脚
	pReg = (unsigned int *)(0x40010C00U + 0x00U);
	*pReg |= (1UL << 0U);
	
	pReg = (unsigned int *)(0x40010C00U + 0x0CU);
	
	while (1)
	{
		// 设置GPIOB0为输出1
		*pReg |= (1UL << 0U);
		
		delay(10000U);
		
		// 设置GPIOB0为输出0
		*pReg &= ~(1UL << 0U);
		
		delay(10000U);
	}
}


