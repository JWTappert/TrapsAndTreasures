//
//  Tile.swift
//  TrapsAndTreasures
//
//  Created by Justin Tappert on 4/20/17.
//  Copyright © 2017 Justin Tappert. All rights reserved.
//

import UIKit

class Tile: UIViewController {
    let index: Int = 0
    var occupiedByPlayer: Bool
    var occupiedByTrap: Bool
    var occupiedByTreasure: Bool
    
    required init?(coder aDecoder: NSCoder) {
        self.occupiedByPlayer = false
        self.occupiedByTrap = false
        self.occupiedByTreasure = false
        super.init(coder: aDecoder)
    }
    
    func isOccupiedByItem() -> Bool{
        if (occupiedByTrap || occupiedByTreasure){
            return true
        }
        return false
    }
    
    func isOccupiedByPlayer() -> Bool{
        if (occupiedByPlayer){
            return true
        }
        return false
    }
    
    func setTrapFlag(){
        if !isOccupiedByItem(){
            self.occupiedByTrap = true
        }
    }
    
    func setTreasureFlag(){
        if !isOccupiedByItem(){
            self.occupiedByTreasure = true
        }
    }
}
