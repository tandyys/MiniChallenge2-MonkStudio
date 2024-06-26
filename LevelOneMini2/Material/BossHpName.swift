// Import necessary libraries
import Foundation
import SpriteKit

// Define the BossHpName class
class BossHpName: SKSpriteNode {
    
    // Initialize the BossHpName class
    init() {
        let texture = SKTexture(imageNamed: "hpBosLabel")
        super.init(texture: texture, color: .clear, size: CGSize(width: texture.size().width * 0.4, height: texture.size().height * 0.4))
        
        self.position = CGPoint(x: 900, y: 1640) 
        self.zPosition = CGFloat(SKSpriteNode.Layer.label.rawValue)
    }
    
    // Required initializer for NSCoder
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
