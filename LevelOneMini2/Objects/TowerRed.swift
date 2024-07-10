//
//  TowerRed.swift
//  LevelOneMini2
//
//  Created by tandyys on 25/06/24.
//

import Foundation
import SpriteKit

class TowerRed: SKSpriteNode {
    enum TowerAnimationType:String {
        case active
    }
    
    private var towerRedActiveTexture: [SKTexture]?
    
    init() {
        let texture = SKTexture(imageNamed: "TowerRed_0")
        
        super.init(texture: texture, color: .clear, size: texture.size())
        
        self.towerRedActiveTexture = self.loadAnimation(atlas: "TowerRed", prefix: "TowerRed_", startAt: 1, stopAt: 2)
        
        self.name = "TowerRed"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        self.position = CGPoint(x: 300, y: 1300)
        self.size = CGSize(width: 197, height: 508.5)
        
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width/1.5, height: self.size.height/4), center: CGPoint(x: 0, y: self.size.height/2.5))
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerRedNotActivated
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        self.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func activated() {
        guard let redTowerActiveAnimationTexture = towerRedActiveTexture else {
            preconditionFailure("Can't find red tower texture")
        }
        startAnimation(textures: redTowerActiveAnimationTexture, speed: 0.100, name: TowerAnimationType.active.rawValue, count: 0, resize: true, restore: true)
    }
    
    func deactive() {
        removeAction(forKey: TowerAnimationType.active.rawValue)
    }
}
