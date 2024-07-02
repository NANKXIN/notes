                PRESERVE8
                THUMB
                AREA    RESET, DATA, READONLY
				; 前三行为语法规定
				
				EXPORT  __Vectors
__Vectors       DCD     0
                DCD     Reset_Handler              ; Reset Handler
				
                AREA    |.text|, CODE, READONLY

; Reset handler
Reset_Handler   PROC
				EXPORT  Reset_Handler             [WEAK]			
				
				; enable GPIOB
				; pReg = (unsigned int *)(0x40021000U + 0x18U);
				; *pReg |= (1UL << 3U);
				LDR R0, = (0x40021000 + 0x18)
				LDR R1, [R0]
				ORR R1, R1, #(1<<3)
				STR R1, [R0]
				
				; set GPIOB0 as output
				; pReg = (unsigned int *)(0x40010C00U + 0x00U);
				; *pReg |= (1UL << 0U);
				LDR R0, = (0x40010C00 + 0x00)
				LDR R1, [R0]
				ORR R1, R1, #(1<<0)
				STR R1, [R0]
				
				LDR R2, = (0x40010C00 + 0x0C) ; 防止被 delay 函数内的 R0 覆盖
Loop
				; set GPIOB0 output high
				; *pReg |= (1UL << 0U);
				LDR R1, [R2]
				ORR R1, R1, #(1<<0)
				STR R1, [R2]
				
				; delay
				LDR R0, = 10000
				BL delay
				
				; set GPIOB0 output low
				LDR R1, [R2]
				BIC R1, R1, #(1<<0)
				STR R1, [R2]
				
				; delay
				LDR R0, = 10000
				BL delay
				
				B Loop
				
                ENDP  ; 结束子程序

delay
				SUBS R0, R0, #1		; R0--
				BNE delay			; 不为0
				MOV PC, LR

				END
					 
