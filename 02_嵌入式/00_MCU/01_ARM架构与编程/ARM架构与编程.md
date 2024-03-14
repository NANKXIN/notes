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



# 三. ARM架构

### 3.1 地址空间

X86架构地址：内存和IO分开

<img src = ".\00_pic\03_ARM架构\P1.png" style = "zoom:100%">

ARM架构地址：内存和IO一样

<img src = ".\00_pic\03_ARM架构\P2.png" style = "zoom:100%">

RISC指令（精简指令）：

<img src = ".\00_pic\03_ARM架构\P3.png" style = "zoom:100%">

CISC指令（复杂指令）：

<img src = ".\00_pic\03_ARM架构\P4.png" style = "zoom:100%">



### 3.2 ARM内部寄存器

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

### 3.3 ARM汇编
