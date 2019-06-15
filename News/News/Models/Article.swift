//
//  Article.swift
//  News
//
//  Created by Nguyen Tran Cong on 6/15/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import Foundation
import SwiftyJSON

class Article: Mappable {
    var id: Int?
    var title: String?
    var image: String?
    var url: String?
    var description: String?
    var publishDate: Date?
    var source: Source?
    
    required init?(dict: [String : Any]) {
        let json = JSON(dict)
        id = json["id"].int
        title = json["title"].string
        image = json["image"].string
        url = json["url"].string
        description = json["description"].string
        
        if let date = json["publishDate"].string {
            publishDate = Date(fromString: date, format: .custom("yyyy-MM-dd'T'HH:mm:ss"))
        }
        let sourceId = json["source"]["id"].int
        let sourceName = json["source"]["name"].string
        source = Source(id: sourceId, name: sourceName)
    }
    
}
