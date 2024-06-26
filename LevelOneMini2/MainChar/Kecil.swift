//
//  Kecil.swift
//  LevelOneMini2
//
//  Created by tandyys on 18/06/24.
//

import Foundation
import SpriteKit

class Kecil: SKSpriteNode {
    enum PlayerAnimationType:String {
        case walk
    }
    
    private var KecilWalkTexture: [SKTexture]?
    var hp:Double = 500
    var hpTotalKecil:Double = 500
    
    init() {
        let texture = SKTexture(imageNamed: "KecilWalk_0")
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.KecilWalkTexture = self.loadAnimation(atlas: "Kecil", prefix: "KecilWalk_", startAt: 0, stopAt: 5)
        self.name = "Kecil"
        self.setScale(1.0)
//        self.size = CGSize(width: 320, height: 360)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = SKSpriteNode.Layer.character.rawValue
        self.position = CGPoint(x: 100, y: 300)
        
        //Physics
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height/2), center: CGPoint(x: 0, y: self.size.height/5))
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.kecil
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.monster |  SKSpriteNode.PhysicsCategory.canonLeft | SKSpriteNode.PhysicsCategory.canonRight | SKSpriteNode.PhysicsCategory.canonLeftNotActivated | SKSpriteNode.PhysicsCategory.canonRightNotActivated | PhysicsCategory.jatuhan
        self.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.monster |  SKSpriteNode.PhysicsCategory.canonLeft | SKSpriteNode.PhysicsCategory.canonRight | SKSpriteNode.PhysicsCategory.canonLeftNotActivated | SKSpriteNode.PhysicsCategory.canonRightNotActivated | SKSpriteNode.PhysicsCategory.jatuhan
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func walk() {
        //Check the texture
        guard let walkTexture = KecilWalkTexture else {
            preconditionFailure("Cant find kecil texture")
        }
        
        //Run animation
        startAnimation(textures: walkTexture, speed: 0.150, name: PlayerAnimationType.walk.rawValue, count: 0, resize: true, restore: true)
    }
    
    func stop() {
        removeAction(forKey: PlayerAnimationType.walk.rawValue)
//        removeAllActions()
    }
}
