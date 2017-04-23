//
//  ViewController.swift
//  TrapsAndTreasures
//
//  Created by Justin Tappert on 4/19/17.
//  Copyright © 2017 Justin Tappert. All rights reserved.
//

import UIKit

class StartScreenController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var playerNameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // handle the text fields user input through delagate callbacks
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: UITextFieldDelagate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        playerNameLabel.text = "Welcome, \(String(describing: textField.text!))!"
    }

    //MARK: Actions
    @IBAction func setUsername(_ sender: UIButton) {
        playerNameLabel.text = "Enter your username"
    }
    
}

