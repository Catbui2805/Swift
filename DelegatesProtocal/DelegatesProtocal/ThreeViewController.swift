//
//  ThreeViewController.swift
//  DelegatesProtocal
//
//  Created by Nguyen Tran Cong on 5/19/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    @IBOutlet weak var textDate: UILabel!
    @IBOutlet weak var btSelectDate: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectDateAction(_ sender: Any) {
        let sb = UIStoryboard(name: "PopupViewController", bundle: nil)
        let popup = sb.instantiateInitialViewController() as! PopupViewController
        
        self.present(popup, animated: true)
    }

}
