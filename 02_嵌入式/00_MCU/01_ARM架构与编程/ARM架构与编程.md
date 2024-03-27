# 一. 嵌入式概念及硬件组成

## 1. 处理器的区分

* MPU（微处理器单元）：作用等同于CPU，需配合内存、Flash等外设才能使用
* MCU（微控制器单元/单片机）：内部集成处理器和各类模块，CPU+RAM+Flash...
* Application Processors（应用处理器）：MCU的升级版本，如：手机主芯片

## 2. 嵌入式系统硬件组成

* 片内ROM（read only memory）：只读，用于执行CPU启动程序
* 片内RAM（random access memory）：可读可写，用于处理变量

<img src = ".\00_pic\01_嵌入式概念及硬件组成\P1.png" style = "zoom:100%">



# 二. 第一个程序（手写 start.S）

程序运行栈（程序目录：01_project\01_led_c）：

<img src = ".\00_pic\02_第一个程序（手写start.S）\P1.png" style = "zoom:100%">



# 三. ARM 架构

### 3.1 地址空间

X86架构地址：内存和IO分开

<img src = ".\00_pic\03_ARM架构\P1.png" style = "zoom:100%">

ARM架构地址：内存和IO一样

<img src = ".\00_pic\03_ARM架构\P2.png" style = "zoom:100%">

RISC指令（精简指令）：

<img src = ".\00_pic\03_ARM架构\P3.png" style = "zoom:100%">

CISC指令（复杂指令）：

<img src = ".\00_pic\03_ARM架构\P4.png" style = "zoom:100%">



### 3.2 ARM 内部寄存器

<img src = ".\00_pic\03_ARM架构\P5.png" style = "zoom:100%">

**不同芯片内部寄存器：**

* SP_process：RTOS线程栈指针
* SP_main：主程序栈指针

* xPSR：程序状态寄存器

* CPSR：当前程序状态寄存器

<img src = ".\00_pic\03_ARM架构\P6.png" style = "zoom:100%">

**xPSR（M3/M4）：**

* 重点关注：N、Z、C、V、Q

<img src = ".\00_pic\03_ARM架构\P7.png" style = "zoom:100%">

**CPSR（A7）：**

* 重点关注：N、Z、C、V、Q

<img src = ".\00_pic\03_ARM架构\P8.png" style = "zoom:100%">

**A7内部寄存器：**

* 不同模式寄存器不一样

<img src = ".\00_pic\03_ARM架构\P9.png" style = "zoom:100%">

### 3.3 ARM 汇编

#### 3.3.1 指令集

* Thumb 指令集：16位，节省空间
* ARM 指令集：32位，高效，太占空间
* Thumb-2 指令集：16位和32位混合

> 程序可能部分使用16位指令，部分使用32位指令。

1. ARM/cortex-A7：使用 Thumb 和 ARM 混合

   * CODE16：BX A_addr -> CODE32

   * CODE32：BX B_addr+1 -> CODE16

     > 通过函数地址的第 0 位来区分，在 ARM 指令集和 Thumb 指令集之间来回切换

2. cortex-M3/M4：使用 Thumb-2

   > Thumb-2 指令集：16 位和 32 位混合，CPU自动区分

#### 3.3.2 统一的汇编语言：UAL

> 参考书籍：
>
> 《DEN0013D_cortex_a_series_PG》P70
>
> 《ARM Cortex-M3与Cortex-M4权威指南》第5章

1. 以“数据处理”指令为例，UAL汇编格式为：

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

2. 立即数

   ``````assembly
   MOV R0, #VAL
   ``````

   * VAL 必须是立即数
   * 立即数 = 某个8位数，循环移位某个偶位数

3. 伪指令

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

### 3.4 ARM 汇编模拟器：VisUAL

#### 3.4.1 使用教程

> 官网：https://salmanarif.bitbucket.io/visual/downloads.html
>
> 使用方法：https://salmanarif.bitbucket.io/visual/user_guide/index.html

``````assembly
MOV		R0, #0x20000  	; 将 0x20000 写入到 R0
LDR		R1, =0x1234   	; 将 0x1234 写入到 R1
LDR		R2, =0x3456		; 将 0x3456 写入到 R2
CMP		R1, R2			; 比较 R1 和 R2 的值
STRLE	R1, [R0]		; 若 R1<=R2，执行该指令，将 R1 的数据写入 R0 所指向的地址
STRGT	R2, [R0]		; 若 R1>R2，执行该指令，将 R2 的数据写入 R0 所指向的地址
``````

#### 3.4.2 内存访问指令

1. **LDR：Load Register，读内存，从内存中将一个 32 位的数据写入到目的寄存器中**
* LDRB：将存储器中的 1 字节数据写入到目的寄存器中，同时将寄存器的高 24 位清零
   
* LDRH：将存储器中的 2 字节数据写入到目的寄存器中，同时将寄存器的高 16 位清零

<img src = ".\00_pic\03_ARM架构\P10.png" style = "zoom:100%">

2. **STR：Store Register，写内存，从源寄存器中将一个32位的数据写入到目的内存中**

   * STRB：从源寄存器中将 1 字节数据写入到内存中，该字节数据为源寄存器中的低 8 位

   * STRH：从源寄存器中将 2 字节数据写入到内存中，该半字数据为源寄存器中的低 16 位

<img src = ".\00_pic\03_ARM架构\P11.png" style = "zoom:110%">

3. **LDM：Load Multiple Register，读多个内存**

4. **STM：Store Multiple Register，写多个内存**

   <img src = ".\00_pic\03_ARM架构\P12.png" style = "zoom:100%">

   * reglist：低标号的寄存器对应低地址
   * IA, IB, DA, DB 的区别

   <img src = ".\00_pic\03_ARM架构\P13.png" style = "zoom:100%">

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



#### 3.4.3 栈的4种方式

1. 满/空

   * 满 SP：指向最后一个入栈的数据地址，先修改 SP 在入栈
   * 空 SP：指向下一个空地址，先入栈再修改 SP

2. 增/减

   * 增：SP 变大
   * 减：SP 变小

3. 满增、满减、空增、空减

   * 满减：SP 指向 0x1004，内有数据，数据入栈时，SP 先指向 0x1000，再写入数据（先减后写）

   * 满增：SP 指向 0x1000，内有数据，数据出栈时，先读取数据，SP 再指向 0x1004（先读后加）

     <img src = ".\00_pic\03_ARM架构\P14.png" style = "zoom:100%">

     <img src = ".\00_pic\03_ARM架构\P15.png" style = "zoom:70%">

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

     
