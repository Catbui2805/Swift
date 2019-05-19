//
//  ViewController.swift
//  PassingDataWithCallbackFunction
//
//  Created by Nguyen Tran Cong on 5/19/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textDate: UILabel!
    @IBOutlet weak var btSelectDate: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPopup" {
            let popup = segue.destination as! PopupViewController
            popup.showTime = true
            popup.getTime = { [weak self] (data: String) in
                self?.textDate.text = data
            }
        }
    }
    
}

