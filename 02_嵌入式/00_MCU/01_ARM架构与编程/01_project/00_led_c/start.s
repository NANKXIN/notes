                PRESERVE8
                THUMB
                AREA    RESET, DATA, READONLY
				; ǰ����Ϊ�﷨�涨
				
				EXPORT  __Vectors
__Vectors       DCD     0
                DCD     Reset_Handler              ; Reset Handler
				
                AREA    |.text|, CODE, READONLY

; Reset handler
Reset_Handler   PROC
				EXPORT  Reset_Handler             [WEAK]
                IMPORT  main					; �����ⲿ���� main
				
				LDR SP,= (0x20000000+0x10000)  	; ����ջ
				BL main							; ��ת�� main
				
                ENDP

				END
					 
