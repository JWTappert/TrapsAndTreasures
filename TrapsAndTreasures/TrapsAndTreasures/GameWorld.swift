class GameWorld {
    let player: Player
    
    init() {
        self.player = Player()
    }
    
    init(player: Player){
        self.player = player
    }
}
