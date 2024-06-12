
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
				IMPORT |Image$$RW_IRAM1$$ZI$$Base|
				IMPORT |Image$$RW_IRAM1$$ZI$$Length|
				IMPORT memset
				
				LDR SP, =(0x20000000+0x10000)
				
				; relocate data section
				LDR R0, = |Image$$RW_IRAM1$$Base|	; 链接地址
				LDR R1, = |Load$$RW_IRAM1$$Base|	; 加载地址
				LDR R2, = |Image$$RW_IRAM1$$Length|	; 链接长度
				BL memcpy
				
				; clear bss/zi
				LDR R0, = |Image$$RW_IRAM1$$ZI$$Base|	; 链接地址
				MOV R1, #0								; 清0
				LDR R2, = |Image$$RW_IRAM1$$ZI$$Length|	; 链接长度
				BL memset
				
				BL main

                ENDP
                
                END

