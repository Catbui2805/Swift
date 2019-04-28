//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by Nguyen Tran Cong on 4/28/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startQuizbt: UIButton!
    @IBOutlet weak var studybt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        startQuizbt.layer.cornerRadius = 10
        studybt.layer.cornerRadius = 10
    }
}

