//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Sahil Sagar on 18/01/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi:Bmi?
    
    func getBmiValue()->String{
        let bmiFormatted=String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiFormatted
    }
    
    mutating func calculateBmi(height:Float, weight:Float){
        let bmiValue = weight / pow(height, 2)
        
        //bmi?.value = bmiValue cant directlt assign value as bmi object isnt initialized
        
        if bmiValue<18.5{
            bmi=Bmi(value: bmiValue, advice: "Eat More Pies!", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        }else if bmiValue<24.9{
            bmi=Bmi(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        }else{
            bmi=Bmi(value: bmiValue, advice: "Eat less Pies!", color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
        }
        print(bmiValue)
    }
    
    func getAdvice()->String{
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor()->UIColor{
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
