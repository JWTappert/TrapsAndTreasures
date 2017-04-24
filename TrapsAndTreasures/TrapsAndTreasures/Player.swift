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
    let view: UIView?
    
    init(){
        self.name = "Bob"
        self.totalMovementPoints = 0
        self.view = nil
    }
    
    init(name: String){
        self.name = name
        self.totalMovementPoints = 0
        self.view = nil
    }
    
    init(view: UIView){
        self.name = "Bob"
        self.totalMovementPoints = 0
        self.view = view
    }
    
    func move(){
        self.totalMovementPoints -= 1;
            
    }
    
    
}
