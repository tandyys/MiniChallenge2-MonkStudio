//
//  Canon_Left.swift
//  MonkGames
//
//  Created by Christian Gunawan on 22/06/24.
//

import Foundation
import SpriteKit

class Canon_Left: SKSpriteNode {
    
    enum PlayerAnimationType:String{
        case shoot
    }
    
    private var canon_LeftTextures: [SKTexture]?
    var attack: Double = 10
    var hitBoss: Bool = false
    
    var maxAmmo: Int = 1
    var currentAmmo: Int = 1
    var isReloading: Bool = false
    let reloadTime: TimeInterval = 2.0
    
    init() {
        let texture = SKTexture(imageNamed: "CanonLeft_0")
        
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.canon_LeftTextures = self.loadAnimation(atlas: "Canon_Left", prefix: "CanonLeft_", startAt: 0, stopAt: 5)
        
        self.name = "Canon_Left"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.zPosition = SKSpriteNode.Layer.canon.rawValue
        
        //physics
        
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width/5, height: self.size.height/5), center: CGPoint(x: self.size.width/2, y: -25))
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.canonLeftNotActivated
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.kecil
        self.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.allowsRotation = false
        
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError()
        
    }
    
    
    func shootAnimation() {
        //Check the textures
        guard let canonLeftTexture = canon_LeftTextures else {
            preconditionFailure("Cant find canon_Left texture")
        }
        
        //Run animation
        startAnimation(textures: canonLeftTexture, speed: 0.0001, name: PlayerAnimationType.shoot.rawValue, count: 0, resize: true, restore: true)
    }
    
    func shootAction(movementSpeed: CGFloat) {
        guard currentAmmo > 0 else {
            print("Out of ammo, need to reload")
            return
        }
        
        // Create a new instance of Projectile
        let projectile = Projectile()
        
        // Calculate the position of the tip of the canon for the projectile
        let canonTipPosition = CGPoint(x: self.position.x + 250, y: self.position.y - 275)
        
        // Set the position of the projectile at the tip of the canon
        if let parent = parent {
            projectile.position = parent.convert(canonTipPosition, from: self)
        }
        
        // Add the projectile to the scene
        self.parent?.addChild(projectile)
        
        // Calculate the x and y components of the vector for a 45-degree angle with the specified movement speed
        let angleInRadians = CGFloat.pi / 4  // 45 degrees in radians
        let dx = cos(angleInRadians) * movementSpeed  // Magnitude of the impulse in the x-direction based on movement speed
        let dy = sin(angleInRadians) * movementSpeed  // Magnitude of the impulse in the y-direction based on movement speed
        
        // Apply an impulse to the projectile to shoot it at a 45-degree angle with the specified movement speed
        let impulseVector = CGVector(dx: dx, dy: dy)
        projectile.physicsBody?.applyImpulse(impulseVector)
        
        // Decrease ammo count
        currentAmmo -= 1


    }
    
    
    func reload() {
         guard !isReloading else { return }
         isReloading = true
         print("Reloading...")
         
         // Simulate reloading time
         let waitAction = SKAction.wait(forDuration: reloadTime)
         let reloadAction = SKAction.run { [weak self] in
             self?.currentAmmo = self?.maxAmmo ?? 10
             self?.isReloading = false
             print("Reloaded")
         }
         
         self.run(SKAction.sequence([waitAction, reloadAction]))
     }
    
    
    func stop() {
        
       removeAction(forKey: PlayerAnimationType.shoot.rawValue)
        
    }
    
    
    
    
}
