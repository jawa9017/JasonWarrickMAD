//
//  ViewController.swift
//  ereader
//
//  Created by Jason Warrick on 9/22/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookText: UILabel!
    @IBOutlet weak var fontColorLabel: UILabel!
    
    @IBOutlet weak var bookControl: UISegmentedControl!
    @IBOutlet weak var capsControl: UISwitch!

    
    func updateImage() {
        if bookControl.selectedSegmentIndex == 0 {
            bookText.text = "In my younger and more vulnerable years my father gave me some advice that I've been turning over in my mind ever since."
            bookImage.image = UIImage(named: "greatGasby")
        } else if bookControl.selectedSegmentIndex == 1{
            bookText.text = "All this happened, more or less."
            bookImage.image = UIImage(named: "slaughterhouse5")
        } else if bookControl.selectedSegmentIndex == 2{
            bookText.text = "Robert Cohn was once middleweight boxing champion of princeton."
            bookImage.image = UIImage(named: "sunri")
        }
    }

    func updateCaps() {
        if capsControl.isOn {
            bookText.text = bookText.text?.uppercased()
        } else {
            bookText.text = bookText.text?.lowercased()
        }
    }
    
    
    @IBAction func changeBook(_ sender: UISegmentedControl) {
        updateImage()
        updateCaps()
    }
    
    
    @IBAction func updateCaps(_ sender: UISwitch) {
        updateCaps()
    }
    
    @IBAction func changeColor(_ sender: UISlider) {
        if sender.value >= 1 && sender.value < 2 {
            bookText.textColor = UIColor.black
        } else if sender.value >= 2 && sender.value < 3 {
            bookText.textColor = UIColor.red
        } else if sender.value >= 3 && sender.value < 4 {
            bookText.textColor = UIColor.green
        } else if sender.value >= 4  && sender.value < 5 {
            bookText.textColor = UIColor.blue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

