//
//  ViewController.swift
//  IOS-CalculatorApp
//
//  Created by Berdil İlyada Karacam on 24.06.2018.
//  Copyright © 2018 Berdil İlyada Karacam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_number: UILabel!
    var numberString:String = ""
    var processType:TypesOfProcess = .addition
  //  var processArray:Array = ["addition","subtract","multiply","divide"]
    var number1:Double = 0
    var number2:Double = 0
    var getNumber1:Bool = true
    var anyProcess:Bool = false

    enum TypesOfProcess {
        case addition
        case subtract
        case multiply
        case divide
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lbl_number.text = "0"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {

        
        switch sender.tag {
  
        case 0...9:
            if anyProcess{
                resetCalc()
                anyProcess=false
            }
            numberString += String(sender.tag)
            lbl_number.text = numberString
            
        case 10:
            if number1 != 0 || number2 != 0
            {
                getNumber()
                makeProcess(processType: processType)
            }
            else
            {
                lbl_number.text = "0"
            }
        case 11:
            anyProcess = false
            processType = .addition
         //   processType = "\(processArray[0])" //add
            print("\(processType)")
            getNumber()
        
        case 12:
            anyProcess = false
            processType = .subtract
          //  processType = "\(processArray[1])" //sub
            getNumber()
        
        case 13:
            anyProcess = false
            processType = .multiply
         //   processType = "\(processArray[2])" //mult
            getNumber()
        
        case 14:
            anyProcess = false
            processType = .divide
          //  processType = "\(processArray[3])" //div
            getNumber()
        
        case 15:
            if getNumber1 {
                number1 = (numberString as NSString).doubleValue
                number1 /= 100
                numberString = "\(number1)"
                lbl_number.text = numberString
            }
            else {
                number2 = (numberString as NSString).doubleValue
                number2 /= 100
                numberString = "\(number2)"
                lbl_number.text = numberString

            }
            
        case 16:
            if getNumber1 {
                
                number1 = (numberString as NSString).doubleValue
                if number1 != 0
                {
                number1 *= -1
                }
                numberString = "\(number1)"
                lbl_number.text = numberString

            }
            else {
                number2 = (numberString as NSString).doubleValue
                if number2 != 0
                {
                    number2 *= -1
                }
                numberString = "\(number2)"
                lbl_number.text = numberString
            }
        case 17:
            resetCalc()
            
        case 18:
            numberString += "."
            lbl_number.text = numberString

  
        default :
            return
        }
    }
    
    func makeProcess (processType : TypesOfProcess) {
        
        if processType == .addition
        {
         number1 += number2
            print("\(number1) ,\(number2) ")
        }
        else if processType == .subtract
        {
            number1 -= number2
        }
        else if processType == .multiply
        {
            number1 *= number2
        }
        else if processType == .divide
        {
            number1 /= number2
        }
        numberString = "\(number1)"
        lbl_number.text = numberString
        
        anyProcess = true
    }
    
    func getNumber () {
        
        if getNumber1 {
            number1 = (numberString as NSString).doubleValue
            print("\(number1) number1")
            numberString = ""
            lbl_number.text = "0"
            getNumber1 = false
        }
        else if getNumber1 == false {
            number2 = (numberString as NSString).doubleValue
            print("\(number2) number2")
            numberString = ""
            lbl_number.text = "0"
            getNumber1 = true
        }
        
    }
    func resetCalc (){
        print("reset Calculator")
        number1=0
        number2=0
        numberString=""
        lbl_number.text = "0"
        getNumber1 = true
        
    }
    
}
