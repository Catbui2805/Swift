//
//  Data.swift
//  SwiftQuiz
//
//  Created by Nguyen Tran Cong on 4/28/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import Foundation

class DataService {
    func dataVariables() -> [QuestionModel]{
        var data = [QuestionModel]()
        data.append(QuestionModel(id: "1-1-1",questionText: "Which of these lines of code create new variables?", options: ["""
    Option 1:
    var name = "Sophie"

    Option 2:
    status = "success"
    """], correctAns: 1, optionSelect: ["CHOOSE OPTION 1", "CHOOSE OPTION 2"], isAnsered: false))
        
        data.append(QuestionModel(id: "1-1-2",questionText: "Which of these lines of code create new variables?", options: ["""
    Option 1:
    spaceship = "Nostromo"

    Option 2:
    var pirate = "LeChuck"
    """], correctAns: 2, optionSelect: ["CHOOSE OPTION 1", "CHOOSE OPTION 2"], isAnsered: false))
        
        data.append(QuestionModel(id: "1-1-3",questionText: "Which of these lines of code create new variables?", options: ["""
    Option 1:
    var operatingSystem = "macOS"
    
    Option 2:
    message = "Good morning, Dave!"
    """], correctAns: 1, optionSelect: ["CHOOSE OPTION 1", "CHOOSE OPTION 2"], isAnsered: false))
        
        data.append(QuestionModel(id: "1-1-4",questionText: "Which of these lines of code create new variables?", options: ["""
    Option 1:
    var address = "321 Park Lane"

    Option 2:
    favoriteColor = "heliotrope"
    """], correctAns: 1, optionSelect: ["CHOOSE OPTION 1", "CHOOSE OPTION 2"], isAnsered: false))
        
        data.append(QuestionModel(id: "1-1-5",questionText: "Which of these lines of code create new variables?", options: ["""
    Option 1:
    city = "Paris"
    
    Option 2:
    var dinosaur = "T-Rex"
    """], correctAns: 2, optionSelect: ["CHOOSE OPTION 1", "CHOOSE OPTION 2"], isAnsered: false))
        
        data.append(QuestionModel(id: "1-1-5",questionText: "Which of these lines of code create new variables?", options: ["""
    Option 1:
    user = "twostraws"
    
    Option 2:
    var dinosaur = "T-Rex"
    """], correctAns: 2, optionSelect: ["CHOOSE OPTION 1", "CHOOSE OPTION 2"], isAnsered: false))
        
        
        return data
    }
    
}
