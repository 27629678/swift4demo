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
        
        let format = NSLocalizedString("%d demo(s)", comment: "")
        title = String.localizedStringWithFormat(format, DemoModel.demos().count)
        
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
        return DemoModel.demos().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        
        guard indexPath.section == 0 else {
            return UITableViewCell(style: .default, reuseIdentifier: "none")
        }
        
        let demo = DemoModel.demos()[indexPath.row];
        cell.textLabel?.text = NSLocalizedString(demo.name!, comment: "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
    }
}

