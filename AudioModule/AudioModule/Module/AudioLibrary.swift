import AVFoundation

enum SongLibrary : String, CaseIterable {
    case dance = "dance-elevation.mp3"
    case night = "night-at-the-club.mp3"
}

enum IntroWithLoopLibrary: CaseIterable {
    case first
    
    var info : (intro: String, loop: String) {
        switch self {
        case .first:
            return ("intro.mp3", "loop.mp3")
        }
    }
}

enum SoundEffectLibrary : String, CaseIterable {
    case synth = "click-synth.mp3"
    case double = "click-double.mp3"
}
