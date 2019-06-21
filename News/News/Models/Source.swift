//
//  Source.swift
//  News
//
//  Created by Nguyen Tran Cong on 6/15/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation

public enum SourceType: Int {
    case VnExpress = 1
    case VietNamNet
    case NguoiLaoDong
    
}

struct Source {
    let id: Int?
    let name: String?
    
    var type: SourceType? {
        guard let id = id else { return nil }
        return SourceType(rawValue: id)
    }
}
