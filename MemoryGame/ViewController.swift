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
    
    
    @IBOutlet weak var wordsTextField1: UITextField!
    @IBOutlet weak var wordsTextField2: UITextField!
    @IBOutlet weak var wordsTextField3: UITextField!
    @IBOutlet weak var wordsTextField4: UITextField!
    @IBOutlet weak var wordsTextField5: UITextField!
    @IBOutlet weak var wordsTextField6: UITextField!
    @IBOutlet weak var wordsTextField7: UITextField!
    
    var words = ["hello", "hallo", "hi", "yeah", "wohoo", "yess", "nooo"]
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    
    
    @IBAction func chechResultBtnPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func giveUpBtnPressed(_ sender: UIButton) {
    }
    

    @IBAction func repeatBtnPressed(_ sender: UIButton) {
    }
    
    func showWords() {
        
    }
    
}

