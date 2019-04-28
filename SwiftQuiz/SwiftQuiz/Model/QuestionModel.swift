//
//  QuestionModel.swift
//  SwiftQuiz
//
//  Created by Nguyen Tran Cong on 4/28/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import Foundation

class QuestionModel {
    var id: String
    var questionText: String
    var options: [String]
    var correctAns: Int
    var optionSelect: [String]?
    var isAnsered: Bool
    
    init(id: String, questionText: String, options: [String], correctAns: Int, optionSelect: [String]?, isAnsered: Bool = false) {
        self.id = id
        self.questionText = questionText
        self.options = options
        self.correctAns = correctAns
        self.optionSelect = optionSelect
        self.isAnsered = isAnsered
    }
}
