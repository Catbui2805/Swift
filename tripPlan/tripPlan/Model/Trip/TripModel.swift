//
//  TripModel.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/29/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//
import UIKit
import Foundation

struct TripModel {
    var id: UUID
    var title: String
    var image: UIImage?
    var dayModels = [DayModel]() {
        didSet {
            // Called when a new value is assigned to dayModels
//            dayModels = dayModels.sorted(by: { (dayModel1, dayModel2) -> Bool in
//                dayModel1.title < dayModel2.title
//            })
//            dayModels = dayModels.sorted(by: { $0.title < $1.title } )
            
            dayModels = dayModels.sorted(by: <)
        }
    }
    
    init(title: String, image: UIImage? = nil, dayModels: [DayModel]? = nil) {
        id = UUID()
        self.title = title
        self.image = image
        
        if let dayModels = dayModels {
            self.dayModels = dayModels
        }
    }
}
