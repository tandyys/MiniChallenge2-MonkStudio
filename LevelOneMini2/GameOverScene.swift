import SpriteKit
import AVFoundation
import Cocoa

class GameManager {
    static let shared = GameManager()

    private init() {}

    func transitionToScene(scene: SKScene, view: SKView, transition: SKTransition) {
        view.presentScene(scene, transition: transition)
    }

    func playVideo(videoURL: URL, view: NSView) {
        let player = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        view.layer?.addSublayer(playerLayer)
        player.play()
    }
}
