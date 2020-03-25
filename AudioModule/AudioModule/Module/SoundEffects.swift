import AVFoundation

class SoundEffect {
    
    private var players = [AVAudioPlayer]()
    private var url: URL
    
    init(fileName: String) {
        let path = Bundle.main.path(forResource: fileName, ofType : nil)!
        url = URL(fileURLWithPath: path)

        load()
    }
    
    private func load() {
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            players.append(player)
        } catch {
            fatalError("Fatal Error - Sound Effects Player")
        }
    }
    
    func play() {
        for player in players {
            if player.isPlaying == false {
                
                DispatchQueue.global().async {
                    player.play()
                }
                
                return
            }
        }
        
        load()
        
        DispatchQueue.global().async {
            self.players.last?.play()
        }
    }
}
