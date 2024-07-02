
                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset
                AREA    RESET, DATA, READONLY
				EXPORT  __Vectors
					
__Vectors       DCD     0                  
                DCD     Reset_Handler              ; Reset Handler

				AREA    |.text|, CODE, READONLY

; Reset handler
Reset_Handler   PROC
				EXPORT  Reset_Handler             [WEAK]
                IMPORT  main
				IMPORT |Image$$RW_IRAM1$$Base|		; Execution address of the region.
				IMPORT |Image$$RW_IRAM1$$Length|	; Execution region length in bytes excluding ZI length.
				IMPORT |Load$$RW_IRAM1$$Base|		; Load address of the region.
				IMPORT memcpy
				
				LDR SP, =(0x20000000+0x10000)
				
				; relocate data section
				LDR R0, = |Image$$RW_IRAM1$$Base|	; ���ӵ�ַ
				LDR R1, = |Load$$RW_IRAM1$$Base|	; ���ص�ַ
				LDR R2, = |Image$$RW_IRAM1$$Length|	; ���ӳ���
				BL memcpy
				
				BL main

                ENDP
                
                END

