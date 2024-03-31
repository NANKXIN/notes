# Bootloader

## 1. bootloader 功能

* 初始化硬件：时钟、内存
* 启动内核/APP：从Flash读出内核、存入内核、给内核设置参数、启动内核
* 调试作用：调试内核、更新内核



## 2. 必备知识

BootLoader的主要功能：启动APP

<img src = ".\00_pic\06_BootLoader的功能与必备知识\P1.png" style = "zoom:100%">

怎么启动APP？

* 我们编写单片机程序时都是烧写在Flash开头，现在这个APP不是位于Flash开头，有什么区别？
  * 段的概念、重定位的概念
  * 散列文件
* 异常向量
  * 以前异常向量在Flash开头
  * APP想使用异常时怎么提供异常向量？
