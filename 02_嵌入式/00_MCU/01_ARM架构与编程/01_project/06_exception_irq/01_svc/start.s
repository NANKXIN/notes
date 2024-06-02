                PRESERVE8
                THUMB

; Vector Table Mapped to Address 0 at Reset
                AREA    RESET, DATA, READONLY
				EXPORT  __Vectors
				IMPORT HardFault_Handler
				IMPORT UsageFault_Handler
				IMPORT SVC_Handler
				
__Vectors       DCD     0                  
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
                DCD     0           		 		; SysTick Handler
				AREA    |.text|, CODE, READONLY

; Reset handler
Reset_Handler   PROC
				EXPORT  Reset_Handler             [WEAK]
                IMPORT  mymain
				IMPORT  SystemInit
				IMPORT  uart_init
				IMPORT	UsageFaultInit
				
				LDR SP, =(0x20000000+0x10000)
				
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
				
				BL mymain
				
                ENDP

UsageFault_Handler_asm PROC
				MOV R0, SP		; 传入栈(指向保存的现场)
				B UsageFault_Handler
				ENDP
					
					
                END