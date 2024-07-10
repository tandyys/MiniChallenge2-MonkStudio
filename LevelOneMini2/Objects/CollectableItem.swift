//
//  CollectableItem.swift
//  LevelOneMini2
//
//  Created by Christian Gunawan on 26/06/24.
//

import SpriteKit

class CollectableItem: SKSpriteNode {
    
    
    init() {
        let texture = SKTexture(imageNamed: "collectable")
        super.init(texture: texture, color: .clear, size: texture.size())
        self.name = "CollectableItem"
        self.setScale(0.5)
        self.zPosition = SKSpriteNode.Layer.collectibleItems.rawValue
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.collectablesitem
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.canonLeft | SKSpriteNode.PhysicsCategory.canonRight | SKSpriteNode.PhysicsCategory.canonLeftNotActivated | SKSpriteNode.PhysicsCategory.canonRightNotActivated |
        SKSpriteNode.PhysicsCategory.towerWhite1Destroyed | SKSpriteNode.PhysicsCategory.towerWhite2Destroyed | SKSpriteNode.PhysicsCategory.towerWhite3Destroyed
        self.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.canonLeft | SKSpriteNode.PhysicsCategory.canonRight | SKSpriteNode.PhysicsCategory.canonLeftNotActivated | SKSpriteNode.PhysicsCategory.canonRightNotActivated
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
