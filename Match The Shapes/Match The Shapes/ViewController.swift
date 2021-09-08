//
//  ViewController.swift
//  Match The Shapes
//
//  Created by Jason Warrick on 9/8/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var shapePic: UIImageView!
    @IBOutlet weak var shapeText: UILabel!
    
    let picNames = ["Circle", "Pentagon", "Square", "Star", "Triangle"]
    var imagePos = 0
    var textPos = 2
    
    @IBAction func shuffleImages(_ sender: UIButton) {
        if sender.tag == 1 {
            if imagePos <= 1 {
                imagePos = 5 + imagePos - 2
                shapePic.image=UIImage(named: picNames[imagePos])
            } else {
                imagePos -= 2
                shapePic.image=UIImage(named: picNames[imagePos])
            }
            
            if textPos >= 4 {
                textPos = 0
                shapeText.text = picNames[textPos]
            } else {
                textPos += 1
                shapeText.text = picNames[textPos]
            }
        } else if sender.tag == 2 {
            if textPos <= 1 {
                textPos = 5 + textPos - 2
                shapeText.text = picNames[textPos]
            } else {
                textPos -= 2
                shapeText.text = picNames[textPos]
            }
            
            if imagePos >= 4 {
                imagePos = 0
                shapePic.image=UIImage(named: picNames[imagePos])
            } else {
                imagePos += 1
                shapePic.image=UIImage(named: picNames[imagePos])
            }
        }
    }
    
    @IBAction func nextSet(_ sender: UIButton) {
        if textPos >= 4 {
            textPos = 0
            shapeText.text = picNames[textPos]
        } else {
            textPos += 1
            shapeText.text = picNames[textPos]
        }
        
        if imagePos >= 4 {
            imagePos = 0
            shapePic.image=UIImage(named: picNames[imagePos])
        } else {
            imagePos += 1
            shapePic.image=UIImage(named: picNames[imagePos])
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

