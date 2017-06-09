//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Animal {
    var name: String
    var age: Int
    
    public init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    public func sayHello() -> String {
        return ""
    }
}

class Dog: Animal {
    override public func sayHello() -> String {
        return "wang wang"
    }
}

let dog = Dog(name: "xiaohei", age: 6)

dog.sayHello()

let path = \Dog.name

print("\(dog[keyPath: path])")
