//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabelWithSmile: UILabel!
    @IBOutlet var descriptionResultLabel: UILabel!
    
    var answers: [Answer]!
    
    // 1. Избавиться от кнопки возврата назад на экране результатов
    // 2. Передать массив с ответами на экран с результатами
    // 3. Определить наиболее часто встречающийся тип животного
    // 4. Отобразить результаты в соответствии с этим животным
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        finalResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func finalResult() {
        var mostOftenAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        for animal in animals {
            mostOftenAnimals[animal, default: 0] += 1
        }
        let sortMostOftenAnimals = mostOftenAnimals
            .sorted { $0.value > $1.value }
        guard let mostAnimal = sortMostOftenAnimals.first?.key
        else { return }
        
        updateUI(with: mostAnimal)
    }
    
    private func updateUI(with animal: Animal) {
        resultLabelWithSmile.text = "Вы - \(animal.rawValue)!"
        descriptionResultLabel.text = animal.definition
    }
}
