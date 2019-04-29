//
//  PopupUIView.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/29/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class PopupUIView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.darkGray.cgColor
        backgroundColor = Theme.backgroundColor
    }
}
