//
//  AddActivityViewController.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 5/1/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class AddActivityViewController: UIViewController {

    @IBOutlet weak var cardView: PopupUIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dayViewPicker: UIPickerView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subTitleTextField: UITextField!
    @IBOutlet weak var saveButton: AppUIButton!
    @IBOutlet weak var cancelButton: AppUIButton!
    
    var doneSaving: ((DayModel) -> ())?
    var tripIndex: Int!
    var tripModel: TripModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayViewPicker.dataSource = self
        dayViewPicker.delegate = self
        titleLabel.font = Theme.popupFontTitleLable
    }
    
    @IBAction func cancelTaped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
       
        dismiss(animated: true)
    }
    
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension AddActivityViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tripModel.dayModels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tripModel.dayModels[row].title.mediumDate()
    }
}

