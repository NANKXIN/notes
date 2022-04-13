[TOC]

# 一. Linux常用命令
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

# 二. vi编辑器的使用
## 1. 基础命令
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

## 2. 高级命令
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
>> * <font face="consolas" color=#DC143C size=5>: 1,$ s /old/new</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>从第1行到最后一行</font>**
>> * <font face="consolas" color=#DC143C size=5>: % s /old/new</font> &nbsp;&nbsp; **<font face="华文细黑" size=4>全文替换</font>**
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
# 三. 基础知识


    
