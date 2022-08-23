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
>> * <font face="consolas" color=#DC143C size=5>:vsp file</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>vi 中打开其它文件</font>**
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

<!--
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
-->

<!--
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
-->


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
> ![文件系统逻辑结构](\pic\02\logic.png)
> ![文件系统逻辑结构](\pic\02\logic1.png)
> * **5. 文件系统结构**
> ![文件系统结构](\pic\02\structure.png)
> ![文件系统结构](\pic\02\structure1.png)
> ![文件系统结构](\pic\02\structure2.png)
> ![文件系统结构](\pic\02\directory.png)
> ![文件系统结构](\pic\02\directory1.png)
> * **6. 基本目录**
> ![基本目录](\pic\02\directory2.png)

## 5. 文件系统相关命令
> * **1. 查看文件属性：file**
> ![file](\pic\02\file.png)
> * **2. 创建目录：mkdir**
> **<font color=#DC143C>注：当前目录 "./" 或 空，上一级目录 "../"，根目录 "/"，主目录 "~"</font>**
> ![mdkir](\pic\02\mkdir.png)
> ![mdkir](\pic\02\mkdir1.png)
> * **2. 删除目录：rmdir**
> **<font color=#DC143C>目录内有文件："rm -r"</font>**
> ![rmdir](\pic\02\rmdir.png)
> ![rmdir](\pic\02\rmdir1.png)
> ![rmdir](\pic\02\rmdir2.png)
> * **3. 创建链接文件**
> ![link](\pic\02\link.png)
>> * **(1). 软链接：ln -s**
>> **<font color=#DC143C>注意链接的是绝对路径还是相对路径，若是相对路径，移动链接后，可能失效</font>**
>> **<font color=#DC143C>建议：使用绝对路径</font>**
>> **<font color=#DC143C>注意：修改链接文件同时也会修改源文件</font>**
>> ![ln](\pic\02\ln.png)
>> ![ln](\pic\02\ln1.png)
>> * **(2). 硬链接：ln (无 -s)**
>> **<font color=#DC143C>linux内每个文件都有一个物理编号：inode，查看："ls -i"</font>**
>> **<font color=#DC143C>硬链接文件和源文件本质上是同一个文件 (inode号相同)</font>**
>> **<font color=#DC143C>硬链接一般用于做文件备份，保护文件</font>**
> * **4. 文件压缩与归档**
> **<font color=#DC143C>先 归档 再 压缩</font>**
> ![compress](\pic\02\compress.png)
> ![compress](\pic\02\compress1.png)
> ![compress](\pic\02\compress2.png)
> ![archive](\pic\02\archive.png)
>> * **(1). gzip(压缩) 与 gunzip(解压) 命令**
>> ![gzip](\pic\02\gzip.png)
>> ![gunzip](\pic\02\gunzip.png)
>> ![gzip-gunzip](\pic\02\gzip-gunzip.png)
>> ![gzip-gunzip](\pic\02\gzip-gunzip1.png)
>> * **(2). tar 命令**
>> ![tar](\pic\02\tar.png)
>> ![tar](\pic\02\tar1.png)
>> **<font color=#DC143C>举例</font>**
>> ![tar](\pic\02\tar2.png)
>> ![tar](\pic\02\tar3.png)
>> ![tar](\pic\02\tar4.png)

## 6. 网络配置管理
> * **基础知识**
> ![net](\pic\02\net.png)
> ![net](\pic\02\net1.png)
> * **IP地址**
> ![ip](\pic\02\ip.png)
> ![ip](\pic\02\ip1.png)
> * **<font color=#DC143C>配置IP地址</font>**
>> * **查看IP：ifconfig**
>> ![ip](\pic\02\ifconfig.png)
>> **<font color=#DC143C>eth33：代表网卡; lo：代表主机本身，也称回送接口(Loopback),其IP地址约定为 127.0.0.1</font>**
>> ![ip](\pic\02\ifconfig1.png)
>> **多块网卡**
>> ![ip](\pic\02\ifconfig2.png)
>> ![ip](\pic\02\ifconfig3.png)
>> * **IP修改：临时生效**
>> ![ip](\pic\02\ifconfig4.png)
>> ![ip](\pic\02\ifconfig5.png)
>> * **配置动态IP：dhclient**
>> ![ip](\pic\02\dhclient.png)
>> ![ip](\pic\02\dhclient1.png)
>> * **<font color=#DC143C>永久修改IP地址（注意：unbuntu20 无该文件）</font>**
>> **IP配置**
>> ![ip](\pic\02\interfaces.png)
>> 动态
>> ![ip](\pic\02\interfaces1.png)
>> 静态
>> ![ip](\pic\02\interfaces2.png)
>> **DNS配置**
>> ![ip](\pic\02\resolv.png)
>> ![ip](\pic\02\resolv1.png)
>> **<font color=#DC143C>注意：获取IP后，重启网络服务（包括dhclient）</font>**
>> ![ip](\pic\02\dhclient2.png)
> * **网络连接检测：ping**
> ![ip](\pic\02\ping.png)
> ![ip](\pic\02\ping1.png)
> ![ip](\pic\02\ping2.png)
> **<font color=#DC143C>"-c 3"：只 ping 3次</font>**
> ![ip](\pic\02\ping3.png)
> * **nslookup**
> ![ip](\pic\02\nslookup.png)
> ![ip](\pic\02\nslookup1.png)


# 五. shell脚本编程
## 1. 变量
> * **1. 基本过程**
>> **<font color=#DC143C>文件以 .sh 结尾</font>**
>> ![shell](\pic\02\shell-step.png)
>> ![shell](\pic\02\shell-step1.png)
>> ![shell](\pic\02\shell-step2.png)
>> ![shell](\pic\02\shell-step3.png)
>> ![shell](\pic\02\shell-step4.png)
> * **2. shell变量**
>> ![shell](\pic\02\shell-value.png)
>> **<font color=#DC143C>打印变量要加 "$"，否则会被当成 字符串</font>**
>> ![shell](\pic\02\shell-value1.png)
>> **<font color=#DC143C>shell变量无数据类型</font>**
>> **<font color=#DC143C>"=" 两边不能加 空格</font>**
>> ![shell](\pic\02\shell-value2.png)
> * **3. 用户自定义变量**
>> **<font color=#DC143C>变量名大写, unset 删除变量赋值</font>**
>> ![shell](\pic\02\shell-value3.png)
>> ![shell](\pic\02\shell-value4.png)
>> ![shell](\pic\02\shell-value5.png)
> * **4. 位置变量**
>> ![shell](\pic\02\shell-value6.png)
>> **<font color=#DC143C>类似于C语言 main函数的输入参数</font>**
>> **<font color=#DC143C>执行文件前加当前路径 "./"，否则会被当成常规shell命令来执行</font>**
>> ![shell](\pic\02\shell-value7.png)
>> ![shell](\pic\02\shell-value8.png)
>> **<font color=#DC143C>不同于C语言的是，命令个数 "\$#" 不包含文件本身</font>**
>> ![shell](\pic\02\shell-value9.png)
>> ![shell](\pic\02\shell-value10.png)
>> **<font color=#DC143C>但 "\$0" 为文件本身</font>**
>> ![shell](\pic\02\shell-value11.png)
>> ![shell](\pic\02\shell-value12.png)
>> **<font color=#DC143C>转义符 \ 和C语言一样</font>**
>> ![shell](\pic\02\shell-value13.png)
>> ![shell](\pic\02\shell-value14.png)
>> **<font color=#DC143C>数子用{}起来，不加{}入下</font>**
>> ![shell](\pic\02\shell-value15.png)
>> ![shell](\pic\02\shell-value16.png)
>> **<font color=#DC143C>加{}，注意 "\$0" 是文件名</font>**
>> ![shell](\pic\02\shell-value17.png)
>> ![shell](\pic\02\shell-value18.png)
> * **5. 常用shell环境变量**
>> **<font color=#DC143C>类似于C语言中的默认变量，注意自定义时不要冲突</font>**
>> ![shell](\pic\02\shell-value19.png)

## 2. 功能语句
> ![shell](\pic\02\shell-sentence.png)
> * **1. 注释**
>> **<font color=#DC143C>注意：第一行注释用来指明用哪种类型的shell来执行</font>**
>> ![shell](\pic\02\shell-sentence1.png)
> * **2. read**
>> ![shell](\pic\02\shell-sentence2.png)
>> **<font color=#DC143C>例1：</font>**
>> **<font color=#DC143C>注：脚本中变量无数据类型，所有输入都会被当成字符串处理</font>**
>> ![shell](\pic\02\shell-read.png)
>> ![shell](\pic\02\shell-read1.png)
>> ![shell](\pic\02\shell-read2.png)
>> **<font color=#DC143C>例2：</font>**
>> **<font color=#DC143C>注：多余的会赋值给最后一个变量</font>**
>> ![shell](\pic\02\shell-read3.png)
>> ![shell](\pic\02\shell-read4.png)
>> **<font color=#DC143C>例3：</font>**
>> **<font color=#DC143C>bash: -n 不换行</font>**
>> ![shell](\pic\02\shell-read5.png)
>> ![shell](\pic\02\shell-read6.png)
>> **<font color=#DC143C>sh: \c 不换行</font>**
>> ![shell](\pic\02\shell-read7.png)
>> ![shell](\pic\02\shell-read6.png)
> * **3. expr**
>> **<font color=#DC143C size=4> * 是通配符，需要转义</font>**
>> ![shell](\pic\02\shell-expr.png)
>> ![shell](\pic\02\shell-expr1.png)
>> **<font color=#DC143C>例1：</font>**
>> **<font color=#DC143C size=4>算术符号两边要加空格</font>**
>> ![shell](\pic\02\shell-expr2.png)
>> ![shell](\pic\02\shell-expr3.png)
>> **<font color=#DC143C>例2：</font>**
>> **<font color=#DC143C size=4>注意命令置换 ``</font>**
>> **<font color=#DC143C size=4>等号两边不能加空格</font>**
>> ![shell](\pic\02\shell-expr4.png)
>> ![shell](\pic\02\shell-expr3.png)
> * **4. test**
>> ![shell](\pic\02\shell-test.png)
>> **<font color=#DC143C>字符串</font>**
>> ![shell](\pic\02\shell-test1.png)
>> **<font color=#DC143C>整数</font>**
>> ![shell](\pic\02\shell-test2.png)
>> **<font color=#DC143C>文件</font>**
>> ![shell](\pic\02\shell-test7.png)
>> **<font color=#DC143C>例1：字符串</font>**
>> **<font color=#DC143C>"\$?" 是上一条语句的执行结果</font>**
>> **<font color=#DC143C>和C语言相反：假是1，真是0</font>**
>> ![shell](\pic\02\shell-test3.png)
>> ![shell](\pic\02\shell-test4.png)
>> **<font color=#DC143C>例2：整数</font>**
>> ![shell](\pic\02\shell-test5.png)
>> ![shell](\pic\02\shell-test6.png)
>> **<font color=#DC143C>例3：文件</font>**
>> **<font color=#DC143C>\$HOME：用户主目录</font>**
>> ![shell](\pic\02\shell-test8.png)
>> ![shell](\pic\02\shell-test9.png)

## 3. 分支语句
> * **结构性语句**
>> ![shell](\pic\02\shell-branch.png)
> * **分支语句1：if then fi**
>> **<font color=#DC143C>和C语言相反：假是1，真是0</font>**
>> ![shell](\pic\02\shell-branch1.png)
>> **<font color=#DC143C>例：</font>**
>> **<font color=#DC143C>用 [ ] 代替 test 命令，前后必须有空格</font>**
>> **<font color=#DC143C>只输入文件名，\$# = 0，与1不相等，成立 (-ne是否不相等)</font>**
>> ![shell](\pic\02\shell-branch2.png)
>> ![shell](\pic\02\shell-branch3.png)
>> **<font color=#DC143C>相当于</font>**
>> ![shell](\pic\02\shell-branch4.png)
>> ![shell](\pic\02\shell-branch3.png)
>> **<font color=#DC143C>完整</font>**
>> ![shell](\pic\02\shell-branch5.png)
>> ![shell](\pic\02\shell-branch6.png)
> * **分支语句2：if then else fi：同C语言**
>> ![shell](\pic\02\shell-branch7.png)
> * **分支语句3：if then elif else fi：同C语言**
>> ![shell](\pic\02\shell-branch8.png)
> * **分支语句3：case esac**
>> ![shell](\pic\02\shell-branch9.png)
>> ![shell](\pic\02\shell-branch10.png)
>> **<font color=#DC143C>例1：</font>**
>> ![shell](\pic\02\shell-branch11.png)
>> **<font color=#DC143C>例2：</font>**
>> ![shell](\pic\02\shell-branch12.png)
>> ![shell](\pic\02\shell-branch13.png)
>> **<font color=#DC143C>例3：</font>**
>> ![shell](\pic\02\shell-branch14.png)
>> ![shell](\pic\02\shell-branch15.png)

## 4. 循环语句
> * **1. for**
>> ![shell](\pic\02\shell-cycle.png)
>> **<font color=#DC143C>例1：</font>**
>> ![shell](\pic\02\shell-cycle1.png)
>> ![shell](\pic\02\shell-cycle2.png)
>> **<font color=#DC143C>例2：</font>**
>> ![shell](\pic\02\shell-cycle3.png)
>> **<font color=#DC143C>例3：</font>**
>> **<font color=#DC143C>seq 1 2 10：起始1，增量2，终止10；具体 "man seq"</font>**
>> ![shell](\pic\02\shell-cycle4.png)
>> **<font color=#DC143C>例4：</font>**
>> ![shell](\pic\02\shell-cycle5.png)
>> **<font color=#DC143C>例5：</font>**
>> ![shell](\pic\02\shell-cycle6.png)
>> **<font color=#DC143C>例6：死循环</font>**
>> **<font color=#DC143C>for (( ;; ))</font>**
>> **<font color=#DC143C>例7：</font>**
>> ![shell](\pic\02\shell-cycle8.png)
>> ![shell](\pic\02\shell-cycle7.png)
> * **2. while**
> ![shell](\pic\02\shell-while.png)
> ![shell](\pic\02\shell-while1.png)
>> **<font color=#DC143C>例1：</font>**
>> ![shell](\pic\02\shell-while2.png)
>> **<font color=#DC143C>例2：</font>**
>> ![shell](\pic\02\shell-while3.png)
>> **<font color=#DC143C>例3：死循环</font>**
>> **<font color=#DC143C>while true</font>**
>> ![shell](\pic\02\shell-while4.png)
>> **<font color=#DC143C>例4：</font>**
>> **<font color=#DC143C>生成文件：>（即重定向符）</font>**
>> ![shell](\pic\02\shell-while5.png)
>> **<font color=#DC143C>例5：生成"FILE\*"文件（例子内为 FILE1 FILE2）</font>**
>> **<font color=#DC143C>删除同理：将 ">" 换成 "rm" 即可</font>**
>> ![shell](\pic\02\shell-while6.png)
> * **3. break 和 continue**
>> **<font color=#DC143C>同C语言一样：break跳出整个循环；continue跳出1层循环</font>**
>> ![shell](\pic\02\shell-break-countinue.png)
>> **<font color=#DC143C>例1：</font>**
>> ![shell](\pic\02\shell-break-countinue1.png)
>> **<font color=#DC143C>例2：</font>**
>> ![shell](\pic\02\shell-break-continue1.png)
>> ![shell](\pic\02\shell-break-continue2.png)
>> **<font color=#DC143C>例3：</font>**
>> ![shell](\pic\02\shell-break-continue3.png)
>> **<font color=#DC143C>例4：设置跳出层数</font>**
>> ![shell](\pic\02\shell-break-continue4.png)

## 5. 函数
> ![shell](\pic\02\shell-func.png)
>> **<font color=#DC143C>例1：</font>**
>> ![shell](\pic\02\shell-func1.png)
>> **<font color=#DC143C>例2：</font>**
>> ![shell](\pic\02\shell-func2.png)
>> **<font color=#DC143C>例3：</font>**
>> ![shell](\pic\02\shell-func3.png)
>> **<font color=#DC143C>例4：无 return，修改搜索语句</font>**
>> **<font color=#DC143C>^$S: 即以 \$S: 开头的文件</font>**
>> ![shell](\pic\02\shell-func4.png)
> * **函数变量作用域**
> ![shell](\pic\02\shell-func5.png)
>> **<font color=#DC143C>例1：</font>**
>> **<font color=#DC143C>lcvariable 为局部变量，外部无法调用</font>**
>> ![shell](\pic\02\shell-func6.png)
>> ![shell](\pic\02\shell-func7.png)


# 六. C语言高级编程
## 1. gcc和gdb的用法
> * **GUN**
>> ![gun](\pic\02\gun.png)
>> ![gun](\pic\02\gun1.png)
> * **GCC**
>> ![gcc](\pic\02\gcc.png)
>> ![gcc](\pic\02\gcc1.png)
> * **编辑器的主要组件**
>> ![gcc](\pic\02\gcc2.png)
> * **GCC的基本用法和选项**
>> ![gcc](\pic\02\gcc3.png)
> * **GCC的错误类型及对策**
>> ![gcc](\pic\02\gcc4.png)
>> ![gcc](\pic\02\gcc5.png)
> * **GCC编译过程**
>> ![gcc](\pic\02\gcc6.png)
>> ![gcc](\pic\02\gcc10.png)
>> **<font color=#DC143C>1. 预处理：gcc -E test -o test.i</font>**
>> **<font color=#DC143C>替换所有 # 开头的内容（头文件、宏定义、条件编译等），删除注释，不检查语法错误</font>**
>> ![gcc](\pic\02\gcc11.png)
>> **<font color=#DC143C>2. 编译：gcc -S test.i -o test.s</font>**
>> **<font color=#DC143C>只编译不汇编，生成汇编代码，期间会检查语法错误</font>**
>> ![gcc](\pic\02\gcc12.png)
>> **<font color=#DC143C>3. 汇编：gcc -c test.s -o test.o</font>**
>> **<font color=#DC143C>编译、汇编，不链接，生成目标文件（二进制机器指令）</font>**
>> ![gcc](\pic\02\gcc13.png)
>> **<font color=#DC143C>4. 链接：gcc test.o -o test</font>**
>> **<font color=#DC143C>链接所有的.o文件、库文件，生成可执行文件</font>**
>> ![gcc](\pic\02\gcc14.png)
>> * **<font color=#DC143C>例1：</font>**
>> ![gcc](\pic\02\gcc7.png)
>> ![gcc](\pic\02\gcc8.png)
>> **<font color=#DC143C>sqrt 需要 -lm，指定对应的库</font>**
>> **<font color=#DC143C>-Wall：显示警告</font>**
>> ![gcc](\pic\02\gcc9.png)
> * **GDB（调试运行时的错误，不检查语法）**
>> ![gcc](\pic\02\gdb.png)
>> **<font color=#DC143C>调试流程</font>**
>> ![gcc](\pic\02\gdb1.png)
>> **<font color=#DC143C>例：</font>**
>> ![gcc](\pic\02\gdb2.png)
>> **<font color=#DC143C>l：一次10行</font>**
>> **<font color=#DC143C>l 1：返回第一次</font>**
>> ![gcc](\pic\02\gdb3.png)
>> ![gcc](\pic\02\gdb4.png)
>> **<font color=#DC143C>b 11：第11行打断点</font>**
>> **<font color=#DC143C>info b：显示断点信息</font>**
>> ![gcc](\pic\02\gdb5.png)
>> **<font color=#DC143C>del 1：删除第1个断点</font>**
>> ![gcc](\pic\02\gdb6.png)
>> **<font color=#DC143C>r：程序运行，此处运行到断点1处</font>**
>> ![gcc](\pic\02\gdb7.png)
>> **<font color=#DC143C>p m：显示变量m的值</font>**
>> ![gcc](\pic\02\gdb8.png)
>> **<font color=#DC143C>n：单步跟踪</font>**
>> **<font color=#DC143C>s：单步跟踪进入(函数)</font>**
>> ![gcc](\pic\02\gdb9.png)
>> **<font color=#DC143C>set args：设置输入参数</font>**
>> ![gcc](\pic\02\gdb10.png)
>> **<font color=#DC143C>c：继续运行</font>**
>> **<font color=#DC143C>q：退出</font>**
>> **<font color=#DC143C>其它：查字典</font>**

## 2. C复习
> * **结构体**
>> * ![c](\pic\02\struct.png)
>> * ![c](\pic\02\struct1.png)
>> **<font color=#DC143C>同类型结构体变量可直接赋值</font>**
>> * ![c](\pic\02\struct2.png)
> * **存储**
>> **<font color=#DC143C>代码区：存放二进制代码</font>**
>> **<font color=#DC143C>静态存储区：全局变量、静态变量、常量</font>**
>> **<font color=#DC143C>栈/堆区：不解释</font>**
>> * ![c](\pic\02\mem.png)
> * **malloc/free**
>> **<font color=#DC143C>(1). malloc 申请失败，返回 NULL，也不需要 free</font>**
>> **<font color=#DC143C>(2). free(p) 操作只是释放了p所指向的堆内存，p指向不变，为空悬指针，所以释放后，将 p = NULL;</font>**
>> **<font color=#DC143C>(3). malloc 申请的内存，不能释放多次</font>**
>> **<font color=#DC143C>(4). malloc 申请的内存，释放前，不能修改指针指向</font>**
>> * __<font color=#DC143C>char s[]局部变量，不解释；static char s[]静态变量，生命周期到main()结束，可以被return；char *s 字符串常量，不能被 return</font>__
>> * __<font color=#DC143C>建议：使用动态内存，不解释</font>__
>> * ![c](\pic\02\malloc.png)
>> * __<font color=#DC143C>错误：修改了s存储的地址，return后，无法被正确释放</font>__
>> * ![c](\pic\02\malloc1.png)
> * **野指针**
>> * __<font color=#DC143C>(1). 未初始化：为一个随机值</font>__
>> * __<font color=#DC143C>(2). free 后未 = NULL：存储了一个无法被访问的内存地址</font>__
>> * __<font color=#DC143C>(2). 指针操作越界：如访问数组，指向了数组范围之外</font>__
>> * ![c](\pic\02\malloc2.png)
>> * __<font color=#DC143C>例1：p未初始化</font>__
>> * ![c](\pic\02\malloc3.png)
>> * __<font color=#DC143C>例2：指针操作越界</font>__
>> * ![c](\pic\02\malloc4.png)

# 七. Makefile
## 1. 原理及基础知识
> * __1. 原理__
>> ![makefile](\pic\02\make.png)
> * __2. 基本结构__
>> ![makefile](\pic\02\make1.png)
>> ![makefile](\pic\02\make2.png)
>> ![makefile](\pic\02\make3.png)
>> * __<font color=#DC143C>例1：命令执行顺序根据目标文件的依赖，即 f1.o f2.o main.o</font>__
>> * __<font color=#DC143C>.PHONY:clean - 设定clean为命令，而非文件</font>__
>> ![makefile](\pic\02\make4.png)
> * __3. Make使用__
>> ![makefile](\pic\02\make21.png)
> * __4. 创建和使用变量__
>> ![makefile](\pic\02\make5.png)
>> ![makefile](\pic\02\make6.png)
>> * __<font color=#DC143C>(1). 递归展开方式：foo的值从后面找</font>__
>> ![makefile](\pic\02\make8.png)
>> ![makefile](\pic\02\make9.png)
>> * __<font color=#DC143C>(2). 简单方式：x的值从前面找，类C语言</font>__
>> ![makefile](\pic\02\make10.png)
>> ![makefile](\pic\02\make11.png)
>> * __<font color=#DC143C>(3). 用 ?= 定义变量</font>__
>> ![makefile](\pic\02\make12.png)
>> ![makefile](\pic\02\make13.png)
>> * __<font color=#DC143C>(4). 添加值</font>__
>> ![makefile](\pic\02\make14.png)
>>*  __<font color=#DC143C>(5). 预定义变量 (默认有值)</font>__
>> __<font color=#DC143C>例中 CC 即为 gcc，RM 为 rm -f</font>__
>> ![makefile](\pic\02\make15.png)
>> ![makefile](\pic\02\make16.png)
>> * __<font color=#DC143C>(6). 自动变量</font>__
>> ![makefile](\pic\02\make18.png)
>> * __<font color=#DC143C>(7). 环境变量</font>__
>> ![makefile](\pic\02\make20.png)
>> * __<font color=#DC143C>例1：自定义变量</font>__
>> ![makefile](\pic\02\make17.png)
>> * __<font color=#DC143C>例2：自动变量和预定义变量</font>__
>> ![makefile](\pic\02\make19.png)
>> * __<font color=#DC143C>例3：</font>__
>> ![makefile](\pic\02\make7.png)
>> * __<font color=#DC143C>例4：指定 include文件所在的目录（gcc -I）</font>__
>> ![makefile](\pic\02\make23.png)

## 2. 命令的选项及隐含的规则
> * __1. 复习Make使用的几个重要选项（上一小节）__
> ![makefile](\pic\02\make21.png)
>> * __<font color=#DC143C>-C：执行指定目录下的 Makefile</font>__
>> * __<font color=#DC143C>-f：make -f file 代替 make（make -f file clean 代替 make clean）; 指定文件当成Makefile，如调试时备份Makefile</font>__
>> * __<font color=#DC143C>-i：不执行错误的命令，执行能执行的命令（大工程，编译时间长，防止万一某个命令错了，不带 -i 即全部执行失败）</font>__
>> * __<font color=#DC143C>-n：只打印，不执行（工程大，只看一下执行的过程）</font>__
>> * __<font color=#DC143C>-p：显示 make变量数据库 以及 隐含规则</font>__
>> * __<font color=#DC143C>-w：如果执行过程中make改变目录，打印当前目录（make 是默认带 -w 的）</font>__
>> * __<font color=#DC143C>include 包含其它文件（#为注释）</font>__
>> ![makefile](\pic\02\make24.png)
> * __2. 常用的隐含规则__
>> * __(1). 编译C语言的隐含规则：-c过程（生成.o文件过程）__
>> ![makefile](\pic\02\make25.png)
>> * __<font color=#DC143C>目标文件的生成：会自动查询同名的.c文件，自动生成.o文件；默认为 gcc -c，CFLAGS 需自己定义</font>__
>> * __<font color=#DC143C>注意：如果生成.o过程中，有特殊选项，一定要重新给 CFLAGS 赋值</font>__
>> ![makefile](\pic\02\make26.png)
>> * __<font color=#DC143C>更简洁</font>__
>> ![makefile](\pic\02\make27.png)
>> * __(2). 链接Object文件的隐含规则（生成执行文件过程）__
>> ![makefile](\pic\02\make28.png)
>> * __<font color=#DC143C>注意：执行文件要和目标文件的其中一个同名（f1 或 f2 或 main）</font>__
>> ![makefile](\pic\02\make29.png)

## 3. VPATH及嵌套的Makefile
> * __1. VPATH的用法__
>> ![makefile](\pic\02\vpath.png)
>> * __<font color=#DC143C>例：目录如下</font>__
>> ![makefile](\pic\02\vpath1.png)
>> __<font color=#DC143C>不使用 VPATH 的基础 Makefile</font>__
>> ![makefile](\pic\02\vpath2.png)
>> ![makefile](\pic\02\vpath3.png)
>> __<font color=#DC143C>删除文件：</font>__
>> __<font color=#DC143C>-exec 详见搜索（类似管道），"{}" 为查找出来的文件，";" 为结束符（加上转义符斜杆），第二个 ";" 为两个命令之间分隔</font>__
>> __<font color=#DC143C>注意：是 "*.o"，".o" 会把文件全删了</font>__
>> ![makefile](\pic\02\vpath4.png)
>> * __<font color=#DC143C>简化1：隐含规则</font>__
>> ![makefile](\pic\02\vpath5.png)
>> * __<font color=#DC143C>简化2：隐含规则 + VPATH声明依赖路径</font>__
>> ![makefile](\pic\02\vpath6.png)
>> ![makefile](\pic\02\vpath7.png)
> * __2. Makefile的嵌套__
>> ![makefile](\pic\02\nesting.png)
>> ![makefile](\pic\02\nesting1.png)
>> ![makefile](\pic\02\nesting2.png)
>> ![makefile](\pic\02\nesting3.png)
>> ![makefile](\pic\02\nesting7.png)
>> ![makefile](\pic\02\nesting4.png)
>> ![makefile](\pic\02\nesting8.png)
>> * __<font color=#DC143C>依赖文件Makefile解析：</font>__
>> ![makefile](\pic\02\nesting5.png)
>> __../\$(OBJS_DIR)/main.o:main.c__
>> __依赖文件为当前目录下的main.c，生成的目标文件在 ../obj/ 内__
>> * __<font color=#DC143C>根文件Makefile解析：</font>__
>> ![makefile](\pic\02\nesting6.png)
>> __all: CHECK_DIR \$(SUBDIRS)__
>> __all 依赖 CHECK_DIR 和 SUBDIRS__
>> __CHECK_DIR 执行的命令为 mkdir -p bin__
>> __SUBDIRS 依赖 ECHO__
>> __ECHO 为 两句打印语句__
>> __SUBDIRS 为 f1 f2 main obj__
>> __SUBDIRS 执行的命令为 make -C f1; make -C f2; make -C main; make -C obj__
>> __echo 前加 @：是因为make执行的时候本身就会打印命令，所以隐藏掉make命令__
>> __make -C dir：调用 dir 目录下的make（见上一节）__
>> __export：使得这些变量在 子目录下的子Makefile内也能调用__


# 八. Linux I/O

## 1. 标准IO介绍
> __标准C中定义好的一组用来输入和输出的API__
> * __1. 文件__
>> ![io](\pic\04\file.png)
> * __2. 系统调用、缓冲__
>> ![io](\pic\04\io.png)
>> __系统调用：应用程序通过操作系统提供的接口访问硬件；不同的操作系统，系统调用接口不兼容__
>> ![io](\pic\04\os.png)
>> __缓冲：无缓冲 - APP读多少，系统从硬盘中取多少，每次读取都要进行系统调用；有缓冲 - 不管APP读多少，先读一批数据到缓冲中，APP直接从缓冲区中读取，减少系统调用的次数__
>> ![io](\pic\04\buffer.png)
> * __3. FILE/流__
>> __Linux下不区分文本流和二进制流__
>> ![io](\pic\04\io1.png)
>> ![io](\pic\04\io2.png)
> * __4. 流缓冲类型__
>> __全缓冲 - 标准I/O默认(打开文件)：当流的缓冲区满时才执行实际的I/O操作；当缓冲区空的时候，才会从实际的文件中读取数据__
>> __<font color=#DC143C>行缓冲 - 标准输入/输出(终端相关 - printf)：缓冲区满 或者 遇到换行符，才进行实际的I/O操作；即标准输出的 printf 必须加上 '\n' 才能输出</font>__
>> __无缓冲(标准错误输出)：直接读取/写入文件__
>> ![io](\pic\04\io3.png)
> * __5. 默认流__
>> __Linux运行时，系统自动打开的3个流；对应3个文件描述符__
>> ![io](\pic\04\io4.png)

## 2. 流的打开和关闭
> * __1. 打开流__
>> ![io](\pic\04\io5.png)
>> * __(1). mode 参数__
>> __<font color=#DC143C>w+: 因为 w 将文件的内容清空，所以只能读打开文件后新写入的内容</font>__
>> ![io](\pic\04\io6.png)
>> ![io](\pic\04\io7.png)
>> __<font color=#DC143C>例：</font>__
>> ![io](\pic\04\io8.png)
>> * __(2). 权限__
>> __<font color=#DC143C>文件权限补充：ls -l 查看，依次为所有者、群组、其它用户</font>__
>> ![io](\pic\04\io9.png)
>> ![io](\pic\04\io10.png)
>> * __(3). 处理错误信息__
>> ![io](\pic\04\io11.png)
>> __<font color=#DC143C>例1：</font>__
>> ![io](\pic\04\io12.png)
>> __<font color=#DC143C>例2：</font>__
>> ![io](\pic\04\io13.png)
> * __2. 关闭流__
>> ![io](\pic\04\io14.png)
> * __3. 一个程序打开流的最大个数__
>> ![io](\pic\04\io15.png)

## 3. 按字符输入和输出
> * __1. 读写流__
>> __<font color=#DC143C>一般推荐用第三种方式</font>__
>> ![io](\pic\04\io16.png)
>> * __(1). 按字符输入__
>> ![io](\pic\04\io17.png)
>> __<font color=#DC143C>例：</font>__
>> __<font color=#DC143C>再次强调：标准输出流是行缓冲，printf 要 '\n' 才能输出</font>__
>> ![io](\pic\04\io18.png)
>> * __(2). 按字符输出__
>> ![io](\pic\04\io19.png)
>> __<font color=#DC143C>例1：</font>__
>> ![io](\pic\04\io20.png)
>> __<font color=#DC143C>例2：diff 文件比较命令，有不同会输出</font>__
>> ![io](\pic\04\io21.png)
>> ![io](\pic\04\io22.png)
>> * __(3). 按行输入__

>> * __(4). 按行输出__

>> * __(5). 按对象输入__

>> * __(6). 按对象输出__