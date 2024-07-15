//
//  MonsterGeneratorSetUp.swift
//  LevelOneMini2
//
//  Created by tandyys on 25/06/24.
//

import Foundation
import SpriteKit
import GameplayKit
import AVFoundation

extension GameScene31 {

    
    func spawnRedMonster() {
//        let minionTexture = SKTexture(imageNamed: "walk-\(imageCode)-1")
        let minSpawn = -4000
        let maxSpawn = 8000
        let minionTexture = SKTexture(imageNamed: "walk-r-1")
        let healthBarSize = CGSize(width: 100, height: 20)
        let maxHealth = 100.0
        let position = Int.random(in: minSpawn...maxSpawn )
        let minion = Minion(texture: minionTexture, healthBarSize: healthBarSize, maxHealth: maxHealth, entityManager: entityManager, position: position)
        
        if let spriteComponent = minion.component(ofType: SpriteComponent.self) {
            
            spriteComponent.node.name = UUID().uuidString

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
        entityManager.add(minion)
    }
    
    func spawnBlueMonster() {
        let minSpawn = -4000
        let maxSpawn = 8000
//        let minionTexture = SKTexture(imageNamed: "walk-\(imageCode)-1")
        let minionTexture = SKTexture(imageNamed: "walk-b-1")
        let healthBarSize = CGSize(width: 100, height: 20)
        let maxHealth = 100.0
        let position = Int.random(in: minSpawn...maxSpawn )
        let minion = Minion(texture: minionTexture, healthBarSize: healthBarSize, maxHealth: maxHealth, entityManager: entityManager, position: position)
        
        if let spriteComponent = minion.component(ofType: SpriteComponent.self) {
            
            spriteComponent.node.name = UUID().uuidString

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
        entityManager.add(minion)
    }
    
    func spawnPurpleMonster() {
        let minSpawn = -4000
        let maxSpawn = 8000
//        let minionTexture = SKTexture(imageNamed: "walk-\(imageCode)-1")
        let minionTexture = SKTexture(imageNamed: "walk-p-1")
        let healthBarSize = CGSize(width: 100, height: 20)
        let maxHealth = 100.0
        let position = Int.random(in: minSpawn...maxSpawn )
        let minion = Minion(texture: minionTexture, healthBarSize: healthBarSize, maxHealth: maxHealth, entityManager: entityManager, position: position)
        
        if let spriteComponent = minion.component(ofType: SpriteComponent.self) {
            
            spriteComponent.node.name = UUID().uuidString

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
        entityManager.add(minion)
    }
    
}
