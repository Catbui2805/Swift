//
//  AppUIButton.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/29/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = Theme.tintColor
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
    }
}
