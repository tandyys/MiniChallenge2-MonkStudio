//
//  Projectile.swift
//  LevelOneMini2
//
//  Created by Christian Gunawan on 23/06/24.
//
import SpriteKit

class Projectile: SKSpriteNode{
    
    enum Shoot:String{
        case dar
    }
    
    
    private var projectile: [SKTexture]?
    
    init(){
        let projectiles = SKTexture(imageNamed: "Projectile")
        
        super.init(texture: projectiles, color: .clear, size: projectiles.size())
        
        self.name = "Projectile"
        
        self.setScale(1.0)
        self.zPosition = SKSpriteNode.Layer.projectile.rawValue
        
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = PhysicsCategory.projectile
        self.physicsBody?.contactTestBitMask = PhysicsCategory.bos
        self.physicsBody?.collisionBitMask = PhysicsCategory.none
        self.physicsBody?.affectedByGravity = false
        
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError()
        
    }
}

