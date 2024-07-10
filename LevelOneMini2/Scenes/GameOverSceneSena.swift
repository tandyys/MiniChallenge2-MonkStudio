//
//  GameOverScene.swift
//  LevelOneMini2
//
//  Created by Sena Kristiawan on 26/06/24.
//

import Foundation
import SpriteKit

class GameOverSceneSena: SKScene {
    override init(size: CGSize) {
    super.init(size: size)
    
    // 1
        backgroundColor = SKColor.black
    
    // 2
    let gameOverLabel = SKSpriteNode(imageNamed: "gameover_name")
      gameOverLabel.position = CGPoint(x: frame.midX, y: frame.midY+200)
      addChild(gameOverLabel)
    
    // 3
    let gameOverButton = SKSpriteNode(imageNamed: "gameover_button")
      gameOverButton.position = CGPoint(x: frame.midX, y: frame.midY-200)
        gameOverButton.name = "gameOverButton"
      addChild(gameOverButton)
    
    // 4
  }
    override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
                let touchedNode = self.atPoint(location)
                
                if touchedNode.name == "gameOverButton" {
                    restartGame()
                }
    }
    func restartGame() {
        let reveal = SKTransition.fade(withDuration: 0.5)
        let scene = GameScene1(size: size)
        view?.scene?.scaleMode = .aspectFit
        self.view?.presentScene(scene, transition:reveal)
    }
  
  // 6
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
