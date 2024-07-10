import Foundation
import SpriteKit

class AudioManager {
    var backgroundMusic: SKAudioNode?

    func playBackgroundMusic(in scene: SKScene) {
        if let musicURL = Bundle.main.url(forResource: "bg", withExtension: "mp3") {
            backgroundMusic = SKAudioNode(url: musicURL)
            if let backgroundMusic = backgroundMusic {
                backgroundMusic.autoplayLooped = true
                // Add the audio node to the provided scene
                scene.addChild(backgroundMusic)
            }
        }
    }
    
    
    func playRockFalling(in scene: SKScene) {
        if let musicURL = Bundle.main.url(forResource: "rock-falling-010-104938", withExtension: "mp3") {
            backgroundMusic = SKAudioNode(url: musicURL)
            if let backgroundMusic = backgroundMusic {
                backgroundMusic.autoplayLooped = false
                // Add the audio node to the provided scene
                scene.addChild(backgroundMusic)
            }
        }
    }
}
