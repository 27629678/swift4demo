## Understand Undefined Behavior

### 一、什么是未定义的行为

- shift by negative value
- modification of string literal
- type mismatch
- signed integer overflow
- invalid conversions
- invalid enum value
- out-of-bounds array subscript
- data races
- null dereference
- use of uninitialized values
- c++ dynamic type violation
- division by 0
- shift amounts bigger than type
- misaligned access
- access to object past of lifetime
- missing return statement
- others



目前，可以处理该行为的工具：

1. 编译器：以编译错误（或警告）的方式提示开发者
2. 静态代码分析：提示对应的潜在风险
3. 内存检查器：运行时检测并提示对应的潜在风险

> 备注：亲测之后，并不是所有以上未定义行为都可以检查到；

