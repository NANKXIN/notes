#ifndef __KEY_H__
#define __KEY_H__


typedef struct
{
	volatile unsigned int EVCR;
	volatile unsigned int MAPR;
	volatile unsigned int EXTICR[4];
	volatile unsigned int RESERVED0;
	volatile unsigned int MAPR2;  
} AFIO_TypeDef;

void KeyInit(void);

#endif
