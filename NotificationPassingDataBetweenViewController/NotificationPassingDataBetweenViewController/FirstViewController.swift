//
//  FirstViewController.swift
//  NotificationPassingDataBetweenViewController
//
//  Created by Nguyen Tran Cong on 5/18/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textDate: UILabel!
    
    var  observer:  NSObjectProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1. notifications: old way
//        NotificationCenter.default.addObserver(self, selector: #selector(handlePopupClosing), name: .saveDateTime, object: nil)
    }

//    @objc func handlePopupClosing(notificaton: Notification) {
//        let dateVc = notificaton.object as! DatePopupViewController
//        textDate.text = dateVc.formattedDate
//
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 2. notifications: new way
        observer = NotificationCenter.default.addObserver(forName: .saveDateTime, object: nil, queue: OperationQueue.main) { (notification) in
            let popupVc = notification.object as! DatePopupViewController
            self.textDate.text = popupVc.formattedDate
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDatePopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.showTime = false
        }
    }

}

