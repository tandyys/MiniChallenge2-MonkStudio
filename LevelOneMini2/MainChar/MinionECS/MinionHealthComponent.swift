//
//  MinionHealthComponent.swift
//  LevelOneMini2
//
//  Created by tandyys on 25/06/24.
//

import Foundation
import SpriteKit
import GameplayKit

class MinionHealthComponent: GKComponent {
    let healthBarNode: SKSpriteNode
    let healthBackgroundNode: SKSpriteNode
    
    @GKInspectable var maxHealth: CGFloat
    @GKInspectable var currentHealth: CGFloat
    
    init(size: CGSize, maxHealth: CGFloat) {
        self.maxHealth = maxHealth
        self.currentHealth = maxHealth
        
        self.healthBackgroundNode = SKSpriteNode(imageNamed: "MinionHB_bg")
        
        self.healthBarNode = SKSpriteNode(imageNamed: "MinionHB_fill")
        self.healthBarNode.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.healthBarNode.position = CGPoint(x: healthBackgroundNode.frame.minX, y: 0)
        
        self.healthBackgroundNode.addChild(self.healthBarNode)
        
        super.init()
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init has not been implemented")
    }
    
    func updateHealth(to health: CGFloat) {
        self.currentHealth = max(0, min(health, maxHealth))
        let healthScale = currentHealth / maxHealth
        self.healthBarNode.xScale = healthScale
    }
    
    
    
}
