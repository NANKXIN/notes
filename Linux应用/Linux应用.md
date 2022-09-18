# 一. 必备Linux命令和C语言基础

## 1. Linux常用命令

* __ls：__ -R 查看对应文件及所在目录
* __cat：__ 打印文件内容到终端；__-s__：空行合并；__-b__：显示行号
* __nl：__ 相当于 cat -b
* __head：__ 默认显示前10行；head -5 test.c：显示前5行
* __tail：__ 默认显示后10行

* __cp：__ cp test.c test2.c —— 拷贝test.c为test2.c
　　cp tets.c /home/a -i —— 拷贝到a目录，-i提示是否覆盖
　　cp test.c /home/a test2.c —— 拷贝到a目录，重命名为test2.c
　　cp -r —— 拷贝目录需要加上-r

* __mv：__ mv test.c /home/a —— 移动
　　mv test.c test2.c —— 重命名
　　mv test.c /home/a test2.c —— 移动并重命名

* __touch：__ touch test.c —— 创建文件test.c(不存在)，修改时间(存在)

* __rm：__ 删除文件
　　__-i：__ 带提示
　　__-r：__ 删除目录

* __mkdir：__ 创建目录
　　　　mkdir -p d1/d2 —— 创建多级目录

<!--============================================================-->

## 2. vi编辑器的使用

### (1). 基础命令

> <font face="华文细黑" color=#008B8B size=5>模式切换</font>
>>
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
>>
>> * <font face="consolas" color=#DC143C size=5>:vsp file</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>vi 中打开其它文件</font>**
>>
>> 1. <font face="华文细黑" color=#008B8B size=4>保存 / 退出</font>
>>
>> * <font face="consolas" color=#DC143C size=5>:q</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>退出未修改的文件</font>**
>> * <font face="consolas" color=#DC143C size=5>:q!</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>强制退出，不保存</font>**
>> * <font face="consolas" color=#DC143C size=5>:w</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>保存文件，不退出</font>**
>> * <font face="consolas" color=#DC143C size=5>:x</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>保存文件，退出</font>**
>> * <font face="consolas" color=#DC143C size=5>:w file</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>另存为 file，不退出</font>**
>> * <font face="consolas" color=#DC143C size=5>:r file</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>读入 file 指定的文件内容插入</font>**
>> * <font face="consolas" color=#DC143C size=5>:pwd</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>显示当前文件目录</font>**
>>
>> 2. <font face="华文细黑" color=#008B8B size=4>拷贝 / 粘贴 / 删除 / 取消</font>
>>
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
>>
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
>>
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
>>
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
>>
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

* __软件源配置文件：__ /etc/apt/sources.list
* __软件详细定位：__ /var/lib/apt/lists/*
* __软件源：__ 1. Main(官方开源) 2. Universe(社区开源) 3. Restricted(官方非开源) 4. Multiverse(非官方非开源)
* __刷新软件源：__ 1. 修改配置文件 2. apt-get update

> **<font size=4>管理软件包（sudo）</font>**
![文件类型](\pic\02\apt.png)
![文件类型](\pic\02\apt-get.png)
>>
>> * __1. 修复软件包依赖关系__
![文件类型](\pic\02\rely-on.png)
>> * __2. 安装软件包：sudo apt-get install__
![文件类型](\pic\02\install.png)
>> * __3. 重新安装软件包：sudo apt-get --reinstall install__
>> * __4. 软件的卸载：1. 不完全卸载 sudo apt-get remove 2. 完全卸载 sudo apt-get --purge remove__
![文件类型](\pic\02\remove.png)
>> * __5. 清理软件包缓冲区：sudo apt-get clean; sudo apt-get autoclean__
缓冲区目录：/var/cache/apt/archives/
![文件类型](\pic\02\cache1.png)
![文件类型](\pic\02\cache2.png)

> **<font size=4>查询软件包信息（无需sudo）</font>**
![文件类型](\pic\02\query.png)
>>
>> * __1. 查询软件包描述信息__
![文件类型](\pic\02\show.png)
>> * __2. 获取软件包安装状态__
![文件类型](\pic\02\policy.png)

## 3. shell基本命令

* __关机：__ sudo shutdown -h now
* __定时关机：__ sudo shutdown -h +45 "Game over." （45分钟后关机）
* __重启：__ sudo shutdown -r now; sudo reboot now
* __定时重启：__ 同定时关机

> **<font size=4>shell命令格式</font>**
>
> * __1.__
![文件类型](\pic\02\shell.png)
> * __2.__
![文件类型](\pic\02\format.png)
> * __3.__
![文件类型](\pic\02\format1.png)

> **<font size=4>命令行操作</font>**
>>
>> * __1. 补齐命令和文件名__
![文件类型](\pic\02\operation.png)
>> * __2. 查询命令历史__
>> ![文件类型](\pic\02\history.png)
>> ![文件类型](\pic\02\history1.png)

## 4. shell中的特殊字符

> **<font size=4>通配符</font>**
>> ![文件类型](\pic\02\currency1.png)
>> ![文件类型](\pic\02\currency2.png)
>
> * **<font color=#DC143C>1. 管道</font>**
>
>> ![文件类型](\pic\02\pipe.png)
>
> * __2. 输入输出重定向__
>
>> ![文件类型](\pic\02\inout.png)
>> ![文件类型](\pic\02\inout1.png)
>
> * __3. 命令置换__
>
>> **<font color=#DC143C>方法2：$() 代替 ``</font>**
>> ![文件类型](\pic\02\replace.png)

# 四. shell命令

## 1. shell基础系统维护命令

> **<font size=4>获取联机帮助</font>**
>> **<font color=#DC143C>注意：直接 "man man" 查看man用法，主要是 1~9 和 A</font>**
>> ![文件类型](\pic\02\man.png)
>> ![文件类型](\pic\02\man1.png)
>
> * __1. 基本系统维护命令__
>
>> __(1). passwd__
>> ![文件类型](\pic\02\passwd.png)
>> __(2). su__
>> **<font color=#DC143C>注意："su" 和 "su -" 不一样，su只更改用户，未更改环境</font>**
>> ![文件类型](\pic\02\su.png)
>> ![文件类型](\pic\02\su1.png)
>> __(3). echo__
>> ![文件类型](\pic\02\echo.png)
>> __(4). date__
>> ![文件类型](\pic\02\date.png)
>> __(5). clear 同 ctrl+l__
>> __(6). df__
>> ![文件类型](\pic\02\df.png)
>> ![文件类型](\pic\02\df1.png)
>> __(7). du__
>> ![文件类型](\pic\02\du.png)

## 2. 用户管理命令

> **<font size = 4>相关文件</font>**
> ![文件类型](\pic\02\user.png)
>>
>> * __1. /etc/passwd文件__
>> **<font color=#DC143C>注意："man 5 passwd" 查看文件格式</font>**
>> ![文件类型](\pic\02\passwd-file.png)
>> * __2. /etc/group文件__
>> ![文件类型](\pic\02\group.png)
> **<font size = 4>相关命令</font>**
>> * __1. adduser__
>> **<font color=#DC143C>可在 /etc/passwd 和 /etc/group 中查看新添加的用户，或 "ls /home" 查看</font>**
>> ![文件类型](\pic\02\adduser.png)
>> 配置文件
>> ![文件类型](\pic\02\adduser-config.png)
>> SKEL模版
>> ![文件类型](\pic\02\skel.png)
>> 添加新用户的过程
>> ![文件类型](\pic\02\adduser-process.png)
>> * __2. 设置初始口令：passwd__
>> ![文件类型](\pic\02\passwd.png)
>> * __3. 修改用户属性：usermod__
>> ![文件类型](\pic\02\usermod.png)
>> * __4. 删除用户：deluser__
>> ![文件类型](\pic\02\deluser.png)
>> * __5. 添加用户组：addgroup__
>> ![文件类型](\pic\02\addgroup.png)
>> * __6. 删除用户组：delgroup__
>> ![文件类型](\pic\02\delgroup.png)

## 3. 进程管理命令

**<font color=#DC143C>程序的一次执行就是一个进程：如登两个QQ即两个进程</font>**
>
> * __1. ps__
**<font color=#DC143C>"ps aux | grep a.out"</font>**
> ![文件类型](\pic\02\ps.png)
> ![文件类型](\pic\02\ps1.png)
> **<font color=#DC143C>Z-僵尸态：结束了，但资源未回收</font>**
> ![文件类型](\pic\02\ps2.png)
> * __2. top__
> ![文件类型](\pic\02\top.png)
> * __3. pstree__
> ![文件类型](\pic\02\pstree.png)
> * __4. kill__
> ![文件类型](\pic\02\kill.png)

## 4. 文件系统的类型和结构

> ![文件类型](\pic\02\file-system.png)
> ![文件类型](\pic\02\file-system1.png)
> ![文件类型](\pic\02\file-system2.png)
>
> * __1. SCSI与IDE设备命名__
> **<font color=#DC143C>"df -T"</font>**
> **<font color=#DC143C>1代表硬盘的第1个分区，2代表第3个分区</font>**
> ![文件类型](\pic\02\scsi-ide.png)
> * __2. Linux分区的命名方式__
> ![文件类型](\pic\02\partition.png)
> * **<font color=#DC143C size = 4>3. 交换分区</font>**
> ![文件类型](\pic\02\exchange.png)
> * __4. 文件系统逻辑结构__
> ![文件系统逻辑结构](\pic\02\logic.png)
> ![文件系统逻辑结构](\pic\02\logic1.png)
> * __5. 文件系统结构__
> ![文件系统结构](\pic\02\structure.png)
> ![文件系统结构](\pic\02\structure1.png)
> ![文件系统结构](\pic\02\structure2.png)
> ![文件系统结构](\pic\02\directory.png)
> ![文件系统结构](\pic\02\directory1.png)
> * __6. 基本目录__
> ![基本目录](\pic\02\directory2.png)

## 5. 文件系统相关命令
>
> * __1. 查看文件属性：file__
> ![file](\pic\02\file.png)
> * __2. 创建目录：mkdir__
> **<font color=#DC143C>注：当前目录 "./" 或 空，上一级目录 "../"，根目录 "/"，主目录 "~"</font>**
> ![mdkir](\pic\02\mkdir.png)
> ![mdkir](\pic\02\mkdir1.png)
> * __2. 删除目录：rmdir__
> **<font color=#DC143C>目录内有文件："rm -r"</font>**
> ![rmdir](\pic\02\rmdir.png)
> ![rmdir](\pic\02\rmdir1.png)
> ![rmdir](\pic\02\rmdir2.png)
> * __3. 创建链接文件__
> ![link](\pic\02\link.png)
>>
>> * __(1). 软链接：ln -s__
>> **<font color=#DC143C>注意链接的是绝对路径还是相对路径，若是相对路径，移动链接后，可能失效</font>**
>> **<font color=#DC143C>建议：使用绝对路径</font>**
>> **<font color=#DC143C>注意：修改链接文件同时也会修改源文件</font>**
>> ![ln](\pic\02\ln.png)
>> ![ln](\pic\02\ln1.png)
>> * __(2). 硬链接：ln (无 -s)__
>> **<font color=#DC143C>linux内每个文件都有一个物理编号：inode，查看："ls -i"</font>**
>> **<font color=#DC143C>硬链接文件和源文件本质上是同一个文件 (inode号相同)</font>**
>> **<font color=#DC143C>硬链接一般用于做文件备份，保护文件，防止误删 (inode号对应的所有文件被删除，文件才真正删除)</font>**
>> ![ln](\pic\02\ln3.png)
>>
> * __4. 文件压缩与归档__
> **<font color=#DC143C>先 归档 再 压缩</font>**
> ![compress](\pic\02\compress.png)
> ![compress](\pic\02\compress1.png)
> ![compress](\pic\02\compress2.png)
> ![archive](\pic\02\archive.png)
>>
>> * __(1). gzip(压缩) 与 gunzip(解压) 命令__
>> ![gzip](\pic\02\gzip.png)
>> ![gunzip](\pic\02\gunzip.png)
>> ![gzip-gunzip](\pic\02\gzip-gunzip.png)
>> ![gzip-gunzip](\pic\02\gzip-gunzip1.png)
>> * __(2). tar 命令__
>> ![tar](\pic\02\tar.png)
>> ![tar](\pic\02\tar1.png)
>> **<font color=#DC143C>举例</font>**
>> ![tar](\pic\02\tar2.png)
>> ![tar](\pic\02\tar3.png)
>> ![tar](\pic\02\tar4.png)

## 6. 网络配置管理
>
> * __基础知识__
> ![net](\pic\02\net.png)
> ![net](\pic\02\net1.png)
> * __IP地址__
> ![ip](\pic\02\ip.png)
> ![ip](\pic\02\ip1.png)
> * **<font color=#DC143C>配置IP地址</font>**
>>
>> * __查看IP：ifconfig__
>> ![ip](\pic\02\ifconfig.png)
>> **<font color=#DC143C>eth33：代表网卡; lo：代表主机本身，也称回送接口(Loopback),其IP地址约定为 127.0.0.1</font>**
>> ![ip](\pic\02\ifconfig1.png)
>> __多块网卡__
>> ![ip](\pic\02\ifconfig2.png)
>> ![ip](\pic\02\ifconfig3.png)
>> * __IP修改：临时生效__
>> ![ip](\pic\02\ifconfig4.png)
>> ![ip](\pic\02\ifconfig5.png)
>> * __配置动态IP：dhclient__
>> ![ip](\pic\02\dhclient.png)
>> ![ip](\pic\02\dhclient1.png)
>> * **<font color=#DC143C>永久修改IP地址（注意：unbuntu20 无该文件）</font>**
>> __IP配置__
>> ![ip](\pic\02\interfaces.png)
>> 动态
>> ![ip](\pic\02\interfaces1.png)
>> 静态
>> ![ip](\pic\02\interfaces2.png)
>> __DNS配置__
>> ![ip](\pic\02\resolv.png)
>> ![ip](\pic\02\resolv1.png)
>> **<font color=#DC143C>注意：获取IP后，重启网络服务（包括dhclient）</font>**
>> ![ip](\pic\02\dhclient2.png)
>>
> * __网络连接检测：ping__
> ![ip](\pic\02\ping.png)
> ![ip](\pic\02\ping1.png)
> ![ip](\pic\02\ping2.png)
> **<font color=#DC143C>"-c 3"：只 ping 3次</font>**
> ![ip](\pic\02\ping3.png)
> * __nslookup__
> ![ip](\pic\02\nslookup.png)
> ![ip](\pic\02\nslookup1.png)

# 五. shell脚本编程

## 1. 变量

### (1). 基本过程

__<font color=#DC143C>文件以 .sh 结尾</font>__
![shell](\pic\02\shell-step.png)
![shell](\pic\02\shell-step1.png)
![shell](\pic\02\shell-step2.png)
![shell](\pic\02\shell-step3.png)
![shell](\pic\02\shell-step4.png)

### (2). shell变量

![shell](\pic\02\shell-value.png)
__<font color=#DC143C>打印变量要加 "$"，否则会被当成 字符串</font>__
![shell](\pic\02\shell-value1.png)
__<font color=#DC143C>shell变量无数据类型</font>__
__<font color=#DC143C>"=" 两边不能加 空格</font>__
![shell](\pic\02\shell-value2.png)

### (3). 用户自定义变量

__<font color=#DC143C>变量名大写, unset 删除变量赋值</font>__
![shell](\pic\02\shell-value3.png)
![shell](\pic\02\shell-value4.png)
![shell](\pic\02\shell-value5.png)

### (4). 位置变量

![shell](\pic\02\shell-value6.png)
__<font color=#DC143C>类似于C语言 main函数的输入参数</font>__
__<font color=#DC143C>执行文件前加当前路径 "./"，否则会被当成常规shell命令来执行</font>__
![shell](\pic\02\shell-value7.png)
![shell](\pic\02\shell-value8.png)
__<font color=#DC143C>不同于C语言的是，命令个数 "\$#" 不包含文件本身</font>__
![shell](\pic\02\shell-value9.png)
![shell](\pic\02\shell-value10.png)
__<font color=#DC143C>但 "\$0" 为文件本身</font>__
![shell](\pic\02\shell-value11.png)
![shell](\pic\02\shell-value12.png)
__<font color=#DC143C>转义符 \ 和C语言一样</font>__
![shell](\pic\02\shell-value13.png)
![shell](\pic\02\shell-value14.png)
__<font color=#DC143C>数子用{}起来，不加{}入下</font>__
![shell](\pic\02\shell-value15.png)
![shell](\pic\02\shell-value16.png)
__<font color=#DC143C>加{}，注意 "\$0" 是文件名</font>__
![shell](\pic\02\shell-value17.png)
![shell](\pic\02\shell-value18.png)

### (5). 常用shell环境变量

__<font color=#DC143C>类似于C语言中的默认变量，注意自定义时不要冲突</font>__
![shell](\pic\02\shell-value19.png)

## 2. 功能语句

![shell](\pic\02\shell-sentence.png)

### (1). 注释

__<font color=#DC143C>注意：第一行注释用来指明用哪种类型的shell来执行</font>__
![shell](\pic\02\shell-sentence1.png)

### (2). read

![shell](\pic\02\shell-sentence2.png)

> * __<font color=#DC143C>例1：</font>__
> __<font color=#DC143C>注：脚本中变量无数据类型，所有输入都会被当成字符串处理</font>__
> ![shell](\pic\02\shell-read.png)
> ![shell](\pic\02\shell-read1.png)
> ![shell](\pic\02\shell-read2.png)
> * __<font color=#DC143C>例2：</font>__
> __<font color=#DC143C>注：多余的会赋值给最后一个变量</font>__
> ![shell](\pic\02\shell-read3.png)
> ![shell](\pic\02\shell-read4.png)
> * __<font color=#DC143C>例3：</font>__
> __<font color=#DC143C>bash: -n 不换行</font>__
> ![shell](\pic\02\shell-read5.png)
> ![shell](\pic\02\shell-read6.png)
> __<font color=#DC143C>sh: \c 不换行</font>__
> ![shell](\pic\02\shell-read7.png)
> ![shell](\pic\02\shell-read6.png)

### (3). expr

__<font color=#DC143C size=4> * 是通配符，需要转义</font>__
![shell](\pic\02\shell-expr.png)
![shell](\pic\02\shell-expr1.png)

> * __<font color=#DC143C>例1：</font>__
> __<font color=#DC143C size=4>算术符号两边要加空格</font>__
> ![shell](\pic\02\shell-expr2.png)
> ![shell](\pic\02\shell-expr3.png)
> * __<font color=#DC143C>例2：</font>__
> __<font color=#DC143C size=4>注意命令置换 ``</font>__
> __<font color=#DC143C size=4>等号两边不能加空格</font>__
> ![shell](\pic\02\shell-expr4.png)
> ![shell](\pic\02\shell-expr3.png)

### (4). test

![shell](\pic\02\shell-test.png)
__<font color=#DC143C>字符串</font>__
![shell](\pic\02\shell-test1.png)
__<font color=#DC143C>整数</font>__
![shell](\pic\02\shell-test2.png)
__<font color=#DC143C>文件</font>__
![shell](\pic\02\shell-test7.png)

> * __<font color=#DC143C>例1：字符串</font>__
> __<font color=#DC143C>"\$?" 是上一条语句的执行结果</font>__
> __<font color=#DC143C>和C语言相反：假是1，真是0</font>__
> ![shell](\pic\02\shell-test3.png)
> ![shell](\pic\02\shell-test4.png)
> * __<font color=#DC143C>例2：整数</font>__
> ![shell](\pic\02\shell-test5.png)
> ![shell](\pic\02\shell-test6.png)
> * __<font color=#DC143C>例3：文件</font>__
> __<font color=#DC143C>\$HOME：用户主目录</font>__
> ![shell](\pic\02\shell-test8.png)
> ![shell](\pic\02\shell-test9.png)

## 3. 分支语句

### (1). 结构性语句

![shell](\pic\02\shell-branch.png)

### (2). if then fi

__<font color=#DC143C>和C语言相反：假是1，真是0</font>__
![shell](\pic\02\shell-branch1.png)

> * __<font color=#DC143C>例：</font>__
> __<font color=#DC143C>用 [ ] 代替 test 命令，前后必须有空格</font>__
> __<font color=#DC143C>只输入文件名，\$# = 0，与1不相等，成立 (-ne是否不相等)</font>__
> ![shell](\pic\02\shell-branch2.png)
> ![shell](\pic\02\shell-branch3.png)
> __<font color=#DC143C>相当于</font>__
> ![shell](\pic\02\shell-branch4.png)
> ![shell](\pic\02\shell-branch3.png)
> __<font color=#DC143C>完整</font>__
> ![shell](\pic\02\shell-branch5.png)
> ![shell](\pic\02\shell-branch6.png)

### (3). if then else fi：同C语言

![shell](\pic\02\shell-branch7.png)

### (4). if then elif else fi：同C语言

![shell](\pic\02\shell-branch8.png)

### (5). 分支语句：case esac

![shell](\pic\02\shell-branch9.png)
![shell](\pic\02\shell-branch10.png)

> * __<font color=#DC143C>例1：</font>__
> ![shell](\pic\02\shell-branch11.png)
> * __<font color=#DC143C>例2：</font>__
> ![shell](\pic\02\shell-branch12.png)
> ![shell](\pic\02\shell-branch13.png)
> * __<font color=#DC143C>例3：</font>__
> ![shell](\pic\02\shell-branch14.png)
> ![shell](\pic\02\shell-branch15.png)

## 4. 循环语句

### (1). for

![shell](\pic\02\shell-cycle.png)

> * __<font color=#DC143C>例1：</font>__
> ![shell](\pic\02\shell-cycle1.png)
> ![shell](\pic\02\shell-cycle2.png)
> * __<font color=#DC143C>例2：</font>__
> ![shell](\pic\02\shell-cycle3.png)
> * __<font color=#DC143C>例3：</font>__
> __<font color=#DC143C>seq 1 2 10：起始1，增量2，终止10；具体 "man seq"</font>__
> ![shell](\pic\02\shell-cycle4.png)
> * __<font color=#DC143C>例4：</font>__
> ![shell](\pic\02\shell-cycle5.png)
> * __<font color=#DC143C>例5：</font>__
> ![shell](\pic\02\shell-cycle6.png)
> * __<font color=#DC143C>例6：死循环</font>__
> __<font color=#DC143C>for (( ;; ))</font>__
> * __<font color=#DC143C>例7：</font>__
> ![shell](\pic\02\shell-cycle8.png)
> ![shell](\pic\02\shell-cycle7.png)

### (2). while

![shell](\pic\02\shell-while.png)
![shell](\pic\02\shell-while1.png)

> * __<font color=#DC143C>例1：</font>__
> ![shell](\pic\02\shell-while2.png)
> * __<font color=#DC143C>例2：</font>__
> ![shell](\pic\02\shell-while3.png)
> * __<font color=#DC143C>例3：死循环</font>__
> __<font color=#DC143C>while true</font>__
> ![shell](\pic\02\shell-while4.png)
> * __<font color=#DC143C>例4：</font>__
> __<font color=#DC143C>生成文件：>（即重定向符）</font>__
> ![shell](\pic\02\shell-while5.png)
> * __<font color=#DC143C>例5：生成"FILE\*"文件（例子内为 FILE1 FILE2）</font>__
> __<font color=#DC143C>删除同理：将 ">" 换成 "rm" 即可</font>__
> ![shell](\pic\02\shell-while6.png)

### (3). break 和 continue

__<font color=#DC143C>同C语言一样：break跳出整个循环；continue跳出1层循环</font>__
![shell](\pic\02\shell-break-countinue.png)

> * __<font color=#DC143C>例1：</font>__
> ![shell](\pic\02\shell-break-countinue1.png)
> * __<font color=#DC143C>例2：</font>__
> ![shell](\pic\02\shell-break-continue1.png)
> ![shell](\pic\02\shell-break-continue2.png)
> * __<font color=#DC143C>例3：</font>__
> ![shell](\pic\02\shell-break-continue3.png)
> * __<font color=#DC143C>例4：设置跳出层数</font>__
> ![shell](\pic\02\shell-break-continue4.png)

## 5. 函数

### (1). 格式

![shell](\pic\02\shell-func.png)

> * __<font color=#DC143C>例1：</font>__
> ![shell](\pic\02\shell-func1.png)
> * __<font color=#DC143C>例2：</font>__
> ![shell](\pic\02\shell-func2.png)
> * __<font color=#DC143C>例3：</font>__
> ![shell](\pic\02\shell-func3.png)
> * __<font color=#DC143C>例4：无 return，修改搜索语句</font>__
> __<font color=#DC143C>^$S: 即以 \$S: 开头的文件</font>__
> ![shell](\pic\02\shell-func4.png)

### (2). 变量作用域

![shell](\pic\02\shell-func5.png)

> * __<font color=#DC143C>例1：</font>__
> __<font color=#DC143C>lcvariable 为局部变量，外部无法调用</font>__
> ![shell](\pic\02\shell-func6.png)
> ![shell](\pic\02\shell-func7.png)

# 六. C语言高级编程

## 1. gcc和gdb的用法

### (1). GUN

![gun](\pic\02\gun.png)
![gun](\pic\02\gun1.png)

### (2). GCC

![gcc](\pic\02\gcc.png)
![gcc](\pic\02\gcc1.png)

### (3). 编辑器的主要组件

![gcc](\pic\02\gcc2.png)

### (4). GCC的基本用法和选项

![gcc](\pic\02\gcc3.png)

### (5). GCC的错误类型及对策

![gcc](\pic\02\gcc4.png)
![gcc](\pic\02\gcc5.png)

### (6). GCC编译过程

![gcc](\pic\02\gcc6.png)
![gcc](\pic\02\gcc10.png)
__<font color=#DC143C>1. 预处理：gcc -E test -o test.i</font>__
__<font color=#DC143C>替换所有 # 开头的内容（头文件、宏定义、条件编译等），删除注释，不检查语法错误</font>__
![gcc](\pic\02\gcc11.png)
__<font color=#DC143C>2. 编译：gcc -S test.i -o test.s</font>__
__<font color=#DC143C>只编译不汇编，生成汇编代码，期间会检查语法错误</font>__
![gcc](\pic\02\gcc12.png)
__<font color=#DC143C>3. 汇编：gcc -c test.s -o test.o</font>__
__<font color=#DC143C>编译、汇编，不链接，生成目标文件（二进制机器指令）</font>__
![gcc](\pic\02\gcc13.png)
__<font color=#DC143C>4. 链接：gcc test.o -o test</font>__
__<font color=#DC143C>链接所有的.o文件、库文件，生成可执行文件</font>__
![gcc](\pic\02\gcc14.png)

> * __<font color=#DC143C>例1：</font>__
> ![gcc](\pic\02\gcc7.png)
> ![gcc](\pic\02\gcc8.png)
> __<font color=#DC143C>sqrt 需要 -lm，指定对应的库</font>__
> __<font color=#DC143C>-Wall：显示警告</font>__
> ![gcc](\pic\02\gcc9.png)

### (7). GDB（调试运行时的错误，不检查语法）

![gcc](\pic\02\gdb.png)
__<font color=#DC143C>调试流程</font>__
![gcc](\pic\02\gdb1.png)
> __<font color=#DC143C>例：</font>__
> ![gcc](\pic\02\gdb2.png)
> __<font color=#DC143C>l：一次10行</font>__
> __<font color=#DC143C>l 1：返回第一次</font>__
> ![gcc](\pic\02\gdb3.png)
> ![gcc](\pic\02\gdb4.png)
> __<font color=#DC143C>b 11：第11行打断点</font>__
> __<font color=#DC143C>info b：显示断点信息</font>__
> ![gcc](\pic\02\gdb5.png)
> __<font color=#DC143C>del 1：删除第1个断点</font>__
> ![gcc](\pic\02\gdb6.png)
> __<font color=#DC143C>r：程序运行，此处运行到断点1处</font>__
> ![gcc](\pic\02\gdb7.png)
> __<font color=#DC143C>p m：显示变量m的值</font>__
> ![gcc](\pic\02\gdb8.png)
> __<font color=#DC143C>n：单步跟踪</font>__
> __<font color=#DC143C>s：单步跟踪进入(函数)</font>__
> ![gcc](\pic\02\gdb9.png)
> __<font color=#DC143C>set args：设置输入参数</font>__
> ![gcc](\pic\02\gdb10.png)
> __<font color=#DC143C>c：继续运行</font>__
> __<font color=#DC143C>q：退出</font>__
> __<font color=#DC143C>其它：查字典</font>__

## 2. C复习

### (1). 结构体

![c](\pic\02\struct.png)
![c](\pic\02\struct1.png)
__<font color=#DC143C>同类型结构体变量可直接赋值</font>__
![c](\pic\02\struct2.png)

### (2). 存储

__<font color=#DC143C>只读区：代码区 + 常量区</font>__
__<font color=#DC143C>代码区：存放二进制代码</font>__
__<font color=#DC143C>常量区：全局 const + 字符串常量，程序结束后才释放</font>__
__<font color=#DC143C>静态存储区：全局变量、静态变量、常量</font>__
__<font color=#DC143C>栈/堆区：不解释</font>__
![c](\pic\02\mem.png)
![c](\pic\02\mem1.png)
![c](\pic\02\mem2.png)
![c](\pic\02\mem3.png)

### (3). malloc/free

__<font color=#DC143C>(1). malloc 申请失败，返回 NULL，也不需要 free</font>__
__<font color=#DC143C>(2). free(p) 操作只是释放了p所指向的堆内存，p指向不变，为空悬指针，所以释放后，将 p = NULL;</font>__
__<font color=#DC143C>(3). malloc 申请的内存，不能释放多次</font>__
__<font color=#DC143C>(4). malloc 申请的内存，释放前，不能修改指针指向</font>__

> * __<font color=#DC143C>char s[]局部变量，不解释；static char s[]静态变量，生命周期到main()结束，可以被return；char *s 字符串常量，不能被 return</font>__
> * __<font color=#DC143C>建议：使用动态内存，不解释</font>__
> * ![c](\pic\02\malloc.png)
> * __<font color=#DC143C>错误：修改了s存储的地址，return后，无法被正确释放</font>__
> * ![c](\pic\02\malloc1.png)

### (4). 野指针

* __<font color=#DC143C>(1). 未初始化：为一个随机值</font>__
* __<font color=#DC143C>(2). free 后未 = NULL：存储了一个无法被访问的内存地址</font>__
* __<font color=#DC143C>(2). 指针操作越界：如访问数组，指向了数组范围之外</font>__
![c](\pic\02\malloc2.png)
* __<font color=#DC143C>例1：p未初始化</font>__
![c](\pic\02\malloc3.png)
* __<font color=#DC143C>例2：指针操作越界</font>__
![c](\pic\02\malloc4.png)

# 七. Makefile

## 1. 原理及基础知识

### (1). 原理

![makefile](\pic\02\make.png)

### (2). 基本结构

![makefile](\pic\02\make1.png)
![makefile](\pic\02\make2.png)
![makefile](\pic\02\make3.png)

* __<font color=#DC143C>例1：命令执行顺序根据目标文件的依赖，即 f1.o f2.o main.o</font>__
* __<font color=#DC143C>.PHONY:clean - 设定clean为命令，而非文件</font>__
![makefile](\pic\02\make4.png)

### (3). Make使用

![makefile](\pic\02\make21.png)

### (4). 创建和使用变量

![makefile](\pic\02\make5.png)
![makefile](\pic\02\make6.png)

* __<font color=#DC143C>(1). 递归展开方式：foo的值从后面找</font>__
![makefile](\pic\02\make8.png)
![makefile](\pic\02\make9.png)
* __<font color=#DC143C>(2). 简单方式：x的值从前面找，类C语言</font>__
![makefile](\pic\02\make10.png)
![makefile](\pic\02\make11.png)
* __<font color=#DC143C>(3). 用 ?= 定义变量</font>__
![makefile](\pic\02\make12.png)
![makefile](\pic\02\make13.png)
* __<font color=#DC143C>(4). 添加值</font>__
![makefile](\pic\02\make14.png)
* __<font color=#DC143C>(5). 预定义变量 (默认有值)</font>__
__<font color=#DC143C>例中 CC 即为 gcc，RM 为 rm -f</font>__
![makefile](\pic\02\make15.png)
![makefile](\pic\02\make16.png)
* __<font color=#DC143C>(6). 自动变量</font>__
![makefile](\pic\02\make18.png)
* __<font color=#DC143C>(7). 环境变量</font>__
![makefile](\pic\02\make20.png)
* __<font color=#DC143C>例1：自定义变量</font>__
![makefile](\pic\02\make17.png)
* __<font color=#DC143C>例2：自动变量和预定义变量</font>__
![makefile](\pic\02\make19.png)
* __<font color=#DC143C>例3：</font>__
![makefile](\pic\02\make7.png)
* __<font color=#DC143C>例4：指定 include文件所在的目录（gcc -I）</font>__
![makefile](\pic\02\make23.png)

## 2. 命令的选项及隐含的规则

### (1). 复习Make使用的几个重要选项

![makefile](\pic\02\make21.png)

* __<font color=#DC143C>-C：执行指定目录下的 Makefile</font>__
* __<font color=#DC143C>-f：make -f file 代替 make（make -f file clean 代替 make clean）; 指定文件当成Makefile，如调试时备份Makefile</font>__
* __<font color=#DC143C>-i：不执行错误的命令，执行能执行的命令（大工程，编译时间长，防止万一某个命令错了，不带 -i 即全部执行失败）</font>__
* __<font color=#DC143C>-n：只打印，不执行（工程大，只看一下执行的过程）</font>__
* __<font color=#DC143C>-p：显示 make变量数据库 以及 隐含规则</font>__
* __<font color=#DC143C>-w：如果执行过程中make改变目录，打印当前目录（make 是默认带 -w 的）</font>__
* __<font color=#DC143C>include 包含其它文件（#为注释）</font>__
![makefile](\pic\02\make24.png)

### (2). 常用的隐含规则

* __(1). 编译C语言的隐含规则：-c过程（生成.o文件过程）__
![makefile](\pic\02\make25.png)
* __<font color=#DC143C>目标文件的生成：会自动查询同名的.c文件，自动生成.o文件；默认为 gcc -c，CFLAGS 需自己定义</font>__
* __<font color=#DC143C>注意：如果生成.o过程中，有特殊选项，一定要重新给 CFLAGS 赋值</font>__
![makefile](\pic\02\make26.png)
* __<font color=#DC143C>更简洁</font>__
![makefile](\pic\02\make27.png)
* __(2). 链接Object文件的隐含规则（生成执行文件过程）__
![makefile](\pic\02\make28.png)
* __<font color=#DC143C>注意：执行文件要和目标文件的其中一个同名（f1 或 f2 或 main）</font>__
![makefile](\pic\02\make29.png)

## 3. VPATH及嵌套的Makefile

### (1). VPATH的用法

![makefile](\pic\02\vpath.png)

* __<font color=#DC143C>例：目录如下</font>__
![makefile](\pic\02\vpath1.png)
__<font color=#DC143C>不使用 VPATH 的基础 Makefile</font>__
![makefile](\pic\02\vpath2.png)
![makefile](\pic\02\vpath3.png)
__<font color=#DC143C>删除文件：</font>__
__<font color=#DC143C>-exec 详见搜索（类似管道），"{}" 为查找出来的文件，";" 为结束符（加上转义符斜杆），第二个 ";" 为两个命令之间分隔</font>__
__<font color=#DC143C>注意：是 "*.o"，".o" 会把文件全删了</font>__
![makefile](\pic\02\vpath4.png)
* __<font color=#DC143C>简化1：隐含规则</font>__
![makefile](\pic\02\vpath5.png)
* __<font color=#DC143C>简化2：隐含规则 + VPATH声明依赖路径</font>__
![makefile](\pic\02\vpath6.png)
![makefile](\pic\02\vpath7.png)

### (2). Makefile的嵌套

![makefile](\pic\02\nesting.png)
![makefile](\pic\02\nesting1.png)
![makefile](\pic\02\nesting2.png)
![makefile](\pic\02\nesting3.png)
![makefile](\pic\02\nesting7.png)
![makefile](\pic\02\nesting4.png)
![makefile](\pic\02\nesting8.png)

* __<font color=#DC143C>依赖文件Makefile解析：</font>__
![makefile](\pic\02\nesting5.png)
__../\$(OBJS_DIR)/main.o:main.c__
__依赖文件为当前目录下的main.c，生成的目标文件在 ../obj/ 内__
* __<font color=#DC143C>根文件Makefile解析：</font>__
![makefile](\pic\02\nesting6.png)
__all: CHECK_DIR \$(SUBDIRS)__
__all 依赖 CHECK_DIR 和 SUBDIRS__
__CHECK_DIR 执行的命令为 mkdir -p bin__
__SUBDIRS 依赖 ECHO__
__ECHO 为 两句打印语句__
__SUBDIRS 为 f1 f2 main obj__
__SUBDIRS 执行的命令为 make -C f1; make -C f2; make -C main; make -C obj__
__echo 前加 @：是因为make执行的时候本身就会打印命令，所以隐藏掉make命令__
__make -C dir：调用 dir 目录下的make（见上一节）__
__export：使得这些变量在 子目录下的子Makefile内也能调用__

# 八. Linux I/O

## 1. 标准IO介绍

* __标准C中定义好的一组用来输入和输出的API__

### (1). 文件

![io](\pic\04\file.png)

### (2). 系统调用、缓冲

![io](\pic\04\io.png)

* __系统调用：应用程序通过操作系统提供的接口访问硬件；不同的操作系统，系统调用接口不兼容__
![io](\pic\04\os.png)
* __缓冲：无缓冲 - APP读多少，系统从硬盘中取多少，每次读取都要进行系统调用；有缓冲 - 不管APP读多少，先读一批数据到缓冲中，APP直接从缓冲区中读取，减少系统调用的次数__
![io](\pic\04\buffer.png)

### (3). FILE/流

__Linux下不区分文本流和二进制流__
![io](\pic\04\io1.png)
![io](\pic\04\io2.png)

### (4). 流缓冲类型

* __全缓冲 - 标准I/O默认(打开文件)：当流的缓冲区满时才执行实际的I/O操作；当缓冲区空的时候，才会从实际的文件中读取数据__
* __<font color=#DC143C>行缓冲 - 标准输入/输出(终端相关 - printf)：缓冲区满 或者 遇到换行符，才进行实际的I/O操作；即标准输出的 printf 必须加上 '\n' 才能输出</font>__
* __无缓冲(标准错误输出)：直接读取/写入文件__
![io](\pic\04\io3.png)

### (5). 默认流

__Linux运行时，系统自动打开的3个流；对应3个文件描述符__
![io](\pic\04\io4.png)

## 2. 流的打开和关闭

### (1). 打开流

![io](\pic\04\io5.png)

* __<font size=4>(1). mode 参数</font>__
__<font color=#DC143C>w+: 因为 w 将文件的内容清空，所以只能读打开文件后新写入的内容</font>__
![io](\pic\04\io6.png)
![io](\pic\04\io7.png)
>
> * __<font color=#DC143C>例：</font>__
> ![io](\pic\04\io8.png)
>
* __<font size=4>(2). 权限</font>__
__<font color=#DC143C>文件权限补充：ls -l查看，d代表目录，权限依次为 所有者(u)、群组(g)、其它用户(o)</font>__
__<font color=#DC143C>文件权限为一组8进制数(0开头)，0777 = rwx rwx rwx</font>__
![io](\pic\04\io9.png)
![io](\pic\04\io10.png)
* __<font size=4>(3). 处理错误信息</font>__
![io](\pic\04\io11.png)
>
> * __<font color=#DC143C>例1：</font>__
> ![io](\pic\04\io12.png)
> * __<font color=#DC143C>例2：</font>__
> ![io](\pic\04\io13.png)

### (2). 关闭流

![io](\pic\04\io14.png)

### (3). 一个程序打开流的最大个数

![io](\pic\04\io15.png)

## 3. 按字符输入和输出

__<font color=#DC143C size=4>既能处理文本文件 (字符串)，也能处理二进制文件，缺点效率低</font>__

### (1). 读写流

__<font color=#DC143C>一般推荐用第三种方式</font>__
![io](\pic\04\io16.png)

### (2). 按字符输入

![io](\pic\04\io17.png)
>
> * __<font color=#DC143C>例：</font>__
> __<font color=#DC143C>再次强调：标准输出流是行缓冲，printf 要 '\n' 才能输出</font>__
> ![io](\pic\04\io18.png)

### (3). 按字符输出

![io](\pic\04\io19.png)
>
> * __<font color=#DC143C>例1：</font>__
> ![io](\pic\04\io20.png)
> * __<font color=#DC143C>例2：diff 文件比较命令，有不同会输出</font>__
> ![io](\pic\04\io21.png)
> ![io](\pic\04\io22.png)

## 4. 按行输入和输出

__<font color=#DC143C size=4>只能处理文本文件 (字符串)，无法处理二进制文件 (二进制文件中通常会包含 '\0')</font>__

### (1). 按行输入

![io](\pic\04\io23.png)
![io](\pic\04\io32.png)
> __<font color=#DC143C>例：</font>__
> ![io](\pic\04\io24.png)
>> __<font color=#DC143C>abcd<回车>：abcd\n\0（输入的一定是字符串）</font>__
![io](\pic\04\io25.png)
>> __<font color=#DC143C>abcdef<回车>：abcde\0（只能读取N-1个）</font>__
![io](\pic\04\io26.png)

### (2). 按行输出

* __<font color=#DC143C size=4>puts 和 fputs 都是将缓冲区s内的字符串输出到流内，直到遇到'\0'后停止（都不包含'\0'）</font>__
* __<font color=#DC143C size=4>puts 会追加 '\n'（因为是标准输出流），fputs 不会追加 '\n'</font>__
* __<font color=#DC143C size=4>fputs 写入的字符串，不包含末尾的 '\0'</font>__
![io](\pic\04\io27.png)

> __<font color=#DC143C>例：</font>__
> ![io](\pic\04\io28.png)

## 5. 按对象输入和输出

![io](\pic\04\io29.png)
![io](\pic\04\io30.png)
>
> * __<font color=#DC143C>例1：</font>__
> ![io](\pic\04\io31.png)
> * __<font color=#DC143C>例2：</font>__
> ![io](\pic\04\io33.png)
> ![io](\pic\04\io34.png)

## 6. 流相关操作

### (1). 刷新流

* __<font color=#DC143C>1. 全缓冲：缓冲区满；行缓冲：缓冲区满/换行</font>__
* __<font color=#DC143C>2. 当流关闭(fclose)时 / 程序结束时调用exit</font>__
* __<font color=#DC143C>3. fflush函数</font>__
![io](\pic\04\io35.png)

> __<font color=#DC143C>例：标准IO打开的流都是全缓冲，以下代码只是将字符 'a' 写入到流的缓冲区里，并未写入到文件里</font>__
> ![io](\pic\04\io36.png)
> ![io](\pic\04\io37.png)
> ![io](\pic\04\io38.png)
> __<font color=#DC143C>修改代码，通过 fflush 刷新流</font>__
> ![io](\pic\04\io39.png)
> ![io](\pic\04\io40.png)
> ![io](\pic\04\io41.png)

### (2). 定位流

__<font color=#DC143C>当流打开时，内部有一个当前读写位置</font>__
__rewind 定位到起始点，相当于 fseek(sp, 0, SEEK_SET);__
![io](\pic\04\io42.png)
![io](\pic\04\io43.png)
>
> * __<font color=#DC143C>例1：</font>__
> ![io](\pic\04\io44.png)
> * __<font color=#DC143C>例2：</font>__
> ![io](\pic\04\io45.png)

### (3). 判断流 (出错/结束)

![io](\pic\04\io46.png)

## 7. sprintf和fprintf的用法

* __<font color=#DC143C>fprintf - 将字符串输出到指定的流中（fprintf(stdout...) = printf）；成功：返回写入的字符总数，失败：返回EOF</font>__
* __<font color=#DC143C>sprintf - 将字符串输出到指定的缓冲区中；成功：返回写入的字符总数，不包括追加在末尾的'\0'，失败：返回EOF</font>__
* __<font color=#DC143C size=4>sprintf 会追加 '\0'，fprintf 不写入 '\0'</font>__
![io](\pic\04\io47.png)
>
> * __<font color=#DC143C>例1：</font>__
> ![io](\pic\04\io48.png)
> * __<font color=#DC143C>例2：</font>__
> ![io](\pic\04\io49.png)
> ![io](\pic\04\io50.png)
> ![io](\pic\04\io51.png)
> ![io](\pic\04\io52.png)
> ![io](\pic\04\io53.png)

## 8. 文件IO介绍

__<font color=#DC143C>标准IO相当于在文件IO上封装了一个缓冲</font>__
![fileio](\pic\04\fileio.png)
![fileio](\pic\04\fileio1.png)

### (1). 文件描述符

* __<font color=#DC143C>不同程序内获取的文件描述符互不干扰，即使序号一样</font>__
* __<font color=#DC143C>0、1、2 分别是：标准输入流、标准输出流、标准错误流</font>__
![fileio](\pic\04\fileio2.png)

### (2). 打开文件：open

* __<font color=#DC143C>权限还受掩码影响，实际权限：mode & ~umask</font>__
* __<font color=#DC143C>O_CREAT、O_EXCL 一般同时使用</font>__
![fileio](\pic\04\fileio3.png)
![fileio](\pic\04\fileio4.png)
>
> * __<font color=#DC143C>例1：0666(8进制) 110110110 rw-rw-rw-</font>__
> ![fileio](\pic\04\fileio5.png)
> * __<font color=#DC143C>例2：</font>__
> ![fileio](\pic\04\fileio6.png)

### (3). 关闭文件：close

![fileio](\pic\04\fileio7.png)

## 9. 文件IO编程接口

### (1). 读取文件：read

__<font color=#DC143C>count: 读取字节数</font>__
![fileio](\pic\04\fileio8.png)
>
> * __<font color=#DC143C>例：</font>__
> ![fileio](\pic\04\fileio9.png)

### (2). 写入文件：write

__<font color=#DC143C>count: 写入字节数</font>__
![fileio](\pic\04\fileio10.png)
>
> * __<font color=#DC143C>例：</font>__
> __<font color=#DC143C>复习：gets/fgets读取，直到回车结束；gets不读取\n，会追加\0；fgets会读取\n，并追加\0</font>__
> ![fileio](\pic\04\fileio11.png)

### (3). 定位文件：lseek

__<font color=#DC143C>返回值和 fseek 不一样</font>__
![fileio](\pic\04\fileio12.png)
>
> * __<font color=#DC143C>例：</font>__
> ![fileio](\pic\04\fileio13.png)
> ![fileio](\pic\04\fileio14.png)

## 10. 目录操作和文件属性

### (1). 打开目录：opendir

![fileio](\pic\04\fileio15.png)

### (2). 读取目录：readdir

__<font color=#DC143C>目录中每一个子目录或文件都对应一个目录项，所以要循环读取，直到读到目录尾</font>__
![fileio](\pic\04\fileio17.png)

### (3). 关闭目录：closedir

![fileio](\pic\04\fileio16.png)
>
> * __<font color=#DC143C>例：</font>__
> ![fileio](\pic\04\fileio18.png)

### (4). 修改文件访问权限：chmod / fchmod

__<font color=#DC143C>一个通过路径，一个通过文件描述符</font>__
![fileio](\pic\04\fileio19.png)

### (5). 获取文件属性：stat / lstat / fstat

__<font color=#DC143C>建议使用 lstat：目标文件是源文件</font>__
![fileio](\pic\04\fileio20.png)

* __<font size=4>常见属性</font>__
![fileio](\pic\04\fileio21.png)
* __<font size=4>文件类型 - st_mode：和8进制的类型掩码相与，即文件类型(都是8进制)</font>__
![fileio](\pic\04\fileio22.png)
* __<font size=4>文件访问权限 - st_mode：低9位存放的就是权限 (8-6: 所有者rwx, 5-3: 同组用户rwx, 2-0: 其它用户rwx)</font>__
![fileio](\pic\04\fileio23.png)
>
> * __<font color=#DC143C>例：</font>__
> ![fileio](\pic\04\fileio24.png)
> ![fileio](\pic\04\fileio25.png)

## 11. 静态库的制作

### (1). 库

![lib](\pic\04\lib.png)
![lib](\pic\04\lib1.png)

### (2). 特点

![lib](\pic\04\lib2.png)

### (3). 创建

* __<font color=#DC143C>静态库名称：lib 开头，格式 .a</font>__
* __<font color=#DC143C>调用库内的函数要声明函数原型</font>__
* __<font color=#DC143C>-L.：指定库搜索路径为当前路径；-lhello：指定hello库 (编译器默认从缺省路径查找C库)</font>__
* __<font color=#DC143C>静态库被删除了程序也能执行 (相关的代码已经被复制到程序内)</font>__
![lib](\pic\04\lib3.png)
![lib](\pic\04\lib4.png)
![lib](\pic\04\lib5.png)
![lib](\pic\04\lib6.png)
![lib](\pic\04\lib7.png)

## 12. 共享库的制作

### (1). 特点

![lib](\pic\04\lib8.png)

### (2). 创建

* __<font color=#DC143C>-fPIC: 编译生成位置无关代码</font>__
* __<font color=#DC143C>共享库名称：lib开头，格式 .so.n，n通常代码版本</font>__
* __<font color=#DC143C>符号链接名称：去掉版本号 (修改版本只需要修改链接指向即可)</font>__
* __<font color=#DC143C>gcc 链接默认先找 共享库；直接链接静态库：-static</font>__
* __<font color=#DC143C>由于执行时系统会在缺省路径查找库，需添加共享库的加载路径 (设为当前路径)：export LD_LIBRARY_PATH=$LD_LIBARY_PATH:.  注意：此方法只在当前的 shell 中有效</font>__
* __<font color=#DC143C>gcc 默认先从当前目录查找 头文件</font>__
![lib](\pic\04\lib9.png)
![lib](\pic\04\lib10.png)
![lib](\pic\04\lib11.png)
![lib](\pic\04\lib12.png)
![lib](\pic\04\lib13.png)

### (3). 查找共享库

__<font color=#DC143C>建议使用方法3</font>__
![lib](\pic\04\lib14.png)
![lib](\pic\04\lib15.png)
![lib](\pic\04\lib16.png)

# 九. Linux并发

## 1. Linux进程

### (1). 概念

![process](\pic\05\process.png)

### (2). 内容

![process](\pic\05\process1.png)
![process](\pic\05\process2.png)
__PC: program counter 下一条指令的地址__

### (3). 类型

![process](\pic\05\process3.png)
__前台进程：从终端(shell)输入，从终端输出__
__后台进程：加地址号，18645是进程号，无法从终端读取输入，可以往终端输出__
![process](\pic\05\process4.png)

### (4). 状态

__准备运行也叫就绪态__
__死亡态也叫僵尸态__
![process](\pic\05\process5.png)
![process](\pic\05\process6.png)

## 2. 进程编辑命令

### (1). 查看进程信息

![process](\pic\05\process7.png)
__ps -ef | more：显示所有进程信息，more：一页一页显示__
__ps -ef | grep test：列出并查找对应的进程信息__
__UID：进程所有者，PID：进程号，PPID：副进程号，C：CPU的占有率，STIME：开始时间，TTY：关联的终端，TIME：执行时占用的时间，CMD：对应程序的名称__
![process](\pic\05\process8.png)
__ps aux：较 -ef，还能显示当前状态，具体状态码的含义：man ps__
![process](\pic\05\process9.png)
![process](\pic\05\process10.png)
__top：查看进程的动态信息__
__/proc：进程信息目录，再进入需要查看的进程号目录__
![process](\pic\05\process11.png)
![process](\pic\05\process12.png)
![process](\pic\05\process13.png)
__fd目录：当前进程打开的所有的文件信息__
![process](\pic\05\process14.png)

### (2). 修改进程优先级

![process](\pic\05\process15.png)
__NI：nice值，越小，优先级越高 [-20, 19]，默认为0__
![process](\pic\05\process16.png)
__nice -n x ./test：指定 test 的优先级为 x__
__<font color=#DC143C>普通用户最小只能是0，管理员全优先级</font>__
![process](\pic\05\process17.png)
![process](\pic\05\process18.png)
__renice -n x PID：修改正在运行的对应进程号的进程优先级__
__<font color=#DC143C>权限同 nice 一样</font>__
![process](\pic\05\process19.png)

### (3). 前后台进程的切换

__<font color=#DC143C>后台进程也叫后台作业</font>__
![process](\pic\05\process20.png)
__./test &：test在后台运行__
![process](\pic\05\process21.png)
__jobs：查看当前终端下的后台进程__
![process](\pic\05\process22.png)
__fg n：将后台作业1在前台运行 (foreground)__
![process](\pic\05\process23.png)
__ctrl+z：讲当前的前台进程在后台挂起，并处于停止态__
![process](\pic\05\process24.png)
__bg n：将后台作业n放到前台，为运行态__
![process](\pic\05\process25.png)

## 3. fork函数和exit函数

### (1). 创建进程 - fork

![process](\pic\05\fork.png)
>
> * __<font color=#DC143C>例：</font>__
> __<font color=#DC143C>Pid = 0 下为子进程代码；pid > 0 下为父进程代码</font>__
> ![process](\pic\05\fork1.png)

### (2). 父子进程

![process](\pic\05\fork2.png)
__子进程继承了父进程几乎所有的数据，包括变量、打开的文件、PC等__
__子进程从fork的下一条语句开始执行__
__父子进程执行的先后顺序：不确定，看父进程的时间片__
__可以多次调用fork，多次创建子进程；子进程同样也可以调用fork__

### (3). 结束进程 - exit / _exit

__<font color=#DC143C>(status & 0xFF) 返回给父进程</font>__
___exit 不会刷新进程中打开的流的缓冲区__
![process](\pic\05\fork3.png)
![process](\pic\05\exit.png)
>
> * __<font color=#DC143C>例1：</font>__
> __printf 无换行符，执行完并不会输出__
> __exit(0); 刷新流，打印第1个字符串__
> __下一个语句不会执行__
> ![process](\pic\05\fork4.png)
> * __<font color=#DC143C>例2：</font>__
> ![process](\pic\05\fork5.png)

## 4. exec函数族和system函数

### (1). 进程 - exec函数族

![process](\pic\05\fork6.png)
__在 shell 内执行程序就是创建了一个子进程，exec执行指定的程序__

### (2). 进程 - execl / execlp

__path：可相对，可绝对__
__arg：可变参数，第1个为执行的程序名称，后面依次为传递给程序的选项和内容，最后一个参数必须是NULL__
__file：直接是程序的名称，PATH见动态库章节__
![process](\pic\05\fork7.png)
>
> * __<font color=#DC143C>例：</font>__
> ![process](\pic\05\fork8.png)

### (3). 进程 - execv / execvp

![process](\pic\05\fork9.png)
>
> * __<font color=#DC143C>例：</font>__
> ![process](\pic\05\exec.png)

### (4). 进程 - system

__自动创建子进程，执行command__
![process](\pic\05\exec1.png)

## 5. wait函数和waitpid函数

### (1). 进程回收

* __孤儿进程：父进程结束，子进程未结束，子进程自动在后台运行，且被init进程收养__
* __僵尸进程：子进程结束但未被父进程回收，除PCB以外的资源被释放，直到父进程结束，变成孤儿进程，PCB才会被init进程释放__
![process](\pic\05\recovery.png)

### (2). wait

![process](\pic\05\wait.png)
>
> * __<font color=#DC143C>例：</font>__
> __sleep(1); exit(2); 为子进程执行，其它都为父进程执行__
> __wait 堵塞直到子进程 sleep 1s 结束__
> ![process](\pic\05\wait1.png)

### (3). 进程返回值和结束方法

__<font color=#DC143C>子进程返回值只取低8位</font>__
__<font color=#DC143C>具体：man wait</font>__
![process](\pic\05\return.png)

> __status:__
>
> * __0-6位为0: 正常返回__
> * __0-6不为0: 为信号值__
> * __8-15位: 子进程 exit 返回的值__

### (4). waitpid

> __pid:__
>
> * __-1: 任意子进程__
> * __非-1: 具体子进程__
>
> __option:__
>
> * __0: 阻塞__
> * __WNOHANG: 非阻塞，若返回0，表示要回收的子进程未结束__

![process](\pic\05\waitpid.png)

> * __<font color=#DC143C>例：</font>__
> ![process](\pic\05\waitpid1.png)

## 6. Linux守护进程

### (1). 守护进程特点

![process](\pic\05\daemon.png)

* __后台进程：只能输出到终端，不能从终端输入__
* __区别于交互进程：守护进程和终端无关__
![process](\pic\05\daemon1.png)

### (2). 会话、控制终端

* __进程组：父进程即其子进程__
* __会话：打开一个终端，第一个进程shell为会话的首进程，也叫做会话组组长，在该shell下执行的所有程序、创建的所有进程都属于同一个会话；终端也叫做会话的控制终端；一个会话最多只能打开一个控制终端__
* __终端无关：终端关闭时不能结束守护进程，所以守护进程和终端无关__
![process](\pic\05\daemon2.png)

### (3). 守护进程创建

* __fork 返回值用于判断父进程和子进程，0为子进程，>0为父进程__
* __此时子进程仍依附于终端__
![process](\pic\05\daemon3.png)

* __原先的会话是在打开终端的时候创建的__
* __新创建会话后，子进程不再属于原先的会话，也和原先的终端无关__
![process](\pic\05\daemon4.png)

* __根目录 和 tmp目录 权限不一样__
* __守护进程的工作目录指向一个永远不需要卸载的目录__
![process](\pic\05\daemon5.png)

* __守护进程内创建的文件权限一般不受限制__
![process](\pic\05\daemon6.png)

* __关闭从父进程继承来的文件__
![process](\pic\05\daemon7.png)

> * __<font color=#DC143C>例：</font>__
> ![process](\pic\05\daemon8.png)
> ![process](\pic\05\daemon9.png)

## 7. 线程模型及线程创建

![thread](\pic\05\thread.png)

* __进程切换：cache刷新，TLB刷新，开销大__
* __线程切换：同一个进程，cahce、TLB不需要频繁刷新，或只刷新一部分__
![thread](\pic\05\thread1.png)

### (1). 线程特点

![thread](\pic\05\thread2.png)
__静态变量：全局变量也是__
![thread](\pic\05\thread3.png)
__堆栈：即局部变量互不影响__
![thread](\pic\05\thread4.png)

### (2). 线程库

![thread](\pic\05\thread5.png)

### (3). 线程创建 - pthread_create

![thread](\pic\05\thread6.png)

### (4). 线程回收 - pthread_join

![thread](\pic\05\thread7.png)

### (5). 线程结束 - pthread_exit

* __<font color=#DC143C>进程结束：进程内所有的线程都会结束</font>__
![thread](\pic\05\thread8.png)

### (6). 实例

> __<font color=#DC143C>字符串常量存放在只读的数据段内，线程结束，字符串还存在，不会被释放 —— 见 六.2.2 存储</font>__
> ![thread](\pic\05\thread9.png)
> ![thread](\pic\05\thread10.png)
> __<font color=#DC143C>编译：</font>__
> ![thread](\pic\05\thread11.png)
> __<font color=#DC143C>结果：</font>__
> ![thread](\pic\05\thread12.png)
> __<font color=#DC143C>pthread_join 使用错误</font>__
> ![thread](\pic\05\thread12-.png)

## 8. 线程同步 - 信号量

![thread](\pic\05\thread13.png)

### (1). 同步

![thread](\pic\05\thread14.png)
![thread](\pic\05\thread15.png)
![thread](\pic\05\thread16.png)

### (2). Posix 信号量

* __无名信号量：一般进程内部，线程之间__
* __有名信号量：即可进程，也可线程__
![thread](\pic\05\thread17.png)

### (3). 函数 - 初始化

![thread](\pic\05\thread18.png)

### (4). 函数 - P/V操作

![thread](\pic\05\thread19.png)

### (5). 实例

> * __<font color=#DC143C>例1：不安全</font>__
> ![thread](\pic\05\thread20.png)
> ![thread](\pic\05\thread21.png)
> ![thread](\pic\05\thread22.png)
> * __<font color=#DC143C>例2：安全</font>__
> ![thread](\pic\05\thread23.png)
> ![thread](\pic\05\thread24.png)
> ![thread](\pic\05\thread25.png)
> ![process](\pic\05\pro-comm-ex10.jpg)
> ![process](\pic\05\pro-comm-ex11.jpg)
> ![process](\pic\05\pro-comm-ex12.jpg)

## 9. 线程互斥

* __同一时间只能有一个线程拥有锁__
![thread](\pic\05\thread26.png)

### (1). 初始化 - pthread_mutex_init

![thread](\pic\05\thread27.png)

### (2). 申请锁 - pthread_mutex_lock

![thread](\pic\05\thread28.png)

### (3). 释放锁 - pthread_mutex_unlock

![thread](\pic\05\thread29.png)

### (4). 实例

> ![thread](\pic\05\thread30.png)
> ![thread](\pic\05\thread31.png)
> ![thread](\pic\05\thread32.png)
> __不使用互斥锁__
> ![thread](\pic\05\thread33.png)
> __使用互斥锁，-D_LOCK\_: 传递一个宏定义__
> ![thread](\pic\05\thread34.png)
> ![process](\pic\05\pro-comm-ex7.jpg)
> ![process](\pic\05\pro-comm-ex8.jpg)
> ![process](\pic\05\pro-comm-ex9.jpg)

## 10. 进程间通信综述及无名管道

### (1). 进程间通信

* __前6种：本地通信__
* __套接字：网络通信__
![process](\pic\05\pro-comm.png)

### (2). 无名管道

![process](\pic\05\pro-comm1.png)
__<font color=#DC143C>只能用于有亲缘关系的进程之间：文件只在内存中存在，无路径；子进程继承父进程打开的文件</font>__
__<font color=#DC143C>单工：一个进程只能读或只能写</font>__
__<font color=#DC143C>区别于普通文件：管道内容被读取后，内容清空，且无法定位</font>__
![process](\pic\05\pro-comm2.png)
__<font color=#DC143C>是否会设置errno，查看man手册的 RETURN VALUE</font>__
![process](\pic\05\pro-comm3.png)
![process](\pic\05\pro-comm4.png)

> * __<font color=#DC143C>例：</font>__
> ![process](\pic\05\pro-comm5.png)
> ![process](\pic\05\pro-comm6.png)
> ![process](\pic\05\pro-comm7.png)
> ![process](\pic\05\pro-comm-ex4.jpg)
> ![process](\pic\05\pro-comm-ex5.jpg)
> ![process](\pic\05\pro-comm-ex6.jpg)

## 11. 进程间通信 - 无名管道详解

### (1). 读取

* __<font color=#DC143C>写端存在：至少有一个线程可以通过写端文件描述符向管道内写入数据</font>__
* __<font color=#DC143C>写端不存在：写端文件被关闭；发送线程发送完毕后，关闭写端文件，接收线程判断写端不存在，并且读取数据返回0，即判定发送完毕</font>__
* __实际大小：根据读取缓冲区大小和管道内数据决定；管道大小>=读取大小，=读取大小；管道数据<读取大小，=管道大小__
![process](\pic\05\pro-comm8.png)
![process](\pic\05\pro-comm9.png)

### (2). 写入

* __<font color=#DC143C>读端存在：至少有一个线程可以通过读端文件描述符读取管道中的内容</font>__
* __<font color=#DC143C>无空间：指空间不足，不保证原子操作，例：写入1024，空间256，会堵塞直到全部写入完毕</font>__
![process](\pic\05\pro-comm10.png)
* __<font color=#DC143C>读端不存在：读端文件被关闭，写入数据不会被读取</font>__
![process](\pic\05\pro-comm14.png)

### (3). 获取管道大小

![process](\pic\05\pro-comm11.png)

> * __<font color=#DC143C>例：缺省大小为64K</font>__
> ![process](\pic\05\pro-comm12.png)
> ![process](\pic\05\pro-comm13.png)

### (4). 验证管道断裂

![process](\pic\05\pro-comm15.png)

> * __<font color=#DC143C>例：</font>__
> ![process](\pic\05\pro-comm16.png)
> ![process](\pic\05\pro-comm17.png)
> __<font color=#DC143C>低7位非0，为异常结束（被信号结束）</font>__
> ![process](\pic\05\pro-comm18.png)
> __<font color=#DC143C>0x0d = 13 = SIGPIPE：代表管道断裂</font>__

___
__以下开始按视频内容大纲列分标题，上面的复习时再修改__
___

## 12. 进程间通信 - 有名管道详解

### (1). 有名管道特点

* __<font color=#DC143C>无论无名还是有名管道，当读端和写端都被关闭后，管道内的数据都会被释放</font>__
![process](\pic\05\pro-comm19.png)

### (2). 有名管道创建

* __path：相对/绝对，默认在当前路径__
* __mode：主要是读/写权限，无执行__
![process](\pic\05\pro-comm20.png)

### (3). 有名管道读写

> * __<font face="华文细黑" color=#DC143C>例：</font>__
> __<font face="华文细黑" color=#DC143C>1. 一共3个程序</font>__
> __<font face="华文细黑" color=#DC143C>2. 管道文件大小为0，因为管道数据是保存在内存里面</font>__
> __<font face="华文细黑" color=#DC143C>3. 当前只有读端或写端的时候（只运行读程序或写程序），open打开有名管道时会阻塞</font>__
> __<font face="华文细黑" color=#DC143C>4. 只有读端和写端都存在时（读写程序都运行），两个程序的open才能成功</font>__
> ![process](\pic\05\pro-comm21.png)
> ![process](\pic\05\pro-comm22.png)
> ![process](\pic\05\pro-comm23.png)
> ![process](\pic\05\pro-comm24.png)
> ![process](\pic\05\pro-comm-ex1.jpg)
> ![process](\pic\05\pro-comm-ex2.jpg)
> ![process](\pic\05\pro-comm-ex3.jpg)


## 13. 信号机制及信号相关命令

### (1). 信号机制

* __<font face="华文细黑">中断：中断<font face="consolas">CPU<font face="华文细黑">的执行；接收到中断信号，执行完当前指令结束后，处理中断</font>__
* __<font face="华文细黑">模拟中断：非硬件，由内核模拟，处理方式和中断一致</font>__
* __<font face="华文细黑">异步：一个进程在任何条件下都能接收到信号，不需要特殊处理</font>__
* __<font face="consolas" color=#DC143C>kill -l：<font face="华文细黑">查看中断列表；前<font face="consolas">31<font face="华文细黑">种为不可靠信号，不支持信号排队</font>__
* __<font face="华文细黑" color=#DC143C>捕捉信号(注册信号)：设定对应的信号处理函数</font>__
![process](\pic\05\pro-comm25.png)

### (2). 常用信号

* __<font face="consolas" color=#DC143C>SIGSEV：<font face="华文细黑">段错误</font>__
![process](\pic\05\pro-comm26.png)
* __<font face="consolas" color=#DC143C>SIGCONT：gdb c</font>__
* __<font face="consolas" color=#DC143C>SIGALRM：<font face="华文细黑">定时器到达，默认为终止进程，一般修改为捕捉</font>__
![process](\pic\05\pro-comm27.png)

### (3). 相关命令

* __<font face="华文细黑" color=#DC143C>默认发送<font face="consolas">15：SIGTERM</font>__
* __<font face="consolas" color=#DC143C>PID：<font face="华文细黑">可以是多个值</font>__
* __<font face="consolas" color=#DC143C>-1：<font face="华文细黑">除<font face="consolas">init<font face="华文细黑">进程和当前进程外的所有进程发送信号；<font face="consolas">n：<font face="华文细黑">给进程<font face="consolas" >n<font face="华文细黑">发送信号；<font face="consolas">-n：<font face="华文细黑">给进程组n的所有进程发送信号</font>__
![process](\pic\05\pro-comm28.png)
* __</font><font face="华文细黑" color=#DC143C>普通用户只能向自己创建的进程发信号</font>__
![process](\pic\05\pro-comm29.png)

## 14. 信号发送及定时器

### (1). 信号发送

### (2). 定时器

### (3). 信号捕捉

## 15. IPC机制及共享内存

## 16. 共享内存的实现

## 17. 消息队列机制及相关函数

## 18. 消息队列的实现

## 19. 信号灯集机制及相关函数

## 20. 利用信号灯集实现共享内存的同步

## 21. 利用信号灯集实现共享内存的同步
