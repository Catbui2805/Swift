//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Nguyen Tran Cong on 4/28/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var viewForHeader: UIView!
    @IBOutlet weak var viewForBody: UIView!
    @IBOutlet weak var viewForEnd: UIView!
    
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var optionsTextArea: UITextView!
    @IBOutlet weak var sliderTime: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    
    @IBOutlet weak var trueTapped: UIButton!
    @IBOutlet weak var falseTapped: UIButton!
    
    
    var reviewQuestions = [QuestionModel]()
    var questions = [QuestionModel]()
    var numberCorrect = 0
    var questionCurrent = 0
    var totalQuestion = 0
    var data = DataService()
    var seconds = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        questions = data.dataVariables()
        totalQuestion = questions.count
        askQuestion()
        countDownTime()
    }
    
    func setupLayout() {
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
        viewForHeader.layer.cornerRadius = 10
        viewForBody.layer.cornerRadius = 10
        viewForEnd.layer.cornerRadius = 10
        trueTapped.layer.cornerRadius = 10
        falseTapped.layer.cornerRadius = 10
        sliderTime.layer.cornerRadius = 10
        scoreLabel.layer.cornerRadius = 10
        questionNumberLabel.layer.cornerRadius = 10
        
        questionTextLabel.text = ""
        optionsTextArea.text = ""
        
    }
}

// MARK: - swiper gesture
private extension QuizViewController {
    @IBAction func swiperGestureQuestionRight(_ sender: UISwipeGestureRecognizer) {
        //Todo: Show question
        //go home
    }
    
    @IBAction func swiperGestureQuestionLeft(_ sender: Any) {
        if questions.count > 0 {
            if let question = questions.first {
                reviewQuestions.append(question)
            }
            questions.remove(at: 0)
            askQuestion()
        } else {
            alertControllerMessage()
        }
    }
}

// MARK: - Function
private extension QuizViewController {
    func alertControllerMessage() {
        let ac = UIAlertController(title: "Test Finish", message: "Your score is \(numberCorrect)/\(totalQuestion) .", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "finish", style: .cancel, handler: nil))
        ac.addAction(UIAlertAction(title: "Try again", style: .default, handler: { (action) in
            self.questions = self.data.dataVariables()
            self.questionCurrent = 0
            self.numberCorrect = 0
            self.seconds = 0
            self.countDownTime()
            self.askQuestion(action: action)
        }))
        timer.invalidate()
        present(ac, animated: true)
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        if questions.count > 0 {
            seconds = 0
            questionCurrent += 1
            sliderTime.value = Float(seconds)
            scoreLabel.text = "SCORE: \(numberCorrect)/\(totalQuestion)"
            questionNumberLabel.text = "QUESTION: \(questionCurrent)/\(totalQuestion)"
            
            questions.shuffle() // random position in list
            questionTextLabel.text = "Q: \(questions.first?.questionText ?? "")"
            optionsTextArea.text = questions.first?.options.first
            trueTapped.setTitle(questions.first?.optionSelect?.first ?? "TRUE", for: .normal)
            trueTapped.titleLabel?.adjustsFontSizeToFitWidth = true
            falseTapped.setTitle(questions.first?.optionSelect?.last ?? "FALSE", for: .normal)
        } else {
            alertControllerMessage()
        }
    }
}

// MARK: - Action button
private extension QuizViewController {
    @IBAction func trueTappedButton(_ sender: Any) {
        if let correctAns = questions.first?.correctAns, correctAns == 1 {
            numberCorrect += 1
            questions.first?.isAnsered = true
        }
        if let question = questions.first {
            reviewQuestions.append(question)
            questions.remove(at: 0)
        }
        askQuestion()
    }
    
    @IBAction func falseTappedButton(_ sender: Any) {
        if let correctAns = questions.first?.correctAns, correctAns == 2 {
            numberCorrect += 1
            questions.first?.isAnsered = true
        }
        if let question = questions.first {
            reviewQuestions.append(question)
            questions.remove(at: 0)
        }
        askQuestion()
    }
}

// MARK: - Slider
private extension QuizViewController {
    func countDownTime() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuizViewController.count), userInfo: nil, repeats: true)
    }
    
    @objc func count() {
        seconds += 1
        sliderTime.value = Float(seconds)
        if seconds == 60 {
            timer.invalidate()
            alertControllerMessage()
        }
    }
}
