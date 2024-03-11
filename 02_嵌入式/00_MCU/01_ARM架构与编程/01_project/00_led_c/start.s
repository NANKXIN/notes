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
                IMPORT  main					; 调用外部函数 main
				
				LDR SP,= (0x20000000+0x10000)  	; 设置栈
				BL main							; 跳转到 main
				
                ENDP

				END
					 
