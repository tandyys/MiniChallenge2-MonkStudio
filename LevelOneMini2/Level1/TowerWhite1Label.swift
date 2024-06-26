// Import necessary libraries
import Foundation
import SpriteKit

// Define the BossHpName class
class TowerWhite1Label: SKSpriteNode {
    
    // Initialize the BossHpName class
    init(message: String ) {
        let message = message
        
        // 3
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = message
        label.fontSize = 40
        label.fontColor = SKColor.black
        label.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(label)
    }
    
    // Required initializer for NSCoder
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
