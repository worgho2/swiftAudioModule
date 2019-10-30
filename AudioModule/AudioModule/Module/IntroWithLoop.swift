import AVFoundation

class IntroWithLoop : Song, AVAudioPlayerDelegate {
    
    private var player: AVAudioPlayer!
    
    init(introFileName: String, loopFileName: String) {
        super.init(fileName: loopFileName)
        self.player = super.load(fileName: introFileName)
        self.player.numberOfLoops = 0
        self.player.delegate = self
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        super.play()
    }
    
    override func play() {
        self.player.play()
    }
    
    override func stop() {
        self.player.stop()
        self.player.currentTime = 0
        super.stop()
    }
    
}
 
