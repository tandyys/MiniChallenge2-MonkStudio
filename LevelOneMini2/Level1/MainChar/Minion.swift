//
//  redMinion.swift
//  LevelOneMini2
//
//  Created by tandyys on 25/06/24.
//

import Foundation
import SpriteKit
import GameplayKit
import AVFoundation

class Minion: GKEntity, GKAgentDelegate {
    
    var dieEffect: AVAudioPlayer?
    var stoneEffect: AVAudioPlayer?
    weak var entityManager: EntityManager?
    var minionAgent: GKAgent2D
    
    init(texture: SKTexture, healthBarSize: CGSize, maxHealth: CGFloat, entityManager: EntityManager, position: Int) {
        
        self.entityManager = entityManager
        self.minionAgent = GKAgent2D()
        
        super.init()
        loadDieEffect()
        loadDropEffect()
       
        let spriteComponent = SpriteComponent(texture: texture)
        spriteComponent.node.name = "Minion"
        spriteComponent.node.size = CGSize(width: 180, height: 150)
        spriteComponent.node.anchorPoint = CGPoint(x: 0.5, y: 0)
        spriteComponent.node.zPosition = SKSpriteNode.Layer.minion.rawValue
        spriteComponent.node.position = CGPoint(x: position, y: -300)
        spriteComponent.node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: spriteComponent.node.size.width/2, height: spriteComponent.node.size.height/2), center: CGPoint(x: 0, y: spriteComponent.node.size.height/2))
        spriteComponent.node.physicsBody?.isDynamic = true
        spriteComponent.node.physicsBody?.affectedByGravity = false
        spriteComponent.node.physicsBody?.allowsRotation = false
        spriteComponent.node.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.monster
        spriteComponent.node.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.projectileCharacter
        spriteComponent.node.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.gendut
        
        //Minion Agent
        minionAgent.delegate = self
        minionAgent.position = SIMD2(Float(spriteComponent.node.position.x), Float(spriteComponent.node.position.y))
        minionAgent.maxSpeed = 200
        minionAgent.maxAcceleration = 50
        
        self.addComponent(spriteComponent)
        
        self.addComponent(minionAgent)
        
        let healthBarComponent = MinionHealthComponent(size: healthBarSize, maxHealth: maxHealth)
        self.addComponent(healthBarComponent)
        
        healthBarComponent.healthBackgroundNode.position = CGPoint(x: 0, y: spriteComponent.node.size.height + 10)
        
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
                    die()
                }
                if let spriteComponent = component(ofType: SpriteComponent.self) {
                    spriteComponent.node.removeFromParent()
                }
            }
        }
    }
    
    func setTargetAgent(_ target: GKAgent2D) {
        let setGoal = GKGoal(toSeekAgent: target)
        let behavior = GKBehavior(goals: [setGoal], andWeights: [NSNumber(value: 1.0)])
        self.minionAgent.behavior = behavior
    }
    
    func loadDropEffect(){
        if let soundURL = Bundle.main.url(forResource: "stoneDrop", withExtension: ".wav"){
            do {
                stoneEffect = try AVAudioPlayer(contentsOf: soundURL)
                stoneEffect?.prepareToPlay()
                stoneEffect?.volume = 1
            } catch {
                print("Error loading sound file: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found")
        }
    }
    func loadDieEffect(){
        if let soundURL = Bundle.main.url(forResource: "dieMinion", withExtension: ".wav"){
            do {
                dieEffect = try AVAudioPlayer(contentsOf: soundURL)
                dieEffect?.prepareToPlay()
                dieEffect?.volume = 0.2
            } catch {
                print("Error loading sound file: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found")
        }
    }
    
    func die() {
        dieEffect?.play()
         if let spriteComponent = component(ofType: SpriteComponent.self) {
             stoneEffect?.play()
             let item = CollectableItem()
             item.position = spriteComponent.node.position
             if let parent = spriteComponent.node.parent {
                 parent.addChild(item)
             }
             
             spriteComponent.node.removeFromParent()
         }
         
         if let entityManager = entityManager {
             entityManager.remove(self)
         }
     }
     
     func removeFromParentCollectableItems(item: CollectableItem) {
         item.removeFromParent()
     }
    
    func applyDamage(_ damage: CGFloat) {
        changeHealth(by: -damage)
    }
    
    
}
