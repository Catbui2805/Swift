//
//  PopupDelegate.swift
//  ReusablePopups
//
//  Created by Nguyen Tran Cong on 4/27/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation

protocol PopupDelegate: AnyObject {
    func popupValueSelected(value: String)
}
