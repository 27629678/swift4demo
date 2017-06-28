##  Finding Bugs using XCode Run Tools

### 一、运行时完整性检查

- 主线程检查器：1.02X 0
- 内存检查器（作用域的问题）1.2X 0
- 线程检查器（对集合类的竞态访问）2-3X 2X
- 未定论行为检查器5-10X 4X

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

- 上溢和下溢：Int_Max + 1 > Int_Max ???
- 违反动态类型转换规则