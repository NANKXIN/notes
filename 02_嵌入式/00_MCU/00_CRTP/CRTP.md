# CRTP协议

## 1. 协议分析

参考资料：

* crazyflie-CRTP解析：https://www.ngui.cc/51cto/show-724815.html?action=onClick
* 官方文档：https://www.bitcraze.io/documentation/repository/crazyflie-firmware/master/functional-areas/crtp/

### 1.1 协议层次

``````c
+-------------------+
+     Subsystems    +   <- 应用层 Log/Param/Commander/...
+-------------------+
+       CRTP        +   <- 协议层[数据解析+处理(回环/分发)] (port, channel, payload)
+-------------------+
+       Link        +   <- 链路层(收/发函数) Radio link or USB link
+-------------------+   
+  Physical medium  +   <- 物理层(串口/USB/无线...) radio or USB
+-------------------+
``````



### 1.2 数据包格式

完整数据结构：

<img src = ".\00_pic\02_CRTP数据包分析\P1.png" style = "zoom:100%">

大 union：

<img src = ".\00_pic\02_CRTP数据包分析\P2.png" style = "zoom:100%">

小 union：

<img src = ".\00_pic\02_CRTP数据包分析\P3.png" style = "zoom:100%">

数据包总大小32字节：

* size：表示 data 数组内有效数据长度
* header：含 channel、port
  * port（端口）：指定子系统（电机/风机/显示...）
  * channel（通道）：指定子系统功能（电机速度/状态/脉冲...）
* data：30字节数据 buffer
* raw：31字节原始数据 buffer



### 1.3 数据包传递

* 硬件发送方式不固定，可完整，可只有效数据，可加帧头（0xA5、0x5A）和校验（CRC16）
* 接收到传递给上层必须是完整的数据包 

1. CRTP 发送线程（尽快完成发送）

<img src = ".\00_pic\03_使用UART收发数据包的思路\P1.png" style = "zoom:70%">

**发送流程：**

1. CRTP发送线程：
   * 阻塞等待 CRTP发送队列 数据包  <- 子系统
2. CRTP发送函数：
   * 待发送数据包 -> 通信模块（USB/串口/网口）发送队列
3. 通信模块发送线程：
   * 阻塞等待 通信模块发送队列
   * 调用发送函数发送数据包



2. CRTP 接收线程（阻塞等待数据包）

<img src = ".\00_pic\03_使用UART收发数据包的思路\P2.png" style = "zoom: 80%;">

**接收流程：**

1. 串口接收中断：

   * 读取数据写入缓冲区
2. 串口空闲中断：

   * 唤醒数<font color="#dd0000">据解析线程</font>
3. 数据解析线程：

   * 判断数据有效性

   * 构造数据包 -> CRTP接收队列
4. CRTP接收线程：

   * 阻塞等待 CRTP接收队列 数据包

   * 发送数据包 -> 对应的子系统



## 2. 总结

* 介于模块层与子系统层之间的一层
* 作用为消息汇总和分发

程序分层：

``````C
+-----------------------------------+
+                APP					 <- 业务层
+-----------------------------------+
+  Input、Output、Display...				<- 子系统
+-----------------------------------+
+  AT24CXX、AW9106.../Modbus、CRTP... 	<- 模块层/协议层
+-----------------------------------+   
+  PinCtrl、i2cCtrl... 		    		 <- 驱动层
+-----------------------------------+   
+  GPIO、I2C、UART、USB、PWM...  		   <- 物理层
+-----------------------------------+
``````

