//
//  FirstViewController.swift
//  DelegatesProtocal
//
//  Created by Nguyen Tran Cong on 5/19/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textDate: UILabel!
    @IBOutlet weak var btSelectDate: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPopup" {
            let popup = segue.destination as! PopupViewController
            popup.showTime = true
            popup.delegate = self
            
        }
    }
    
}

extension FirstViewController: PopupViewControllerable {
    func selectDateAction(_ date: String) {
        textDate.text = date
    }
    
    
}

