

import Foundation
import SpriteKit

class GedeProjectile: SKSpriteNode{
    enum CharacterProjectileAnimationType:String {
        case shoot
    }
    
    init(){
        let projectiles = SKTexture(imageNamed: "gedeProjectile")
                
        super.init(texture: projectiles, color: .clear, size: projectiles.size())
                
        self.name = "ProjectileShoot"
        self.setScale(0.5)
        self.zPosition = SKSpriteNode.Layer.tembakanDariKucing.rawValue
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = PhysicsCategory.shootFromGendut
        self.physicsBody?.contactTestBitMask = PhysicsCategory.monster
        self.physicsBody?.collisionBitMask = PhysicsCategory.none
        self.physicsBody?.affectedByGravity = false
                
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

