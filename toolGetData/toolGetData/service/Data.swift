//
//  Data.swift
//  toolGetData
//
//  Created by Nguyen Tran Cong on 5/7/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import Foundation

class Post: Codable {
    let status, lasttime: String?
    let data: [Datum]?
    
    init(status: String?, lasttime: String?, data: [Datum]?) {
        self.status = status
        self.lasttime = lasttime
        self.data = data
    }
}


class Datum: Codable {
    let sid, catID, content, author: String?
    let createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case sid
        case catID = "cat_id"
        case content, author
        case createdAt = "created_at"
    }
    
    init(sid: String?, catID: String?, content: String?, author: String?, createdAt: String?) {
        self.sid = sid
        self.catID = catID
        self.content = content
        self.author = author
        self.createdAt = createdAt
    }
}

// MARK: Convenience initializers and mutators

extension Post {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Post.self, from: data)
        self.init(status: me.status, lasttime: me.lasttime, data: me.data)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        status: String?? = nil,
        lasttime: String?? = nil,
        data: [Datum]?? = nil
        ) -> Post {
        return Post(
            status: status ?? self.status,
            lasttime: lasttime ?? self.lasttime,
            data: data ?? self.data
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Datum {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Datum.self, from: data)
        self.init(sid: me.sid, catID: me.catID, content: me.content, author: me.author, createdAt: me.createdAt)
    }
    
    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        sid: String?? = nil,
        catID: String?? = nil,
        content: String?? = nil,
        author: String?? = nil,
        createdAt: String?? = nil
        ) -> Datum {
        return Datum(
            sid: sid ?? self.sid,
            catID: catID ?? self.catID,
            content: content ?? self.content,
            author: author ?? self.author,
            createdAt: createdAt ?? self.createdAt
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

fileprivate func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

fileprivate func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    func postTask(with url: URL, completionHandler: @escaping (Post?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
