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
    let defaults = UserDefaults.standard
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    var name: String = ""
    let noNameAlert = UIAlertController(title: "Insert Name", message: "Please enter a name before proceeding", preferredStyle: .alert)
    let nameSavedAlert = UIAlertController(title: "Name Saved", message: "Your username has been saved", preferredStyle: .alert)
    
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
        noNameAlert.addAction(action)
        nameSavedAlert.addAction(action)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //if user is returning
        if let username = defaults.string(forKey: "playerName") {
            playerNameLabel.text = "Welcome back, \(username)"
            nameTextField.text = "\(username)"
            startButton.isEnabled = true
        }
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
                present(noNameAlert, animated: true, completion: nil)
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
        defaults.set(name, forKey: "playerName")
        present(nameSavedAlert, animated: true, completion: nil)
    }
    
}

