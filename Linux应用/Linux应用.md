[TOC]

# Linux常用命令
* ls：-R 查看对应文件及所在目录
* cat：打印文件内容到终端；-s：空行合并；-b：显示行号
* nl：相当于 cat -b
* head：默认显示前10行；head -5 test.c：显示前5行
* tail：默认显示后10行

- cp：cp test.c test2.c —— 拷贝test.c为test2.c
　　cp tets.c /home/a -i —— 拷贝到a目录，-i提示是否覆盖
　　cp test.c /home/a test2.c —— 拷贝到a目录，重命名为test2.c
　　cp -r —— 拷贝目录需要加上-r

* mv：mv test.c /home/a —— 移动
　　mv test.c test2.c —— 重命名
　　mv test.c /home/a test2.c —— 移动并重命名

- touch：touch test.c —— 创建文件test.c(不存在)，修改时间(存在)

* rm：删除文件
　　-i：提示
　　-r：删除目录

- mkdir：创建目录
　　　　mkdir -p d1/d2 —— 创建多级目录