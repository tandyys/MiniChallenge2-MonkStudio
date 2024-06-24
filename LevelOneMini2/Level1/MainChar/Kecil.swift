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
    
    private var gendutWalkTexture: [SKTexture]?
    
    init() {
        let texture = SKTexture(imageNamed: "KecilWalk_0")
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.gendutWalkTexture = self.loadAnimation(atlas: "Kecil", prefix: "KecilWalk_", startAt: 0, stopAt: 5)
        
        self.name = "Kecil"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.position = CGPoint(x: self.size.width - self.size.width/2, y: 650)
        
        //Physics body settings
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height/2), center: CGPoint(x: 0, y: self.size.height/2))
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.kecil
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.towerRedNotActivated | SKSpriteNode.PhysicsCategory.towerBlueNotActivated | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated | SKSpriteNode.PhysicsCategory.towerGreenNotActivated | SKSpriteNode.PhysicsCategory.towerActivated
        self.physicsBody?.collisionBitMask = 
        SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.monster
        | SKSpriteNode.PhysicsCategory.towerRedNotActivated | SKSpriteNode.PhysicsCategory.towerBlueNotActivated | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated | SKSpriteNode.PhysicsCategory.towerGreenNotActivated
        
        | SKSpriteNode.PhysicsCategory.towerActivated
        
        | SKSpriteNode.PhysicsCategory.platform
        
        | SKSpriteNode.PhysicsCategory.towerWhite1Destroyed | SKSpriteNode.PhysicsCategory.towerWhite1Activated | SKSpriteNode.PhysicsCategory.towerWhite1NotActivated
        
        | SKSpriteNode.PhysicsCategory.towerWhite2Destroyed | SKSpriteNode.PhysicsCategory.towerWhite2Activated | SKSpriteNode.PhysicsCategory.towerWhite2NotActivated
        
        | SKSpriteNode.PhysicsCategory.towerWhite3Destroyed | SKSpriteNode.PhysicsCategory.towerWhite3Activated | SKSpriteNode.PhysicsCategory.towerWhite3NotActivated
        
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func walk() {
        //Check the texture
        guard let walkTexture = gendutWalkTexture else {
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
