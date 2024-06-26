//
//  EntityManager.swift
//  LevelOneMini2
//
//  Created by tandyys on 25/06/24.
//

import Foundation
import SpriteKit
import GameplayKit

class EntityManager {
    var entities = Set<GKEntity>()
    var toRemove = Set<GKEntity>()
    let scene: SKScene
    lazy var componentSystems: [GKComponentSystem] = {
    let minionSystem = GKComponentSystem(componentClass: MinionHealthComponent.self)
      return [minionSystem]
    }()

    init(scene: SKScene) {
        self.scene = scene
    }
    
    func add(_ entity: GKEntity) {
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            scene.addChild(spriteNode)
        }
        
        for componentSystem in componentSystems {
          componentSystem.addComponent(foundIn: entity)
        }
    }

    func remove(_ entity: GKEntity) {
        toRemove.insert(entity)
    }
    
    func update(_ deltaTime: CFTimeInterval) {
        for entity in toRemove {
            entities.remove(entity)
            
            if let spriteComponent = entity.component(ofType: SpriteComponent.self) {
                spriteComponent.node.removeFromParent()
            }
            
            toRemove.removeAll()
            
            for entity in entities {
                entity.update(deltaTime: deltaTime)
            }
        }
    }
    
    func getEntity(for node: SKNode) -> GKEntity? {
           return entities.first { entity in
               if let spriteComponent = entity.component(ofType: SpriteComponent.self) {
                   return spriteComponent.node == node
               }
               return false
           }
       }
}

