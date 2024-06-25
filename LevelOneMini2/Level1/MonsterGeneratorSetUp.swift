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
    func setUpMonsterGenerator() {
        // Create a new entity for the monster generator
        let generatorEntity = GKEntity()
        
        // Create and configure the MonsterGeneratorComponent
        let monsterGenerator = MonsterGeneratorComponent()
        monsterGenerator.monsterType = "b"  // Example type
        monsterGenerator.maxMonsters = 50   // Example max monsters
        monsterGenerator.monsterHealth = 100  // Example monster health
        monsterGenerator.waitTime = 3  // Example wait time
        monsterGenerator.entityManager = entityManager
                
        // Add the component to the entity
        generatorEntity.addComponent(monsterGenerator)
        
        // Set up a node for the generator entity
        let generatorNode = SKNode()
        generatorNode.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)  // Example position
        addChild(generatorNode)
                
        // Assign the node to the component
//        monsterGenerator.componentNode = generatorNode
            
        // Add the generator entity to the entity manager
        entityManager.add(generatorEntity)
    }
}
