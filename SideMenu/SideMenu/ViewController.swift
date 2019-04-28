//
//  ViewController.swift
//  SideMenu
//
//  Created by Nguyen Tran Cong on 4/28/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var menuShowing = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
    }

    @IBAction func openMenu(_ sender: Any) {
        if menuShowing {
            leadingConstraint.constant = -150
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        } else {
            leadingConstraint.constant = 0
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
        menuShowing = !menuShowing
    }
    
}

