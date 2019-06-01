//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Nguyen Tran Cong on 6/2/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var randomBallNumber: Int = 0
    let items = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var btAsk: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btAskAction(_ sender: UIButton) {
        
        randomBallNumber = Int.random(in: 0 ... 4)
        
        imageView.image = UIImage(named: items[randomBallNumber])
        
    }
    
}

