//
//  SecondViewController.swift
//  NotificationPassingDataBetweenViewController
//
//  Created by Nguyen Tran Cong on 5/18/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var observer: NSObjectProtocol?
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        NotificationCenter.default.addObserver(self, selector: #selector(handlePopup), name: .saveDateTime, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        observer = NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
            let popupVc = notification.object as! DatePopupViewController
            self.textLabel.text = popupVc.formattedDate
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }

    @objc func handlePopup(notification: Notification) {
        let popupVc = notification.object as! DatePopupViewController
        textLabel.text = popupVc.formattedDate
    }
}

