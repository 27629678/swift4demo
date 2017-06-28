//
//  DemoModel.swift
//  swift4demo
//
//  Created by hzyuxiaohua on 2017/6/27.
//  Copyright © 2017年 XY Network Co., Ltd. All rights reserved.
//

import Foundation

class Demo {
    var name: String
    var identifier: String?
    
    init(_ name: String, identifier id: String? = nil) {
        self.name = name
        self.identifier = id
    }
}

class DemoModel {
    
    static func demos() -> [Demo] {
        return [ Demo("Localization", identifier: "LocalizationViewController"),
                 Demo("Finding Runtime Issues", identifier: "FindRuntimeIssueViewController"),
        ];
    }
}
