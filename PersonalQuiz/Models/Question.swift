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

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(text: "Какую еду предпочитаете?", type: .single, answer: [
                Answer(text: "Стейк", type: .dog),
                Answer(text: "Рыба", type: .cat),
                Answer(text: "Зелень", type: .koala),
                Answer(text: "Курицу", type: .fox)
            ]),
            Question(text: "Что любите делать?", type: .multiple, answer: [
                Answer(text: "Спать", type: .cat),
                Answer(text: "Играть с друзьями", type: .dog),
                Answer(text: "Охотиться", type: .fox),
                Answer(text: "Проводить время в лесу", type: .koala)
            ]),
            Question(text: "Любите ли вы поездки на машине?", type: .range, answer: [
                Answer(text: "Обожаю", type: .dog),
                Answer(text: "Люблю", type: .cat),
                Answer(text: "Равнодушно", type: .koala),
                Answer(text: "Ненавижу", type: .fox)
            ])
        ]
    }
}
