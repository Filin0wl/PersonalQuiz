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
                return "Собака"
            case .cat:
                return "Кошка"
            case .fox:
                return "Лиса"
            case .koala:
                return "Коала"
        }
    }
}

struct Answer {
    let text: String
    let type: AnimalType
}
