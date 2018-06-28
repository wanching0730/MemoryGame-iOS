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
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIView!
    
    var words = [
        ["utar", "ucsi", "usm", "um", "taylor", "sunway", "tarc"],
        ["php", "java", "python", "javascript", "swift", "css", "html"],
        ["dog", "cat", "mouse", "elephant", "donkey", "rat", "rabbit"],
        ["blue", "red", "yellow", "green", "grey", "white", "purple"],
        ["square", "circle", "oval", "cube", "triangle", "cuboid", "pyramid"],
    ]
    
    var arrayCount: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for textField in wordsTextFieldCollection {
            textField.isUserInteractionEnabled = false
        }
        
        progressLabel.text = "\(arrayCount+1) / 5"
        
        showAllWords()
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    @IBAction func startBtnPressed(_ sender: UIButton) {
        for label in wordsLabelCollection {
            label.text = ""
        }
        
        for textField in wordsTextFieldCollection {
            textField.isUserInteractionEnabled = true
        }
    }
    

    @IBAction func chechResultBtnPressed(_ sender: UIButton) {
        checkResult()
    }
    
    
    @IBAction func giveUpBtnPressed(_ sender: UIButton) {
        showAllWords()
        checkResult()
    }
    

    @IBAction func repeatBtnPressed(_ sender: UIButton) {
        resetAll()
        updateUI()
        showAllWords()
    }
    
    func showAllWords() {
        var count: Int = 0
        
        for label in wordsLabelCollection {
            label.text = words[arrayCount][count]
            count += 1
        }
    }
    
    func checkResult() {
        var count: Int = 0
        
        for textField in wordsTextFieldCollection {
            if textField.text == words[arrayCount][count] {
                textField.textColor = UIColor.green
            } else if textField.text == "" {
                textField.backgroundColor = UIColor.darkGray
            } else {
                textField.textColor = UIColor.red
            }
            
            count += 1
        }
    }
    
    func resetAll() {
        for textField in wordsTextFieldCollection {
            textField.text = ""
            textField.textColor = UIColor.black
            textField.backgroundColor = UIColor.clear
        }
        
        if arrayCount < 4 {
            arrayCount += 1
        } else {
            arrayCount = 0
        }
        
    }
    
    func updateUI() {
        progressBar.frame.size.width = (view.frame.size.width / 5) * CGFloat(arrayCount + 1)
        
        progressLabel.text = "\(arrayCount+1) / 5"
    }
    
}

