//
//  Minion.swift
//  LevelOneMini2
//
//  Created by Christian Gunawan on 25/06/24.
//

//
//  Gendut.swift
//  LevelOneMini2
//
//  Created by tandyys on 18/06/24.
//

import Foundation
import SpriteKit

class Minion: SKSpriteNode {
    enum PlayerAnimationType:String {
        case walk
    }
    
    private var MinionWalkTexture: [SKTexture]?
    var hp:Double = 100
    
    init() {
        let texture = SKTexture(imageNamed: "walk-b-0")
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.MinionWalkTexture = self.loadAnimation(atlas: "MinionWalkPurple", prefix: "walk-b-", startAt: 0, stopAt: 5)
        self.name = "MinionBiru"
        self.setScale(0.2)
//        self.size = CGSize(width: 320, height: 360)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = SKSpriteNode.Layer.character.rawValue
        
        //physics
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height), center: CGPoint(x: self.xScale, y: self.yScale+100))
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.monster
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.shootFromKecil | SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.shootFromGendut | SKSpriteNode.PhysicsCategory.gendut
        self.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.shootFromKecil | SKSpriteNode.PhysicsCategory.shootFromGendut
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = true
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func walk() {
        //Check the texture
        guard let walkTexture = MinionWalkTexture else {
            preconditionFailure("Cant find Minions texture")
        }
        
        //Run animation
        startAnimation(textures: walkTexture, speed: 0.135, name: PlayerAnimationType.walk.rawValue, count: 0, resize: true, restore: true)
    }
    
    func stop() {
        removeAction(forKey: PlayerAnimationType.walk.rawValue)
//        removeAllActions()
    }
    
    
    
}