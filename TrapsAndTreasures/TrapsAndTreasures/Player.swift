class Player {
    let name: String
    var movementPoints: Int
    var traps: Int
    
    init() {
        name = "jack"
        movementPoints = 0
        traps = 1
    }
    
    init(name: String) {
        self.name = name
        movementPoints = 0
        traps = 1
    }
    
    func move(){
        self.movementPoints -= 1;
    }
    
    
}
