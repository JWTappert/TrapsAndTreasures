//
//  GameplayController.swift
//  TrapsAndTreasures
//
//  Created by Justin Tappert on 4/20/17.
//  Copyright © 2017 Justin Tappert. All rights reserved.
//

import UIKit
import PusherSwift

class GameplayController: UIViewController {
    
    //MARK: Attributes
    @IBOutlet weak var playerMovesLabel: UILabel!
    @IBOutlet weak var playerAvatar: UILabel!
    @IBOutlet weak var playerTrapCountLabel: UILabel!
    
    @IBOutlet var tiles: [UIView]!
    
    var index = 0
    let defaults = UserDefaults.standard
    let playerMovesCountKey = "playerMovesCount"
    let playerTrapCountKey = "playerTrapCount"
    var playerMovesCount: Int?
    var playerTrapCount: Int?
    var count = 0
    var gameWorld: GameWorld?
    var hasTrap = -1
    
    let noMovesAlert = UIAlertController(title: "Out of Moves", message: "Click the get moves button to get more moves", preferredStyle: .alert)
    
    let pusher = Pusher(
        key: "338b7804d638b00a56a2",
        options: PusherClientOptions(host: .cluster("us2"))
    )
    
    //MARK: Load Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        gameWorld = GameWorld()
        let action = UIAlertAction(title: "OK", style: .default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        noMovesAlert.addAction(action)
        
        let channel = pusher.subscribe("movement")
        
        let _ = channel.bind(eventName: "new", callback: { (data: Any?) -> Void in
            if let data = data as? [String : AnyObject] {
                if let message = data["message"] as? String {
                    print(message)
                }
            }
        })
        
        pusher.connect()
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
        
        if let trapCount = defaults.object(forKey: playerTrapCountKey) as? Int {
            playerTrapCount = trapCount
            print("traps existed, its value was: \(String(describing: playerTrapCount!))")
        } else {
            playerTrapCount = 1
        }
        playerTrapCountLabel.text = "\(String(describing: playerTrapCount))"

        
        if let playerIndex = defaults.object(forKey: "playerIndex") as? Int {
            index = playerIndex
            print("got index: \(index)")
        }
        
        if index >= tiles.count {
            index = 0
        }
        
        tiles[index].addSubview(playerAvatar)
        playerAvatar.bringSubview(toFront: tiles[index])
    }
    
    //goes with addgesture and isuserenabled stuff
    @IBAction func playerTapped(_ sender: Any) {
        if playerMovesCount! <= 0 {
            present(noMovesAlert, animated: true, completion: nil)
            return
        }
        index = index + 1
        print("player tapped")
        print(index)
        if index >= tiles.count {
            index = 0
        }
        tiles[index].addSubview(playerAvatar)
        playerAvatar.bringSubview(toFront: tiles[index])
        
        if(hasTrap == index){
            print("Trap activated. You lose 10 moves")
            playerMovesCount = playerMovesCount! - 10
            hasTrap = -1
        }
        
        playerMovesCount = playerMovesCount! - 1
        playerMovesLabel.text = "\(String(describing: playerMovesCount!))"
        
        
        defaults.set(index, forKey: "playerIndex")
    }
    @IBAction func dropTrap(_ sender: UILongPressGestureRecognizer) {
        if playerTrapCount! <= 0 {
            print("You out of traps, fam")
        }
        else if(hasTrap != -1){
            print("Trap already Placed")
        }
        else {
            playerTrapCount = playerTrapCount! - 1
        playerTrapCountLabel.text = "\(String(describing: playerTrapCount))"
        hasTrap = index
        }
    }
    
    @IBAction func incrementMoves(_ sender: UIButton) {
        playerMovesCount! += 1
        playerMovesLabel.text = "\(String(describing: playerMovesCount!))"
    }
    
}

