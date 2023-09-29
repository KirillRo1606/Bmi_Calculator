//
//  CalculatorBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Kirill Romanov on 23.09.22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBmi(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more Pies!", color: .blue )
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Feed as a fiddle!", color: .green )
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!" , color: .red)
        }
    }
    
    func returnBmi() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "bla bla"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
}
