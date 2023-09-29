//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    
    @IBOutlet var heightValue: UILabel!
    @IBOutlet var weightValue: UILabel!
    
    @IBOutlet var heighSlider: UISlider!
    @IBOutlet var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightValue.text = "1.50m"
        weightValue.text = "100Kg"
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        
        
    }
    
    @IBAction func heighSliderChange(_ sender: UISlider) {
        heightValue.text = "\(String(format: "%.2f" , sender.value))m"
    }
    
    @IBAction func weightSliderChangw(_ sender: UISlider) {
        weightValue.text = "\(Int(sender.value))Kg"
    }
    
    @IBAction func calculateBmi(_ sender: UIButton) {
        let height = heighSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBmi(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    //print(String(format: "%.1f", indexBmi))
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.returnBmi()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            
        }
        
    }
    


}

