#include "uart.h"
#include "string.h"
#include "key.h"
#include "exti.h"
#include "nvic.h"


void delay(int d)
{
	d *= 10;
	while (d--);
}

char g_char1 = 'A';
const char g_char2 = 'B';
int g_A[16] = { 0 };
int g_B[16];


void SystemInit(void)
{
	extern int Image$$ER_IROM1$$Base;
	extern int Image$$ER_IROM1$$Length;
	extern int Load$$ER_IROM1$$Base;
					
	extern int Image$$RW_IRAM1$$Base;
	extern int Image$$RW_IRAM1$$Length;
	extern int Load$$RW_IRAM1$$Base;
					
	extern int Image$$RW_IRAM1$$ZI$$Base;
	extern int Image$$RW_IRAM1$$ZI$$Length;
	
	// 代码重定位
	if (&Image$$ER_IROM1$$Base != &Load$$ER_IROM1$$Base)
	{
		memcpy(&Image$$ER_IROM1$$Base, &Load$$ER_IROM1$$Base, &Image$$ER_IROM1$$Length);
	}
	// 数据段重定位
	if (&Image$$RW_IRAM1$$Base != &Load$$RW_IRAM1$$Base)
	{
		memcpy(&Image$$RW_IRAM1$$Base, &Load$$RW_IRAM1$$Base, &Image$$RW_IRAM1$$Length);
	}
	// 清除BSS段
	memset(&Image$$RW_IRAM1$$ZI$$Base, 0, &Image$$RW_IRAM1$$ZI$$Length);
}


int mymain()
{
	char c;
	static int s_C[16] = { 0 };
	void (*func)(const char *s, unsigned int val);
	
	func = put_s_hex;
////	uart_init();  // start.S 内
	
	KeyInit();
	ExtiInit();
	NvicInit();
	
	while (1)
	{
		c = getchar();
		putchar(g_char1);
		putchar(g_char2);
		putchar('\n');
		put_s_hex("g_char1 addr = ", &g_char1);
		put_s_hex("g_char2 addr = ", &g_char2);
		put_s_hex("g_A val = ", g_A[0]);
		put_s_hex("g_B val = ", g_B[0]);
		put_s_hex("s_C val = ", s_C[0]);
		putchar('\n');
		func("Test.", 1);
	}
	
	return 0;
}
