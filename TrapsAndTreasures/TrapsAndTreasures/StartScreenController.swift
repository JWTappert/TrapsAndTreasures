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
    @IBOutlet weak var startButton: UIButton!
    var name: String = ""
    let alert = UIAlertController(title: "Insert Name", message: "Please enter a name before proceeding", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.isEnabled = false
        // handle the text fields user input through delagate callbacks
        nameTextField.delegate = self
        
        //alert handling
        let action = UIAlertAction(title: "OK", style: .default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        alert.addAction(action)
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
        if let name = nameTextField.text {
            if (name.isEmpty || name == " ") {
                present(alert, animated: true, completion: nil)
                return
            } else {
                self.name = name
                playerNameLabel.text = "Welcome, \(name)!"
                startButton.isEnabled = true
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (nameTextField.text!.isEmpty){
            startButton.isEnabled = false
        }
        if (!name.isEmpty){
            textField.text = name
        }
    }
    
    //MARK: Actions
    @IBAction func setUsername(_ sender: UIButton) {
        playerNameLabel.text = "Welcome, \(String(describing: nameTextField.text!))!"
    }
    
}

