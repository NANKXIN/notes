
                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset
                AREA    RESET, DATA, READONLY
				EXPORT  __Vectors
					
__Vectors       DCD     0                  
                DCD     0x08000009	;Reset_Handler	; Reset Handler

				AREA    |.text|, CODE, READONLY

; Reset handler
Reset_Handler   PROC
				EXPORT  Reset_Handler             [WEAK]
                IMPORT  mymain
				IMPORT memcpy
				IMPORT memset
				
				IMPORT |Image$$ER_IROM1$$Base|
				IMPORT |Image$$ER_IROM1$$Length|
				IMPORT |Load$$ER_IROM1$$Base|
				
				IMPORT |Image$$RW_IRAM1$$Base|		; Execution address of the region.
				IMPORT |Image$$RW_IRAM1$$Length|	; Execution region length in bytes excluding ZI length.
				IMPORT |Load$$RW_IRAM1$$Base|		; Load address of the region.
				
				IMPORT |Image$$RW_IRAM1$$ZI$$Base|
				IMPORT |Image$$RW_IRAM1$$ZI$$Length|
				
				LDR SP, =(0x20000000+0x10000)
				
				; relocate code section
				LDR R0, = |Image$$ER_IROM1$$Base|	; ���ӵ�ַ
				LDR R1, = |Load$$ER_IROM1$$Base|	; ���ص�ַ
				LDR R2, = |Image$$ER_IROM1$$Length|	; ���ӳ���
				BL memcpy
				
				; relocate data section
				LDR R0, = |Image$$RW_IRAM1$$Base|	; ���ӵ�ַ
				LDR R1, = |Load$$RW_IRAM1$$Base|	; ���ص�ַ
				LDR R2, = |Image$$RW_IRAM1$$Length|	; ���ӳ���
				BL memcpy
				
				; clear bss/zi
				LDR R0, = |Image$$RW_IRAM1$$ZI$$Base|	; ���ӵ�ַ
				MOV R1, #0								; ��0
				LDR R2, = |Image$$RW_IRAM1$$ZI$$Length|	; ���ӳ���
				BL memset
				
				BL mymain

                ENDP
                
                END

