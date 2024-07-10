import SpriteKit

class PauseMenuScene: SKScene {
    
    weak var gameScene: GameScene31?
    
    override func didMove(to view: SKView) {
        // Setup your pause menu UI here
        let background = SKSpriteNode(imageNamed: "mainMenu_bg")
          background.position = CGPoint(x: frame.midX, y: frame.midY)
            background.zPosition = -1
          addChild(background)
        
        let gameOverLabel = SKSpriteNode(imageNamed: "Paused")
          gameOverLabel.position = CGPoint(x: frame.midX, y: frame.midY+200)
        gameOverLabel.setScale(2)
          addChild(gameOverLabel)
        
        let resumeButton = SKSpriteNode(imageNamed: "Resume")
        resumeButton.position = CGPoint(x: frame.midX, y: frame.midY-200)
        resumeButton.name = "resumeButton"
        addChild(resumeButton)
    }
    
    
    override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
        let touchedNode = self.atPoint(location)
        
        if touchedNode.name == "resumeButton" {
            let reveal = SKTransition.fade(withDuration: 0.5)
            let scene = GameScene31(size: size)
            view?.scene?.scaleMode = .aspectFit
            self.view?.presentScene(scene, transition:reveal)
        }
    }
}
