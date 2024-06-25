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
//    func setUpMonsterGenerator() {
//        // Create a new entity for the monster generator
//        let generatorEntity = GKEntity()
//        
//        // Create and configure the MonsterGeneratorComponent
//        let monsterGenerator = MonsterGeneratorComponent()
//        monsterGenerator.monsterType = "b"  // Example type
//        monsterGenerator.maxMonsters = 50   // Example max monsters
//        monsterGenerator.monsterHealth = 100  // Example monster health
//        monsterGenerator.waitTime = 3  // Example wait time
//        monsterGenerator.entityManager = entityManager
//                
//        // Add the component to the entity
//        generatorEntity.addComponent(monsterGenerator)
//        
//        // Set up a node for the generator entity
//        let generatorNode = SKNode()
//        generatorNode.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)  // Example position
//        addChild(generatorNode)
//                
//        // Assign the node to the component
////        monsterGenerator.componentNode = generatorNode
//            
//        // Add the generator entity to the entity manager
//        entityManager.add(generatorEntity)
//    }
    
    func random() -> CGFloat {
      return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }

    func random(min: CGFloat, max: CGFloat) -> CGFloat {
      return random() * (max - min) + min
    }
    
    func spawnMonster() {
        let minionTexture = SKTexture(imageNamed: "walk-b-1")
        let healthBarSize = CGSize(width: 100, height: 20)
        let maxHealth = 100.0
        let minion = Minion(texture: minionTexture, healthBarSize: healthBarSize, maxHealth: maxHealth, entityManager: entityManager)
        // Determine where to spawn the monster along the Y axis
        let actualY = random(min: 50, max: 1180)
        if let spriteComponent = minion.component(ofType: SpriteComponent.self) {
            spriteComponent.node.position = CGPoint(x: size.width + self.size.width/2, y: actualY)
            spriteComponent.node.zPosition = SKSpriteNode.Layer.monster.rawValue
            entityManager.add(minion)
            // Determine speed of the monster
//            let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
            let actualDuration = 20.0
            
            // Create the actions
            let actionMove = SKAction.move(to: CGPoint(x: -minionTexture.size().width/2, y: actualY),
                                           duration: TimeInterval(actualDuration))
            let actionMoveDone = SKAction.removeFromParent()
            spriteComponent.node.run(SKAction.sequence([actionMove, actionMoveDone]))
        }
    }
    
}
