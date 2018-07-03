//
//  ViewController.swift
//  MemoryGame
//
//  Created by Wan Ching on 27/06/2018.
//  Copyright © 2018 Wan Ching. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var wordsLabelCollection: [UILabel]!
    
    @IBOutlet var wordsTextFieldCollection: [UITextField]!
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var checkAnswerBtn: UIButton!
    
    @IBOutlet weak var giveUpBtn: UIButton!
    
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
    
        unableInput()
        showAllWords()
        controlButtons(enable: false)
        
        progressLabel.text = "\(arrayCount+1) / 5"
        
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
            textField.delegate = self
        }
        
        controlButtons(enable: true)
    }
    

    @IBAction func chechResultBtnPressed(_ sender: UIButton) {
        showAllWords()
        checkResult()
    }
    
    
    @IBAction func giveUpBtnPressed(_ sender: UIButton) {
        showAllWords()
    }
    

    @IBAction func repeatBtnPressed(_ sender: UIButton) {
        if arrayCount == 4 {
            showAlert()
        }
        
        resetAll()
        updateGameProgress()
        unableInput()
        controlButtons(enable: false)
        showAllWords()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
            textField.backgroundColor = UIColor.white
        }
        
        if arrayCount < 4 {
            arrayCount += 1
        } else {
            self.arrayCount = 0
        }
        
    }
    
    func updateGameProgress() {
        progressBar.frame.size.width = (view.frame.size.width / 5) * CGFloat(arrayCount + 1)
        
        progressLabel.text = "\(arrayCount+1) / 5"
    }
    
    func unableInput() {
        for textField in wordsTextFieldCollection {
            textField.isUserInteractionEnabled = false
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(
            title: "The End",
            message: "The game is ended. Click Continue to repeat the game",
            preferredStyle: .alert
        )
        
        let cancelAction = UIAlertAction(
            title:"Continue",
            style: UIAlertActionStyle.cancel,
            handler: nil
        )
        
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func controlButtons(enable: Bool) {
        if enable {
            checkAnswerBtn.isEnabled = true
            giveUpBtn.isEnabled = true
            startBtn.isEnabled = false
        } else {
            checkAnswerBtn.isEnabled = false
            giveUpBtn.isEnabled = false
            startBtn.isEnabled = true
        }
    }
    
}

