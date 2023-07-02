//
//  Question.swift
//  QuizApp-iOS14
//
//  Created by Molindu Achintha on 2023-07-02.
//

import Foundation

struct Question{
    var q: String
    var a: [String]
    var correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.q = q
        self.a = a
        self.correctAnswer = correctAnswer
    }
}
