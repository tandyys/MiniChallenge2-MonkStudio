//
//  ViewController.swift
//  Level3Stage2
//
//  Created by Christian Gunawan on 18/06/24.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as? SKView {
            // Load the SKScene from 'GameScene.sks'
            let scene = GameScene(size: CGSize(width: 2880, height: 1864))
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
                
            // Present the scene
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = true
        }
    }
    
}
