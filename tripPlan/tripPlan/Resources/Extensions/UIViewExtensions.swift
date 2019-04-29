//
//  UIViewExtensions.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/29/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

extension UIView {
    func addShadowAndRoundedCorner() {
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.darkGray.cgColor
    }

}
