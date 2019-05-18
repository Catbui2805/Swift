//
//  DatePopupViewController.swift
//  NotificationPassingDataBetweenViewController
//
//  Created by Nguyen Tran Cong on 5/18/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class DatePopupViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    
    var showTime: Bool = false
    
    var formattedDate: String {
        get {
            let formater = DateFormatter()
            formater.dateStyle = .medium
            return formater.string(from: datePicker.date)
        }
    }
    
    var formattedTime: String {
        get {
            let formatter = DateFormatter()
            formatter.timeStyle = .medium
            return formatter.string(from: datePicker.date)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if showTime {
            titleLabel.text = "Select Time"
            datePicker.datePickerMode = .time
            saveButton.setTitle("Save Time", for: .normal)
        } else {
            titleLabel.text = "Select Date"
            datePicker.datePickerMode = .date
            saveButton.setTitle("Save Date", for: .normal)
        }
    }
    
    @IBAction func saveDateAction(_ sender: Any) {
        NotificationCenter.default.post(name: .saveDateTime , object: self)
        dismiss(animated: true)
    }
    
}
