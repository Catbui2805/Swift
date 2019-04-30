//
//  UITextFielExtension.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 5/1/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

extension UITextField {
    var hasValue: Bool {
        guard text == "" else {
            return true
        }
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.image = UIImage(named: "Warning")
        imageView.contentMode = .scaleAspectFit
        rightView = imageView
        rightViewMode = .unlessEditing
        return false
    }
}
