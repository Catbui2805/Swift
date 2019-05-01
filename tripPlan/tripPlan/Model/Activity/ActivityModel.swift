//
//  ActivityModel.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/30/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//
import UIKit
import Foundation

struct ActivityModel {
    var id: String!
    var title = ""
    var subTitle = ""
    var activityType: ActivityType
    var photo: UIImage?
    
    init(title: String, subTitle: String, activityType: ActivityType, photo: UIImage? = nil) {
        id = UUID().uuidString
        self.title = title
        self.subTitle = subTitle
        self.activityType = activityType
        self.photo = photo
    }
}

extension ActivityModel: Equatable {
    static func == (lhs: ActivityModel, rhs: ActivityModel) -> Bool {
        return lhs.id == rhs.id
    }
}

