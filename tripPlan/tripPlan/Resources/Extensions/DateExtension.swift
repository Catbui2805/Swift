//
//  DateExtension.swift
//  tripPlan
//
//  Created by Nguyen Tran Cong on 5/1/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import Foundation

extension Date {
    func addDay(day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: Date())!
    }
}
