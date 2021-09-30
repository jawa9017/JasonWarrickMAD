//
//  ViewController.swift
//  exponenter
//
//  Created by Jason Warrick on 9/29/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var baseText: UITextField!
    @IBOutlet weak var expoLabel: UILabel!
    @IBOutlet weak var expoStepper: UIStepper!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func changeExpo(_ sender: UIStepper) {
        expoLabel.text = String(format: "%.0f", expoStepper.value)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func calculateResult(_ sender: UIButton) {
        if baseText.text == "" {
            let alert = UIAlertController(title: "Warning", message: "You must have a base to compute the exponent", preferredStyle: UIAlertController.Style.alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancelAction)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {
                action in
            })
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        let base = Float(baseText.text!)!
        let exponent = Float(expoLabel.text!)!
        
        let expoResult = pow(base, exponent)
        
        resultLabel.text = "\(expoResult)"
    }
    
    override func viewDidLoad() {
        let tap: UITapGestureRecognizer =
        UITapGestureRecognizer(target: self, action:
        #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        baseText.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

