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
    let defaults = UserDefaults.standard
    let playerMovesCountKey = "playerMovesCount"
    var playerMovesCount: Int?
    var count = 0
    var gameWorld: GameWorld?
    
    //MARK: Load Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        gameWorld = GameWorld()
    }
    
    // runs everytime the view is about to load
    override func viewWillAppear(_ animated: Bool) {
        updateInterface()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("saving values")
        defaults.set(playerMovesCount, forKey: playerMovesCountKey)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updateInterface(){
        print("updating interface")
        // load players move count if it exists
        if let moveCount = defaults.object(forKey: playerMovesCountKey) as? Int {
            playerMovesCount = moveCount
            print("moves existed, its value was: \(String(describing: playerMovesCount!))")
        } else {
            playerMovesCount = 0
        }
        playerMovesLabel.text = "\(String(describing: playerMovesCount!))"
    }
    
    //goes with addgesture and isuserenabled stuff
    @IBAction func playerTapped(_ sender: Any) {
        
    }
    
    @IBAction func incrementMoves(_ sender: UIButton) {
        playerMovesCount! += 1
        playerMovesLabel.text = "\(String(describing: playerMovesCount!))"
    }
    
}

