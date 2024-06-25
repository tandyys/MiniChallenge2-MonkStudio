//
//  redMinion.swift
//  LevelOneMini2
//
//  Created by tandyys on 25/06/24.
//

import Foundation
import SpriteKit
import GameplayKit

class Minion: GKEntity {
//    init(imageName: String) {
//        super.init()
//        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
//        addComponent(spriteComponent)
//    }
    
    weak var entityManager: EntityManager?
    
    init(texture: SKTexture, healthBarSize: CGSize, maxHealth: CGFloat, entityManager: EntityManager) {
        super.init()
        
        self.entityManager = entityManager
        
        let spriteComponent = SpriteComponent(texture: texture)
        spriteComponent.node.size = CGSize(width: 240, height: 200)
        self.addComponent(spriteComponent)
        
        let healthBarComponent = MinionHealthComponent(size: healthBarSize, maxHealth: maxHealth)
        self.addComponent(healthBarComponent)
        
        healthBarComponent.healthBackgroundNode.position = CGPoint(x: 0, y: spriteComponent.node.frame.maxY + 10)
        
        spriteComponent.node.addChild(healthBarComponent.healthBackgroundNode)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init coder hasn't been implemented")
    }
    
    func changeHealth(by delta: CGFloat) {
        if let healthBarComponent = component(ofType: MinionHealthComponent.self) {
            let newHealth = healthBarComponent.currentHealth + delta
            healthBarComponent.updateHealth(to: newHealth)
            
            if newHealth <= 0 {
                if let entityManager = entityManager {
                    entityManager.remove(self)
                }
                if let spriteComponent = component(ofType: SpriteComponent.self) {
                    spriteComponent.node.removeFromParent()
                }
            }
        }
    }
    
}
