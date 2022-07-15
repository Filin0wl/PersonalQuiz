//
//  Question.swift
//  PersonalQuiz
//
//  Created by Anastasia Perminova on 15.07.2022.
//

enum ResponseType {
    case single
    case multiple
    case range
}

struct Question {
    let text: String
    let type: ResponseType
    let answer: [Answer]
}
