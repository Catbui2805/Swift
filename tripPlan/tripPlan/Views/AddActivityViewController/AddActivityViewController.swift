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
    var tripIndex: Int! // Needed for saving
    var tripModel: TripModel! // Needed for Showing days in picker view
    
    // For editing Activities
    var dayIndexToEdit: Int?
    var activityModelToEdit: ActivityModel!
    var doneUpdating: ((Int, Int, ActivityModel) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayViewPicker.dataSource = self
        dayViewPicker.delegate = self
        
        titleLabel.font = Theme.popupFontTitleLable
        activityTypeButtons.forEach({ $0.tintColor = .darkGray}) // Set color for activity type button
        
        if let dayIndex = dayIndexToEdit, let activityModel = activityModelToEdit {
            // Update Activity: Popuplate the popup
            titleLabel.text = "Edit Activity"
            
            // Select the Day in the Picker View
            dayViewPicker.selectRow(dayIndex, inComponent: 0, animated: true)
            
            // Populate the Activity Data
            // Set the selected Activity Type Button
            activityTypeSelected(activityTypeButtons[activityModel.activityType.rawValue])
            titleTextField.text = activityModel.title
            subTitleTextField.text = activityModel.subTitle
        } else {
            // New Activity: Set default values
            activityTypeSelected(activityTypeButtons[ActivityType.excursion.rawValue])
        }
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
        
        let newDayIndex = dayViewPicker.selectedRow(inComponent: 0)
        
        if activityModelToEdit != nil {
            // Update Activity
            activityModelToEdit.activityType = activityType
            activityModelToEdit.title = newTitle
            activityModelToEdit.subTitle = subTitleTextField.text ?? ""
            
            ActivityFunctions.updateActivity(at: tripIndex, oldDayIndex: dayIndexToEdit!, newDayIndex: newDayIndex, using: activityModelToEdit)
            
            if let doneUpdating = doneUpdating, let oldDayIndex = dayIndexToEdit {
                doneUpdating(oldDayIndex, newDayIndex, activityModelToEdit)
            }
        } else {
            // New Activity
            
            let activityModel = ActivityModel(title: newTitle, subTitle: subTitleTextField.text ?? "", activityType: activityType)
            ActivityFunctions.createActivity(at: tripIndex, for: newDayIndex, using: activityModel)
            
            if let doneSaving = doneSaving {
                doneSaving(newDayIndex, activityModel)
            }
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

