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
        return tower
    }
    
    class func towerGreenActivated() -> Tower {
        let tower = Tower(imageNamed: "Tower_Level 1_Green")
        tower.anchorPoint = CGPoint(x: 0.5, y: 0)
        tower.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        return tower
    }
}
