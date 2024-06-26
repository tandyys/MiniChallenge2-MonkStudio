////
////  Minion.swift
////  LevelOneMini2
////
////  Created by Christian Gunawan on 25/06/24.
////
//
//
//
//import Foundation
//import SpriteKit
//
//class Minion: SKSpriteNode {
//    enum PlayerAnimationType:String {
//        case walk
//    }
//    
//    private var MinionWalkTexture: [SKTexture]?
//    var hp:Double = 100
//    
//    init() {
//        let texture = SKTexture(imageNamed: "walk-b-0")
//        
//        super.init(texture: texture, color: .clear, size: texture.size())
//        
//        self.MinionWalkTexture = self.loadAnimation(atlas: "MinionWalkBlue", prefix: "walk-b-", startAt: 0, stopAt: 5)
//        self.name = "MinionBiru"
//        self.setScale(0.2)
//        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        self.zPosition = SKSpriteNode.Layer.character.rawValue
//        
//        
//        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height), center: CGPoint(x: self.xScale, y: self.yScale))
//        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.monster
//        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.shootFromKecil | SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.shootFromGendut | SKSpriteNode.PhysicsCategory.gendut
//        self.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.shootFromKecil | SKSpriteNode.PhysicsCategory.shootFromGendut
//        self.physicsBody?.affectedByGravity = false
//        self.physicsBody?.isDynamic = true
//        self.physicsBody?.allowsRotation = true
//        
//       
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError()
//    }
//    
//    func walk() {
//
//        guard let walkTexture = MinionWalkTexture else {
//            preconditionFailure("Cant find Minions texture")
//        }
//        startAnimation(textures: walkTexture, speed: 0.135, name: PlayerAnimationType.walk.rawValue, count: 0, resize: true, restore: true)
//    }
//    
//    func stop() {
//        removeAction(forKey: PlayerAnimationType.walk.rawValue)
//    }
//    
//    func die() {
//          let item = CollectableItem()
//          item.position = self.position
//          if let parent = self.parent {
//              parent.addChild(item)
//
//          }
//          self.removeFromParent()
//      }
//    
//    func removeFromParentCollectableItems(item: CollectableItem) {
//        item.removeFromParent()
//    }
//    
//    
//    
//}
