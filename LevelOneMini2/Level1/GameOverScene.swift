//
//  GameOverScene.swift
//  LevelOneMini2
//
//  Created by tandyys on 27/06/24.
//

import Foundation
import SpriteKit
import GameplayKit

class GameOverScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        let label = SKLabelNode(text: "Game Over")
        label.fontSize = 50
        label.fontColor = .white
        label.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(label)
    
        // Restart or exit the game after a delay or button press
        // Add more functionality as needed
    }
}
