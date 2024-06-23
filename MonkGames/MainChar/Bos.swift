//
//  Bos.swift
//  MonkGames
//
//  Created by Christian Gunawan on 23/06/24.
//

import Foundation
import SpriteKit

class Bos: SKSpriteNode {
    enum PlayerAnimationType:String {
        case move
    }
    
    private var bosMoveTexture: [SKTexture]?
    
    init() {
        let texture = SKTexture(imageNamed: "ratBoss_0")
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.bosMoveTexture = self.loadAnimation(atlas: "Bos", prefix: "ratBos_", startAt: 0, stopAt: 5)
        
        self.name = "Bos"
        self.setScale(1.5)
//        self.size = CGSize(width: 320, height: 360)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = SKSpriteNode.Layer.bos.rawValue
        
        //physics
//        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height/3), center: CGPoint(x: 0, y: self.size.height/3))
//        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.gendut
//        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.tower | SKSpriteNode.PhysicsCategory.canon
//        self.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.tower | SKSpriteNode.PhysicsCategory.canon
//        self.physicsBody?.affectedByGravity = false
//        self.physicsBody?.isDynamic = true
//        self.physicsBody?.allowsRotation = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func walk() {
        //Check the texture
        guard let bosTexture = bosMoveTexture else {
            preconditionFailure("Cant find gendut texture")
        }
        
        //Run animation
        startAnimation(textures: bosTexture, speed: 0.135, name: PlayerAnimationType.move.rawValue, count: 0, resize: true, restore: true)
    }
    
    func stop() {
        removeAction(forKey: PlayerAnimationType.move.rawValue)
//        removeAllActions()
    }
}
