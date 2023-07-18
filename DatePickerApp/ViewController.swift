//
//  ViewController.swift
//  DatePickerApp
//
//  Created by Ilya Pavlov on 18.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let maxDate : Date? = Calendar.current.date(byAdding: .day, value: -1, to: Date())

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    private var numberOfDays = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray6
        datePicker.date = maxDate!
        resultButton.layer.cornerRadius = 10
        infoLabel.isHidden = true
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        sender.maximumDate = maxDate
        let range = sender.date..<Date.now
        numberOfDays = range.formatted(.components(style: .wide, fields: [.day]))
    }
    
    @IBAction func resultButtonPressed(_ sender: UIButton) {
        infoLabel.isHidden = false
        if numberOfDays == "" {
            infoLabel.text = "Ты только родился! Поздравляю! Все еще впереди"
        } else {
            infoLabel.text = "Ты прожил уже \(numberOfDays). А сколько всего еще впереди!"
        }
    }

    
}

