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
    
    //callback function
    var onSave: ((_ data: String) -> ())?
    
    
    var showTimePicker: Bool = false
    var formatterDate: String {
        get {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: datePicker.date)
        }
        
    }
    
    var formatterTime: String {
        get {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: datePicker.date)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if showTimePicker {
            titilePopupLable.text = "Select Time demo segue"
            datePicker.datePickerMode = .time
            saveButton.setTitle("Save Time", for: .normal)
        }

    }
    
    @IBAction func saveDateTapped(_ sender: UIButton) {
//        NotificationCenter.default.post(name: Notification.Name.saveDateTime, object: self)
        NotificationCenter.default.post(name: .saveDateTime, object: self)
        
        //send data
        if showTimePicker {
            onSave?(formatterTime)
        } else {
            onSave?(formatterDate)
        }
        dismiss(animated: true)
    }
    
}
