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
    var attack: Double = 1000
    
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
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.canonRightNotActivated
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.kecil
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
        
        startAnimation(textures: canonRightTexture, speed: 0.0001, name: PlayerAnimationType.shoot.rawValue, count: 0, resize: true, restore: true)
    }
    
    func shootAction(movementSpeed: CGFloat) {
        // Create a new instance of Projectile
        let projectile = Projectile()
        
        // Calculate the position of the tip of the canon for the projectile
        let canonTipPosition = CGPoint(x: 140, y: 170)
        
        // Set the position of the projectile at the tip of the canon
        if let parent = parent {
            projectile.position = parent.convert(canonTipPosition, from: self)
        }
        
        // Add the projectile to the scene
        self.parent?.addChild(projectile)
        
        // Calculate the x and y components of the vector for a 45-degree angle to the left with the specified movement speed
           let angleInRadians = CGFloat.pi * 3 / 4  // 45 degrees to the left in radians
           let dx = cos(angleInRadians) * movementSpeed  // Magnitude of the impulse in the x-direction based on movement speed
           let dy = sin(angleInRadians) * movementSpeed  // Magnitude of the impulse in the
        
        // Apply an impulse to the projectile to shoot it at a 45-degree angle with the specified movement speed
        let impulseVector = CGVector(dx: dx, dy: dy)
        projectile.physicsBody?.applyImpulse(impulseVector)
        print("Ini kluar ngak")
    }
    
    
  
    
    func stop(){
        removeAction(forKey: PlayerAnimationType.shoot.rawValue)
    }
    
    
}
