// Import necessary libraries
import Foundation
import SpriteKit

// Define the BossHpName class
class TowerWhite1Label: SKSpriteNode {
    
    // Initialize the BossHpName class
    init(message: String, position: CGPoint) {
        super.init(texture: nil, color: .clear, size: CGSize(width: 0, height: 0))
        
        
        // 3
        let label = SKLabelNode(fontNamed: "Comic Sans MS")
        label.zPosition = SKSpriteNode.Layer.label.rawValue
        label.text = message
        label.fontSize = 100
        label.fontColor = SKColor.black
        label.position = position
        addChild(label)
//        label.position = CGPoint(x: position.x - 100, y: position.y - 100)
//        addChild(label)
    }
    
    // Required initializer for NSCoder
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
