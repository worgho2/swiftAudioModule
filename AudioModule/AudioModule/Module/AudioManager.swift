import AVFoundation

class AudioManager{
    static let shared = AudioManager()
    
    private var soundEffects = [SoundEffectLibrary : SoundEffect]()
    private var songs = [SongLibrary : Song]()
    private var introsWithLoops = [IntroWithLoopLibrary : Song]()

    private init() {
        SoundEffectLibrary.allCases.forEach( { soundEffects[$0] = SoundEffect(fileName: $0.rawValue) } )
        SongLibrary.allCases.forEach( { songs[$0] = Song(fileName: $0.rawValue) } )
        IntroWithLoopLibrary.allCases.forEach( { introsWithLoops[$0] = IntroWithLoop(introFileName: $0.info.intro, loopFileName: $0.info.loop) } )
    }
    
    func play(soundEffect: SoundEffectLibrary) {
        soundEffects[soundEffect]?.play()
    }
    
    func play(song: SongLibrary) {
        stopSongs()
        stopIntrosWithLoops()
        songs[song]?.play()
    }
    
    func play(introWithLoop: IntroWithLoopLibrary) {
        stopSongs()
        stopIntrosWithLoops()
        introsWithLoops[introWithLoop]?.play()
    }
    
    func stopCurrentSong() {
        stopIntrosWithLoops()
        stopSongs()
    }
    
    private func stopSongs() {
        songs.forEach( { $0.value.stop() } )
    }
    
    private func stopIntrosWithLoops() {
        introsWithLoops.forEach( { $0.value.stop() } )
    }
    
}
