//
//  ViewController.swift
//  LevelOneMini2
//
//  Created by tandyys on 18/06/24.
//

import Cocoa
import SpriteKit
import GameplayKit
//import UIKit

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as? SKView {
            // Load the SKScene from 'GameScene.sks'
            let scene = GameScene1(size: view.bounds.size)
//            let scene = GameScene32(size: view.bounds.size)
//            let scene = GameScene31(size: view.bounds.size)
//            let scene = Intro(size: view.bounds.size)x
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
                
            // Present the scene
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = false
            view.presentScene(scene)
        }
    }
    
}

