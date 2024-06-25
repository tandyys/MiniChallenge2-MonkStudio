//
//  AttackFromBos.swift
//  LevelOneMini2
//
//  Created by Christian Gunawan on 25/06/24.
//

import SpriteKit

class AttackFromBos: SKSpriteNode{
    
    enum Shoot:String{
        case jatuh
    }
    
    private var jatuhan: [SKTexture]?
    
    class AttackFromBos: SKSpriteNode {
        
        init() {
            let texture = SKTexture(imageNamed: "stalaktit1")
            super.init(texture: texture, color: .clear, size: texture.size())
            
            self.setScale(1.0)
            self.zPosition = SKSpriteNode.Layer.jatuhan.rawValue
            
            let size = CGSize(width: self.size.width, height: self.size.height/3)
            self.physicsBody = SKPhysicsBody(rectangleOf: size, center: CGPoint(x: 0, y: 0))
            self.physicsBody?.isDynamic = false
            self.physicsBody?.categoryBitMask = PhysicsCategory.none
            self.physicsBody?.contactTestBitMask = PhysicsCategory.kecil | PhysicsCategory.gendut
            self.physicsBody?.collisionBitMask = PhysicsCategory.jatuhan
            self.physicsBody?.affectedByGravity = true
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    


    
    




    
}
