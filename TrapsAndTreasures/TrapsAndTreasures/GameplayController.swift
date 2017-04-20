//
//  GameplayController.swift
//  TrapsAndTreasures
//
//  Created by Justin Tappert on 4/20/17.
//  Copyright © 2017 Justin Tappert. All rights reserved.
//

import UIKit

class GameplayController: UIViewController {
    
    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func playerTapped(_ sender: Any) {
        player.move()
    }
}

