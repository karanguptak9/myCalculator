import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var brain = CalcAlgo()
    
    var userIsCurrentlyTyping = false
    var hasDecimal = false
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let buttonText = sender.currentTitle!
        
        if userIsCurrentlyTyping {
            let currentText = display.text!
            display.text = currentText + buttonText
        } else {
            display.text = buttonText
            userIsCurrentlyTyping = true
            hasDecimal = false
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        userIsCurrentlyTyping = false
        brain.setOperand(displayValue)
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
            hasDecimal = false
        }
        if let result = brain.result {
            displayValue = result
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        display.text = "0"
        brain.reset()
        hasDecimal = false
    }
    
    @IBAction func decimal(_ sender: UIButton) {
        if !hasDecimal{
            let currentText = display.text!
            if userIsCurrentlyTyping {
                display.text = currentText + "."
            }else{
                display.text = "0."
                userIsCurrentlyTyping = true
                hasDecimal = true
            }
        }
    }
}
