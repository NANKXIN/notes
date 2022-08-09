[TOC]

# 一. 必备Linux命令和C语言基础

## 1. Linux常用命令
* __ls：__ -R 查看对应文件及所在目录
* __cat：__ 打印文件内容到终端；__-s__：空行合并；__-b__：显示行号
* __nl：__ 相当于 cat -b
* __head：__ 默认显示前10行；head -5 test.c：显示前5行
* __tail：__ 默认显示后10行

- __cp：__ cp test.c test2.c —— 拷贝test.c为test2.c
　　cp tets.c /home/a -i —— 拷贝到a目录，-i提示是否覆盖
　　cp test.c /home/a test2.c —— 拷贝到a目录，重命名为test2.c
　　cp -r —— 拷贝目录需要加上-r

* __mv：__ mv test.c /home/a —— 移动
　　mv test.c test2.c —— 重命名
　　mv test.c /home/a test2.c —— 移动并重命名

- __touch：__ touch test.c —— 创建文件test.c(不存在)，修改时间(存在)

* __rm：__ 删除文件
　　__-i：__ 带提示
　　__-r：__ 删除目录

- __mkdir：__ 创建目录
　　　　mkdir -p d1/d2 —— 创建多级目录

<!--============================================================-->

## 2. vi编辑器的使用
### (1). 基础命令
> <font face="华文细黑" color=#008B8B size=5>模式切换</font>
>> * <font face="consolas" color=#DC143C size=5>a</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>光标之后插入</font>**
>> * <font face="consolas" color=#DC143C size=5>A</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>行尾插入</font>**
>> * <font face="consolas" color=#DC143C size=5>i</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>光标之前插入</font>**
>> * <font face="consolas" color=#DC143C size=5>I</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>行首插入</font>**
>> * <font face="consolas" color=#DC143C size=5>o</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>光标下一行插入新行</font>**
>> * <font face="consolas" color=#DC143C size=5>O</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>光标上一行插入新行</font>**
>> * <font face="consolas" color=#DC143C size=5>esc</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>退出插入模式，进入命令行模式</font>**
>> * <font face="consolas" color=#DC143C size=5>:command</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>退出命令行模式，进入底行模式</font>**
<!--
### (1). 模式切换
* __a__ &nbsp;&nbsp; 当前 __光标之后__
* __A__ &nbsp;&nbsp; 当前 __行尾__
* __i__ &nbsp;&nbsp; 当前 __光标之前__
* __I__ &nbsp;&nbsp; 当前 __行首__
* __o__ &nbsp;&nbsp; __下__ 一行插入 __新行__
* __O__ &nbsp; __上__ 一行插入 __新行__
* __esc__ &nbsp;&nbsp; 退出插入模式，进入命令行模式
* __:command__ &nbsp;&nbsp; 从命令行模式进入底行模式
-->
> <font face="华文细黑" color=#008B8B size=5>常用操作</font>
>> 1. <font face="华文细黑" color=#008B8B size=4>保存 / 退出</font>
>> * <font face="consolas" color=#DC143C size=5>:q</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>退出未修改的文件</font>**
>> * <font face="consolas" color=#DC143C size=5>:q!</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>强制退出，不保存</font>**
>> * <font face="consolas" color=#DC143C size=5>:w</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>保存文件，不退出</font>**
>> * <font face="consolas" color=#DC143C size=5>:x</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>保存文件，退出</font>**
>> * <font face="consolas" color=#DC143C size=5>:w file</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>另存为 file，不退出</font>**
>> * <font face="consolas" color=#DC143C size=5>:r file</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>读入 file 指定的文件内容插入</font>**
>> * <font face="consolas" color=#DC143C size=5>:pwd</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>显示当前文件目录</font>**
>> 2. <font face="华文细黑" color=#008B8B size=4>拷贝 / 粘贴 / 删除 / 取消</font>
>> * <font face="consolas" color=#DC143C size=5>[n]x</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>删除光标位置开始的连续 n 个字符（并复制到编辑缓冲区）</font>**
>> * <font face="consolas" color=#DC143C size=5>[n]dd</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>删除(剪切)光标位置开始的连续 n 行（并复制到编辑缓冲区）</font>**
>> * <font face="consolas" color=#DC143C size=5>[n]yy</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>复制从光标位置开始的连续 n 行到编辑缓冲区</font>**
>> * <font face="consolas" color=#DC143C size=5>p</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>从编辑缓冲区复制文本到当前光标下一行</font>**
>> * <font face="consolas" color=#DC143C size=5>P</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>从编辑缓冲区复制文本到当前光标上一行</font>**
>> * <font face="consolas" color=#DC143C size=5>u</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>取消上次操作</font>**
<!--
### (2). 常用操作
1. __保存 / 退出__
    * __:q__ &nbsp;&nbsp; 退出未修改文件
    * __:q!__ &nbsp;&nbsp; 强制退出，不保存
    * __:w__ &nbsp;&nbsp; 保存文件，不退出
    * __:x__&nbsp;&nbsp; 保存并退出
    * __:w file__ &nbsp;&nbsp; 另存为file，不退出
    * __:r file__ &nbsp;&nbsp; 读入file指定的文件内容插入
    * __:!pwd__ &nbsp;&nbsp; 显示当前文件目录
2. __拷贝 / 粘贴 / 删除 / 取消__
    * __[n]x__ &nbsp;&nbsp; 删除光标位置开始的连续n个字符（并复制到编辑缓冲区）
    * __[n]dd__ &nbsp;&nbsp; 删除(剪切)光标位置开始的连续n行（并复制到编辑缓冲区）
    * __[n]yy__ &nbsp;&nbsp; 复制从光标位置开始的连续n行到编辑缓冲区
    * __p__ &nbsp;&nbsp; 从编辑缓冲区复制文本到当前光标 __下__ 一行
    * __P__ &nbsp;&nbsp; 从编辑缓冲区复制文本到当前光标 __上__ 一行
    * __u__ &nbsp;&nbsp; 取消上次操作
-->

### (2). 高级命令
> <font face="华文细黑" color=#008B8B size=5>光标命令</font>
>> * <font face="consolas" color=#DC143C size=5>hjkl</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>左下上右</font>**
>> * <font face="consolas" color=#DC143C size=5>1G</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>到第一行</font>**
>> * <font face="consolas" color=#DC143C size=5>G</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>到最后一行</font>**
>> * <font face="consolas" color=#DC143C size=5>:n</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>到第 n 行</font>**
>> * <font face="consolas" color=#DC143C size=5>:set nu</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>显示行号</font>**
>> * <font face="consolas" color=#DC143C size=5>:set nonu</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>隐藏行号</font>**
<!--
1. __光标命令__
    * __hjkl__ &nbsp;&nbsp; 左下上右
    * __1G__ &nbsp;&nbsp; 到第一行
    * __G__ &nbsp;&nbsp; 到最后一行
    * __:n__ &nbsp;&nbsp; 到第n行
    * __:set nu__ &nbsp;&nbsp; 显示行号
    * __:set nonu__ &nbsp;&nbsp; 取消显示行号
-->
> <font face="华文细黑" color=#008B8B size=5>查找命令</font>
>> * <font face="consolas" color=#DC143C size=5>/string</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>从光标开始向后查找字符串</font>**
>> * <font face="consolas" color=#DC143C size=5>?string</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>从光标开始向前查找字符串</font>**
>> * <font face="consolas" color=#DC143C size=5>g/string</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>光标停止在第一个检索到的行首，显示所有相关行</font>**
>> * <font face="consolas" color=#DC143C size=5>n</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>在同一个方向重复上一次搜索命令</font>**
>> * <font face="consolas" color=#DC143C size=5>N</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>在反方向重复上一次搜索命令</font>**
<!--
2. __查找命令__
    * __/string__  &nbsp;&nbsp; 从光标开始向 __后__ 查找字符串
    * __?string__  &nbsp;&nbsp; 从光标开始向 __前__ 查找字符串
    * __g/string__ &nbsp;&nbsp; 光标停止在第一个检索到的行首，显示所有相关行
    * __n__  &nbsp;&nbsp; 重复上一次命令
    * __N__  &nbsp;&nbsp; 反向重复上一次命令
-->
> <font face="华文细黑" color=#008B8B size=5>替换命令</font>
>> * <font face="consolas" color=#DC143C size=5>: [范围] s /old/new</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>将 old 替换为 new，范围不写则为当前行</font>**
>> * <font face="consolas" color=#DC143C size=5>: 10,15 s /old/new/g</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>从10到15行所有 old 替换为 new（g 代表全部）</font>**
>> * <font face="consolas" color=#DC143C size=5>: .,$ s /old/new</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>从当前行到最后一行</font>**
>> * <font face="consolas" color=#DC143C size=5>: 1,$ s /old/new</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>从第一行到最后一行</font>**
>> * <font face="consolas" color=#DC143C size=5>: %s /old/new</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>全文替换</font>**
>> * <font face="consolas" color=#DC143C size=5>/g</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>替换所有，否则若一行有多个，只替换第一个</font>**
<!--
3. __替换命令__
    * __: [范围] s /old/new__  &nbsp;&nbsp; 将old替换为new，范围不写为当前行
    * __: 10,15 s /old/new/g__ &nbsp;&nbsp; 从10到15行所有old替换为new（g代表全部）
    * __: .,$ s /old/new__ &nbsp;&nbsp; 从当前行到最后一行
    * __: 1,$ s /old/new__ &nbsp;&nbsp; 从第1行到最后一行
    * __: % s /old/new__ &nbsp;&nbsp; 全文替换
    * __最后加 /g__ &nbsp;&nbsp; 全文替换，否则只替换第一个
-->
> <font face="华文细黑" color=#008B8B size=5>复制 / 剪切</font>
>> * <font face="consolas" color=#DC143C size=5>y0</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>复制从光标到行首的内容</font>**
>> * <font face="consolas" color=#DC143C size=5>y$</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>复制从光标到行尾的内容</font>**
>> * <font face="consolas" color=#DC143C size=5>d0</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>剪切从光标到行首的内容</font>**
>> * <font face="consolas" color=#DC143C size=5>d$</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>剪切从光标到行尾的内容</font>**
>> * <font face="consolas" color=#DC143C size=5>: 10,15 y</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>复制 10 到 15 行内容</font>**
>> * <font face="consolas" color=#DC143C size=5>: 10,15 d</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>删除(剪切) 10 到 15 行内容</font>**
<!--
4. __复制 / 剪切__
    * __y0__ &nbsp;&nbsp; 复制从光标到 __行首__ 的内容
    * __y$__ &nbsp;&nbsp; 复制从光标到 __行尾__ 的内容
    * __d0__ &nbsp;&nbsp; 剪切从光标到 __行首__ 的内容
    * __d$__ &nbsp;&nbsp; 剪切从光标到 __行尾__ 的内容
    * __: 10,15 y__ &nbsp;&nbsp; 复制10到15行内容
    * __: 10,15 d__ &nbsp;&nbsp; 删除(剪切)10到15行内容
-->


## 3. 数据的表示
### (1). 进制 (转换)
- **十进制转二进制**
2 128 ······ 0
2 64  ······ 0
2 32  ······ 0
2 16  ······ 0
2 8   ······ 0
2 4   ······ 0
2 2   ······ 0
2 1   ······ 1
即 128 的二进制为 1000 0000
负数取绝对值，最高位为符号位

### (2). *原码、反码、补码
> **程序内按补码存储**
> 数据 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -5
> 原码 0000 0101 &nbsp;&nbsp; 1000 0101 (原始二进制 最高位符号位 进位丢弃)
> 反码 0000 0101 &nbsp;&nbsp; 1111 1010
> 补码 0000 0101 &nbsp;&nbsp; 1111 1011 (反码+1)
> **注-例：signed char [-128,127], -128补码为 1000 0000, 无原码和反码**

### (3). *非数值型数据 ASCII
**ASCII码：** linux 查表，注意范围
```C
man ASCII
```

## 4. 程序的编译和调试
### (1). gcc编译器
![文件类型](\pic\01\01.png)
```C
Linux C高级
```
   
# 二. 数据类型、常量、变量、及运算符
## 1. *数据类型
- **溢出举例：**
```C
signed char a = 128;  // [-128, 127]  此处 a = -128
// 128 原/反/补码 0000 0000 1000 0000 补码赋值给 a，只取低8位，即 1000 0000 = -128
// -128 原码 1000 0000 1000 0000
//      反码 1111 1111 0111 1111
//      补码 1111 1111 1000 0000  赋值给 a，只取低8位，即 1000 0000
unsigned char b = -1;  // [0, 255]  此处 b = 255
// -1 原码 1000 0001
//    反码 1111 1110
//    补码 1111 1111 按无符号为 255
```
- 数据范围
C语言 <usr/include/limits.h>

## 2. 常量
- **指数常量：**
  1.176e+10 = 1.176x10^10
  1.176e-10 = 1.176x10^-10

## 3. 变量
- **寄存器变量：** register

## 4. 运算符
- **%#：** 自动输出0x
```C
int a = 0x12;
printf("%#x", a);  // 输出 0x12
```
- **,：** 从左到右依次执行
```C
int a = 1, b = 2, z = 0;
z = (a+=5, b=a+1);  // z = 7
```
- **优先级：** 注意运算优先级



# 三. 软件包管理及shell编程
## 1. deb软件包管理 (无网络, 需处理依赖)
![文件类型](\pic\02\dpkg.png)

## 2. apt软件包管理 (有网络, 无需处理依赖)
* **软件源配置文件：** /etc/apt/sources.list
* **软件详细定位：** /var/lib/apt/lists/*
* **软件源：** 1. Main(官方开源) 2. Universe(社区开源) 3. Restricted(官方非开源) 4. Multiverse(非官方非开源)
* **刷新软件源：** 1. 修改配置文件 2. apt-get undate
> **<font size=4>管理软件包（sudo）</font>**
![文件类型](\pic\02\apt.png)
![文件类型](\pic\02\apt-get.png)
>> * **1. 修复软件包依赖关系** 
![文件类型](\pic\02\rely-on.png)
>> * **2. 安装软件包：sudo apt-get install**
![文件类型](\pic\02\install.png)
>> * **3. 重新安装软件包：sudo apt-get --reinstall install**
>> * **4. 软件的卸载：1. 不完全卸载 sudo apt-get remove 2. 完全卸载 sudo apt-get --purge remove**
![文件类型](\pic\02\remove.png)
>> * **5. 清理软件包缓冲区：sudo apt-get clean; sudo apt-get autoclean**
缓冲区目录：/var/cache/apt/archives/
![文件类型](\pic\02\cache1.png)
![文件类型](\pic\02\cache2.png)

> **<font size=4>查询软件包信息（无需sudo）</font>**
![文件类型](\pic\02\query.png)
>> * **1. 查询软件包描述信息**
![文件类型](\pic\02\show.png)
>> * **2. 获取软件包安装状态**
![文件类型](\pic\02\policy.png)

## 3. shell基本命令
* **关机：** sudo shutdown -h now
* **定时关机：** sudo shutdown -h +45 "Game over." （45分钟后关机）
* **重启：** sudo shutdown -r now; sudo reboot now
* **定时重启：** 同定时关机

> **<font size=4>shell命令格式</font>**
> * **1.**
![文件类型](\pic\02\shell.png)
> * **2.** 
![文件类型](\pic\02\format.png)
> * **3.** 
![文件类型](\pic\02\format1.png)

> **<font size=4>命令行操作</font>**
>> * **1. 补齐命令和文件名**
![文件类型](\pic\02\operation.png)
>> * **2. 查询命令历史**
>> ![文件类型](\pic\02\history.png)
>> ![文件类型](\pic\02\history1.png)

## 4. shell中的特殊字符
> **<font size=4>通配符</font>**
>> ![文件类型](\pic\02\currency1.png)
>> ![文件类型](\pic\02\currency2.png)
> * **<font color=#DC143C>1. 管道</font>**
>> ![文件类型](\pic\02\pipe.png)
> * **2. 输入输出重定向**
>> ![文件类型](\pic\02\inout.png)
>> ![文件类型](\pic\02\inout1.png)
> * **3. 命令置换**
>> **<font color=#DC143C>方法2：$() 代替 ``</font>**
>> ![文件类型](\pic\02\replace.png)

# 四. shell命令
## 1. shell基础系统维护命令
> **<font size=4>获取联机帮助</font>**
>> **<font color=#DC143C>注意：直接 "man man" 查看man用法，主要是 1~9 和 A</font>**
>> ![文件类型](\pic\02\man.png)
>> ![文件类型](\pic\02\man1.png)
> * **1. 基本系统维护命令**
>> **(1). passwd**
>> ![文件类型](\pic\02\passwd.png)
>> **(2). su**
>> **<font color=#DC143C>注意："su" 和 "su -" 不一样，su只更改用户，未更改环境</font>**
>> ![文件类型](\pic\02\su.png)
>> ![文件类型](\pic\02\su1.png)
>> **(3). echo**
>> ![文件类型](\pic\02\echo.png)
>> **(4). date**
>> ![文件类型](\pic\02\date.png)
>> **(5). clear 同 ctrl+l**
>> **(6). df**
>> ![文件类型](\pic\02\df.png)
>> ![文件类型](\pic\02\df1.png)
>> **(7). du**
>> ![文件类型](\pic\02\du.png)

## 2. 用户管理命令
> **<font size = 4>相关文件</font>**
> ![文件类型](\pic\02\user.png)
>> * **1. /etc/passwd文件**
>> **<font color=#DC143C>注意："man 5 passwd" 查看文件格式</font>**
>> ![文件类型](\pic\02\passwd-file.png)
>> * **2. /etc/group文件**
>> ![文件类型](\pic\02\group.png)

> **<font size = 4>相关命令</font>**
>> * **1. adduser**
>> **<font color=#DC143C>可在 /etc/passwd 和 /etc/group 中查看新添加的用户，或 "ls /home" 查看</font>**
>> ![文件类型](\pic\02\adduser.png)
>> 配置文件
>> ![文件类型](\pic\02\adduser-config.png)
>> SKEL模版
>> ![文件类型](\pic\02\skel.png)
>> 添加新用户的过程
>> ![文件类型](\pic\02\adduser-process.png)
>> * **2. 设置初始口令：passwd**
>> ![文件类型](\pic\02\passwd.png)
>> * **3. 修改用户属性：usermod**
>> ![文件类型](\pic\02\usermod.png)
>> * **4. 删除用户：deluser**
>> ![文件类型](\pic\02\deluser.png)
>> * **5. 添加用户组：addgroup**
>> ![文件类型](\pic\02\addgroup.png)
>> * **6. 删除用户组：delgroup**
>> ![文件类型](\pic\02\delgroup.png)

## 3. 进程管理命令
**<font color=#DC143C>程序的一次执行就是一个进程：如登两个QQ即两个进程</font>**
> * **1. ps**
**<font color=#DC143C>"ps aux | grep a.out"</font>**
> ![文件类型](\pic\02\ps.png)
> ![文件类型](\pic\02\ps1.png)
> **<font color=#DC143C>Z-僵尸态：结束了，但资源未回收</font>**
> ![文件类型](\pic\02\ps2.png)
> * **2. top**
> ![文件类型](\pic\02\top.png)
> * **3. pstree**
> ![文件类型](\pic\02\pstree.png)
> * **4. kill**
> ![文件类型](\pic\02\kill.png)

## 4. 文件系统的类型和结构
> ![文件类型](\pic\02\file-system.png)
> ![文件类型](\pic\02\file-system1.png)
> ![文件类型](\pic\02\file-system2.png)
> * **1. SCSI与IDE设备命名**
> **<font color=#DC143C>"df -T"</font>**
> **<font color=#DC143C>1代表硬盘的第1个分区，2代表第3个分区</font>**
> ![文件类型](\pic\02\scsi-ide.png)
> * **2. Linux分区的命名方式**
> ![文件类型](\pic\02\partition.png)
> * **<font color=#DC143C size = 4>3. 交换分区</font>**
> ![文件类型](\pic\02\exchange.png)
> * **4. 文件系统逻辑结构**
> ![文件类型](\pic\02\logic.png)
> ![文件类型](\pic\02\logic1.png)
> * **5. 文件系统结构**
> ![文件类型](\pic\02\structure.png)
> ![文件类型](\pic\02\structure1.png)
> ![文件类型](\pic\02\structure2.png)
> ![文件类型](\pic\02\directory.png)
> ![文件类型](\pic\02\directory1.png)
> * **6. 基本目录**
> ![文件类型](\pic\02\directory2.png)

## 5. 文件系统相关命令


