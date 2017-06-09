//
//  ViewController.swift
//  swift4demo
//
//  Created by hzyuxiaohua on 2017/6/8.
//  Copyright © 2017年 XY Network Co., Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "hello"
        
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let benji = Kid(name: "benji", age: 12)
        print("\(benji.sayHi())")
        print("\(benji.sayGoodBye())")
        
        
        // MARK: key path
        
        // swift 3.x
        // must be dynamic property
//        let path = #keyPath(Kid.name)
//        print("\(benji.value(forKeyPath: path))")
        
        // swift 4 or later
        let path1 = \Kid.name
        print("\(benji[keyPath: path1])")
    }


}

extension Kid {
    public func sayGoodBye() -> String {
        return "Bye!!! I'm \(self.name)"
    }
}

