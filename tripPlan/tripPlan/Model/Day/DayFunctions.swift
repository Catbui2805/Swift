//
//  DayFunctions.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 5/1/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import Foundation

class DayFunctions {
    static func createDay(at tripIndex: Int, dayModel: DayModel) {
        // Replace with real data store code
        Data.tripModels[tripIndex].dayModels.append(dayModel)
    }
    
}
