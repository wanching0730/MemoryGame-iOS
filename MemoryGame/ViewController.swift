//
//  ViewController.swift
//  MemoryGame
//
//  Created by Wan Ching on 27/06/2018.
//  Copyright © 2018 Wan Ching. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var wordsLabelCollection: [UILabel]!
    
    
    @IBOutlet var wordsTextFieldCollection: [UITextField]!
    
    
    var words = ["hello", "hallo", "hi", "yeah", "wohoo", "yess", "nooo"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var count: Int = 0
        
        for label in wordsLabelCollection {
            label.text = words[count]
            count += 1
        }

    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    @IBAction func startBtnPressed(_ sender: UIButton) {
        for label in wordsLabelCollection {
            label.text = ""
        }
    }
    
    
    @IBAction func chechResultBtnPressed(_ sender: UIButton) {
        var count: Int = 0
        
        for textField in wordsTextFieldCollection {
            if textField.text == words[count] {
                textField.textColor = UIColor.green
            } else {
                textField.textColor = UIColor.red
            }
            count += 1
        }
    }
    
    
    @IBAction func giveUpBtnPressed(_ sender: UIButton) {
    }
    

    @IBAction func repeatBtnPressed(_ sender: UIButton) {
    }
    
    
    
}

