//
//  ViewController.swift
//  LevelOneMini2
//
//  Created by tandyys on 18/06/24.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as? SKView {
            // Load the SKScene from 'GameScene.sks'
//            let scene = HomeScene(size: view.bounds.size)
            let scene = GameScene(size: view.bounds.size)
//            let scene = PrologVideoScene(size: view.bounds.size)
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
                
            // Present the scene
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = false
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = false
        }
    }
    
}

