//
//  ActivityFunctions.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 5/1/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import Foundation

class ActivityFunctions {
    static func createActivity(at tripIndex: Int, for dayIndex: Int, using activityModel: ActivityModel) {
        // Replace with real data store code
        
        Data.tripModels[tripIndex].dayModels[dayIndex].activityModels.append(activityModel)
    }
    
    static func deleteActivity(at tripIndex: Int, for dayIndex: Int, using activityModel: ActivityModel) {
        // Replace with real data store code
        
        let dayModel = Data.tripModels[tripIndex].dayModels[dayIndex]
        if let index = dayModel.activityModels.firstIndex(of: activityModel) {
            Data.tripModels[tripIndex].dayModels[dayIndex].activityModels.remove(at: index)
        }
    }
    
    static func updateActivity(at tripIndex: Int, oldDayIndex: Int, newDayIndex: Int, using activityModel: ActivityModel){
        //Replace with real data store code
        
        if oldDayIndex != newDayIndex {
            // Move activity to different day
            let lastIndex = Data.tripModels[tripIndex].dayModels[newDayIndex].activityModels.count
            reorderActivity(at: tripIndex, oldDayIndex: oldDayIndex, newDayIndex: newDayIndex, newActivityIndex: lastIndex, activityModel: activityModel)
        } else {
            // update activity in same day
            let dayModel = Data.tripModels[tripIndex].dayModels[oldDayIndex]
            let activityIndex = (dayModel.activityModels.firstIndex(of: activityModel))!
            Data.tripModels[tripIndex].dayModels[newDayIndex].activityModels[activityIndex] = activityModel
        }
    }
    
    static func reorderActivity(at tripIndex: Int, oldDayIndex: Int, newDayIndex: Int, newActivityIndex: Int, activityModel: ActivityModel){
        // Replace with real data store code
        
        // 1. Remove activity form old location
        let oldDayModel = Data.tripModels[tripIndex].dayModels[oldDayIndex]
        let oldActivityIndex = (oldDayModel.activityModels.firstIndex(of: activityModel))!
        Data.tripModels[tripIndex].dayModels[oldDayIndex].activityModels.remove(at: oldActivityIndex)
        
        // 2. Insert activity into new location
        Data.tripModels[tripIndex].dayModels[newDayIndex].activityModels.insert(activityModel, at: newActivityIndex)
    }
}
