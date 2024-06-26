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
        let texture = SKTexture(imageNamed: "GendutWalk_0")
        self.playerAgent = GKAgent2D()
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.gendutWalkTexture = self.loadAnimation(atlas: "Gendut", prefix: "GendutWalk_", startAt: 0, stopAt: 16)
        self.name = "Gendut"
        self.setScale(1)
        self.position = CGPoint(x: 600, y: 900)
//        self.size = CGSize(width: 320, height: 360)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = SKSpriteNode.Layer.character.rawValue
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width - 100 , height: self.size.height/2), center: CGPoint(x: 0, y: self.size.height/5))
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.gendut
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.canonLeft | SKSpriteNode.PhysicsCategory.canonRight | SKSpriteNode.PhysicsCategory.canonLeftNotActivated | SKSpriteNode.PhysicsCategory.canonRightNotActivated | SKSpriteNode.PhysicsCategory.jatuhan
        self.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.canonLeft | SKSpriteNode.PhysicsCategory.canonRight | SKSpriteNode.PhysicsCategory.canonLeftNotActivated | SKSpriteNode.PhysicsCategory.canonRightNotActivated | SKSpriteNode.PhysicsCategory.jatuhan
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
        startAnimation(textures: walkTexture, speed: 0.135, name: PlayerAnimationType.walk.rawValue, count: 0, resize: false, restore: false)
    }
    
    func stop() {
        removeAction(forKey: PlayerAnimationType.walk.rawValue)
//        removeAllActions()
    }
}
