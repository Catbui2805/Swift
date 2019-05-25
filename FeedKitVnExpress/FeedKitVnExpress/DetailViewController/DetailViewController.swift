//
//  DetailViewController.swift
//  FeedKitVnExpress
//
//  Created by Nguyen Tran Cong on 5/25/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var link: String = ""
    var textTitle: String = ""
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        self.navigationController?.title = textTitle
        super.viewDidLoad()

        let url = URL (string: link)
        let requestObj = URLRequest(url: url!)
        DispatchQueue.main.async {
            self.webView.loadRequest(requestObj)
        }
    }
    
}
