


void delay(unsigned int cnt)
{
	while (cnt--)
	{
	}
}

int mymain()
{
	unsigned int *pReg;
	
	// ʹ��GPIO
	pReg = (unsigned int *)(0x40021000U + 0x18U);
	*pReg |= (1UL << 3U);
	// ����GPIOB0Ϊ�������
	pReg = (unsigned int *)(0x40010C00U + 0x00U);
	*pReg |= (1UL << 0U);
	
	pReg = (unsigned int *)(0x40010C00U + 0x0CU);
	
	while (1)
	{
		// ����GPIOB0Ϊ���1
		*pReg |= (1UL << 0U);
		
		delay(10000U);
		
		// ����GPIOB0Ϊ���0
		*pReg &= ~(1UL << 0U);
		
		delay(10000U);
	}
}


