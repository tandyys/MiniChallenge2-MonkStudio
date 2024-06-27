import Foundation
import SpriteKit

class Domain: SKSpriteNode {
    
    class func tower1WhiteDomain() -> Domain {
        let domain1 = Domain(imageNamed: "Domain")
        domain1.anchorPoint = CGPoint(x: 0.5, y: 0)
        domain1.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        return domain1
    }
    class func tower2WhiteDomain() -> Domain {
        let domain2 = Domain(imageNamed: "Domain")
        domain2.anchorPoint = CGPoint(x: 0.5, y: 0)
        domain2.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        return domain2
    }
    class func tower3WhiteDomain() -> Domain {
        let domain3 = Domain(imageNamed: "Domain")
        domain3.anchorPoint = CGPoint(x: 0.5, y: 0)
        domain3.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        return domain3
    }
}
