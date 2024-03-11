# 一. 嵌入式概念及硬件组成

## 1. 处理器的区分

* MPU（微处理器单元）：作用等同于CPU，需配合内存、Flash等外设才能使用
* MCU（微控制器单元/单片机）：内部集成处理器和各类模块，CPU+RAM+Flash...
* Application Processors（应用处理器）：MCU的升级版本，如：手机主芯片

## 2. 嵌入式系统硬件组成

* 片内ROM（read only memory）：只读，用于执行CPU启动程序
* 片内RAM（random access memory）：可读可写，用于处理变量

<img src = ".\00_pic\01_嵌入式概念及硬件组成\P1.png" style = "zoom:100%">

## 3. 第一个程序（手写 start.S）

程序运行栈（程序目录：01_project\01_led_c）：

<img src = ".\00_pic\02_第一个程序（手写start.S）\P1.png" style = "zoom:100%">
