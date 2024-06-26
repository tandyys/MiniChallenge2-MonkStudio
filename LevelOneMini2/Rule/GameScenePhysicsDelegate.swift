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
        let canonContactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let contactProjectileMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let contactJatuhanCharacterMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let collectableItemsContactCharacter = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let collectableItemsContactCanon = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let contactMonsterAndWeapon = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        
        if contactMonsterAndWeapon == SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.monster {
            if let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node {
                if nodeA.name == "Gendut" && nodeB.name == "Minion" {
                    // Minion is hit by projectile
                    let damage = 5
                    attackManager.gendutGotAttack(gendut: gendut, healthBarGendut: healthBarGendut, totalhpGendut: gendut.hpTotalGendut, damage: CGFloat(damage), attackedGendutHit: &attackedGendutHit)
                } else if nodeA.name == "Gendut" && nodeB.name == "ProjectileShoot" {
                    // Minion is hit by projectile
                    let damage = 5
                    attackManager.gendutGotAttack(gendut: gendut, healthBarGendut: healthBarGendut, totalhpGendut: gendut.hpTotalGendut, damage: CGFloat(damage), attackedGendutHit: &attackedGendutHit)
                }
            }
        }
        
        if contactMonsterAndWeapon == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster {
            if let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node {
                if nodeA.name == "Kecil" && nodeB.name == "Minion" {
                    // Minion is hit by projectile
                    let damage = 10
                    attackManager.kecilGotAttack(kecil: kecil, healthBarKecil: healthBarKecil, totalhpKecil: kecil.hpTotalKecil, damage: CGFloat(damage), attackedKecilHit: &attackedKecilHit)
                } else if nodeA.name == "Kecil" && nodeB.name == "ProjectileShoot" {
                    // Minion is hit by projectile
                    let damage = 10
                    attackManager.kecilGotAttack(kecil: kecil, healthBarKecil: healthBarKecil, totalhpKecil: kecil.hpTotalKecil, damage: CGFloat(damage), attackedKecilHit: &attackedKecilHit)

                }
            }
        }
        
        if contactMonsterAndWeapon == SKSpriteNode.PhysicsCategory.shootFromGendut | SKSpriteNode.PhysicsCategory.monster {
            if let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node {
                if nodeA.name == "ProjectileShoot" && nodeB.name == "Minion" {
                    // Minion is hit by projectile
                    if let minion = entityManager.getEntity(for: nodeB) as? Minion {
                        minion.applyDamage(50)
                    }
                    nodeA.isHidden = true
                } else if nodeA.name == "Minion" && nodeB.name == "ProjectileShoot" {
                    // Minion is hit by projectile
                    if let minion = entityManager.getEntity(for: nodeA) as? Minion {
                        minion.applyDamage(50)
                    }
                    nodeB.isHidden = true
                }
            }
        }

        
        
        
        if collectableItemsContactCanon == SKSpriteNode.PhysicsCategory.collectablesitem | SKSpriteNode.PhysicsCategory.canonLeftNotActivated {
            let CanonLeftNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.canonLeft ? contact.bodyA.node : contact.bodyB.node
            if let CanonLeftPosition = CanonLeftNode?.position {
                print("kena left ama collectable")
                canonLeft.reload()
                let itemNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.collectablesitem ? contact.bodyA.node : contact.bodyB.node
                        itemNode?.removeFromParent()
            
            }
        }
        
        if collectableItemsContactCanon == SKSpriteNode.PhysicsCategory.collectablesitem | SKSpriteNode.PhysicsCategory.canonRightNotActivated {
            let CanonRightNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.canonRight ? contact.bodyA.node : contact.bodyB.node
            if let CanonRightPosition = CanonRightNode?.position {
                print("kena right ama collectable")
                canonRight.reload()
                let itemNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.collectablesitem ? contact.bodyA.node : contact.bodyB.node
                        itemNode?.removeFromParent()
                
            }
            
            
        }
        


        //Colectable Items With Kecil
        if collectableItemsContactCharacter == SKSpriteNode.PhysicsCategory.collectablesitem | SKSpriteNode.PhysicsCategory.kecil {
            if let nodeA = contact.bodyA.node as? SKSpriteNode, let nodeB = contact.bodyB.node as? SKSpriteNode {
                if (nodeA.name == "CollectableItem" && nodeB.name == "Kecil") || (nodeA.name == "Kecil" && nodeB.name == "CollectableItem") {
                    let collectableItemNode = nodeA.name == "CollectableItem" ? nodeA : nodeB
                    let kecilNode = nodeA.name == "Kecil" ? nodeA : nodeB
                    collectableItemNode.position = kecilNode.position
                }
            }
        }
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
            
        
        
        
        
        
        //BOS GOT CONTACT WITH PROJECTILE FROM CANON
        if contactProjectileMask == SKSpriteNode.PhysicsCategory.projectile | SKSpriteNode.PhysicsCategory.bos {
            let totalhpBos = bos.hpTotalBos
            if let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node {
                if nodeA.name == "Projectile" && nodeB.name == "Bos" {
                    attackedBosHit = true
                    print("\(attackedBosHit)")
                    let damage = 200
                    attackManager.bosGotAttack(bos: bos, healthBarBos: healthBarBos, totalhpBos: totalhpBos, damage: CGFloat(damage), attackedBosHit: &attackedBosHit)
                    nodeA.isHidden = true
                } else if nodeA.name == "Bos" && nodeB.name == "Projectile" {
                    attackedBosHit = true
                    print("\(attackedBosHit)")
                    let damage = 200
                    attackManager.bosGotAttack(bos: bos, healthBarBos: healthBarBos, totalhpBos: totalhpBos, damage: CGFloat(damage), attackedBosHit: &attackedBosHit)
                    nodeB.isHidden = true
                }
            }
        }
        //KECIL GOT CONTACT WITH ATTACKING MATERIAL FROM BOS
        if contactJatuhanCharacterMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.jatuhan {
            let totalhpKecil = kecil.hpTotalKecil
            if let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node {
                if nodeA.name == "jatuhan" && nodeB.name == "Kecil" {
                    contactObstacleFromBoss = true
                    let damage = 40
                    let sequence = SKAction.sequence([
                        SKAction.run {
                            self.attackManager.kecilGotAttack(kecil: self.kecil, healthBarKecil: self.healthBarKecil, totalhpKecil: totalhpKecil, damage: CGFloat(damage), attackedKecilHit: &self.attackedKecilHit)
                        },
                        SKAction.run {
                            nodeA.removeFromParent()
                        }
                    ])
                    nodeA.run(sequence)
                } else if nodeA.name == "Kecil" && nodeB.name == "jatuhan" {
                    contactObstacleFromBoss = true
                    let damage = 40
                    let sequence = SKAction.sequence([
                        SKAction.run {
                            self.attackManager.kecilGotAttack(kecil: self.kecil, healthBarKecil: self.healthBarKecil, totalhpKecil: totalhpKecil, damage: CGFloat(damage), attackedKecilHit: &self.attackedKecilHit)
                        },
                        SKAction.run {
                            nodeB.removeFromParent()
                        }
                    ])
                    nodeA.run(sequence)
                }
            }
        }

        //GENDUT GOT CONTACT WITH ATTACKING MATERIAL FROM BOS
        if contactJatuhanCharacterMask == SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.jatuhan {
            let totalhpGendut = gendut.hpTotalGendut
            if let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node {
                if nodeA.name == "jatuhan" && nodeB.name == "Gendut" {
                    let damage = 40
                    let sequence = SKAction.sequence([
                        SKAction.run {
                            self.attackManager.gendutGotAttack(gendut: self.gendut, healthBarGendut: self.healthBarGendut, totalhpGendut: totalhpGendut, damage: CGFloat(damage), attackedGendutHit: &self.attackedGendutHit)
                        },
                        SKAction.run {
                            nodeA.removeFromParent()
                        }
                    ])
                    nodeA.run(sequence)
                } else if nodeA.name == "Gendut" && nodeB.name == "jatuhan" {
                    let damage = 40
                    let sequence = SKAction.sequence([
                        SKAction.run {
                            self.attackManager.gendutGotAttack(gendut: self.gendut, healthBarGendut: self.healthBarGendut, totalhpGendut: totalhpGendut, damage: CGFloat(damage), attackedGendutHit: &self.attackedGendutHit)
                        },
                        SKAction.run {
                            nodeB.removeFromParent()
                        }
                    ])
                    nodeA.run(sequence)
                }
            }
        }

        
        //KECIL GOT CONTACT WITH CANON LEFT
        if canonContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.canonLeftNotActivated {
            activateCanonLeftButtonAvailable = true
            let CanonLeftNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.canonLeft ? contact.bodyA.node : contact.bodyB.node
            if let CanonLeftPosition = CanonLeftNode?.position {
                displayManager.displayTextCanonLeft(at: CGPoint(x: CanonLeftPosition.x + 200, y: CanonLeftPosition.y - 100))
                displayManager.displayAmno(at: CGPoint(x: CanonLeftPosition.x + 200, y: CanonLeftPosition.y - 50), currentAmmo: canonLeft.currentAmmo, AmmoMax: canonLeft.maxAmmo)
                CanonContactLeft = true
            }
        }
        
        
        //GENDUT GOT CONTACT WITH CANON LEFT
        if canonContactMask ==  SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.canonLeftNotActivated {
            activateCanonLeftButtonAvailable = true
            let CanonLeftNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.canonLeft ? contact.bodyA.node : contact.bodyB.node
            if let CanonLeftPosition = CanonLeftNode?.position {
                displayManager.displayTextCanonLeft(at: CGPoint(x: CanonLeftPosition.x + 200, y: CanonLeftPosition.y - 100 ))
                displayManager.displayAmno(at: CGPoint(x: CanonLeftPosition.x + 200, y: CanonLeftPosition.y - 150), currentAmmo: canonLeft.currentAmmo, AmmoMax: canonLeft.maxAmmo)
                CanonContactLeft = true
                
            }
        }
        
        
        
        //KECIL GOT CONTACT WITH CANON RIGHT
        if canonContactMask ==  SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.canonRightNotActivated {
            activateCanonRightButtonAvailable = true
            
            let CanonRightNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.canonRight ? contact.bodyA.node : contact.bodyB.node

            if let CanonRightPosition = CanonRightNode?.position {
                displayManager.displayTextCanonRight(at: CGPoint(x: CanonRightPosition.x + 300, y: CanonRightPosition.y - 100 ))
                displayManager.displayAmno(at: CGPoint(x: CanonRightPosition.x + 300, y: CanonRightPosition.y - 150 ), currentAmmo: canonLeft.currentAmmo, AmmoMax: canonLeft.maxAmmo)
                CanonContactRight = true
            }
        }
        
        
        
        //GENDUT GOT CONTACT WITH CANON RIGHT
        if canonContactMask ==  SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.canonRightNotActivated {
            activateCanonRightButtonAvailable = true
            let CanonRightNode = contact.bodyA.categoryBitMask == SKSpriteNode.PhysicsCategory.canonRight ? contact.bodyA.node : contact.bodyB.node
            if let CanonRightPosition = CanonRightNode?.position {
                displayManager.displayTextCanonRight(at: CGPoint(x: CanonRightPosition.x + 300, y: CanonRightPosition.y - 100 ))
                displayManager.displayAmno(at: CGPoint(x: CanonRightPosition.x + 300, y: CanonRightPosition.y - 150 ), currentAmmo: canonLeft.currentAmmo, AmmoMax: canonLeft.maxAmmo)
                CanonContactRight = true
            }
        }
        
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        
        let canonContactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        //KECIL CONTACT WITH CANON LEFT
        if canonContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.canonLeftNotActivated {
            activateCanonLeftButtonAvailable = false
        }
        //KECIL CONTACT WITH CANON RIGHT
        if canonContactMask == SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.canonRightNotActivated {
            activateCanonLeftButtonAvailable = false
        }
        
        //GENDUT CONTACT WITH CANON LEFT
        if canonContactMask == SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.canonLeftNotActivated {
            activateCanonLeftButtonAvailable = false
        }
        //GENDUT CONTACT WITH CANON RIGHT
        if canonContactMask == SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.canonRightNotActivated {
            activateCanonLeftButtonAvailable = false
        }
    }
}
