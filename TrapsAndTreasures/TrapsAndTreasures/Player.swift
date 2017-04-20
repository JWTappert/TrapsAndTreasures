//
//  Player.swift
//  TrapsAndTreasures
//
//  Created by Justin Tappert on 4/20/17.
//  Copyright © 2017 Justin Tappert. All rights reserved.
//

import UIKit

class Player{
    let name: String
    var totalMovementPoints: Int
    
    init(){
        self.name = "Bob"
        self.totalMovementPoints = 0
    }
    
    init(name: String){
        self.name = name
        self.totalMovementPoints = 0
    }
    
    func move(){
        totalMovement--;
            
    }
    
}
