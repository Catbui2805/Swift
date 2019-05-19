//
//  PopupViewController.swift
//  DelegatesProtocal
//
//  Created by Nguyen Tran Cong on 5/19/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

protocol PopupViewControllerable {
    func selectDateAction(_ date: String)
}

class PopupViewController: UIViewController {

    @IBOutlet weak var btSelectDate: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleText: UILabel!
    var showTime: Bool = false
    var formattedDate: String {
        let formater = DateFormatter()
        formater.dateStyle = .medium
        return formater.string(from: datePicker.date)
    }
    
    var formattedTime: String {
        let formater = DateFormatter()
        formater.timeStyle = .medium
        return formater.string(from: datePicker.date)
    }
    
    var delegate: PopupViewControllerable?
    override func viewDidLoad() {
        super.viewDidLoad()

        if showTime {
            btSelectDate.setTitle("Select Time", for: .normal)
            titleText.text = "Select Time"
            datePicker.datePickerMode = .time
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func selectDateAction(_ sender: Any) {
        delegate?.selectDateAction(formattedTime)
        
        dismiss(animated: true, completion: nil)
    }
}
