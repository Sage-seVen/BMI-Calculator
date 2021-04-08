//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!

    @IBOutlet weak var heightSliderOutlet: UISlider!
    @IBOutlet weak var weightSliderOutlet: UISlider!
    
    var calculatorBrain=CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        heightLabel.text=String(format: "%.2f", sender.value)+"m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightLabel.text="\(Int((sender.value).rounded()))Kg "
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        calculatorBrain.calculateBmi(height: heightSliderOutlet.value, weight: weightSliderOutlet.value)
        performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="mySegue"
        {
            let destinationVC=segue.destination as! SecondViewController
            destinationVC.bmiValue=calculatorBrain.getBmiValue()
            destinationVC.advice=calculatorBrain.getAdvice()
            destinationVC.color=calculatorBrain.getColor()
        }
    }
    
}

