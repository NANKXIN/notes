[TOC]

# C++面向对象程序设计
## 2. 头文件与类的声明

</br>

## 3. 构造函数

&nbsp;
***********************************************************************
&nbsp;

## 4. 参数传递与返回值

&nbsp;
***********************************************************************
&nbsp;

## 5. 操作符重载与临时对象

&nbsp;
***********************************************************************
&nbsp;

## 7. 三大函数：拷贝构造、拷贝赋值、析构

&nbsp;
***********************************************************************
&nbsp;

## 8. 堆、栈与内存管理

&nbsp;
***********************************************************************
&nbsp;

## 10. 扩展：类、函数模版，及其它

### static
![static](\图片\static.png)
- **non-static data members:** 可以创建多份，地址即为 this 指针
- **non-static member function:** 只有一份，且有 this 指针(入口隐藏)，通过不同对象的 this 指针来处理不同的对象，黄色高亮部分可写可不写
- **static data members:** 只有一份，不管创建了多少对象
- **static member function:** 无 this 指针，只能处理 static data member

``` C++
class Account {
public:
    static double m_rate;  // 声明静态变量
    static void set_rate(const double& x) { m_rate = x; }
};
double Account::m_rate = 8.0;  // 静态变量需要在 class 外部进行定义，给不给初值都可以

int main()
{
    Account::set_rate(5.0);  // 1. 通过 class name 来调用

    Account a;
    a.set_rate(7.0);  // 2. 通过对象来调用（因为是静态函数，所以对象的地址不会作为 this 指针传入函数）
}
```

&nbsp;
**********************
&nbsp;

### 把 构造函数 放在 private 内 —— 设计模式, 不太懂, 后面再说
![singleton](\图片\singleton.png)
- 在 priavate 内定义静态对象 a
- 构造函数 A() 在 private 内
- class 外面只能通过 class name 和 static member function 来获取 a 的
- 然后调用其它函数

&nbsp;

![meyersSingleton](\图片\meyersSingleton.png)
- **更好的写法：** 静态对象不会一直存在，调用时才创建，且只有一份

&nbsp;
**********************
&nbsp;

### 模版

#### 类模版
![类模版](\图片\classTemplate.png)
- 变量(typename) T 未定，调用的时候再确定
- 使用时要明确指定使用的类型 <>

&nbsp;

#### 函数模版
![函数模版](\图片\functionTemplate.png)
- 类(class) T 未定，使用时再确定，这里的 class 和 typename 是一样的
- 编译器会自动推导使用的类型
- 编译器也会自动推导使用的运算符

&nbsp;

#### namespace
```C++
namespace std  // std：标准库
{
    ...  // std 的内容被封锁在此空间内，可分段，在多处 namespace std，会自动连接在一起
}

using namespcae std;    // 打开 std 所有内容，所有都可以直接使用：cout、cin...
using std::cout;        // 只打开 cout，只有 cout 可以直接用，其它使用全名：std::cin
                        // 不打开：所有都使用全名
```

&nbsp;

#### 更多细节深入：以后自己研究
![更多细节](\图片\moreDetail.png)

&nbsp;
***********************************************************************
&nbsp;


## 11. 组合与继承

### 组合

#### queue has a deque
![adapter](\图片\adapter.png)
- **queue <font color='red'>has a</font> deque:** queue拥有deque
- 以下为 Adapter 设计模式
``` C++
template <class T>
class queue {
    ...
protected:
    deque<T> c;  // 底层容器
public:
    /* 以下完全利用 c 的操作函数完成 */
    bool empty() const { return c.empty(); }
    size_type size() const { return c.size(); }
    reference front() { return c.front(); }
    reference back() { return c.back(); }
    //
    void push(cosnt value_type& x) { c.push_back(x); }
    void pop() { c.pop_front(); }
};
```

#### 内存大小
![组合](\图片\composition.png)
- **构造由内而外：** 先 Itr，再 deque，最后 queue，**但是编译器只调用默认的构造函数，其它的要自己写**
```C++
queue::queue(...) :Itr() {...};   // : 初始列
```
- **析构由外而内：** 先 queue，再 deque，最后 Itr
```C++
queue::~queue(...) 
{ 
    ...         // 先 queue 析构
    ~deque();   // 再 deque 析构
};
```

&nbsp;
**********************
&nbsp;

### 委托
#### String 委托 StringRcp
![委托关系图](\图片\delegationP.png)
![委托](\图片\delegation.png)
- 生命周期不同步，可能先有 String，等需要 StringRcp 的时候，才会有 rep
- String 内的只是提供给外部的接口，所有操作都由 StringRcp 来实现
- 即 StringRcp 的任何变动都不影响 String 相关的代码
- 且 rep 还可以指向不同的 class
- 图中三个 rep 指针都指向同一个 StringRep，三个对象共享一个 Hello

&nbsp;
**********************
&nbsp;

### 继承
#### _List_node is a _List_node_base
![关系图](\图片\inheritanceP.png)
![继承](\图片\inheritance.png)
- 子类继承父类的数据：_M_next、_M_prev
- **_List_node <font color='red'>is a</font> _List_node_base：** 子类是一种父类

#### 内存关系
![](\图片\inheritanceM.png)
- **构造由内而外：** 先父类（默认构造函数），在子类
- **析构由外而内：** 先子类，再父类
- **父类的析构函数必须是 virtual**

&nbsp;
***********************************************************************
&nbsp;

## 12. 虚函数与多态
### 三种函数类型：非虚函数、虚函数、纯虚函数
![例](\图片\virtualE.png)
- **非虚函数：** 不希望子类重新定义（覆写）
- **虚函数：** 希望子类重新定义，且有默认定义
- **纯虚函数(pure)：** 希望子类一定重新定义，且无默认定义

### Template Method: Inheritance(继承) with virtual(虚函数)
![虚函数经典用法](\图片\TemplateMethod.png)
- Serialize() 为父类的一个虚函数，执行到的时候跳转到子类重新定义的 Serialize
```C++
#include <iostream>
using namespace std;

// 父类
class CDocument {
public:
    void OnFileOpen()
    {
        cout << "dialog..." << endl;
        cout << "check file status..." << endl;
        cout << "open file..." << endl;
        Serialize();
        cout << "close file..." << endl;
        cout << "update all views..." << endl;
    }

    virtual void Serialize() { };
};

// 子类
class CMyDoc : public CDocument {
public:
    virtual void Serialize()
    {
        cout << "CMyDoc::Serialize()" << endl;
    }
};

int main()
{
    CMyDoc myDoc;
    myDoc.OnFileOpen();

    return 0;
}
```

### Inheritance(继承) + Composition(组合)
![](图片\InheritanceComposition.png)
- 编写代码，在构造函数和析构函数内 cout，观察先后顺序
```C++
/* 测试代码 */



```

### Delegation(委托) + Inheritance(继承)
![例子](\图片\DelegationInheritance.png)
- **这里 Subject 委托的是 Observer 的多个子类（子类是一种父类，这里可以有不同的功能），即 Observer 的子类指针都可以插入 Subject 的 vector 内**
- Subject 为软件，Oberver 为图表框
- Observer 是父类，可以派生出多个子类 —— 不同的图表框
- attach()：将 Observer 类（子类）指针插入容器内 —— 打开新的图表框
- notify()：遍历调用委托 class 的 update() 函数 —— 更新数据等
- **实现以下功能：**
- 一份数据，四个相同图表框；一份数据，三个不同图表框
- 其中一个框内数据变化，其它框都要跟着变化
![实现功能](\图片\DelegationInheritanceE.png)


&nbsp;
**************************************************************************
&nbsp;

## 13. 委托相关设计
### Delegation(委托) + Inheritance(继承)

&nbsp;

#### Composite
![关系图](\图片\CompositeP.png)
- Composite 内的容器需要容纳 Primitive 和 Composite：创建一个父类，被两个一起继承
- Composite 的 add 函数既要可加 Primitive 又要可以加 Composite：传入父类指针
```C++
// 父类
class Component {
    int value;  // 这里默认为 private，struct 内默认为 public
public:
    Component(int val) { value = val; }
    virtual void add(Component*) { }
};

class Primitive : public Component {
public:
    Primitive(int val) 
        :Component(val)  // 继承父类的构造函数
    { }
};

class Composite : public Component {
    vector<Component*> c;
public:
    Composite(int val) 
        :Component(val) 
    { }
    // 入口委托 Component
    void add(Component* elem) { c.push_back(elem); }
};
```

&nbsp;

#### Prototype
![关系图](\图片\Prototype.png)
- 需要一个继承体系：**创建<font color='red'>未来</font>才会出现的子类，即折线之后的**
- 下划线为 static: LSAT 为对象，LandSatImage 为类，即 LSAT 为一个 静态 LandSatImage 对象
- 负号为 private，正号为 public（可以不写，默认为正），＃为 protected
- 即每个子类都创建一个自己，让框架（父类）可以看到子类，然后复制该子类
```C++
#include <iostream>

enum imageType { LSAT, SPOT };


class Image {
public:
    virtual void draw() = 0;
    static Image* findAndClone(imageType);
protected:
    virtual imageType returnType() = 0;
    virtual Image* clone() = 0;
    // As each subclass of Image is declared, it registers its prototype
    static void addPrototype(Image* image)
    {
        _prototypes[_nextSlot++] = image;
    }
private:
    // addPrototype() saves each registered prototype here
    static Image* _prototypes[10];
    static int _nextSlot;
};
// 定义 static
Image* Image::_prototypes[];
int Image::_nextSlot;

// Client calls this public static member function when it needs an instance of an Image subclass
Image* Image::findAndClone(imageType type)
{
    for (int i = 0; i < _nextSlot; i++)
    {
        if (_prototypes[i]->returnType() == type)
            return _prototypes[i]->clone();
    }
}


class LandSatImage : public Image {
public:
    imageType returnType() { return LSAT; }
    void draw() {
        cout << "LandSatImage::draw" << _id << endl;
    }
    // when clone() is called, call the one->argument ctor with a dummy arg
    Image* clone(){
        return new LandSatImage(1);
    }
protected:
    // This is only called from clone()
    // 这个构造函数用于 new LandSatImage 的时候
    // 可以 protected 也可以 private, 只要不被外部调用即可
    LandSatImage(int dummy) {  // 加一个参数 dummy, 用于区分构造函数
        _id = _count++:
    }
private:
    // Mechanism for initializing an Image subclass - this cause the
    // default ctor to be called, which registers the subclass's prototype
    // 定义静态的对象 _LandSatImage
    // 会调用下面的构造函数，调用 addPrototype
    static LandSatImage _LandSatImage;
    // This is only called when the private static data member is inited
    LandSatImage() {
        addPrototype(this);  // this 即 _LandSatImage, 等待被框架 findAndClone
    }
    // Nominal "state" per instance mechanism
    int _id;
    static int _count;
};
// Register the subclass's prototype
LandSatImage LandSatImage::_LandSatImage;
// Initialize the "state" per instance mechanism
int LandSatImage::_count = 1;


class SpotImage : public Imag {
public:
    imageType returnType() { return SPOT; }
    void draw() {
        cout << "SpotImage::draw" << _id << endl;
    }
    Image* clone(){
        return new SpotImage(1);
    }
protected:
    SpotImage(int dummy) {
        _id = _count++;
    }
private:
    static SpotImage _SpotImage;
    SpotImage() {
        addPrototype(this);
    }
    int _id;
    static int _count;
};
SpotImage SpotImage::_SpotImage;
int SpotImage::_count = 1;


// Simulate stream of creation requests
const int NUM_IMAGES = 8;
imageType input[NUM_IMAGES] = {
    LSAT, LSAT, LSAT, SPOT, LSAT, SPOT, SPOT, LSAT
};


int main()
{
    Image* images[NUM_IMAGES];
    // Give an image type, find the right prototype, and return a clone
    for (int i = ; i < NUM_IMAGES; i++)
    {
        images[i] = Image::findAndClone(input[i]);  // 有申请内存
    }
    // Demonstrate that correct image objects have been cloned
    for (i = 0; i < NUM_IMAGES; i++)
    {
        images[i]->draw();
    }
    // Free the dyamic memory
    for (i = 0; i < NUM_IMAGES; i++)
    {
        delete images[i];
    }
}
```




&nbsp;
**************************************************************************
**************************************************************************
&nbsp;


# C++程序设计(II): 兼谈对象模型


