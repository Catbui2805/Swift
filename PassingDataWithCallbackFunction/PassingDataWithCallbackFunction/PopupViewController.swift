//
//  PopupViewController.swift
//  PassingDataWithCallbackFunction
//
//  Created by Nguyen Tran Cong on 5/19/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    var showTime: Bool = false
    var getTime: ((_ data: String) -> ())?
    @IBOutlet weak var btSaveDate: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var formattedTime: String {
        let formater = DateFormatter()
        formater.timeStyle = .medium
        return formater.string(from: datePicker.date)
    }
    
    var formattedDate: String {
        let formater = DateFormatter()
        formater.dateStyle = .medium
        return formater.string(from: datePicker.date)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if showTime {
            datePicker.datePickerMode = .time
            btSaveDate.setTitle("Save Time", for: .normal)
        }
    }
    
    @IBAction func saveDateAction(_ sender: UIButton) {
        if showTime {
            self.getTime?(formattedTime)
        } else {
            self.getTime?(formattedDate)
        }
        dismiss(animated: true, completion: nil)
    }
    
}
