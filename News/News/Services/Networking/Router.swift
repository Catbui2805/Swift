//
//  Router.swift
//  News
//
//  Created by Nguyen Tran Cong on 6/15/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkErrorType: Error {
    case API_ERROR
    case HTTP_ERROR
}

enum EncodingType {
    case url
    case json
}

/// Router
///
/// - login:
/// - getNewsArticles:
/// - getNewsArticlesByCategory:
/// - getRelateNews:
enum Router: URLRequestConvertible {
    case login(userName: String, password: String)
    case getNewsArticles(page: Int, pageSize: Int)
    case getNewsArticlesByCategory(id: Int, page: Int, pageSize: Int)
    case getRelateNews(id: Int, page: Int, pageSize: Int)
    
    static let baseURLString = "http://divedeep.azurewebsites.net"
    
    /// MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getNewsArticles, .getRelateNews, .getNewsArticlesByCategory:
            return .get
        }
    }
    
    /// MARK: - Path
    var path: String {
        switch self {
        
        case .login:
            return "/api/Authenticaion/login"
        case .getNewsArticles:
            return "/api/NewsArticles"
        case .getNewsArticlesByCategory(let id, _, _):
            return "/api/NewsArticles/ByCategory/\(id)"
        case .getRelateNews(let id, _, _):
            return "/api/NewsArticles/RelatedNews/\(id)"
        }
    }
    
    var headers: HTTPHeaders {
        let headers = ["accept": "application/json"]
        switch self {
        case .login,
             .getNewsArticles,
             .getNewsArticlesByCategory,
             .getRelateNews:
            break
        }
        return headers
    }
    
    var encoding: EncodingType {
        switch self {
        case .login:
            return .json
        default:
            return .url
        }
    }
    
    
    /// MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .login(let userName, let password):
            return [
                "userName": userName,
                "passwork": password
            ]
        case .getNewsArticles(let page, let pageSize),
            .getNewsArticlesByCategory( _, let page, let pageSize),
            .getRelateNews( _, let page, let pageSize):
            return [
                "page": page,
                "pageSize": pageSize
            ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: Router.baseURLString) else {
            throw NetworkErrorType.HTTP_ERROR
        }
        
        // Setting path
        var urlRequest: URLRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // Setting method
        urlRequest.httpMethod = method.rawValue
        
        // Setting header
        for (key, value) in headers {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        if let parameters = parameters {
            do {
                if encoding == .url {
                    urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                } else {
                    let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                    urlRequest.httpBody = jsonData
                }
            } catch {
                print("Encoding fail")
            }
        }
        return urlRequest
    }
}
