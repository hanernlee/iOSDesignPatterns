//
//  AppSettings.swift
//  RabbleWabble
//
//  Created by Christopher Lee on 8/8/18.
//  Copyright © 2018 Razeware, LLC. All rights reserved.
//

import Foundation

public class AppSettings {
  private struct Keys {
      static let questionStrategy = "questionStrategy"
  }
  
  public static let shared = AppSettings()
  
  public var questionStrategyType: QuestionStrategyType {
    get {
      let rawValue = userDefaults.integer(forKey: Keys.questionStrategy)
      return QuestionStrategyType(rawValue: rawValue)!
    }
    set {
      userDefaults.set(newValue.rawValue, forKey: Keys.questionStrategy)
    }
  }
  
  private let userDefaults = UserDefaults.standard
  
  public func questionStrategy(for questionGroup: QuestionGroup) -> QuestionStrategy {
    return questionStrategyType.questionStrategy(for: questionGroup)
  }
  
  private init() { }
}

public enum QuestionStrategyType: Int {
  public static let allCases: [QuestionStrategyType] = [.random, .sequential]
  
  case random
  case sequential
  
  public func title() -> String {
    switch self {
    case .random:
      return "Random"
    case .sequential:
      return "Sequential"
    }
  }
  
  public func questionStrategy(for questionGroup: QuestionGroup) -> QuestionStrategy {
    switch self {
    case .random:
      return RandomQuestionStrategy(questionGroup: questionGroup)
    case .sequential:
      return SequentialQuestionStrategy(questionGroup: questionGroup)
    }
  }
}
