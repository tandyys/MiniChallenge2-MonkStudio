//
//  Tower.swift
//  LevelOneMini2
//
//  Created by tandyys on 19/06/24.
//

import Foundation
import SpriteKit

class Tower: SKSpriteNode {
    
    class func tower1White() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 3_White Broken")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        tower.setScale(1.15)
        return tower
    }
    
    class func tower1WhiteBuilt() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 3_White Built")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        tower.setScale(1.15)
        return tower
    }
    
    class func tower1WhiteActivated() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 3_White Activated")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        tower.setScale(1.15)
        return tower
    }
    
    class func tower2White() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 3_White Broken")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        tower.setScale(1.15)
        return tower
    }
    
    class func tower2WhiteBuilt() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 3_White Built")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        tower.setScale(1.15)
        return tower
    }
    
    class func tower2WhiteActivated() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 3_White Activated")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        tower.setScale(1.15)
        return tower
    }
    class func tower3White() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 3_White Broken")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        tower.setScale(1.15)
        return tower
    }
    
    class func tower3WhiteBuilt() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 3_White Built")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        tower.setScale(1.15)
        return tower
    }
    
    class func tower3WhiteActivated() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 3_White Activated")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        tower.setScale(1.15)
        return tower
    }
    
    
    class func towerRed() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 1_Red_Not Active")
//        tower.size = CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        tower.position = CGPoint(x: 500, y: 750)
        tower.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower.size.width/4, height: tower.size.height/4), center: CGPoint(x: 0, y: tower.size.height/2.2))
        tower.physicsBody?.affectedByGravity = false
        tower.physicsBody?.isDynamic = false
        tower.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerRedNotActivated
        tower.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        tower.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.kecil
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
        tower.position = CGPoint(x: 1100, y: -120)
        tower.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower.size.width/3, height: tower.size.height/4), center: CGPoint(x: 0, y: tower.size.height/2.5))
        tower.physicsBody?.affectedByGravity = false
        tower.physicsBody?.isDynamic = false
        tower.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerPurpleNotActivated
        tower.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        tower.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.kecil
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
        tower.position = CGPoint(x: 2550, y: -20)
        tower.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower.size.width/3, height: tower.size.height/4), center: CGPoint(x: 0, y: tower.size.height/2.5))
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
        tower.position = CGPoint(x: 1700, y: 900)
        tower.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower.size.width/4, height: tower.size.height/4), center: CGPoint(x: 0, y: tower.size.height/2.2))
        tower.physicsBody?.affectedByGravity = false
        tower.physicsBody?.isDynamic = false
        tower.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerGreenNotActivated
        tower.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        tower.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.kecil
        return tower
    }
    
    class func towerGreenActivated() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 1_Green")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        return tower
    }
}


