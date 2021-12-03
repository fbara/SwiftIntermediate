//
//  SoundsBootcamp.swift
//  SwiftIntermediate
//
//  Created by Frank Bara on 12/3/21.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case tada
        case badum
    }
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound: \(error.localizedDescription)")
        }
        
    }
}

struct SoundsBootcamp: View {
    
    var soundManager = SoundManager()
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            Button("Play sound2") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}
