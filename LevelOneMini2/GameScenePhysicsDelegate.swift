//
//  GameScenePhysicsDelegate.swift
//  LevelOneMini2
//
//  Created by tandyys on 19/06/24.
//

import Foundation
import SpriteKit
import GameplayKit
//activateCanonRightButtonAvailable

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        //Text Label mechanism
        let canonContactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let contactProjectileMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
                
        
               
        if contactProjectileMask == SKSpriteNode.PhysicsCategory.projectile | SKSpriteNode.PhysicsCategory.bos {
            if let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node {
                if nodeA.name == "Projectile" && nodeB.name == "Bos" {
                    attackedBosHit = true
                    print("\(attackedBosHit)")

                    // Apply damage to the boss
                    let damage = 200
                    bosGotAttack(damage: CGFloat(damage))
                    kecilGotAttack(damage: CGFloat(200))
                    GendutGotAttack(damage: CGFloat(100))
                    nodeA.isHidden = true
                } else if nodeA.name == "Bos" && nodeB.name == "Projectile" {
                    attackedBosHit = true
                    print("\(attackedBosHit)")

                    // Apply damage to the boss
                    let damage = 200
                    bosGotAttack(damage: CGFloat(damage))
                    kecilGotAttack(damage: CGFloat(200))
                    GendutGotAttack(damage: CGFloat(100))
                    nodeB.isHidden = true
                }
            }
        }
        //Canon Left kecil
        if canonContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.canonLeftNotActivated {
            activateCanonLeftButtonAvailable = true
            
            let CanonLeftNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.canonLeft ? contact.bodyA.node : contact.bodyB.node
            
            if let CanonLeftPosition = CanonLeftNode?.position {
                displayTextCanonLeft(at: CGPoint(x: CanonLeftPosition.x + 200, y: CanonLeftPosition.y - 100))
                CanonContactLeft = true
            }
        }
        
        //canon left gendut
        if canonContactMask ==  SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.canonLeftNotActivated {
            activateCanonLeftButtonAvailable = true
            
            let CanonLeftNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.canonLeft ? contact.bodyA.node : contact.bodyB.node
            
            if let CanonLeftPosition = CanonLeftNode?.position {
                displayTextCanonLeft(at: CGPoint(x: CanonLeftPosition.x + 200, y: CanonLeftPosition.y - 100 ))
                CanonContactLeft = true
                
            }
        }
        
        
        
        //canon right kecil
        if canonContactMask ==  SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.canonRightNotActivated {
            activateCanonRightButtonAvailable = true
            
            let CanonRightNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.canonRight ? contact.bodyA.node : contact.bodyB.node
            
            if let CanonRightPosition = CanonRightNode?.position {
                displayTextCanonRight(at: CGPoint(x: CanonRightPosition.x + 300, y: CanonRightPosition.y - 100 ))
                CanonContactRight = true
            }
        }
        
        
        
        //canon Right gendut
        if canonContactMask ==  SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.canonRightNotActivated {
            activateCanonRightButtonAvailable = true
            
            let CanonRightNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.canonRight ? contact.bodyA.node : contact.bodyB.node
            
            if let CanonRightPosition = CanonRightNode?.position {
                displayTextCanonRight(at: CGPoint(x: CanonRightPosition.x + 300, y: CanonRightPosition.y - 100 ))
                CanonContactRight = true
            }
        }
        
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        
        let canonContactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        //kecil left
        if canonContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.canonLeftNotActivated {
            activateCanonLeftButtonAvailable = false
        }
        //kecil right
        if canonContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.canonRightNotActivated {
            activateCanonLeftButtonAvailable = false
        }
        
        //gendut left
        if canonContactMask == SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.canonLeftNotActivated {
            activateCanonLeftButtonAvailable = false
        }
        //gendut right
        if canonContactMask == SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.canonRightNotActivated {
            activateCanonLeftButtonAvailable = false
        }
     
    }
    
}
