//
//  SelectTimeViewController.swift
//  ReusablePopups
//
//  Created by Nguyen Tran Cong on 4/26/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit

class SelectTimeViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}

// MARK: - Action button
extension SelectTimeViewController {
    @IBAction func selectTimeTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: "DatePopupViewController", bundle: nil)
        let popup = sb.instantiateInitialViewController() as! DatePopupViewController
        popup.showTimePicker = true
        // callback function
        // case 1. Assign to a function
        popup.onSave = onSave
        // case 2. Use a Closure
//        popup.onSave = { (data: String) -> () in
//            self.dateLabel.text = data
//        }
        
        self.present(popup, animated: true)
    }
    
    //callback function // Todo: in here
    func onSave(_ data: String) -> () {
        dateLabel.text = data
    }
}
