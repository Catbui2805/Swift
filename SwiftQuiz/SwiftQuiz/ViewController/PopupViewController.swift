//
//  PopupViewController.swift
//  SwiftQuiz
//
//  Created by Nguyen Tran Cong on 4/28/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var messageTitle: UILabel!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popTextContentLabel: UILabel!
    @IBOutlet weak var yesBt: UIButton!
    @IBOutlet weak var noBt: UIButton!
    
    var messageTitleText: String?
    var message: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.cornerRadius = 10
        yesBt.layer.cornerRadius = 10
        noBt.layer.cornerRadius = 10
        popTextContentLabel.layer.cornerRadius = 10
        messageTitle.text = "\(messageTitleText ?? "Start quiz")"
        popTextContentLabel.text = "\(message ?? "Are you aready ?")"
    }
    
}
