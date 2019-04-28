//
//  File.swift
//  SwiftQuiz
//
//  Created by Nguyen Tran Cong on 4/29/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

class TutorialModel {
    var name: String
    var content: String?
    var link: String?
    
    init(name: String, content: String?, link: String?) {
        self.name = name
        self.content = content
        self.link = link
    }
}
