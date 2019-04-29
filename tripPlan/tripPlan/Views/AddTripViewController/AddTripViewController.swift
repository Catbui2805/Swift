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
        TripFuctions.createTrip(tripModel: TripModel(title: addTripTextField.text!))
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }

}
