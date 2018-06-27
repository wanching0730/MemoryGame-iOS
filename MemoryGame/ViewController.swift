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
        arrayCount += 1
        showAllWords()
    }
    
}

