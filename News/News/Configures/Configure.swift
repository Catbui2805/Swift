//
//  Configure.swift
//  News
//
//  Created by Nguyen Tran Cong on 6/15/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation


/// singleton patern
final class Configure {
    static let share = Configure()
    let infoDictionary: [String: Any]
    
    private init() {
        self.infoDictionary = Bundle.main.infoDictionary ?? [:]
    }
    
    var baseUrl: String {
        guard let url = infoDictionary["BASE_URL"] as? String else {
            return ""
        }
        
        return url
    }
    
    var versionApp: String {
        guard let version = infoDictionary["VERSION"] as? String else {
            return ""
        }
        
        return version
    }
}
