//
//  AddActivityViewController.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 5/1/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class AddActivityViewController: UITableViewController {

    @IBOutlet weak var cardView: PopupUIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dayViewPicker: UIPickerView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subTitleTextField: UITextField!
    @IBOutlet weak var saveButton: AppUIButton!
    @IBOutlet weak var cancelButton: AppUIButton!
    
    var doneSaving: ((Int, ActivityModel) -> ())?
    var tripIndex: Int!
    var tripModel: TripModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayViewPicker.dataSource = self
        dayViewPicker.delegate = self
        titleLabel.font = Theme.popupFontTitleLable
        activityTypeButtons.forEach({ $0.tintColor = .darkGray})

    }
   
    
    @IBOutlet var activityTypeButtons: [UIButton]!
    
    @IBAction func activityTypeSelected(_ sender: UIButton) {
        activityTypeButtons.forEach({ $0.tintColor = .darkGray})
        sender.tintColor = Theme.tintColor
    }
    
    
    @IBAction func cancelTaped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        titleTextField.rightViewMode = .never
        guard titleTextField.hasValue, let newTitle = titleTextField.text else {
            return
        }
        let activityType: ActivityType = getSelectedActivityType()
        
        let dayIndex = dayViewPicker.selectedRow(inComponent: 0)
        let activityModel = ActivityModel(title: newTitle, subTitle: subTitleTextField.text ?? "", activityType: activityType)
        ActivityFunctions.createActivity(at: tripIndex, for: dayIndex, using: activityModel)
        
        if let doneSaving = doneSaving {
            doneSaving(dayIndex, activityModel)
        }
        
        dismiss(animated: true)
    }
    
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    func getSelectedActivityType() -> ActivityType {
        for (index, button) in activityTypeButtons.enumerated() {
            if button.tintColor == Theme.tintColor {
                return ActivityType(rawValue: index) ?? ActivityType.excursion
            }
        }
        return .excursion
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

