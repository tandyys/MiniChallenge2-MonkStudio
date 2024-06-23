//
//  GameScenePhysicsDelegate.swift
//  LevelOneMini2
//
//  Created by tandyys on 19/06/24.
//

import Foundation
import SpriteKit

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if contactMask ==  SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.tower {
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.tower ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position {
                displayTextTower(at: towerPosition)
            }
        }
    }
    
    func displayTextTower(at position: CGPoint) {
        let text = SKLabelNode(text: "Press Q to activate!")
        text.position = position
        text.zPosition = SKSpriteNode.Layer.label.rawValue
        text.fontSize = 36
        text.fontColor = SKColor.white
        addChild(text)
        
        text.run(SKAction.sequence([
            SKAction.wait(forDuration: 5.0),
            SKAction.removeFromParent()
        ]))
    }
}
