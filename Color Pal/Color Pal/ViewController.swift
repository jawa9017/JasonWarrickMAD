//
//  ViewController.swift
//  Color Pal
//
//  Created by Jason Warrick on 10/5/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var lockSwitch: UISwitch!
    @IBOutlet weak var generateButton: UIButton!

    @IBOutlet weak var color1: UILabel!
    @IBOutlet weak var color2: UILabel!
    @IBOutlet weak var color3: UILabel!
    @IBOutlet weak var color4: UILabel!
    @IBOutlet weak var color5: UILabel!
    @IBOutlet weak var color6: UILabel!

    @IBOutlet weak var colorStepper: UIStepper!
    
    var red = CGFloat(0.0)
    var green = CGFloat(0.0)
    var blue = CGFloat(0.0)
    
    // source: https://stackoverflow.com/questions/26341008/how-to-convert-uicolor-to-hex-and-display-in-nslog
    func hexStringFromColor(color: UIColor) -> String {
        let components = color.cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0

        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        return hexString
     }
    
    // source: https://developer.apple.com/forums/thread/107522
    func getBaseColor() -> UIColor{
        let randomRed = CGFloat.random(in: (1/4)...(3/4))
        red = randomRed
        let randomGreen = CGFloat.random(in: (1/4)...(3/4))
        green = randomGreen
        let randomBlue = CGFloat.random(in: (1/4)...(3/4))
        blue = randomBlue
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    func getColor2() -> UIColor{
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        return UIColor(red: (randomRed + red)/2, green: (randomGreen + green)/2, blue: (randomBlue + blue)/2, alpha: 1.0)
    }
    
    func getColor3() -> UIColor{
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        return UIColor(red: (randomRed + red)/3, green: (randomGreen + green)/3, blue: (randomBlue + blue)/3, alpha: 1.0)
    }
    
    func getColor4() -> UIColor{
        let randomRed = CGFloat.random(in: 0...(1/4))
        let randomGreen = CGFloat.random(in: 0...(1/4))
        let randomBlue = CGFloat.random(in: 0...(1/4))
        return UIColor(red: (randomRed + red), green: (randomGreen + green), blue: (randomBlue + blue), alpha: 1.0)
    }
    
    func getColor5() -> UIColor{
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)
        return UIColor(red: (randomRed + red)/4, green: (randomGreen + green)/4, blue: (randomBlue + blue)/4, alpha: 1.0)
    }
    
    func getColor6() -> UIColor{
        let randomRed = CGFloat.random(in: 0...(1/2))
        let randomGreen = CGFloat.random(in: 0...(1/2))
        let randomBlue = CGFloat.random(in: 0...(1/2))
        return UIColor(red: (randomRed + red)/4, green: (randomGreen + green)/4, blue: (randomBlue + blue)/4, alpha: 1.0)
    }
    
    @IBAction func incStepper(_ sender: UIStepper) {
        hideColors()
    }
    
    func hideColors() {
        switch colorStepper.value {
            case 1:
                color2.isHidden = true
                color3.isHidden = true
                color4.isHidden = true
                color5.isHidden = true
                color6.isHidden = true
            case 2:
                color2.isHidden = false
                color3.isHidden = true
                color4.isHidden = true
                color5.isHidden = true
                color6.isHidden = true
            case 3:
                color2.isHidden = false
                color3.isHidden = false
                color4.isHidden = true
                color5.isHidden = true
                color6.isHidden = true
            case 4:
                color2.isHidden = false
                color3.isHidden = false
                color4.isHidden = false
                color5.isHidden = true
                color6.isHidden = true
            case 5:
                color2.isHidden = false
                color3.isHidden = false
                color4.isHidden = false
                color5.isHidden = false
                color6.isHidden = true
            case 6:
                color2.isHidden = false
                color3.isHidden = false
                color4.isHidden = false
                color5.isHidden = false
                color6.isHidden = false
            default:
                color2.isHidden = false
                color3.isHidden = false
                color4.isHidden = false
                color5.isHidden = false
                color6.isHidden = false
        }
    }
    

    
    func lockGeneration() {
        if lockSwitch.isOn {
            lockImage.image = UIImage(named: "locked")
            generateButton.isEnabled = false
            generateButton.alpha = 0.5
        } else {
            lockImage.image = UIImage(named: "unlocked")
            generateButton.isEnabled = true
            generateButton.alpha = 1.0
        }
    }
    
    @IBAction func locked(_ sender: UISwitch) {
        lockGeneration()
    }
    
    func makeColors() {
        let text1 = getBaseColor()
        let text2 = getColor2()
        let text3 = getColor3()
        let text4 = getColor4()
        let text5 = getColor5()
        let text6 = getColor6()
        
        color1.backgroundColor = text1
        color1.text = hexStringFromColor(color: text1)
        color2.backgroundColor = text2
        color2.text = hexStringFromColor(color: text2)
        color3.backgroundColor = text3
        color3.text = hexStringFromColor(color: text3)
        color4.backgroundColor = text4
        color4.text = hexStringFromColor(color: text4)
        color5.backgroundColor = text5
        color5.text = hexStringFromColor(color: text5)
        color6.backgroundColor = text6
        color6.text = hexStringFromColor(color: text6)
    }
    
    @IBAction func generateColors(_ sender: UIButton) {
        hideColors()
        makeColors()
    }
    
    override func viewDidLoad() {
        hideColors()
        makeColors()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

