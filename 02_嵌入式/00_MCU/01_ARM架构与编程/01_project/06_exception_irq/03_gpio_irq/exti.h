#ifndef __EXTI_H__
#define __EXTI_H__


typedef struct
{
  volatile unsigned int IMR;
  volatile unsigned int EMR;
  volatile unsigned int RTSR;
  volatile unsigned int FTSR;
  volatile unsigned int SWIER;
  volatile unsigned int PR;
} EXTI_TypeDef;


void ExtiInit(void);
void ExtiClear(int bit);


#endif
