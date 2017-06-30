//
//  FindRuntimeIssueViewController.swift
//  swift4demo
//
//  Created by hzyuxiaohua on 2017/6/28.
//  Copyright © 2017年 XY Network Co., Ltd. All rights reserved.
//

import UIKit

let url = URL(string: "http://seafile-downloads.oss-cn-shanghai.aliyuncs.com/seafile-client-6.0.4.dmg")
let config = URLSessionConfiguration.background(withIdentifier: "com.demo.background-session")

class FindRuntimeIssueViewController: DemoViewController, URLSessionDownloadDelegate {
    
    var raceList: [String] = []
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UseAfterLifeScopeIssue.run()
        progressView.progress = 0
    }
    
    // MainThreadSanitizer
    @IBAction func startDownAction(_ sender: Any) {
        startBtn.isEnabled = false
        progressView.progress = 0
        let session = URLSession(configuration: config,
                                 delegate: self,
                                 delegateQueue: OperationQueue.main)
        let task = session.downloadTask(with: url!)
        task.resume()
    }
    
    // MARK: session download delegate
    
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64,
                    totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64)
    {
        progressView.progress = Float(Double(totalBytesWritten)/Double(totalBytesExpectedToWrite))
    }
    
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL)
    {
        startBtn.isEnabled = true
        progressView.progress = 1.0
        let alert = UIAlertController(title: "Alert",
                                      message: "Download Finished",
                                      preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: AddressSanitizer(Scope)
    @IBAction func memorySanityAction(_ sender: Any) {
        
        let str = "hello, world"
//        var pointer: UnsafePointer<Int8>?
//
//        str.withCString { cstring in
//            pointer = cstring
//        }
//
//        print(pointer!.pointee)
        
        var target: Character? = nil
        for char in str {
            target = char
        }
        
        print(target ?? "")
    }
    
    @IBAction func threadSanityAction(_ sender: Any) {
        DispatchQueue.global().async {
            for item in 1..<10000 {
                self.raceList.append(String(item))
            }
        }
        
        for item in 10000..<20000 {
            self.raceList.append(String(item))
        }
    }
    
}
