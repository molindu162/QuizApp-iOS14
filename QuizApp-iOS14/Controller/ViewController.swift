//
//  ViewController.swift
//  QuizApp-iOS14
//
//  Created by Molindu Achintha on 2023-07-02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    var questions = QuizBrain().questions
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ProgressBar.progress = Float(questionNumber + 1) / Float(questions.count)
        updateQnA()
    }
    
    
    
    @IBAction func answerSelected(_ sender: UIButton) {
        let answer = sender.currentTitle!
        if answer == questions[questionNumber].correctAnswer{
            print("correct")
            sender.backgroundColor = UIColor.green
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
        else{
            print("False")
            sender.backgroundColor = UIColor.red
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }
        
    }
    
    @objc func updateUI(){
        if questionNumber < questions.count - 1 {
            questionNumber += 1
            ProgressBar.progress = Float(questionNumber + 1) / Float(questions.count)
            updateQnA()

        }
        else{
            questionNumber = 0
            ProgressBar.progress = Float(questionNumber + 1) / Float(questions.count)
            updateQnA()
        }
    
    }
    
    func updateQnA(){
        questionText.text = questions[questionNumber].q
        answerOne.setTitle(questions[questionNumber].a[0], for: .normal)
        answerOne.backgroundColor = nil
        answerTwo.setTitle(questions[questionNumber].a[1], for: .normal)
        answerTwo.backgroundColor = nil
        answerThree.setTitle(questions[questionNumber].a[2], for: .normal)
        answerThree.backgroundColor = nil
    }
    

}

