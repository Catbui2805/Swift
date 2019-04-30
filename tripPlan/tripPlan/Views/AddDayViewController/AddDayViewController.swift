//
//  AddDayViewController.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/30/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class AddDayViewController: UIViewController {

    @IBOutlet weak var cardView: PopupUIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subTitleTextField: UITextField!
    @IBOutlet weak var saveBt: UIButton!
    @IBOutlet weak var cancelButton: AppUIButton!
    
    var doneSaving: ((DayModel) -> ())?
    var tripIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cancelTaped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        guard titleTextField.hasValue, let newTitle = titleTextField.text else {
            return
        }
        let dayModel = DayModel(title: newTitle, subtitle: subTitleTextField.text ?? "", data: nil)
        DayFunctions.createDay(at: tripIndex, dayModel: dayModel)
        if let doneSaving = doneSaving {
            doneSaving(dayModel)
        }
        dismiss(animated: true)
    }
}
