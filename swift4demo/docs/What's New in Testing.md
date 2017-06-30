## What's New in Testing

- 增强
- 异步测试
- 多App测试
- UI测试性能
- activities, attachments, and screenshots

### 一、Xcode Server

### 二、Async Testing

#### 1. XCTest

新测试工具类：

1. XCTWaiter
2. XCTExpectation

#### 2. XCUIApplication

多Target支持，引入新的初始化API：

1. init(bundleIdentifier: String)
2. init(url: URL)

```
let readerApp = XCUIApplication(bundlerIdentifier: "Reader")
let writerApp = XCUIApplication(bundlerIdentifier: "Writer")

readerApp.launch()	// interact with first app

writerApp.launch()	// interact with second app

readerApp.activate()	// return to first app without relaunching



```