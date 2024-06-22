//
//  GameScenePhysicsDelegate.swift
//  LevelOneMini2
//
//  Created by tandyys on 19/06/24.
//

import Foundation
import SpriteKit
import GameplayKit

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        //Text Label mechanism
        let towerContactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        //Red Tower
        if towerContactMask ==  SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerRedNotActivated {
            activateRedTowerButtonAvailable = true
            
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerRedNotActivated ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position {
                displayTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
        
        //Purple Tower
        if towerContactMask ==  SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated {
            activatePurpleTowerButtonAvailable = true
            
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerPurpleNotActivated ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position {
                displayTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }

        //Blue Tower
        if towerContactMask ==  SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerBlueNotActivated {
            activateBlueTowerButtonAvailable = true
            
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerBlueNotActivated ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position {
                displayTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
        
        //Green Tower
        if towerContactMask ==  SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerGreenNotActivated {
            activateGreenTowerButtonAvailable = true
            
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerGreenNotActivated ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position {
                displayTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        
        let towerContactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        //Red Tower
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerRedNotActivated {
            activateRedTowerButtonAvailable = false
        }
        //Purple Tower
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated {
            activatePurpleTowerButtonAvailable = false
        }
        //Blue Tower
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerBlueNotActivated {
            activateBlueTowerButtonAvailable = false
        }
        //Green Tower
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerGreenNotActivated {
            activateGreenTowerButtonAvailable = false
        }
    }
    
}
