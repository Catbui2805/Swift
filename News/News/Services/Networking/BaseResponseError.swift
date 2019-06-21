//
//  BaseResponseError.swift
//  News
//
//  Created by Nguyen Tran Cong on 6/15/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation

class BaseResponseError {
    var mErrorType: NetworkErrorType!
    var mErrorCode: Int!
    var mErrorMessage: String!
    
    init(_ errorType: NetworkErrorType, _ errorCode: Int, _ errorMessage: String) {
        mErrorType = errorType
        mErrorCode = errorCode
        mErrorMessage = errorMessage
    }
}
