//
//  LocalizationViewController.swift
//  swift4demo
//
//  Created by hzyuxiaohua on 2017/6/28.
//  Copyright © 2017年 XY Network Co., Ltd. All rights reserved.
//

import UIKit
import SnapKit

class LocalizationViewController: DemoViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.tableHeaderView = tableHeaderView()
    }
    
    // MARK: private
    
    func tableHeaderView() -> UIView {
        let image = UIImage(named: "avatar.jpg")
        let imageView = UIImageView(image: image)
        let size = UIScreen.main.bounds.size
        let view = UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: 120))
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { (maker) in
            maker.width.height.equalTo(90)
            maker.center.equalTo(view)
        }
        
        return view
    }
    
    // MARK: table view delegate & datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        
        var text = ""
        
        switch indexPath.row {
        case 0:
            let content = NSLocalizedString("description", comment: "") as NSString
            text = content.variantFittingPresentationWidth(30)
            
        case 1:
            let format = NSLocalizedString("%d demo(s)", comment: "")
            text = String.localizedStringWithFormat(format, DemoModel.demos().count)
        default:
            text = "no content"
        }
        
        cell.textLabel?.text = text
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
