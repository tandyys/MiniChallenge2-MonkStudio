//
//  Canon_Left.swift
//  MonkGames
//
//  Created by Christian Gunawan on 22/06/24.
//

import Foundation
import SpriteKit

class Canon_Right: SKSpriteNode {
    
    enum PlayerAnimationType:String{
        case shoot
    }
    
    private var canon_RightTextures: [SKTexture]?
    
    init() {
        let texture = SKTexture(imageNamed: "CanonRight_0")
        
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.canon_RightTextures = self.loadAnimation(atlas: "Canon_Right", prefix: "CanonRight_", startAt: 0, stopAt: 5)
        
        self.name = "Canon_Right"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.zPosition = SKSpriteNode.Layer.canon.rawValue
        
        //physics
        
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width/5, height: self.size.height/5), center: CGPoint(x: self.size.width/2, y: -25))
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.canon
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.gendut |
        SKSpriteNode.PhysicsCategory.kecil |
        SKSpriteNode.PhysicsCategory.monster
        self.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.allowsRotation = false
        
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError()
        
    }
    
    func shoot(){
        guard let canonRightTexture = canon_RightTextures else {
            preconditionFailure("Cant find canon_Right texture")
        }
        
        startAnimation(textures: canonRightTexture, speed: 0.135, name: PlayerAnimationType.shoot.rawValue, count: 0, resize: true, restore: true)
    }
    
    func stop(){
        removeAction(forKey: PlayerAnimationType.shoot.rawValue)
    }
    
    
}
