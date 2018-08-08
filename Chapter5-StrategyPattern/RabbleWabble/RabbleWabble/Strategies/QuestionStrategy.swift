//
//  QuestionStrategy.swift
//  RabbleWabble
//
//  Created by Christopher Lee on 8/8/18.
//  Copyright © 2018 Razeware, LLC. All rights reserved.
//

import Foundation

public protocol QuestionStrategy: class {
    var title: String { get }
    
    var correctCount: Int { get }
    var incorrectCount: Int { get }
    
    func advanceToNextQuestion() -> Bool
    
    func currentQuestion() -> Question
    
    func markQuestionCorrect(_ question: Question)
    func markQuestionIncorrect(_ question: Question)
    
    func questionIndexTitle() -> String
}
