# 一. FreeRTOS内部机制

## 1. C函数内部机制

### 1.1 ARM架构

<img src = ".\pic\class01\p1.png" style = "zoom:100%">

> #### 补充
>
> 1. 程序存在 flash 内，程序即指令
> 2. 数据存在 ram 内，局部变量、寄存器等

### 1.2 汇编指令

1. 读内存：`LDR R0,[R1#0x00]`

   * 源地址：R1+0x00，注意：**不是读R1，是以R1的值为地址（R1内存放的地址）**
   * 目标：R0，CPU寄存器
   * 长度：4字节，LDR读4字节，LDRH读2字节，LDRB读1字节
2. 写内存：`STR R0,[R1,#0x00]`

   * 目标地址：R1+0x00，注意：**不是写R1，是以R1的值为地址（R1内存放的地址）**
   * 源：R0，CPU寄存器
   * 长度：4字节，STR读4字节，STRH读2字节，STRB读1字节
3. 加法：`ADD R0,R1,R2`

   * R0 = R1 + R2
4. 入栈：`PUSH {R3,LR} `

   * 源：CPU寄存器R3、LR的值
   * 目标：内存，SP寄存器指向的内存地址
   * 长度：8字节
   * 注意：**寄存器高标号存入内存高地址**
   * 执行结果如下：执行前 SP -> 100，执行后 SP -> 92

   > | 栈指针操作 | 栈地址 | 数据 |
   > | :-- | :-: | :-: |
   > | step1：写入LR的值，SP -= 4 | 100 | LR 字节 1 |
   > | | 99 | LR 字节 2 |
   > | | 98 | LR 字节 3 |
   > | | 97 | LR 字节 4 |
   > | step2：写入R3的值，SP -= 4 | 96 ~ 93 | R3 |
   > | 执行后：SP -> | 92 | 空 |
   >

5. 出栈：`POP {R3,PC}`

   * 源：内存，SP寄存器指向的内存地址
   * 目标：CPU寄存器R3、PC
   * 长度：8字节
   * 注意：**内存高地址存入寄存器高标号**
   * 执行结果如下：执行前 SP -> 92，执行后 SP -> 100

   > | 栈指针操作 | 栈地址 | 数据 |
   > | :-- | :-: | :-: |
   > | step2：赋值给PC，SP += 4 | 100~97 | 原LR的值 |
   > | step1：赋值给R3，SP += 4 | 96 ~ 93 | 原R3的值 |
   > | 执行前：SP -> | 92 | 空 |
   > 


> #### 补充
>
> 1. 指令在Flash内
>
> 2. ARM寄存器：`R0 ~ R15`，其中`R13 = SP`为栈指针，指向栈顶；`R14 = LR`为链接寄存器，存放跳转地址；`R15 = PC`为程序计数器，存放下一条指令的地址
>
> 3. `R0 R1 R2`用于存放函数形参

### 1.3 运行流程分析

<img src = ".\pic\class02\p2.png" style = "zoom:80%">

<img src = ".\pic\class02\p1.png" style = "zoom:150%">

``````C
// 					void AddTest(int *pa, int *pb) 
0x08001B02 4770      BX       lr
                    // 将返回地址存入 lr 中，即 prvSetupHardware();

//					{ 
// 					volatile int temp; 
0x08001B04 B508      PUSH     {r3,lr}
                    // 分别将 r3、lr 的值存入栈内;
                    // 当前栈:
                    // lr 的值
                    // r3 的值
                    // 空 <- sp

// 					temp = *pa; 
0x08001B06 6802      LDR      r2,[r0,#0x00]
                    // 读出地址 r0+0x00 内的值给 r2;
                    // r2 = *pa; 注意：r0 r1 r2 用于存放函数形参
0x08001B08 9200      STR      r2,[sp,#0x00]
                    // 将 r2 的值写入到地址 sp+0x00;
                    // 当前栈:
                    // 原 lr 的值
    				// 原 r3 的值
                    // r2 的值 *pa <- sp

// 					temp = temp + *pb;
0x08001B0A 680A      LDR      r2,[r1,#0x00]
                    // r2 = *pb;
0x08001B0C 9B00      LDR      r3,[sp,#0x00]
    				// 读出地址 sp+0x00 内的值给 r3;
                    // r3 = *pa;
0x08001B0E 441A      ADD      r2,r2,r3
                    // r2 = r2 + r3 = *pb + *pa;
0x08001B10 9200      STR      r2,[sp,#0x00]
    				// 将 r2 的值写入到地址 sp+0x00;
                    // 当前栈:
                    // 原 lr 的值
    				// 原 r3 的值
                    // r2 的值 *pb + *pa <- sp
    
// 					*pa = temp; 
0x08001B12 9A00      LDR      r2,[sp,#0x00]
    				// 读出地址 sp+0x00 内的值给 r2;
                    // r2 = *pb + *pa;
0x08001B14 6002      STR      r2,[r0,#0x00]
    				// 将 r2 的值写入到地址 r0+0x00;
                    // r0 = *pa = r2 = *pb + *pa;

// 					} 
0x08001B16 BD08      POP      {r3,pc}
                    // r3 复原
                    // pc = lr, 即下一条指令为 prvSetupHardware();
``````

## 2. 保存现场

### 2.1 保存的内容

> ###### 什么是现场？
>
> 被打断瞬间，**所有**寄存器的值

> ###### 什么是任务?
>
> 任务 = 回调函数 + 任务栈，即运行中的函数

### 2.2 保存现场的场景

1. 任务切换：保存所有的寄存器（R0 ~ R15）

2. 函数切换：用于传参的寄存器无需保存，即 R0, R1, R2

   ``````C
   FunA(void)
   {
       FunB(a, b);  // FunA调用FunB时, R0 = a, R1 = b
   }
   ``````

3. 中断切换(Cortex M3/M4)：硬件保存 R0, R1, R2；软件保存用到的寄存器

## 4. 任务函数创建

### 4.1 所需参数

``````C
BaseType_t xTaskCreate( TaskFunction_t pxTaskCode,						// 函数指针
						const char * const pcName, 						// 任务名称
						const configSTACK_DEPTH_TYPE usStackDepth,		// 栈大小
						void * const pvParameters,						// 参数
						UBaseType_t uxPriority,							// 优先级
						TaskHandle_t * const pxCreatedTask )			// TCB结构体 (任务控制块 Task Control Block)

xTaskCreate(vTask1, "Task 1", 1000, &para, 0, &task1Tcp);
``````

### 4.2 函数栈补充

1. 函数1

<img src = ".\pic\class05\p1.png" style = "zoom:100%">

<img src = ".\pic\class05\p2.png" style = "zoom:130%">

``````C
//   145: void AddTest(int *pa, int *pb) 
0x08001B02 4770      BX       lr
//   146: { 
//   147:         volatile int array[100]; 
//   148:         volatile int temp; 
0x08001B04 B0E5      SUB      sp,sp,#0x194
					// sp = sp - 0x194;
    				// 4 * 100 = 0x190;

//   150:         array[0] = 123;     
0x08001B06 227B      MOVS     r2,#0x7B
    				// r2 = 123;
0x08001B08 9201      STR      r2,[sp,#0x04]
    				// 将 r2 写入到 sp+4 所指地址
    				// 当前栈：
					// array[0]
					// ...
    				// array[100] = r2 = 123  <- sp+4
    				// 空		  			 <- sp
    
//   152:         temp = *pa; 
0x08001B0A 6802      LDR      r2,[r0,#0x00]
    				// r2 = *pa
0x08001B0C 9200      STR      r2,[sp,#0x00]
    				// 将 r2 写入到 sp+0 所指地址
    				// 当前栈：
					// array[0]
					// ...
    				// array[100]  <- sp+4
    				// *pa		   <- sp
    				// 栈内无 lr
    
//   153:         temp = temp + *pb; 
0x08001B0E 680A      LDR      r2,[r1,#0x00]
0x08001B10 9B00      LDR      r3,[sp,#0x00]
0x08001B12 441A      ADD      r2,r2,r3
0x08001B14 9200      STR      r2,[sp,#0x00]
//   154:         *pa = temp; 
0x08001B16 9A00      LDR      r2,[sp,#0x00]
0x08001B18 6002      STR      r2,[r0,#0x00]
//   155: } 
0x08001B1A B065      ADD      sp,sp,#0x194
0x08001B1C 4770      BX       lr
    				// 直接从 lr 返回
``````

2. 函数2

<img src = ".\pic\class05\p3.png" style = "zoom:100%">

<img src = ".\pic\class05\p4.png" style = "zoom:130%">

> #### 函数所用栈大小
>
> 1. 局部变量的大小
> 2. 调用深度：函数 1 未保存 LR 寄存器；函数 2 调用了其它函数，需记录调用函数的返回地址，即一开始就保存了自己的 LR 寄存器

> #### FreeRTOS的栈
>
> 一个全局数组：`static uint8_t ucHeap[configTOTAL_HEAP_SIZE];`

### 4.3 参数详解

* 分配了 TCB 结构体
* 分配了任务栈
* 栈内写入函数地址、函数参数

``````C
// TCP结构体
typedef struct tskTaskControlBlock
{
    volatile StackType_t * pxTopOfStack;		// 任务栈顶
    ListItem_t xStateListItem;
    ListItem_t xEventListItem;
    UBaseType_t uxPriority;						// 任务优先级
    StackType_t * pxStack;						// 任务栈起始地址
    char pcTaskName[ configMAX_TASK_NAME_LEN ];	// 任务名称
} tskTCB;

// 任务创建
xTaskCreate(vTask1, "Task 1", 1000, &para, 0, &task1Tcp);
``````

pxStack 指向任务栈起始地址：

<img src = ".\pic\class05\p5.png" style = "zoom:120%">

> #### 任务刚创建时的任务栈
>
> ``````C
> R15 (vTask1)
> R14
> R13
> ...
> R2
> R1
> R0 (&para)
> 空	  		 <- pxTopOfStack
> ...
> 栈底          <- pxStack
> ``````

> ###### 恢复现场时的栈
>
> 函数指针存入 PC，参数存入 R0

## 5. 调度机制

* 优先级

  * 高优先级任务，优先级执行，可以抢占低优先级的任务
  * 高优先级任务不停止，低优先级任务永远无法执行
  * 同优先级任务，轮流执行：时间片轮转

* 状态

  * 运行态：running
  * 就绪态：ready
  * 阻塞态：blocked（等待事件、系统延时等）
  * 暂停态：suspend（仅 vTaskSuspend 函数）

* 管理

  * 如何取出要运行的任务

    * 找到最高优先级的运行态、就绪态任务，运行

    * 如果所有任务同优先级，轮流执行：队首运行 1 tick 后，到队尾排队

    * 1. 分配 TCB 结构体后，将新任务插入就绪链表

    * <img src = ".\pic\class06\p1.png" style = "zoom:100%">

    * 2. 执行插入就绪链表

    * <img src = ".\pic\class06\p2.png" style = "zoom:100%">

    * 3. 插入到对应优先级的就绪链表尾部

    * <img src = ".\pic\class06\p3.png" style = "zoom:100%">

    * <img src = ".\pic\class06\p4.png" style = "zoom:100%">

    * ``````C
      pxReadyTasksLists[configMAX_PRIORITIES]  // 就绪任务链表数组，每个优先级对应一个链表
      pxDelayedTaskList  						 // 延时任务链表
      xPendingReadyList  						 // 暂停任务链表
      ``````

* 调度

  * tick 中断：一般 1 ms 产生一次中断，执行 tick 中断函数
  * tick 中断函数：
    * 取出下一个就绪任务：从高优先级（`pxReadyTasksLists[configMAX_PRIORITIES - 1]`）到低优先级（`pxReadyTasksLists[0]`）
    * 切换到下一个就绪任务
      * 保存当前任务
      * 恢复新任务











# 二. FreeRTOS队列实战

# 三. ARM架构与编程

# 四. 从0写RTOS

