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
        
//        UseAfterLifeScopeIssue.run()
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
//        use_after_scope_demo()
        use_after_scope_swift_demo()
    }
    
    private func use_after_scope_swift_demo() {
        var pointer: UnsafeMutablePointer<String>?
        "hello, world".withCString { cstring in
            var tmp = "Hi, pointer"
            //            withUnsafePointer(to: &tmp, { pointer = $0})
            withUnsafeMutablePointer(to: &tmp, { pointer = $0 })
        }
        
        pointer?.pointee = "Hi, i got it."
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
