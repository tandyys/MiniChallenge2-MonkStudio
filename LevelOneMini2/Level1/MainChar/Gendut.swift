//
//  Gendut.swift
//  LevelOneMini2
//
//  Created by tandyys on 18/06/24.
//

import Foundation
import SpriteKit
import GameplayKit

class Gendut: SKSpriteNode {
    enum PlayerAnimationType:String {
        case walk
        case idle
        case attack
    }
    
    private var gendutWalkTexture: [SKTexture]?
    private var gendutIdleTexture: [SKTexture]?
    private var gendutAttackTecture: [SKTexture]?
    var playerAgent: GKAgent2D
    
    init() {
        let texture = SKTexture(imageNamed: "g-idle-0")
        self.playerAgent = GKAgent2D()
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.gendutIdleTexture = self.loadAnimation(atlas: "GendutIdle", prefix: "g-idle-", startAt: 0, stopAt: 1)
        self.gendutWalkTexture = self.loadAnimation(atlas: "GendutWalk", prefix: "g-walk-", startAt: 0, stopAt: 5)
        self.gendutAttackTecture = self.loadAnimation(atlas: "GendutAttack", prefix: "attack-b-", startAt: 0, stopAt: 1)
        
        self.name = "gendut"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.zPosition = SKSpriteNode.Layer.characterGendut.rawValue
        self.position = CGPoint(x: self.size.width - self.size.width/2, y: 500)
        
        //Physics body settings
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width - 120, height: self.size.height/3), center: CGPoint(x: self.size.width - 250, y: self.size.height/3))
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.gendut
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.towerRedNotActivated | SKSpriteNode.PhysicsCategory.towerBlueNotActivated | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated | SKSpriteNode.PhysicsCategory.towerGreenNotActivated | SKSpriteNode.PhysicsCategory.towerActivated
        self.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.towerRedNotActivated | SKSpriteNode.PhysicsCategory.towerBlueNotActivated | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated | SKSpriteNode.PhysicsCategory.towerGreenNotActivated | SKSpriteNode.PhysicsCategory.towerActivated
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = false
        
        playerAgent.position = SIMD2(Float(self.position.x), Float(self.position.y))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func walk() {
        //Check the texture
        guard let walkTexture = gendutWalkTexture else {
            preconditionFailure("Cant find gendut texture")
        }
        
        //Run animation
        startAnimation(textures: walkTexture, speed: 0.250, name: PlayerAnimationType.walk.rawValue, count: 0, resize: true, restore: true)
    }
    
    func idle() {
        //Check the texture
        guard let idleTexture = gendutIdleTexture else {
            preconditionFailure("Cant find gendut texture")
        }
        
        //Run animation
        startAnimation(textures: idleTexture, speed: 0.400, name: PlayerAnimationType.idle.rawValue, count: 0, resize: true, restore: true)
    }
    
    func attack() {
        //Check the texture
        guard let attackTexture = gendutAttackTecture else {
            preconditionFailure("Cant find gendut texture")
        }
        
        //Run animation
        startAnimation(textures: attackTexture, speed: 0.400, name: PlayerAnimationType.attack.rawValue, count: 0, resize: true, restore: true)
    }
    
    func stopWalk() {
        removeAction(forKey: PlayerAnimationType.walk.rawValue)
//        removeAllActions()
    }
    
    func stopAttack() {
        removeAction(forKey: PlayerAnimationType.attack.rawValue)
//        removeAllActions()
    }
}
