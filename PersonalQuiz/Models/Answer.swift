//
//  Answer.swift
//  PersonalQuiz
//
//  Created by Anastasia Perminova on 15.07.2022.
//

enum AnimalType: Character {
    
    case dog = "🐶"
    case cat = "🐱"
    case fox = "🦊"
    case koala = "🐨"
    
    var definition: String {
        switch self {
            case .dog:
                return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь."
            case .cat:
                return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
            case .fox:
                return "Вы охотник по природе. Но сила ваша в хитрости."
            case .koala:
                return "Ваша внешность обманчива, со стороны вы выглядите мягким и милым, но в случае чего вы с легкостью сможете постоять за себя"
        }
    }
}

struct Answer {
    let text: String
    let type: AnimalType
}
