# 一. 嵌入式概念及硬件组成

## 1.1 处理器的区分

* MPU（微处理器单元）：作用等同于CPU，需配合内存、Flash等外设才能使用
* MCU（微控制器单元/单片机）：内部集成处理器和各类模块，CPU+RAM+Flash...
* Application Processors（应用处理器）：MCU的升级版本，如：手机主芯片

## 1.2 嵌入式系统硬件组成

* 片内ROM（read only memory）：只读，用于执行CPU启动程序
* 片内RAM（random access memory）：可读可写，用于处理变量
* <img src = ".\00_pic\01_嵌入式概念及硬件组成\P1.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%">  



# 二. 启动程序

程序运行栈（程序目录：01_project\01_led_c）：

``````assembly
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
``````

<img src = ".\00_pic\02_第一个程序（手写start.S）\P1.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

# 三. ARM 架构

## 3.1 地址空间

1. **X86架构地址：内存和IO分开**
   * <img src = ".\00_pic\03_ARM架构\P1.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

2. **ARM架构地址：内存和IO一样**
   * <img src = ".\00_pic\03_ARM架构\P2.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

3. **RISC指令（精简指令）**
   * <img src = ".\00_pic\03_ARM架构\P3.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%"> 

4. **CISC指令（复杂指令）**
   * <img src = ".\00_pic\03_ARM架构\P4.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%"> 

## 3.2 ARM 内部寄存器

<img src = ".\00_pic\03_ARM架构\P5.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%"> 

1. **不同芯片内部寄存器**

   * SP_process：RTOS线程栈指针

   * SP_main：主程序栈指针


   * xPSR：程序状态寄存器


   * CPSR：当前程序状态寄存器
   * <img src = ".\00_pic\03_ARM架构\P6.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%"> 


2. **xPSR（M3/M4）**
   * 重点关注：N、Z、C、V、Q
   * <img src = ".\00_pic\03_ARM架构\P7.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%"> 


3. **CPSR（A7）：**
   * 重点关注：N、Z、C、V、Q
   * <img src = ".\00_pic\03_ARM架构\P8.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%"> 


4. **A7内部寄存器：**
   * 不同模式寄存器不一样
   * <img src = ".\00_pic\03_ARM架构\P9.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%"> 

## 3.3 ARM 汇编

### 3.3.1 指令集

* Thumb 指令集：16位，节省空间

* ARM 指令集：32位，高效，太占空间

* Thumb-2 指令集：16位和32位混合

  > 程序可能部分使用16位指令，部分使用32位指令。

1. **ARM/cortex-A7：使用 Thumb 和 ARM 混合**

   * CODE16：BX A_addr -> CODE32

   * CODE32：BX B_addr+1 -> CODE16

     > 通过函数地址的第 0 位来区分，在 ARM 指令集和 Thumb 指令集之间来回切换

2. **cortex-M3/M4：使用 Thumb-2**

   <blockquote alt = 'red'>Thumb-2 指令集：16 位和 32 位混合，CPU自动区分</blockquote>

### 3.3.2 UAL

* **ARM 统一的汇编语言**

> 参考书籍：
>
> 《DEN0013D_cortex_a_series_PG》P70
>
> 《ARM Cortex-M3与Cortex-M4权威指南》第5章

1. **以“数据处理”指令为例，UAL汇编格式为：**

   ``````C
   Operation{cond}{S} Rd, Rn, Operand2
   ``````

   * Operation：表示各类汇编指令，如：ADD、MOV

   * cond：表示 condtion，即该指令执行的条件

     * ``````assembly
       CMP R1, R3
       MOV EQ R1, R2
       ``````

     * EQ：为 cond，如果 CMP 指令成立，才会执行 MOV 语句

   * S：表示该指令执行后，会区修改程序状态寄存器

   * Rd：表示目的寄存器

   * Rn、Operand2：两个源操作函数

2. **立即数**

   ``````assembly
   MOV R0, #VAL
   ``````

   * VAL 必须是立即数
   * 立即数 = 某个8位数，循环移位某个偶位数

3. **伪指令**

   ``````assembly
   LDR R0, =VAL
   ``````

   * = 表示该指令为伪指令
   * VAL 可以是任意值
   * 编译器会将其转换为真爽的指令
     * 若 VAL 为立即数：MOV R0, #VAL
     * 若不是立即数：LDR R0, [PC, #offset]，从内存中读出该值

   ``````assembly
   ADR R0, Loop
   Loop
   	ADD R0, R0, #1
   ``````

   * `ADR R0, Loop` 转换成 `ADD R0, PC, #val`，val 在链接时确定

## 3.4 ARM 汇编模拟器：VisUAL

> 官网：https://salmanarif.bitbucket.io/visual/downloads.html
>
> 使用方法：[https://salmanarif.bitbucket.io/visual/user_guide/index.html](https://salmanarif.bitbucket.io/visual/user_guide/index.html)

``````assembly
MOV		R0, #0x20000  	; 将 0x20000 写入到 R0
LDR		R1, =0x1234   	; 将 0x1234 写入到 R1
LDR		R2, =0x3456		; 将 0x3456 写入到 R2
CMP		R1, R2			; 比较 R1 和 R2 的值
STRLE	R1, [R0]		; 若 R1<=R2，执行该指令，将 R1 的数据写入 R0 所指向的地址
STRGT	R2, [R0]		; 若 R1>R2，执行该指令，将 R2 的数据写入 R0 所指向的地址
``````

## 3.5 内存访问指令

### 3.5.1 指令详解

1. **LDR：Load Register，读内存，从内存中将一个 32 位的数据写入到目的寄存器中**
   * LDRB：将存储器中的 1 字节数据写入到目的寄存器中，同时将寄存器的高 24 位清零
     
   * LDRH：将存储器中的 2 字节数据写入到目的寄存器中，同时将寄存器的高 16 位清零
   * <img src = ".\00_pic\03_ARM架构\P10.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%"> 


2. **STR：Store Register，写内存，从源寄存器中将一个32位的数据写入到目的内存中**

   * STRB：从源寄存器中将 1 字节数据写入到内存中，该字节数据为源寄存器中的低 8 位

   * STRH：从源寄存器中将 2 字节数据写入到内存中，该半字数据为源寄存器中的低 16 位
   
   * <img src = ".\00_pic\03_ARM架构\P11.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:110%">  

3. **LDM：Load Multiple Register，读多个内存**

4. **STM：Store Multiple Register，写多个内存**

   <img src = ".\00_pic\03_ARM架构\P12.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%"> 

   * **reglist：低标号的寄存器对应低地址**
   * IA, IB, DA, DB 的区别
     * <img src = ".\00_pic\03_ARM架构\P13.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%">  
   

   例1：

    ``````assembly
    ldr		r0, =0x20000	; 将 0x20000 写入到 r0
    ldr		r1, =0x12345678	; 将 0x12345678 写入到 r1
    str		r1, [r0]		; 将 r1 的数据写到 r0 所指地址
    ldrb	r3, [r0]		; 从 r0 所指地址读数据到 r3
    ``````

    例2：

    ``````assembly
    MOV		R0, #0x20000
    MOV		R1, #0x10
    MOV		R2, #0x12
    STR		R2, [R0]              ; R2 的值存到 R0 所示地址
    STR		R2, [R0, #4]          ; R2 的值存到 R0+4 所示地址
    STR		R2, [R0, #8]!         ; R2 的值存到 R0+8 所示地址, R0=R0+8
    STR		R2, [R0, R1]          ; R2 的值存到 R0+R1 所示地址
    STR		R2, [R0, R1, LSL #4]  ; R2 的值存到 R0+(R1<<4) 所示地址
    STR		R2, [R0], #0X20       ; R2 的值存到 R0 所示地址, R0=R0+0x20
    MOV		R2, #0x34
    STR		R2, [R0]              ; R2 的值存到 R0 所示地址
    LDR		R3, [R0], +R1, LSL #1 ; R3 的值等于 R0+(R1<<1) 所示地址上的值，R0=R0+(R1<<1)
    ``````

    例3：

    ``````assembly
    MOV		R1, #1
    MOV		R2, #2
    MOV		R3, #3
    MOV		R0, #0x20000
    STMIA	R0,	{R1-R3} 	; 入栈：R1,R2,R3 分别存入 R0,R0+4,R0+8 地址处
    ADD		R0, R0, #0x10
    STMIA	R0!, {R1-R3} 	; 出栈：R1,R2,R3 分别存入 R0,R0+4,R0+8 地址处, R0=R0+3*4
    ``````



### 3.5.2 栈的4种方式

1. **满/空**

   * 满 SP：指向最后一个入栈的数据地址，先修改 SP 在入栈
   * 空 SP：指向下一个空地址，先入栈再修改 SP

2. **增/减**

   * 增：SP 变大
   * 减：SP 变小

3. **满增、满减、空增、空减**

   * 满减：SP 指向 0x1004，内有数据，数据入栈时，SP 先指向 0x1000，再写入数据（先减后写）

   * 满增：SP 指向 0x1000，内有数据，数据出栈时，先读取数据，SP 再指向 0x1004（先读后加）

     <img src = ".\00_pic\03_ARM架构\P14.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%" > 

     <img src = ".\00_pic\03_ARM架构\P15.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:70%"> 

     ``````assembly
     MOV		R1, #1
     MOV		R2, #2
     MOV		R3, #3
     MOV		SP, #0x20000 ; SP 指向 0x20000
     STMFD	SP!, {R1-R3} ; R3,R2,R1 分别存入 SP-4,SP-8,SP-12 地址处, SP=SP-12
     MOV		R1, #0
     MOV		R2, #0
     MOV		R3, #0
     LDMFD	SP!, {R1-R3} ; R1,R2,R3 分别得到 SP,SP+4,SP+8 地址处的值, SP=SP+12
     ``````



## 3.6 数据处理指令

### 3.6.1 指令详解

<img src = ".\00_pic\03_ARM架构\P16.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%"> 

1. **加法 ADD**

   ``````assembly
   MOV R2, #1
   MOV R3, #2
   ADD R1, R2, R3	; R1 = R2 + R3
   ``````

   ``````assembly
   MOV R2, #1
   ADD R1, R2, #0x12	; R1 = R2 + 0x12
   ``````

   * #后都为立即数

2. **减法 SUB**

   ``````assembly
   MOV R2, #1
   MOV R3, #2
   SUB R1, R2, R3	; R1 = R2 - R3
   ``````

   ``````assembly
   MOV R2, #1
   SUB R1, R2, #0x12	; R1 = R2 - 0x12
   ``````

3. **位操作**

   ``````assembly
   AND R1, R2, #(1<<4)	; 位与，R1 = R2 & (1<<4)
   AND R1, R2, R3			; 位与，R1 = R2 & R3
   BIC R1, R2, #(1<<4)	; 清除某位，R1 = R2 & ~(1<<4)
   BIC R1, R2, R3			; 清除某位，R1 = R2 & ~R3
   ORR R1, R2, R3			; 位或，R1 = R2 | R3
   ``````

4. **比较**（比较结果会影响程序状态寄存器）

   ``````assembly
   CMP R0, R1				; 比较 R0 - R1 的结果
   CMP R0, #0x12			; 比较 R0 - 0x12 的结果
   TST R0, R1				; 测试 R0 & R1 的结果
   TST R0, #(1<<4)		; 测试 R0 & (1<<4) 的结果
   ``````

### 3.6.2 程序状态寄存器 和 指令 condition

   * <img src = ".\00_pic\03_ARM架构\P17.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%"> 
   * <img src = ".\00_pic\03_ARM架构\P18.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:150%"> 

   * 例：

   <img src = ".\00_pic\03_ARM架构\P19.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:60%"> 

   <img src = ".\00_pic\03_ARM架构\P20.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:60%"> 

> R0 和 R1 相等，Z 和 C 位置 1，则可使用 EQ (Z=1) 条件将 2 写入 R0



## 3.7 跳转指令

### 3.7.1 指令详解

1. **B：Branch，跳转**

2. **BL：Branch with Link，跳转前先把返回地址保存在 LR 寄存器中**

3. **BX：Branch and eXchange，根据跳转地址的 BIT0 切换为 ARM 或 Thumb 状态（0：ARM状态，1：Thumb状态）**

4. **BLX：Branch with Link and eXchange，根据跳转地址的 BIT0 切换为 ARM 或 Thumb 状态（0：ARM状态，1：Thumb状态）**

   <img src = ".\00_pic\03_ARM架构\P21.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

例1：

* <img src = ".\00_pic\03_ARM架构\P31.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%"> 

* **注意：BEN Loop，状态寄存器 Z 位为 0 时执行，为 1 时跳过**

  * <img src = ".\00_pic\03_ARM架构\P22.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

  * <img src = ".\00_pic\03_ARM架构\P23.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

  * <img src = ".\00_pic\03_ARM架构\P24.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

  * <img src = ".\00_pic\03_ARM架构\P25.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

  * <img src = ".\00_pic\03_ARM架构\P26.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

  * <img src = ".\00_pic\03_ARM架构\P27.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

  * <img src = ".\00_pic\03_ARM架构\P28.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

  * <img src = ".\00_pic\03_ARM架构\P29.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

  * LR 的值为 0，返回第一条指令

  * <img src = ".\00_pic\03_ARM架构\P30.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

例2：

* **执行完 BL 后，LR 寄存器值为 0x04，也就是下一条指令的地址，即返回地址**

* <img src = ".\00_pic\03_ARM架构\P32.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

* <img src = ".\00_pic\03_ARM架构\P33.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

例3：

* **直接设置 LR（返回指令地址） 和 PC（下一条指令地址）**

* <img src = ".\00_pic\03_ARM架构\P34.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

* <img src = ".\00_pic\03_ARM架构\P35.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 

* <img src = ".\00_pic\03_ARM架构\P36.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:80%"> 



# 四. 启动程序深度解析

## 4.1 字节序、位操作

* **高位存低地址，大端字节序；低位存低地址，小端字节序（ARM 一般默认小端）**

1. a << n = a * 2 ^ n（所有数值的权重都增加 2^n）
2. a >> n = a / 2 ^ n（同理）
3. a & ~( (1<<7) | (1<<8) )，a 第 7 位和第 8 位清 0

## 4.2 汇编、反汇编、机器码

> keil 下反汇编：
>
> `fromelf  --bin  --output=led.bin  Objects\led_c.axf`
>
> `fromelf  --text  -a -c  --output=led.dis  Objects\led_c.axf`

<img src = ".\00_pic\04_第一个程序深度解析\P1.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%">

伪指令转换为真实指令：

- <img src = ".\00_pic\04_第一个程序深度解析\P2.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%">

- <img src = ".\00_pic\04_第一个程序深度解析\P3.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%">
- Cortex A7：==PC = CUR ADDR + 8==；ARM 指令
- Cortex M3/M4：==PC = CUR ADDR + 4==，Thumb 指令（不管 16 位还是 32 位）
- 处理器指令处理：执行当前指令，处理下一条，读取下下条

## 4.3 C与汇编深入分析

### 4.3.1 ATPCS

ATPCS规则（ARM-Thumnb过程调用标准）：

1. R0-R3：调用者和被调用者之间传参数

2. R4-R11（V1-V8）：函数可能被使用，所以在函数的入口保存它们，在函数的出口恢复它们

   <img src = ".\00_pic\04_第一个程序深度解析\P4.png" style = "box-shadow: 0px 0px 3px 1px #888888; zoom:100%">

### 4.3.2 反汇编代码解析

main.c

``````c
void delay(unsigned int cnt)
{
	while (cnt--)
	{
	}
}

int mymain()
{
	unsigned int *pReg;
	
	// 使能GPIO
	pReg = (unsigned int *)(0x40021000U + 0x18U);
	*pReg |= (1UL << 3U);
	// 设置GPIOB0为输出引脚
	pReg = (unsigned int *)(0x40010C00U + 0x00U);
	*pReg |= (1UL << 0U);
	
	pReg = (unsigned int *)(0x40010C00U + 0x0CU);
	
	while (1)
	{
		// 设置GPIOB0为输出1
		*pReg |= (1UL << 0U);
		
		delay(10000U);
		
		// 设置GPIOB0为输出0
		*pReg &= ~(1UL << 0U);
		
		delay(10000U);
	}
}
``````


led.dis（反汇编）

``````assembly
i.delay
delay
	
	0x08000014:    bf00        ..      NOP      
	; r1 = r0 - 0
	0x08000016:    1e01        ..      SUBS     r1,r0,#0
	; r0 = r0 - 1
	0x08000018:    f1a00001    ....    SUB      r0,r0,#1
	; 不为 0，跳转到 0x8000016
	0x0800001c:    d1fb        ..      BNE      0x8000016 ; delay + 2
	; 为 0，返回
	0x0800001e:    4770        pG      BX       lr

i.mymain
mymain

	; pReg = (unsigned int *)(0x40021000U + 0x18U);
	; r3 = [pc + 56] = [0x800005c] = 0x40021018
		; pc = 0x08000020 + 4 = 0x08000024 + 56 = 0x800005c
		; 从地址 pc+56 读数据(0x40021018)到 r3
	0x08000020:    4b0e        .K      LDR      r3,[pc,#56]
	
	; *pReg |= (1UL << 3U);
	; r0 = [r3 + 0]						从 r3 存储的地址(0x40021018)读数据到 r0
	; r0 = r0 | 8
	; [r3 + 0] = r0						将 r0 写入 r3 存储的地址(0x40021018)
	0x08000022:    6818        .h      LDR      r0,[r3,#0]
	0x08000024:    f0400008    @...    ORR      r0,r0,#8
	0x08000028:    6018        .`      STR      r0,[r3,#0]
	
	; pReg = (unsigned int *)(0x40010C00U + 0x00U);
	; r3 = [pc + 0x52] = [0x8000060] = 0x40010c00
	; 从地址 pc+52 读数据(0x40010c00)到 r3
	0x0800002a:    4b0d        .K      LDR      r3,[pc,#52]
	
	; *pReg |= (1UL << 0U);
	; r0 = [r3 + 0]					从 r3 存储的地址(0x40010c00)读数据到 r0
	; r0 = r0 | 1
	; [r3 + 0] = r0					将 r0 写入 r3 存储的地址(0x40010c00)
	0x0800002c:    6818        .h      LDR      r0,[r3,#0]
	0x0800002e:    f0400001    @...    ORR      r0,r0,#1
	0x08000032:    6018        .`      STR      r0,[r3,#0]
	
	; pReg = (unsigned int *)(0x40010C00U + 0x0CU);
	; r3 = [pc + 40] = [0x8000060] = 0x40010c00
	; r3 = r3 + 0x0c
	0x08000034:    4b0a        .K      LDR      r3,[pc,#40]
	0x08000036:    330c        .3      ADDS     r3,r3,#0xc
	
	; 跳转到 0x800005a = mymain + 58
	; 再跳转到 0x800003a = mymain + 26
	; 应该是 while 循环
	0x08000038:    e00f        ..      B        0x800005a
	
	; *pReg |= (1UL << 0U);
	; r0 = [r3 + 0]				从 r3 存储的地址读数据到 r0
	; r0 = r0 | 1
	; [r3 + 0] = r0				将 r0 写入 r3 存储的地址
	0x0800003a:    6818        .h      LDR      r0,[r3,#0]
	0x0800003c:    f0400001    @...    ORR      r0,r0,#1
	0x08000040:    6018        .`      STR      r0,[r3,#0]
	
	; delay(10000U);
	; r0 = 0x2710 = 10000
	; 跳转到 delay (0x8000014)
	0x08000042:    f2427010    B..p    MOV      r0,#0x2710
	0x08000046:    f7ffffe5    ....    BL       delay
	
	; *pReg &= ~(1UL << 0U);
	; r0 = [r3 + 0]				从 r3 存储的地址读数据到 r0
	; r0 &= ~(r0 | 1)
	; [r3 + 0] = r0				将 r0 写入 r3 存储的地址
	0x0800004a:    6818        .h      LDR      r0,[r3,#0]
	0x0800004c:    f0200001     ...    BIC      r0,r0,#1
	0x08000050:    6018        .`      STR      r0,[r3,#0]
	
	; delay(10000U);
	; r0 = 0x2710 = 10000
	; 跳转到 delay (0x8000014)
	0x08000052:    f2427010    B..p    MOV      r0,#0x2710
	0x08000056:    f7ffffdd    ....    BL       delay
	
	; 跳转回 0x0800003a
	0x0800005a:    e7ee        ..      B        0x800003a
	
$d
	0x0800005c:    40021018    ...@    DCD    1073877016
	0x08000060:    40010c00    ...@    DCD    1073810432
``````

修改源码：

```c
int delay(volatile int cnt)
{
	while (cnt--)
	{
	}
	
	return 55;
}
```

反汇编：

```assembly
i.delay
delay
	
	; 将 r0 和 lr 存入栈内	  r0 为形参 cnt
	0x08000014:    b501        ..      PUSH     {r0,lr}
	0x08000016:    bf00        ..      NOP      
	
	; ==========> while
	; r0 = [sp + 0]    			从 sp 指向的地址读数据到 r0, 即 r0 = cnt
	0x08000018:    9800        ..      LDR      r0,[sp,#0]
	; r1 = r0 - 1
	0x0800001a:    1e41        A.      SUBS     r1,r0,#1
	; 将 r1 写入 sp + 0 所指地址
	0x0800001c:    9100        ..      STR      r1,[sp,#0]
	; 比较 r0 和 0
	0x0800001e:    2800        .(      CMP      r0,#0
	; 不为0 跳到 0x08000018
	; while <==========
	
	0x08000020:    d1fa        ..      BNE      0x8000018 ; delay + 4
	; 为0 r0 = 0x37 (返回值)
	0x08000022:    2037        7       MOVS     r0,#0x37
	; 从栈中把之前的 lr 赋给 pc
	0x08000024:    bd08        ..      POP      {r3,pc}
	; 该指令无作用, 可能是用于对齐
	0x08000026:    0000        ..      MOVS     r0,r0
```

- Flash 上存放的是第2列的机器码

## 4.4 纯汇编点灯



# 五. 使用按键控制LED

C语言代码：

```assembly
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
         IMPORT  mymain					; 调用外部函数 main
				
				LDR SP,= (0x20000000+0x10000)  	; 设置栈
				BL mymain							; 跳转到 main
				
         ENDP

				END
					 

```



```C

int delay(volatile int cnt)
{
	while (cnt--)
	{
	}
	
	return 0x55;
}

int mymain()
{
	unsigned int *pReg;
	
	// 使能GPIO
	pReg = (unsigned int *)(0x40021000U + 0x18U);
	*pReg |= (1UL << 3U);
	// 设置GPIOB0为输出引脚
	pReg = (unsigned int *)(0x40010C00U + 0x00U);
	*pReg |= (1UL << 0U);
	
	pReg = (unsigned int *)(0x40010C00U + 0x0CU);
	
	while (1)
	{
		// 设置GPIOB0为输出1
		*pReg |= (1UL << 0U);
		
		delay(10000U);
		
		// 设置GPIOB0为输出0
		*pReg &= ~(1UL << 0U);
		
		delay(10000U);
	}
}

```

纯汇编：

```assembly
                PRESERVE8
                THUMB
                AREA    RESET, DATA, READONLY
							; 前三行为语法规定
				
							EXPORT  __Vectors
__Vectors       DCD     0
                DCD     Reset_Handler              ; Reset Handler
				
                AREA    |.text|, CODE, READONLY

Reset_Handler   PROC  ; 子程序开始
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
					 

```







# 六. 串口编程



# 七. keil_gcc_Makefile



# 八. 代码重定位



# 九. 异常和中断



