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
    
    
    var maxAmmo: Int = 1
    var currentAmmo: Int = 1
    var isReloading: Bool = false
    let reloadTime: TimeInterval = 2.0
    
    init() {
        let texture = SKTexture(imageNamed: "CanonRight_0")
        super.init(texture: texture, color: .clear, size: texture.size())
        self.canon_RightTextures = self.loadAnimation(atlas: "Canon_Right", prefix: "CanonRight_", startAt: 0, stopAt: 5)
        self.name = "Canon_Right"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.zPosition = SKSpriteNode.Layer.canon.rawValue
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
    
    func shootAnimation(){
        guard let canonRightTexture = canon_RightTextures else {
            preconditionFailure("Cant find canon_Right texture")
        }
        
        startAnimation(textures: canonRightTexture, speed: 0.0001, name: PlayerAnimationType.shoot.rawValue, count: 0, resize: true, restore: true)
    }
    
        func shootAction(movementSpeed: CGFloat) {
          
            guard currentAmmo > 0 else {
                print("Out of ammo, need to reload")
                return
            }
            let projectile = Projectile()
            let canonTipPosition = CGPoint(x: 140, y: 170)
            if let parent = parent {
                projectile.position = parent.convert(canonTipPosition, from: self)
            }
            self.parent?.addChild(projectile)
            let angleInRadians = CGFloat.pi * 3 / 4
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
    
    
  
    
    func stop(){
        removeAction(forKey: PlayerAnimationType.shoot.rawValue)
    }
    

    
    
}
