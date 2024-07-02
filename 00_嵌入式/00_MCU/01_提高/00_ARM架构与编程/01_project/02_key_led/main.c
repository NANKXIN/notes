
int mymain()
{
	unsigned int *pReg;
	unsigned int *pRegA;
	unsigned int *pRegB;
	
	// ʹ��GPIOA��GPIOB
	pReg = (unsigned int *)(0x40021000U + 0x18U);
	*pReg |= (1UL << 2U) | (1UL << 3U);
	
	// ����GPIOB0Ϊ�������
	pRegB = (unsigned int *)(0x40010C00U + 0x00U);
	*pRegB |= (1UL << 0U);
	
	// ����GPIOA0Ϊ��������
	pRegA = (unsigned int *)(0x40010800U + 0x00U);
	*pRegA &= ~(3U);		// mode0 = 0b00
	*pRegA &= ~(3UL << 2U);	// conf0 = 0b00
	*pRegA |= (1UL << 2U);	// conf0 = 0b01
	
	// GPIOB����Ĵ���
	pRegB = (unsigned int *)(0x40010C00U + 0x0CU);
	// GPIOA����Ĵ���
	pRegA = (unsigned int *)(0x40010800U + 0x08U);
	
	while (1)
	{
		// ��ȡGPIOA����
		if ((*pRegA & (1UL << 0U)) == 0U)
		{
			// ����GPIOB0Ϊ���0
			*pReg &= ~(1UL << 0U);
		}
		else
		{
			// ����GPIOB0Ϊ���1
			*pReg |= (1UL << 0U);
		}
	}
}


