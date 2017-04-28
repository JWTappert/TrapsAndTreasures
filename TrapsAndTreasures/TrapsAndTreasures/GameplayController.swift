//
//  GameplayController.swift
//  TrapsAndTreasures
//
//  Created by Justin Tappert on 4/20/17.
//  Copyright © 2017 Justin Tappert. All rights reserved.
//

import UIKit

class GameplayController: UIViewController {
    
    //MARK: Attributes
    @IBOutlet weak var playerMovesLabel: UILabel!
    @IBOutlet weak var playerAvatar: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //goes with addgesture and isuserenabled stuff
    @IBAction func playerTapped(_ sender: Any) {
        
    }
    
}

