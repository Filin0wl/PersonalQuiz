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
      
        let result = getResult(anwers: chosenAnswers)
        
        titleLabel.text = "Вы - \(result.rawValue)"
        descriptionLabel.text = result.definition
        
    }
}

//MARK: - Private methods
extension FinalViewController {
    
    private func getResult(anwers: [Answer]) -> AnimalType {
        var resultDictionary = [AnimalType: Int]()
        
        for item in anwers {
            if let count = resultDictionary[item.type] {
                resultDictionary[item.type] = count + 1
            } else {
                resultDictionary[item.type] = 1
            }
        }
        
        return resultDictionary.sorted(by: {$0.value > $1.value}).first?.key ?? .dog
    }
}
