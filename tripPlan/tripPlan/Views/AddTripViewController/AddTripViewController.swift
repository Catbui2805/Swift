//
//  AddTripViewController.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/29/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addTripTextField: UITextField!
    @IBOutlet weak var cancelBt: UIButton!
    @IBOutlet weak var saveBt: UIButton!
    
    var doneSaving: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func cancelTaped(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        addTripTextField.rightViewMode = .never
        
        guard addTripTextField.text != "", let newTripName = addTripTextField.text else {
//            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
//            imageView.image = UIImage(named: "Warning")
//            imageView.contentMode = .scaleAspectFit
//            addTripTextField.rightView = imageView
//            addTripTextField.rightViewMode = .always
            
            // Alterlatives
            
//            addTripTextField.backgroundColor = UIColor.red
            
            addTripTextField.layer.borderColor = UIColor.red.cgColor
            addTripTextField.layer.borderWidth = 1
            addTripTextField.layer.cornerRadius = 10
            
            
            
            return
        }
        
        TripFuctions.createTrip(tripModel: TripModel(title: newTripName))
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }

}
