//
//  TripModel.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/29/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//
import UIKit
import Foundation

class TripModel {
    var id: UUID
    var title: String
    var image: UIImage?
    
    init(title: String, image: UIImage? = nil ) {
        id = UUID()
        self.title = title
        self.image = image
    }
}
