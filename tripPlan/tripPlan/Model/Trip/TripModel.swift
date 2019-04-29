//
//  TripModel.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/29/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import Foundation

class TripModel {
    var id: UUID
    var title: String
    
    init(title: String) {
        id = UUID()
        self.title = title
    }
}
