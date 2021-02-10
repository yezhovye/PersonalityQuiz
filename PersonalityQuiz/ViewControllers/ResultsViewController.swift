//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Victoria Klimova on 10.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answers: [Answer]!

    let animalTypes = answers.map {$0.type}
    
    var animalAmount = [AnimalType : Int]
    animalTypes.forEach { animalType in
    animalAmount[animalType] = (animalAmount +[animalType]??0) + 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    navigationItem.BackButton.isHidden = true
    updateUI()
    func updateUI() {
        let sortedAmount = animalAmount.sorted {$0.value > $1.value}
        let animal = sortedAmount.first.key
        answerLabel.text = "Вы - \(animal.rowValue)"
        definitionLabel.text = animal.definition
    }

}
