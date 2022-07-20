//
//  FinalViewController.swift
//  PersonalQuiz
//
//  Created by Anastasia Perminova on 14.07.2022.
//

import UIKit

class FinalViewController: UIViewController {
    
   //MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - Properties
    var chosenAnswers: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
        
        let result = maxResultAnimal(anwers: chosenAnswers)
        updateUI(with: result)
    }
}

//MARK: - Private methods
extension FinalViewController {
    
    private func maxResultAnimal(anwers: [Answer]) -> AnimalType? {
        return Dictionary(grouping: anwers, by: {$0.type}).sorted(by: {$0.value.count > $1.value.count}).first?.key
    }
    
    private func updateUI(with animal: AnimalType?) {
        titleLabel.text = "Вы - \(animal?.rawValue ?? "💩")"
        descriptionLabel.text = animal?.definition ?? ""
    }
}
