//
//  Kid.swift
//  swift4demo
//
//  Created by hzyuxiaohua on 2017/6/9.
//  Copyright © 2017年 XY Network Co., Ltd. All rights reserved.
//

import Foundation

public class Kid {
    @objc dynamic var name: String
    var age: Int
    var friends: [Kid]?
    
    public init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.friends = []
    }
    
    public init(name: String, age: Int, friends: [Kid]) {
        self.name = name
        self.age = age
        self.friends = friends
    }
}

extension Kid {
    public func sayHi() -> String {
        return "Hi, everyone, i'm \(name), \(age) years old, my friends is \(friends!)"
    }
}
