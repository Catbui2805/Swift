//
//  SelectTimeViewController.swift
//  NotificationPassingDataBetweenViewController
//
//  Created by Nguyen Tran Cong on 5/18/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class SelectTimeViewController: UIViewController {

    @IBOutlet weak var textTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(handlePopup), name: .saveDateTime, object: nil)
    }

    @objc func handlePopup(notification: Notification) {
        let popupVc = notification.object as! DatePopupViewController
        textTime.text = popupVc.formattedTime
    }
    
    @IBAction func selectimeAction(_ sender: UIButton) {
        let sb = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        let popup = sb.instantiateInitialViewController() as! DatePopupViewController
        popup.showTime = true
        self.present(popup, animated: true)
    }
}
