//
//  Data.swift
//  SwiftQuiz
//
//  Created by Nguyen Tran Cong on 4/28/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import Foundation


/// Description: DataService
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
        
        data.append(QuestionModel(id: "1-1-6",questionText: "Which of these lines of code create new variables?", options: ["""
    Option 1:
    user = "twostraws"
    
    Option 2:
    var str = "Hello, playground"
    """], correctAns: 2, optionSelect: ["CHOOSE OPTION 1", "CHOOSE OPTION 2"], isAnsered: false))
        
        return data
    }
    
}

// MARK: - Tutorial
extension DataService {

    func getTutorails() -> [TutorialModel] {
        var tutorials = [TutorialModel]()
        
        tutorials.append(TutorialModel(name: "Variables", content: "", link: "https://www.hackingwithswift.com/sixty/1/1/variables"))
        tutorials.append(TutorialModel(name: "Strings and integers", content: "", link: "https://www.hackingwithswift.com/sixty/1/2/strings-and-integers"))
        tutorials.append(TutorialModel(name: "Multi-line strings", content: "", link: "https://www.hackingwithswift.com/sixty/1/3/multi-line-strings"))
        tutorials.append(TutorialModel(name: "Doubles and booleans", content: "", link: "https://www.hackingwithswift.com/sixty/1/4/doubles-and-booleans"))
        tutorials.append(TutorialModel(name: "String interpolation", content: "", link: "https://www.hackingwithswift.com/sixty/1/5/string-interpolation"))
        tutorials.append(TutorialModel(name: "Constants", content: "", link: "https://www.hackingwithswift.com/sixty/1/6/constants"))
        tutorials.append(TutorialModel(name: "Type annotations", content: "", link: "https://www.hackingwithswift.com/sixty/1/7/type-annotations"))
        tutorials.append(TutorialModel(name: "Simple types: Summary", content: "", link: "https://www.hackingwithswift.com/sixty/1/8/simple-types-summary"))
        tutorials.append(TutorialModel(name: "Arrays", content: "", link: "https://www.hackingwithswift.com/sixty/2/1/arrays"))
        tutorials.append(TutorialModel(name: "Set", content: "", link: "https://www.hackingwithswift.com/sixty/2/2/sets"))
        tutorials.append(TutorialModel(name: "Tuples", content: "", link: "https://www.hackingwithswift.com/sixty/2/3/tuples"))
        tutorials.append(TutorialModel(name: "Arrays vs sets vs tuples", content: "", link: "https://www.hackingwithswift.com/sixty/2/4/arrays-vs-sets-vs-tuples"))
        tutorials.append(TutorialModel(name: "Dictionaries", content: "", link: "https://www.hackingwithswift.com/sixty/2/5/dictionaries"))
        tutorials.append(TutorialModel(name: "Dictionary default values", content: "", link: "https://www.hackingwithswift.com/sixty/2/6/dictionary-default-values"))
        tutorials.append(TutorialModel(name: "Creating empty collections", content: "", link: "https://www.hackingwithswift.com/sixty/2/7/creating-empty-collections"))
        tutorials.append(TutorialModel(name: "Enumerations", content: "", link: "https://www.hackingwithswift.com/sixty/2/8/enumerations"))
        tutorials.append(TutorialModel(name: "Enum associated values", content: "", link: "https://www.hackingwithswift.com/sixty/2/9/enum-associated-values"))
        tutorials.append(TutorialModel(name: "Enum raw values", content: "", link: "https://www.hackingwithswift.com/sixty/2/10/enum-raw-values"))
        tutorials.append(TutorialModel(name: "Complex types: Summary", content: "", link: "https://www.hackingwithswift.com/sixty/2/11/complex-types-summary"))
        
        return tutorials
    }
}
