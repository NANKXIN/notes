# CRTP协议移植

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
  * port：指定子系统（电机/风机/显示...）
  * channel：指定子系统功能（电机速度/状态/脉冲...）
* data：30字节数据 buffer
* raw：31字节原始数据 buffer



### 1.3 数据包传递



### 1.4 USRT传输

### 1.5 移植

#### 1.5.1 初始化

#### 1.5.2 代码移植

#### 1.5.3 上机测试

