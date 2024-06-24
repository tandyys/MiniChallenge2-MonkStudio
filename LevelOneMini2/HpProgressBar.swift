import SpriteKit

class HpProgressBar: SKNode {
    private var backgroundBar: SKSpriteNode!
    private var progressBar: SKSpriteNode!
    
    var progress: CGFloat = 0.0
    
    init(size: CGSize, backgroundImage: String, progressImage: String) {
        super.init()
        
        let backgroundTexture = SKTexture(imageNamed: backgroundImage)
        let progressBgTexture = SKTexture(imageNamed: progressImage)
        
        // Setup background bar with the texture
        self.backgroundBar = SKSpriteNode(texture: backgroundTexture)
        self.backgroundBar.size = size
        self.backgroundBar.zPosition = SKSpriteNode.Layer.label.rawValue
        addChild(backgroundBar)
        
        // Setup progress bar
        progressBar = SKSpriteNode(texture: progressBgTexture)
        progressBar.zPosition = SKSpriteNode.Layer.label.rawValue + 1
        progressBar.size = CGSize(width: size.width, height: size.height)
        progressBar.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        progressBar.position = CGPoint(x: -size.width / 2, y: 0) // Position at the start
        addChild(progressBar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Function to update progress
    func updateInnerBarWidth(health: CGFloat, totalHealth: CGFloat) {
         let newWidth = (health / totalHealth) * backgroundBar.size.width
         progressBar.size.width = newWidth
     }
}
