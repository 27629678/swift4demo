##  Finding Bugs using XCode Run Tools

### 一、运行时完整性检查

- 主线程检查器：1.02X 0
- 内存检查器（buffer overflow, use-after-free, double free, user after end of scope）1.2X 0
- 线程检查器（对集合类的竞态访问, data race）2-3X 2X
- 未定论行为检查器（misaligned pointer, null pointer dereference, integer overflow, type mismatch, and more[15+]）5-10X 4

如下图所示：

![runtime sanitization](./Sources/FindingBugsUsingXCode_01.png)

#### 1.1 主线程检查器

UI Update：UIKit, AppKit, and WebKit

Language: Swift and C languages

> 不需要重新编译，默认开启

#### 1.2 内存检查器

使用已经释放的指针

#### 1.3 线程检查器

跨线程对竞态资源的访问；

#### 1.4 未定义行为检查器

- 上溢和下溢：Int_Max + 1 ≯ Int_Max ???
- 违反动态类型转换规则

> 总结I：以上新特性，在没有引入之前并没有感觉到有多棘手，举的栗子都是些基本的常识问题，感觉像是初学者的福音；

> 总结II：使用Swift更加安全，但并不是没有未定义的行为发生，只是相对少了许多而已；
