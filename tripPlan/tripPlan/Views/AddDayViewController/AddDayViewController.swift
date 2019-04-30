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
    
    var doneSaving: (() -> ())?
    var tripIndexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // dropshadow on title
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 5

        
    }
    
    @IBAction func cancelTaped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        titleTextField.rightViewMode = .never
        
        guard titleTextField.text != "", let newTripName = titleTextField.text else {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
            imageView.image = UIImage(named: "Warning")
            imageView.contentMode = .scaleAspectFit
            titleTextField.rightView = imageView
            titleTextField.rightViewMode = .always
            return
        }
        
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
}
