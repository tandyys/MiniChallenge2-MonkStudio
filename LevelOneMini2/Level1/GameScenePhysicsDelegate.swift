//
//  GameScenePhysicsDelegate.swift
//  LevelOneMini2
//
//  Created by tandyys on 19/06/24.
//

import Foundation
import SpriteKit
import GameplayKit

extension GameScene31: SKPhysicsContactDelegate{
    func didBegin(_ contact: SKPhysicsContact) {
        //Text Label mechanism
        let towerContactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        //White Tower
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite1Destroyed{
            buildWhite1TowerAvailable = true
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite1Destroyed ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position{
                displayBuildTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite1NotActivated{
            activateWhite1TowerButtonAvailable = true
            createWhiteProgressBar(at: CGPoint(x: tower1White.position.x, y: tower1White.position.y))
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite1Activated ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position{
                displayActivateTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite2Destroyed{
            buildWhite2TowerAvailable = true
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite2Destroyed ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position{
                displayBuildTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite2NotActivated{
            activateWhite2TowerButtonAvailable = true
            createWhiteProgressBar(at: CGPoint(x: tower2White.position.x, y: tower2White.position.y))
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite2NotActivated ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position{
                displayActivateTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite3Destroyed{
            buildWhite3TowerAvailable = true
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite3Destroyed ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position{
                displayBuildTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite3NotActivated{
            activateWhite3TowerButtonAvailable = true
            createWhiteProgressBar(at: CGPoint(x: tower3White.position.x, y: tower3White.position.y))
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite3Destroyed ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position{
                displayActivateTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        let towerContactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite1Destroyed {
            buildWhite1TowerAvailable = false
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite1NotActivated {
            activateWhite1TowerButtonAvailable = false
            removeProgressBar()
            
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite2Destroyed {
            buildWhite2TowerAvailable = false
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite2NotActivated {
            activateWhite2TowerButtonAvailable = false
            removeProgressBar()
            
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite3Destroyed {
            buildWhite3TowerAvailable = false
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite3NotActivated {
            activateWhite3TowerButtonAvailable = false
            removeProgressBar()
            
        }
    }
}
extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        //Text Label mechanism
        let towerContactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        
        //Red Tower
        if towerContactMask ==  SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerRedNotActivated {
            activateRedTowerButtonAvailable = true
            createRedProgressBar(at: CGPoint(x: towerRed.position.x, y: towerRed.position.y))
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerRedNotActivated ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position {
                displayTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
        
        //Purple Tower
        if towerContactMask ==  SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated {
            activatePurpleTowerButtonAvailable = true
            createPurpleProgressBar(at: CGPoint(x: towerPurple.position.x, y: towerPurple.frame.maxY))
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerPurpleNotActivated ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position {
                displayTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }

        //Blue Tower
        if towerContactMask ==  SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerBlueNotActivated {
            activateBlueTowerButtonAvailable = true
            createBlueProgressBar(at: CGPoint(x: towerBlue.position.x, y: towerBlue.frame.maxY))
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerBlueNotActivated ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position {
                displayTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
        
        //Green Tower
        if towerContactMask ==  SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerGreenNotActivated {
            activateGreenTowerButtonAvailable = true
            createGreenProgressBar(at: CGPoint(x: towerGreen.position.x, y: towerGreen.position.y))
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
            removeProgressBar()
        }
        //Purple Tower
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated {
            activatePurpleTowerButtonAvailable = false
            removeProgressBar()
        }
        //Blue Tower
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerBlueNotActivated {
            activateBlueTowerButtonAvailable = false
            removeProgressBar()
        }
        //Green Tower
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerGreenNotActivated {
            activateGreenTowerButtonAvailable = false
            removeProgressBar()
        }
    }
    
}
