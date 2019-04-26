//
//  DatePopupViewController.swift
//  ReusablePopups
//
//  Created by Nguyen Tran Cong on 4/26/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit

class DatePopupViewController: UIViewController {

    @IBOutlet weak var titilePopupLable: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    var showTimePicker: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if showTimePicker {
            titilePopupLable.text = "Select Time demo segue"
            datePicker.datePickerMode = .time
            saveButton.setTitle("Save Time", for: .normal)
        }

    }
    
    @IBAction func saveDateTapped(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
}
