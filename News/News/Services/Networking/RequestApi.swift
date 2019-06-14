//
//  RequestApi.swift
//  News
//
//  Created by Nguyen Tran Cong on 6/15/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation
import Alamofire

class RequestApi {
    
    static func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    /// MARK: - Request object
    ///
    /// - Parameters:
    ///   - router: request webapi
    ///   - type: return type request
    ///   - completion: return result object and error
    static func request<T: Mappable>(_ router: Router, _ type: T.Type,
                                     completion: @escaping (_ result: T?, _ error: BaseResponseError?) -> Void) {
        
        if !isConnectedToInternet() {
            return
        }
        
        Alamofire.request(router).responseJSON { respones in
            switch respones.result {
            case .success(_):
                if respones.response?.statusCode == 200, let dict = respones.result.value as? [String: Any] {
                    let result = T(dict: dict)
                    completion(result, nil)
                } else {
                    let err: BaseResponseError = BaseResponseError(NetworkErrorType.HTTP_ERROR,
                                                                   (respones.response?.statusCode)!, "Request is error!")
                    completion(nil, err)
                }
            case .failure(let error):
                if error is AFError {
                    let err: BaseResponseError = BaseResponseError(NetworkErrorType.HTTP_ERROR,
                                                                   error._code, "Request is error!")
                    completion(nil, err)
                }
            }
        }
    }
    
    /// MARK: - Request array of object
    ///
    /// - Parameters:
    ///   - router: request webapi
    ///   - type: return type request
    ///   - completion: return list object and error
    static func request<T: Mappable>(_ router: Router, _ type: [T.Type],
                                     completion: @escaping (_ result: [T]?, _ error: BaseResponseError?) -> Void) {
        
        if !isConnectedToInternet() {
            return
        }
        
        Alamofire.request(router).responseJSON { response in
            switch response.result {
            case .success(_):
                if response.response?.statusCode == 200,
                    let dict = response.result.value as? [String: Any],
                    let data = dict["data"] as? [[String: Any]] {
                    let results = data.compactMap { T.init(dict: $0) }
                    completion(results, nil)
                } else {
                    let err: BaseResponseError = BaseResponseError(NetworkErrorType.HTTP_ERROR,
                                                                   (response.response?.statusCode)!, "Request is error!")
                    completion(nil, err)
                }
            case .failure(let error):
                if error is AFError {
                    let err: BaseResponseError = BaseResponseError(NetworkErrorType.HTTP_ERROR,
                                                                   error._code, "Request is error!")
                    completion(nil, err)
                }
            }
        }
    }
}
