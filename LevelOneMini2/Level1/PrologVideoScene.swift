//
//  PrologVideoScene.swift
//  LevelOneMini2
//
//  Created by tandyys on 27/06/24.
//

import Foundation
import SpriteKit
import AVFoundation

class PrologVideoScene: SKScene {

    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        playPrologueVideo()
    }
    
    func playPrologueVideo() {
        // Path ke file video dalam bundle
        if let path = Bundle.main.path(forResource: "PrologGame", ofType: "mp4") {
            let videoURL = URL(fileURLWithPath: path)
            print("Video URL: \(videoURL)")
            
            // Buat AVPlayer
            player = AVPlayer(url: videoURL)
            
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
        startGameplay()
    }
    
    func startGameplay() {
        print("Gameplay starts now!")
        // Kode untuk memulai gameplay atau berpindah ke scene lain
    }
}
