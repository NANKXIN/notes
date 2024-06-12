
int mymain()
{
	unsigned int *pReg;
	unsigned int *pRegA;
	unsigned int *pRegB;
	
	// 使能GPIOA、GPIOB
	pReg = (unsigned int *)(0x40021000U + 0x18U);
	*pReg |= (1UL << 2U) | (1UL << 3U);
	
	// 设置GPIOB0为输出引脚
	pRegB = (unsigned int *)(0x40010C00U + 0x00U);
	*pRegB |= (1UL << 0U);
	
	// 设置GPIOA0为输入引脚
	pRegA = (unsigned int *)(0x40010800U + 0x00U);
	*pRegA &= ~(3U);		// mode0 = 0b00
	*pRegA &= ~(3UL << 2U);	// conf0 = 0b00
	*pRegA |= (1UL << 2U);	// conf0 = 0b01
	
	// GPIOB输出寄存器
	pRegB = (unsigned int *)(0x40010C00U + 0x0CU);
	// GPIOA输入寄存器
	pRegA = (unsigned int *)(0x40010800U + 0x08U);
	
	while (1)
	{
		// 读取GPIOA输入
		if ((*pRegA & (1UL << 0U)) == 0U)
		{
			// 设置GPIOB0为输出0
			*pReg &= ~(1UL << 0U);
		}
		else
		{
			// 设置GPIOB0为输出1
			*pReg |= (1UL << 0U);
		}
	}
}


