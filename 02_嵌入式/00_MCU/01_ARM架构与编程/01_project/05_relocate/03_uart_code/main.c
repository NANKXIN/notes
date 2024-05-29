#include "uart.h"
#include "string.h"


void delay(int d)
{
	d *= 10;
	while (d--);
}

char g_char1 = 'A';
const char g_char2 = 'B';
int g_A[16] = { 0 };
int g_B[16];

int mymain()
{
	char c;
	static int s_C[16] = { 0 };
	void (*func)(const char *s, unsigned int val);
	
	func = put_s_hex;
	uart_init();
	
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
