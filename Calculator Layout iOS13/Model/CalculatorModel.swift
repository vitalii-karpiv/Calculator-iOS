//
//  CalculatorModel.swift
//  Calculator Layout iOS13
//
//  Created by newbie on 17.03.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorModel {
    
    private var prevOperation: (prevNumber: Double, sign: String)?
    
    mutating func calculate(symbol: String, number: Double) -> Double {
        switch symbol {
        case "+/-":
            return number * -1
        case "%":
            return number / 100
        case "AC":
            return 0
        case "=":
            return performCalculation(prevData: prevOperation, currentNumber: number)
        default:
            prevOperation = (prevNumber: number, sign: symbol)
            return number
        }
    }
    
    mutating private func performCalculation(prevData: (prevNumber: Double, sign: String)?, currentNumber: Double) -> Double {
        if let prevNumber = prevData?.prevNumber, let sign = prevData?.sign {
            prevOperation = nil
            switch sign {
            case "+":
                return prevNumber + currentNumber
            case "-":
                return prevNumber - currentNumber
            case "÷":
                return prevNumber / currentNumber
            case "×":
                return prevNumber * currentNumber
            default:
                fatalError("Cannot perform calculation with passed sign")
            }
        }
        return currentNumber
    }
}
