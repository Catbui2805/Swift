//
//  ViewController.swift
//  Dicee
//
//  Created by Nguyen Tran Cong on 6/1/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    
    var items = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var viewBackground: UIImageView!
    // heigh
    @IBOutlet weak var heightLayoutConstraintDice: NSLayoutConstraint!
    
    // width
    @IBOutlet weak var widthLayoutConstraintDice: NSLayoutConstraint!
    
    @IBOutlet weak var stackViewLayoutConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    @IBOutlet weak var btRoll: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        setupLayout()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLayout()
    }
    
    func setupLayout() {
        let widthViewBackground = viewBackground.frame.width
        
        if widthViewBackground - 40.0 < stackViewLayoutConstraint.constant {
            stackViewLayoutConstraint.constant = widthViewBackground - 40.0
            heightLayoutConstraintDice.constant = (widthViewBackground - 40.0 - 50.0) / 2
            widthLayoutConstraintDice.constant = heightLayoutConstraintDice.constant
        }
        
        
    }
    
    @IBAction func btRollAction(_ sender: UIButton) {
        randomDiceIndex1 = Int.random(in: 0...5)
        randomDiceIndex2 = Int.random(in: 0...5)
        
        diceImageView1.image = UIImage(named: items[randomDiceIndex1])
        diceImageView2.image = UIImage(named: items[randomDiceIndex2])
    }
    
}

