import SpriteKit
import AVFoundation
import Cocoa

class GameManager {
    static let shared = GameManager()

    private init() {}

    private var currentScene: SKScene?

    func transitionToScene(scene: SKScene, view: SKView, transition: SKTransition) {
        view.presentScene(scene, transition: transition)
        currentScene = scene
    }

    func closeCurrentScene() {
        if let scene = currentScene {
            scene.removeAllActions()
            scene.removeAllChildren()
            currentScene = nil
        }
    }
    func playVideo(videoURL: URL, view: NSView) {
         closeCurrentScene() // Close the current scene before playing the video

         let player = AVPlayer(url: videoURL)
         let playerLayer = AVPlayerLayer(player: player)
         playerLayer.frame = view.bounds
         view.layer?.addSublayer(playerLayer)
         player.play()

         // Create a new scene after playing the video
         let newScene = SKScene(size: CGSize(width: 2880, height: 1864))
         newScene.backgroundColor = .white // Set the background color of the new scene

         // Transition to the new scene
         transitionToScene(scene: newScene, view: view as! SKView, transition: SKTransition.fade(withDuration: 1.0))
     }}
    
