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
    }
    
    private var gendutWalkTexture: [SKTexture]?
    var playerAgent: GKAgent2D
    var hp:Double = 1000
    var hpTotalGendut:Double = 1000
    
    init() {
        let texture = SKTexture(imageNamed: "run-b-1")
 
        self.playerAgent = GKAgent2D()
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.gendutWalkTexture = self.loadAnimation(atlas: "Gendut", prefix: "run-b-", startAt: 1, stopAt: 17)
        
        self.name = "gendut"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.position = CGPoint(x: self.size.width - self.size.width/2, y: 900)
        
        //Physics body settings
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width - 120, height: self.size.height/3), center: CGPoint(x: self.size.width - 250, y: self.size.height/3))
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.gendut
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.towerRedNotActivated | SKSpriteNode.PhysicsCategory.towerBlueNotActivated | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated | SKSpriteNode.PhysicsCategory.towerGreenNotActivated | SKSpriteNode.PhysicsCategory.towerActivated
        self.physicsBody?.collisionBitMask =
        SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster
        | SKSpriteNode.PhysicsCategory.towerRedNotActivated | SKSpriteNode.PhysicsCategory.towerBlueNotActivated | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated | SKSpriteNode.PhysicsCategory.towerGreenNotActivated
        
        | SKSpriteNode.PhysicsCategory.towerActivated
        
        | SKSpriteNode.PhysicsCategory.platform
        
        | SKSpriteNode.PhysicsCategory.towerWhite1Destroyed | SKSpriteNode.PhysicsCategory.towerWhite1Activated | SKSpriteNode.PhysicsCategory.towerWhite1NotActivated
        
        | SKSpriteNode.PhysicsCategory.towerWhite2Destroyed | SKSpriteNode.PhysicsCategory.towerWhite2Activated | SKSpriteNode.PhysicsCategory.towerWhite2NotActivated
        
        | SKSpriteNode.PhysicsCategory.towerWhite3Destroyed | SKSpriteNode.PhysicsCategory.towerWhite3Activated | SKSpriteNode.PhysicsCategory.towerWhite3NotActivated
        
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
        startAnimation(textures: walkTexture, speed: 0.07, name: PlayerAnimationType.walk.rawValue, count: 0, resize: true, restore: true)
    }
    
    func stop() {
        removeAction(forKey: PlayerAnimationType.walk.rawValue)
//        removeAllActions()
    }
}
