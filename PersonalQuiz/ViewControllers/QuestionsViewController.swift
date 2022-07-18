//
//  QuestionsViewController.swift
//  PersonalQuiz
//
//  Created by Anastasia Perminova on 18.07.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    //MARK: -Outlets
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet weak var rangedLabels: UILabel!
    
    
    //MARK: - Properties
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - Private
extension QuestionsViewController {
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestions = questions[questionIndex]
    }
}
