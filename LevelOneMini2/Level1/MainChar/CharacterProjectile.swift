//
//  CharacterProjectile.swift
//  LevelOneMini2
//
//  Created by Sena Kristiawan on 25/06/24.
//

import Foundation
import SpriteKit

class CharacterProjectile: SKSpriteNode{
    enum CharacterProjectileAnimationType:String {
        case shoot
    }
    
    init(texture:String){
        let projectiles = SKTexture(imageNamed: texture)
                
        super.init(texture: projectiles, color: .clear, size: projectiles.size())
                
        self.name = "Projectile"
                
        self.setScale(1.0)
        self.zPosition = SKSpriteNode.Layer.projectile.rawValue
                
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = PhysicsCategory.projectileCharacter
        self.physicsBody?.contactTestBitMask = PhysicsCategory.bos | PhysicsCategory.monster
        self.physicsBody?.collisionBitMask = PhysicsCategory.none
        self.physicsBody?.affectedByGravity = false
                
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

