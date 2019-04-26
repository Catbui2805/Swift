//
//  FirstViewController.swift
//  ReusablePopups
//
//  Created by Nguyen Tran Cong on 4/26/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDatePopupViewControllerSegue" {
            let popup = segue.destination as! DatePopupViewController
            popup.showTimePicker = false
        }
    }

}

