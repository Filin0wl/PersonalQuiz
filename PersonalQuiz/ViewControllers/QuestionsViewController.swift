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
    @IBOutlet var multipleSwitchs: [UISwitch]!
    @IBOutlet var rangedLabels: [UILabel]!
    
    
    
    
    //MARK: - Properties
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answerChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
//MARK: - Actions
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        
        let currentAnswer = currentAnswers[currentIndex]
        answerChosen.append(currentAnswer)
        
        newQuestion()
    }
    
    @IBAction func multipleAnswerPressed() {
        
    }
    
    @IBAction func rangedAnswerButtonPressed() {
    }

}

//MARK: - Private
extension QuestionsViewController {
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestions = questions[questionIndex]
        
        questionLabel.text = currentQuestions.text
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        progressView.setProgress(totalProgress, animated: true)
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        showCurrentStackView(for: currentQuestions.type)
        
    }
    
    private func showCurrentStackView(for type: ResponseType) {
        switch type {
            case .single:
                showSingleStackView(with: currentAnswers)
            case .multiple:
                showMultipleStackView(with: currentAnswers)
            case .range:
                showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
    private func newQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}
