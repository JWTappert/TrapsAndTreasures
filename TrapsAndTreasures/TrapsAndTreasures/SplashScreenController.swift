//
//  SplashScreenController.swift
//  TrapsAndTreasures
//
//  Created by Justin Tappert on 4/22/17.
//  Copyright © 2017 Justin Tappert. All rights reserved.
//

import UIKit

class SplashScreenController: UIViewController {
    
    //MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func splashButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "splashSegue", sender: nil)
    }
    
}
