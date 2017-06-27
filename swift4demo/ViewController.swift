//
//  ViewController.swift
//  swift4demo
//
//  Created by hzyuxiaohua on 2017/6/8.
//  Copyright © 2017年 XY Network Co., Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let format = NSLocalizedString("%d demo(s)", comment: "")
        title = String.localizedStringWithFormat(format, 3)
        
        let description = NSLocalizedString("description", comment: "") as NSString
        
        print(description.variantFittingPresentationWidth(20))
        
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    // MARK: table view delegate & data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DemoModel.elements().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        
        guard indexPath.section == 0 else {
            return UITableViewCell(style: .default, reuseIdentifier: "none")
        }
        
        if let dic = DemoModel.elements()[indexPath.row] as [String : String]? {
            cell.textLabel?.text = NSLocalizedString(dic["title"]!, comment: "")
        }
        else {
            cell.textLabel?.text = "no title"
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
    }
}

