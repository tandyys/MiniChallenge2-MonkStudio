//
//  Kecil.swift
//  LevelOneMini2
//
//  Created by tandyys on 18/06/24.
//

import Foundation
import SpriteKit
import GameplayKit

class Kecil: SKSpriteNode {
    enum PlayerAnimationType:String {
        case walk
        case idle
    }
    
    private var kecilWalkTexture: [SKTexture]?
    private var kecilIdleTexture: [SKTexture]?
    var playerAgent: GKAgent2D
    var kecilHealth:CGFloat = 100.0
    
    init() {
        let texture = SKTexture(imageNamed: "k-idle-0")
        self.playerAgent = GKAgent2D()
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.kecilIdleTexture = self.loadAnimation(atlas: "KecilIdle", prefix: "k-idle-", startAt: 0, stopAt: 1)
        self.kecilWalkTexture = self.loadAnimation(atlas: "KecilWalk", prefix: "k-walk-", startAt: 0, stopAt: 4)
        
        self.name = "Kecil"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.position = CGPoint(x: self.size.width - self.size.width/2, y: 300)
        
        //Physics body settings
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height/2), center: CGPoint(x: 0, y: self.size.height/2))
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.kecil
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.towerRedNotActivated | SKSpriteNode.PhysicsCategory.towerBlueNotActivated | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated | SKSpriteNode.PhysicsCategory.towerGreenNotActivated | SKSpriteNode.PhysicsCategory.towerActivated
        self.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.towerRedNotActivated | SKSpriteNode.PhysicsCategory.towerBlueNotActivated | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated | SKSpriteNode.PhysicsCategory.towerGreenNotActivated | SKSpriteNode.PhysicsCategory.towerActivated
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
        guard let walkTexture = kecilWalkTexture else {
            preconditionFailure("Cant find kecil texture")
        }
        
        //Run animation
        startAnimation(textures: walkTexture, speed: 0.250, name: PlayerAnimationType.walk.rawValue, count: 0, resize: true, restore: true)
    }
    
    func idle() {
        //Check the texture
        guard let idleTexture = kecilIdleTexture else {
            preconditionFailure("Cant find kecil texture")
        }
        
        //Run animation
        startAnimation(textures: idleTexture, speed: 0.400, name: PlayerAnimationType.idle.rawValue, count: 0, resize: true, restore: true)
    }
    
    func stop() {
        removeAction(forKey: PlayerAnimationType.walk.rawValue)
//        removeAllActions()
    }
    
}
