//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping = true
    private var calculator = CalculatorModel()
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert text label into double")
            }
            return number
        }
        set {
                displayLabel.text! = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTyping = true
        
        if let calcMethod = sender.currentTitle {
            displayValue = calculator.calculate(symbol: calcMethod, number: displayValue)
        }
        
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numTitle = sender.currentTitle {
            if isFinishedTyping {
                displayLabel.text = numTitle
                isFinishedTyping = false
            } else {
                if numTitle == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text! += numTitle
            }
            
        }
        
    }
    
}

