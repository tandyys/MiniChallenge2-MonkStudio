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
    let reloadTime: TimeInterval = 0.1
    
    init() {
        let texture = SKTexture(imageNamed: "CanonLeft_0")
        super.init(texture: texture, color: .clear, size: texture.size())
        self.canon_LeftTextures = self.loadAnimation(atlas: "Canon_Left", prefix: "CanonLeft_", startAt: 0, stopAt: 5)
        self.name = "Canon_Left"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.zPosition = SKSpriteNode.Layer.canon.rawValue
        self.position = CGPoint(x: 150, y: 450)
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
        guard let canonLeftTexture = canon_LeftTextures else {
            preconditionFailure("Cant find canon_Left texture")
        }
        startAnimation(textures: canonLeftTexture, speed: 0.01, name: PlayerAnimationType.shoot.rawValue, count: 0, resize: true, restore: true)
    }
    
    func shootAction(movementSpeed: CGFloat) {
        guard currentAmmo > 0 else {
            print("Out of ammo, need to reload")
            return
        }
        
        let projectile = Projectile()
        let canonTipPosition = CGPoint(x: self.position.x + 250, y: self.position.y - 275)
        if let parent = parent {
            projectile.position = parent.convert(canonTipPosition, from: self)
        }

        self.parent?.addChild(projectile)
        let angleInRadians = CGFloat.pi / 4
        let dx = cos(angleInRadians) * movementSpeed
        let dy = sin(angleInRadians) * movementSpeed
        let impulseVector = CGVector(dx: dx, dy: dy)
        projectile.physicsBody?.applyImpulse(impulseVector)

        currentAmmo -= 1

    }
    
    
    func reload() {
         guard !isReloading else { return }
         isReloading = true
         let waitAction = SKAction.wait(forDuration: reloadTime)
         let reloadAction = SKAction.run { [weak self] in
             self?.currentAmmo = self?.maxAmmo ?? 10
             self?.isReloading = false
         }
         
         self.run(SKAction.sequence([waitAction, reloadAction]))
     }
    
    
    func stop() {
       removeAction(forKey: PlayerAnimationType.shoot.rawValue)
        
    }
    
    
    
    
}
