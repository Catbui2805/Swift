//
//  FirstViewController.swift
//  ReusablePopups
//
//  Created by Nguyen Tran Cong on 4/26/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    weak var observer: NSObjectProtocol?
    
    weak var popup: DatePopupViewController?
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 1. NOTIFICATIONS: Old way
////        NotificationCenter.default.addObserver(self, selector: #selector(handlePopupClosing), name: .saveDateTime, object: nil)
//
//    }
//
//    @objc func handlePopupClosing(notification: Notification) {
//        let dateVc = notification.object as! DatePopupViewController
//        dateLabel.text = dateVc.formatterDate
//    }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 2. NOTIFICATION: New way
        observer = NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main, using: { [unowned self] (notification) in
            let dateVc = notification.object as! DatePopupViewController
            self.dateLabel.text = dateVc.formatterDate
            self.popup = nil
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // clease observer
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDatePopupViewControllerSegue" {
            popup = segue.destination as? DatePopupViewController
            popup?.showTimePicker = false
        }
    }
    
    deinit {
        print("FirstViewController was de-initialized")
    }
}

