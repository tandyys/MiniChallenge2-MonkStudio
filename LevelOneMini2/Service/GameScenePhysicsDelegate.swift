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
        
        let contactProjectileMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let collectableItemsContactCharacter = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let collectableItemsContactTower = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let contactMonsterAndWeapon = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let towerContactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let catDomainContactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collectableItemsContactTower == SKSpriteNode.PhysicsCategory.collectablesitem | SKSpriteNode.PhysicsCategory.towerWhite1Destroyed{
            collectibleItemsTower1 += 1.0
            
        }
        if collectableItemsContactTower == SKSpriteNode.PhysicsCategory.collectablesitem | SKSpriteNode.PhysicsCategory.towerWhite2Destroyed{
            collectibleItemsTower2 += 1.0
            

        }
        if collectableItemsContactTower == SKSpriteNode.PhysicsCategory.collectablesitem | SKSpriteNode.PhysicsCategory.towerWhite3Destroyed{
            collectibleItemsTower3 += 1.0
            
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite1Destroyed && collectibleItemsTower1 > 3.0{
            buildWhite1TowerAvailable = true
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite1Destroyed ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position{
                displayBuildTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }else if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite1Destroyed{
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite1Destroyed ? contact.bodyA.node : contact.bodyB.node
            if let towerPosition = towerNode?.position{
                addLabelTowerWhite(position: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite1NotActivated{
            activateWhite1TowerButtonAvailable = true
            createWhite1ProgressBar(at: CGPoint(x: tower1White.position.x, y: tower1White.frame.maxY))
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite1NotActivated ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position{
                displayActivateTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 250))
            }
        }
        
        if catDomainContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.domain1White{
            plusAllDamage = true
        }
        
        if catDomainContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.domain2White{
            plusAllDamage = true
        }
        
        if catDomainContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.domain3White{
            plusAllDamage = true
        }
        
        if catDomainContactMask == SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.domain1White{
            plusAllDamage = true
        }
        
        if catDomainContactMask == SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.domain2White{
            plusAllDamage = true
        }
        
        if catDomainContactMask == SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.domain3White{
            plusAllDamage =  true
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite2Destroyed && collectibleItemsTower2 > 3.0{
            buildWhite2TowerAvailable = true
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite2Destroyed ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position{
                displayBuildTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }else if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite2Destroyed{
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite2Destroyed ? contact.bodyA.node : contact.bodyB.node
            if let towerPosition = towerNode?.position{
                addLabelTowerWhite(position: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite2NotActivated{
            activateWhite2TowerButtonAvailable = true
            createWhite2ProgressBar(at: CGPoint(x: tower2White.position.x, y: tower2White.frame.maxY))
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite2NotActivated ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position{
                displayActivateTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 250))
            }
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite3Destroyed && collectibleItemsTower3 > 3.0{
            buildWhite3TowerAvailable = true
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite3Destroyed ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position{
                displayBuildTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }else if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite3Destroyed{
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite3Destroyed ? contact.bodyA.node : contact.bodyB.node
            if let towerPosition = towerNode?.position{
                addLabelTowerWhite(position: CGPoint(x: towerPosition.x, y: towerPosition.y + 200))
            }
        }
        
        if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite3NotActivated{
            activateWhite3TowerButtonAvailable = true
            createWhite3ProgressBar(at: CGPoint(x: tower3White.position.x, y: tower3White.frame.maxY))
            let towerNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.towerWhite3Destroyed ? contact.bodyA.node : contact.bodyB.node
            
            if let towerPosition = towerNode?.position{
                displayActivateTextTower(at: CGPoint(x: towerPosition.x, y: towerPosition.y + 250))
            }
        }
        
        if contactProjectileMask == SKSpriteNode.PhysicsCategory.projectileCharacter | SKSpriteNode.PhysicsCategory.bos {
            let totalhpBos = bos.hpTotalBos
            if let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node {
                if nodeA.name == "gedeProjectile" && nodeB.name == "Bos" {
                    attackedBosHit = true
//                    print("\(attackedBosHit)")
                    attackManager.bosGotAttack(bos: bos, healthBarBos: healthBarBos, totalhpBos: totalhpBos, damage: CGFloat(damage), attackedBosHit: &attackedBosHit)
                    nodeA.isHidden = true
                } else if nodeA.name == "Bos" && nodeB.name == "gedeProjectile" {
                    attackedBosHit = true
//                    print("\(attackedBosHit)")
                    attackManager.bosGotAttack(bos: bos, healthBarBos: healthBarBos, totalhpBos: totalhpBos, damage: CGFloat(damage), attackedBosHit: &attackedBosHit)
                    nodeB.isHidden = true
                }
            }
        }
        if collectableItemsContactCharacter == SKSpriteNode.PhysicsCategory.collectablesitem | SKSpriteNode.PhysicsCategory.kecil {
            if let nodeA = contact.bodyA.node as? SKSpriteNode, let nodeB = contact.bodyB.node as? SKSpriteNode {
                if (nodeA.name == "CollectableItem" && nodeB.name == "Kecil") || (nodeA.name == "Kecil" && nodeB.name == "CollectableItem") {
                    let collectableItemNode = nodeA.name == "CollectableItem" ? nodeA : nodeB
                    let kecilNode = nodeA.name == "Kecil" ? nodeA : nodeB
                    collectableItemNode.position = kecilNode.position
                }
            }
        }
        
        
//        if contactMonsterAndWeapon == SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.monster {
//            if let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node {
//                if nodeA.name == "gendut" && nodeB.name == "Minion" {
//                    // Minion is hit by projectile
//                    let damage = 5
//                    attackManager.gendutGotAttack(gendut: gendut, healthBarGendut: healthBarGendut, totalhpGendut: gendut.hpTotalGendut, damage: CGFloat(damage), attackedGendutHit: &attackedGendutHit)
//                } else if nodeA.name == "Minion" && nodeB.name == "gendut" {
//                    // Minion is hit by projectile
//                    let damage = 5
//                    attackManager.gendutGotAttack(gendut: gendut, healthBarGendut: healthBarGendut, totalhpGendut: gendut.hpTotalGendut, damage: CGFloat(damage), attackedGendutHit: &attackedGendutHit)
//                }
//            }
//        }
        
//        if contactMonsterAndWeapon == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster {
//            if let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node {
//                if nodeA.name == "Kecil" && nodeB.name == "Minion" {
//                    // Minion is hit by projectile
//                    let damage = 10
//                    attackManager.kecilGotAttack(kecil: kecil, healthBarKecil: healthBarKecil, totalhpKecil: kecil.hpTotalKecil, damage: CGFloat(damage), attackedKecilHit: &attackedKecilHit)
//                } else if nodeA.name == "Minion" && nodeB.name == "Kecil" {
//                    // Minion is hit by projectile
//                    let damage = 10
//                    attackManager.kecilGotAttack(kecil: kecil, healthBarKecil: healthBarKecil, totalhpKecil: kecil.hpTotalKecil, damage: CGFloat(damage), attackedKecilHit: &attackedKecilHit)
//                    
//                }
//            }
//        }
        
//        if contactMonsterAndWeapon == SKSpriteNode.PhysicsCategory.projectileCharacter | SKSpriteNode.PhysicsCategory.monster {
//            if let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node {
//                if nodeA.name == "gedeProjectile" && nodeB.name == "Minion" {
//                    // Minion is hit by projectile
//                    if let minion = entityManager.getEntity(for: nodeB) as? Minion {
//                        minion.applyDamage(50)
//                    }
//                    nodeA.isHidden = true
//                } else if nodeA.name == "Minion" && nodeB.name == "gedeProjectile" {
//                    // Minion is hit by projectile
//                    if let minion = entityManager.getEntity(for: nodeA) as? Minion {
//                        minion.applyDamage(50)
//                    }
//                    nodeB.isHidden = true
//                }
//            }
            
            
            //White Tower
            
            
            //Colectable Items With Gendut
            if collectableItemsContactCharacter == SKSpriteNode.PhysicsCategory.collectablesitem | SKSpriteNode.PhysicsCategory.gendut {
                if let nodeA = contact.bodyA.node as? SKSpriteNode, let nodeB = contact.bodyB.node as? SKSpriteNode {
                    if (nodeA.name == "CollectableItem" && nodeB.name == "Gendut") || (nodeA.name == "Gendut" && nodeB.name == "CollectableItem") {
                        let collectableItemNode = nodeA.name == "CollectableItem" ? nodeA : nodeB
                        let gendutNode = nodeA.name == "Gendut" ? nodeA : nodeB
                        
                        // Update the position of the CollectableItem to match the position of the "Kecil" sprite
                        collectableItemNode.position = gendutNode.position
                    }
                }
            }
        let firstBody: SKPhysicsBody
        let secondBody: SKPhysicsBody
               
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if (firstBody.categoryBitMask & SKSpriteNode.PhysicsCategory.projectileCharacter != 0) && (secondBody.categoryBitMask & SKSpriteNode.PhysicsCategory.monster != 0) {
                if let projectile = firstBody.node as? SKSpriteNode, let minionNode = secondBody.node as? SKSpriteNode {
                    projectileDidCollideWithMonster(projectile: projectile, monster: minionNode)
                }
        } else if (firstBody.categoryBitMask & SKSpriteNode.PhysicsCategory.monster != 0) && (secondBody.categoryBitMask & SKSpriteNode.PhysicsCategory.projectileCharacter != 0) {
                if let minionNode = firstBody.node as? SKSpriteNode, let projectile = secondBody.node as? SKSpriteNode {
                    projectileDidCollideWithMonster(projectile: projectile, monster: minionNode)
                }
            }

            if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster {
                applyRedFilter()
                kecil.kecilHealth -= 10
                checkGameOver()
            
        }
        
    }
    func projectileDidCollideWithMonster(projectile: SKSpriteNode, monster: SKSpriteNode) {
        print("Hit!")
        projectile.removeFromParent()
        monster.removeFromParent()
        
        if let minionEntity = entityManager.getEntity(for: monster) as? Minion {
            minionEntity.changeHealth(by: -25, scene: self)  // Reduce health by 25 points
        }
    }
        
        func didEnd(_ contact: SKPhysicsContact) {
            let towerContactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
            let catDomainContactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
            
            if catDomainContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.domain1White{
                plusAllDamage = false
            }
            
            if catDomainContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.domain2White{
                plusAllDamage = false
            }
            
            if catDomainContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.domain3White{
                plusAllDamage = false
            }
            
            if catDomainContactMask == SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.domain1White{
                plusAllDamage = false
            }
            
            if catDomainContactMask == SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.domain2White{
                plusAllDamage = false
            }
            
            if catDomainContactMask == SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.domain3White{
                plusAllDamage = false
            }
            
            if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite1Destroyed {
                //            let towerNode = towerContactMask == SKSpriteNode.PhysicsCategory.towerWhite1Destroyed ?
                //            contact.bodyA.node : contact.bodyB.node
                buildWhite1TowerAvailable = false
                removeActivateTextTower()
                removeBuildTextTower()
                removecollectTextTower()
            }
            
            if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite1NotActivated {
                activateWhite1TowerButtonAvailable = false
                removeWhite1ProgressBar()
                removeActivateTextTower()
                removeBuildTextTower()
                removecollectTextTower()
            }
            
            if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite2Destroyed {
                buildWhite2TowerAvailable = false
                removeActivateTextTower()
                removeBuildTextTower()
                removecollectTextTower()
            }
            
            if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite2NotActivated {
                activateWhite2TowerButtonAvailable = false
                removeWhite2ProgressBar()
                removeActivateTextTower()
                removeBuildTextTower()
                removecollectTextTower()
                
            }
            
            if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite3Destroyed {
                buildWhite3TowerAvailable = false
                removeActivateTextTower()
                removeBuildTextTower()
                removecollectTextTower()
            }
            
            if towerContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.towerWhite3NotActivated {
                activateWhite3TowerButtonAvailable = false
                removeWhite3ProgressBar()
                removeActivateTextTower()
                removeBuildTextTower()
                removecollectTextTower()
            }
    }
}
