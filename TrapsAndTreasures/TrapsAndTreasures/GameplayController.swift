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
    @IBOutlet var tile1: UIView?
    @IBOutlet var tile2: UIView?
    
    //label variables to assign text and such
    @IBOutlet weak var trapsHeldLabel: UILabel!
    @IBOutlet weak var totalStepsHeld: UILabel!
    
    
    //unused so far
    @IBOutlet var tile3: UIView?
    @IBOutlet var tile4: UIView?
    @IBOutlet var tile5: UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //give text to labels
        //trapsHeldLabel.text = "Traps Held"
        //totalStepsHeld.text = "110 Steps"
        player = Player()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        //possibly useless
        //give tiles a tap function
        //tap.addTarget(self, action:"tileTapped")
        
        //add gesture to tiles
        tile1?.addGestureRecognizer(tap)
        tile2?.addGestureRecognizer(tap)
        
        //make sure tiles can be tapped
        tile1?.isUserInteractionEnabled = true
        tile2?.isUserInteractionEnabled = true
        
        
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

