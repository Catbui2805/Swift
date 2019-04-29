//
//  TripFunctions.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 4/29/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import Foundation

class TripFuctions {
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
    }
    
    static func readTrip(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to Bali!"))
                Data.tripModels.append(TripModel(title: "Trip to Mexico!"))
                Data.tripModels.append(TripModel(title: "Trip to Vietnam!"))
            }
        }
        
        DispatchQueue.main.async {
            completion()
        }
    }
    
    static func updateTrip(tripModel: TripModel) {
        
    }
    
    static func deleteTrip(index: Int) {
        Data.tripModels.remove(at: index)
    }
    
}
