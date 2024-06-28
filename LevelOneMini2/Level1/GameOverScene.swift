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
        
        let instructionLabel = SKLabelNode(text: "Click anywhere to restart")
        instructionLabel.fontSize = 30
        instructionLabel.fontColor = .gray
        instructionLabel.position = CGPoint(x: frame.midX, y: frame.midY - 60)
        addChild(instructionLabel)
    }
    
    // Detect mouse click or tap
    override func mouseDown(with event: NSEvent) {
//        restartGame()
        newRestartGame()
//        thirdRestartGame()
    }
       
       // Function to restart the game
    private func restartGame() {
        // Transition back to the previous scene or initial game scene
        if let view = self.view, let initialScene = SKScene(fileNamed: "GameScene") {
            initialScene.scaleMode = .aspectFill
            
            // Create a transition effect (optional)
            let transition = SKTransition.flipHorizontal(withDuration: 0.5)
            
            // Present the initial game scene with a transition
            view.presentScene(initialScene, transition: transition)
        }
    }
    
    private func newRestartGame() {
        let restartScene = GameScene(size: self.size)
        let transition = SKTransition.flipHorizontal(withDuration: 1.0)
        self.view?.presentScene(restartScene, transition: transition)
    }
   
    private func thirdRestartGame() {
            if let view = self.view {
                // Load the initial game scene (make sure the file name is correct)
                if let initialScene = SKScene(fileNamed: "GameScene") {
                    initialScene.scaleMode = .aspectFill
                    
                    // Create a transition effect (optional)
                    let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                    
                    // Present the initial game scene with a transition
                    view.presentScene(initialScene, transition: transition)
                } else {
                    print("Error: Could not load GameScene.sks")  // Debug statement
                }
            }
        }
}
