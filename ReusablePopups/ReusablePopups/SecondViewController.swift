//
//  SecondViewController.swift
//  ReusablePopups
//
//  Created by Nguyen Tran Cong on 4/26/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func selectTimeTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        let popup = sb.instantiateInitialViewController() as! DatePopupViewController
        popup.showTimePicker = true
        popup.delegate = self
        self.present(popup, animated: true)
    }
}

// MARK: - delegate popup
extension SecondViewController: PopupDelegate {
    func popupValueSelected(value: String) {
        timeLabel.text = value
    }
}

