//
//  GameplayController.swift
//  TrapsAndTreasures
//
//  Created by Justin Tappert on 4/20/17.
//  Copyright © 2017 Justin Tappert. All rights reserved.
//

import UIKit

class GameplayController: UIViewController {
    
    //player
    var player: Player?
    
    //tap variable
    let tap = UITapGestureRecognizer()
    
    //uiview variables to control gestures
    //and placements
    @IBOutlet var playerAvatar: UIView?
    
    //label variables to assign text and such
    @IBOutlet weak var trapsHeldLabel: UILabel!
    @IBOutlet weak var totalStepsHeld: UILabel!
    
    
    
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
    
    //for when tile is tapped
    //currently ONLY tile2 recognizer is linked to this
    @IBAction func tileTapped(_ sender: AnyObject){
        //tile tapped is given as sender
        //center player on tile tapped
        playerAvatar?.center = sender.center
    }
}

