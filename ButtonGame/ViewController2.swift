//
//  ViewController2.swift
//  ButtonGame
//
//  Created by Deniz Baran SERBEST on 29.03.2023.
//

import UIKit

class ViewController2: UIViewController {
    
    var timer = Timer()
    var counter = 0
    var array = [UIButton]()
    var selectedButton: UIButton?
    
    @IBOutlet weak var tLabel: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var b10: UIButton!
    @IBOutlet weak var b11: UIButton!
    @IBOutlet weak var b12: UIButton!
    @IBOutlet weak var b13: UIButton!
    @IBOutlet weak var b14: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 5
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tim), userInfo: nil, repeats: true)
        
        array = [b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14]
        for button in array {
            button.addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)
        }
        
        let random = Int(arc4random_uniform(UInt32(array.count - 1)))
        selectedButton = array[random]
    }
    
    // Selector
    @objc func tapped(_ sender: UIButton) {
        if sender == selectedButton {
            timer.invalidate()
            view.backgroundColor = .green
            let alert = UIAlertController(title: "WIN!", message: "You're just lucky", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action: UIAlertAction) in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        } else {
            for button in array {
                if button != selectedButton {
                    sender.backgroundColor = .gray
                }
            }
        }
    }
    
    // Timer
    @objc func tim () {
        tLabel.text = "TIME: \(counter)"
        counter -= 1
        if counter < 0 {
            timer.invalidate()
            view.backgroundColor = .red
            tLabel.text = "TIME'S OVER"
            let alert = UIAlertController(title: "Time's over", message: "You're so slow, try again", preferredStyle: UIAlertController.Style.alert)
            alert.view.backgroundColor = UIColor.red
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action: UIAlertAction) in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
