//
//  GateSymbol.swift
//  LevelOneMini2
//
//  Created by tandyys on 27/06/24.
//

import Foundation
import SpriteKit

class GateSymbol: SKSpriteNode {
    class func symbolRed() -> GateSymbol {
        let symbol = GateSymbol(imageNamed: "symbol-p")
        symbol.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        symbol.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        symbol.position = CGPoint(x: 2350, y: 1705)
        return symbol
    }
    
    class func symbolPurple() -> GateSymbol {
        let symbol = GateSymbol(imageNamed: "symbol-r")
        symbol.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        symbol.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        symbol.position = CGPoint(x: 2155, y: 1740)
        return symbol
    }
    
    class func symbolBlue() -> GateSymbol {
        let symbol = GateSymbol(imageNamed: "symbol-b")
        symbol.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        symbol.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        symbol.position = CGPoint(x: 2230, y: 1760)
        return symbol
    }
    
    class func symbolGreen() -> GateSymbol {
        let symbol = GateSymbol(imageNamed: "symbol-g")
        symbol.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        symbol.zPosition = SKSpriteNode.Layer.towerUp.rawValue
        symbol.position = CGPoint(x: 2300, y: 1765)
        return symbol
    }
}
