#ifndef __SYSTICK_H__
#define __SYSTICK_H__


typedef struct {
	volatile unsigned int CTRL;
	volatile unsigned int LOAD;
	volatile unsigned int VAL;
	volatile unsigned int CALIB;
} SysTick_Type;


#define SYSTICK_ADDR_BASE	( 0xE000E010UL )
/* æß’Ò ±÷”£∫8MHz */
#define SYSYTICK_VAL		( 8000000U )  // 8M / 8M = 1S

#endif
