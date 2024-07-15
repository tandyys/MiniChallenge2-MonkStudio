//
//  PrologVideoScene.swift
//  LevelOneMini2
//
//  Created by tandyys on 27/06/24.
//

import Foundation
import SpriteKit
import AVFoundation

class EpilogVideoScene: SKScene {

    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        playEpilogVideo()
    }
    
    func playEpilogVideo() {
        // Path ke file video dalam bundle
        if let path = Bundle.main.url(forResource: "Epilogue", withExtension: ".m4v"){
        
            // Buat AVPlayer
            player = AVPlayer(url: path)
            
            // Buat AVPlayerLayer
            playerLayer = AVPlayerLayer(player: player)
            
            // Set frame dan properti lainnya
            playerLayer?.frame = self.view?.bounds ?? CGRect.zero
            playerLayer?.videoGravity = .resizeAspect
            
            // Tambahkan AVPlayerLayer ke SKView
            if let playerLayer = playerLayer, let skView = self.view {
                print("Adding AVPlayerLayer to SKView")
                skView.layer!.addSublayer(playerLayer)
                player?.play()
                
                // Mengamati akhir dari pemutaran video
                NotificationCenter.default.addObserver(self, selector: #selector(videoDidFinishPlaying(_:)), name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
            } else {
                print("playerLayer or skView is nil")
            }
        } else {
            print("Video path is nil")
        }
    }
    
    @objc func videoDidFinishPlaying(_ notification: Notification) {
        // Hapus observer
        NotificationCenter.default.removeObserver(self)
        
        // Hapus AVPlayerLayer
        playerLayer?.removeFromSuperlayer()
        playerLayer = nil
        player = nil
        
        // Lanjutkan ke gameplay
//        startGameplay()
    }
    
//    func startGameplay() {
//        let reveal = SKTransition.fade(withDuration: 0.5)
//        let scene = GameScene1(size: size)
//        view?.scene?.scaleMode = .aspectFit
//        self.view?.presentScene(scene, transition:reveal)
//    }
}
