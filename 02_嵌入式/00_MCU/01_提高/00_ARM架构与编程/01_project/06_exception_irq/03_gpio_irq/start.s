                PRESERVE8
                THUMB

; Vector Table Mapped to Address 0 at Reset
                AREA    RESET, DATA, READONLY
				EXPORT  __Vectors
				IMPORT HardFault_Handler
				IMPORT UsageFault_Handler
				IMPORT SVC_Handler
				IMPORT SysTick_Handler
				IMPORT EXTI3_IRQHandler
				
__Vectors       DCD     (0x20000000+0x10000)                  
                DCD     Reset_Handler              	; Reset Handler
                DCD     0                			; NMI Handler
                DCD     HardFault_Handler          	; Hard Fault Handler
                DCD     0          					; MPU Fault Handler
                DCD     0           				; Bus Fault Handler
                DCD     UsageFault_Handler_asm      ; Usage Fault Handler
                DCD     0                          	; Reserved
                DCD     0                          	; Reserved
                DCD     0                          	; Reserved
                DCD     0                          	; Reserved
                DCD     SVC_Handler                	; SVCall Handler
                DCD     0           				; Debug Monitor Handler
                DCD     0                          	; Reserved
                DCD     0             				; PendSV Handler
                DCD     SysTick_Handler             ; SysTick Handler
				
                ; External Interrupts 从 0 开始
                DCD     0            				; Window Watchdog
                DCD     0            	 			; PVD through EXTI Line detect
                DCD     0          					; Tamper
                DCD     0             				; RTC
                DCD     0           				; Flash
                DCD     0             				; RCC
                DCD     0           				; EXTI Line 0
				DCD     0           				; EXTI Line 1
				DCD     0           				; EXTI Line 2
				DCD     EXTI3_IRQHandler           	; EXTI Line 3
				
				AREA    |.text|, CODE, READONLY

; Reset handler
Reset_Handler   PROC
				EXPORT  Reset_Handler             [WEAK]
                IMPORT  mymain
				IMPORT  SystemInit
				IMPORT  uart_init
				IMPORT	UsageFaultInit
				IMPORT 	SysTickInit
				
				; 在向量表的第0项设置SP更好
				; 因为有可能还没执行到Reset_Handler就发生了异常
				; LDR SP, =(0x20000000+0x10000)
				
				BL SystemInit
				BL uart_init
				BL UsageFaultInit
				
				LDR R0, =0x00
				LDR R1, =0x01
				LDR R2, =0x02
				LDR R3, =0x03
				LDR R12, =0x04
				LDR LR, =0x05
				; PC
				; xPSR
				
				DCD 0xFFFFFFFF	; 未定义指令异常
				SVC #1 			; SVC 异常
				BL	SysTickInit	; SysTick 异常
				
				; 使能CPU中断
				CPSIE I 		; 清除 PRIMASK，使能中断
				
				;BL mymain
				LDR R0, =mymain
				BLX R0
				
                ENDP

UsageFault_Handler_asm PROC
				MOV R0, SP		; 传入栈(指向保存的现场)
				B UsageFault_Handler
				ENDP
				
                END


