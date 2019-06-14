//
//  Article.swift
//  News
//
//  Created by Nguyen Tran Cong on 6/15/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol Mappable {
    init?(dict: [String: Any])
}
