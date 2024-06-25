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
            createWhite1ProgressBar(at: CGPoint(x: tower1White.position.x, y: tower1White.frame.maxY))
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite1Activated ? contact.bodyB.node : contact.bodyA.node
            
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
            createWhite2ProgressBar(at: CGPoint(x: tower2White.position.x, y: tower2White.frame.maxY))
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite2NotActivated ? contact.bodyB.node : contact.bodyA.node
            
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
            createWhite3ProgressBar(at: CGPoint(x: tower1White.position.x, y: tower1White.frame.maxY))
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite3Destroyed ? contact.bodyB.node : contact.bodyA.node
            
            if let towerPosition = towerNode?.position{
                displayActivateTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        let towerContactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite1Destroyed {
//            let towerNode = towerContactMask == SKSpriteNode.PhysicsCategory.towerWhite1Destroyed ?
//            contact.bodyA.node : contact.bodyB.node
            buildWhite1TowerAvailable = false
            removeActivateTextTower()
            removeBuildTextTower()
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite1NotActivated {
            activateWhite1TowerButtonAvailable = false
            removeWhite1ProgressBar()
            removeActivateTextTower()
            removeBuildTextTower()
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite2Destroyed {
            buildWhite2TowerAvailable = false
            removeActivateTextTower()
            removeBuildTextTower()
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite2NotActivated {
            activateWhite2TowerButtonAvailable = false
            removeWhite2ProgressBar()
            removeActivateTextTower()
            removeBuildTextTower()
            
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite3Destroyed {
            buildWhite3TowerAvailable = false
            removeActivateTextTower()
            removeBuildTextTower()
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite3NotActivated {
            activateWhite3TowerButtonAvailable = false
            removeWhite3ProgressBar()
            removeActivateTextTower()
            removeBuildTextTower()
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
            removeRedProgressBar()
        }
        //Purple Tower
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated {
            activatePurpleTowerButtonAvailable = false
            removePurpleProgressBar()
        }
        //Blue Tower
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerBlueNotActivated {
            activateBlueTowerButtonAvailable = false
            removeBlueProgressBar()
        }
        //Green Tower
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerGreenNotActivated {
            activateGreenTowerButtonAvailable = false
            removeGreenProgressBar()
        }
    }
    
}
