//
//  Tower.swift
//  LevelOneMini2
//
//  Created by tandyys on 19/06/24.
//

import Foundation
import SpriteKit

class Tower: SKSpriteNode {
    class func towerRed() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 1_Red_Not Active")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        tower.position = CGPoint(x: 300, y: 1300)
        tower.size = CGSize(width: 197, height: 508.5)
        tower.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower.size.width/1.5, height: tower.size.height/4), center: CGPoint(x: 0, y: tower.size.height/2.5))
        tower.physicsBody?.affectedByGravity = false
        tower.physicsBody?.isDynamic = false
        tower.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerRedNotActivated
        tower.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        tower.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        return tower
    }
    
    class func towerRedActivated() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 1_Red")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        return tower
    }
    
    class func towerPurple() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 1_Purple_Not Active")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerDown.rawValue
        tower.size = CGSize(width: 197, height: 508.5)
        tower.position = CGPoint(x: 900, y: 20)
        tower.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower.size.width/1.5, height: tower.size.height/4), center: CGPoint(x: 0, y: tower.size.height/5))
        tower.physicsBody?.affectedByGravity = false
        tower.physicsBody?.isDynamic = false
        tower.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerPurpleNotActivated
        tower.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        tower.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        return tower
    }
    
    class func towerPurpleActivated() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 1_Purple")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerDown.rawValue
        return tower
    }
    
    class func towerBlue() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 1_Blue_Not Active")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerDown.rawValue
        tower.size = CGSize(width: 197, height: 508.5)
        tower.position = CGPoint(x: 2750, y: 50)
        tower.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower.size.width/1.5, height: tower.size.height/4), center: CGPoint(x: 0, y: tower.size.height/5))
        tower.physicsBody?.affectedByGravity = false
        tower.physicsBody?.isDynamic = false
        tower.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerBlueNotActivated
        tower.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        tower.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        return tower
    }
    
    class func towerBlueActivated() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 1_Blue")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerDown.rawValue
        return tower
    }
    
    class func towerGreen() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 1_Green_Not Active")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        tower.size = CGSize(width: 197, height: 508.5)
        tower.position = CGPoint(x: 1700, y: 1180)
        tower.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower.size.width/1.5, height: tower.size.height/4), center: CGPoint(x: 0, y: tower.size.height/2.5))
        tower.physicsBody?.affectedByGravity = false
        tower.physicsBody?.isDynamic = false
        tower.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerGreenNotActivated
        tower.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        tower.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        return tower
    }
    
    class func towerGreenActivated() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 1_Green")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        return tower
    }
}
