import SpriteKit

class HpProgressBarBos: SKNode {
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
        progressBar.zPosition = SKSpriteNode.Layer.label.rawValue
        progressBar.size = CGSize(width: 0, height: size.height)
        progressBar.anchorPoint = CGPoint(x: 1.0, y: 0.5)
        progressBar.position = CGPoint(x: size.width / 2, y: 0) // Position at the start
        addChild(progressBar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Function to update progress
    func setProgress(_ progress: CGFloat) {
        self.progress = min(max(progress, 0.0), 1) // Clamp the value between 0 and 1
        let newWidth = backgroundBar.size.width * self.progress
        progressBar.size = CGSize(width: newWidth, height: progressBar.size.height)
    }
}
