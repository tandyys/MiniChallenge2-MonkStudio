//
//  MonsterGeneratorSetUp.swift
//  LevelOneMini2
//
//  Created by tandyys on 25/06/24.
//

import Foundation
import SpriteKit
import GameplayKit

extension GameScene {
    func random() -> CGFloat {
      return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }

    func random(min: CGFloat, max: CGFloat) -> CGFloat {
      return random() * (max - min) + min
    }
    
    func spawnMonster(_ imageCode: String) {
        let minionTexture = SKTexture(imageNamed: "walk-\(imageCode)-1")
        let healthBarSize = CGSize(width: 100, height: 20)
        let maxHealth = 100.0
        let minion = Minion(texture: minionTexture, healthBarSize: healthBarSize, maxHealth: maxHealth, entityManager: entityManager)
        
        if let spriteComponent = minion.component(ofType: SpriteComponent.self) {

            entityManager.add(minion)

            minion.setTargetAgent(kecil.playerAgent)
            
            let updateAction = SKAction.run { [self] in
                minion.minionAgent.update(deltaTime: 1.0/60.0)
                spriteComponent.node.position = CGPoint(x: CGFloat(minion.minionAgent.position.x), y: CGFloat(minion.minionAgent.position.y))
                
                if minion.minionAgent.position.x < kecil.playerAgent.position.x {
                    spriteComponent.node.xScale = -1
                } else {
                    spriteComponent.node.xScale = 1
                }
            }
            
            let updateLoop = SKAction.repeatForever(SKAction.sequence([updateAction, SKAction.wait(forDuration: 1.0 / 60.0)]))
            
            run(updateLoop)
        }
    }
    
}
