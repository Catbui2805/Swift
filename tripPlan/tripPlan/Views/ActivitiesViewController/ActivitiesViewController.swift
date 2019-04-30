//
//  ActivitiesViewController.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/30/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    @IBAction func backToTripsViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
