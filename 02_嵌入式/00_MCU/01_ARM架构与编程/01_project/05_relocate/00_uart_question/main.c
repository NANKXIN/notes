#include "uart.h"
#include "string.h"


void delay(int d)
{
	d *= 10;
	while (d--);
}

char g_char1 = 'A';
const char g_char2 = 'B';

int main()
{
	char c;
	
	uart_init();
	
	while (1)
	{
		c = getchar();
		putchar(g_char1);
		putchar(g_char2);
		putchar('\n');
		put_s_hex("g_char1 addr = ", &g_char1);
		put_s_hex("g_char2 addr = ", &g_char2);
	}
	
	return 0;
}
