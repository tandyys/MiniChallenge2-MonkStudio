import SpriteKit

class MenuScene: SKScene {
    
    override func didMove(to view: SKView) {
        // Create the pop-up background
        let background = SKSpriteNode(color: .white, size: CGSize(width: 300, height: 200))
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(background)
        
        // Create three vertical buttons
        let button1 = createButton(title: "Button 1", position: CGPoint(x: size.width/2, y: size.height/2 + 30))
        let button2 = createButton(title: "Button 2", position: CGPoint(x: size.width/2, y: size.height/2))
        let button3 = createButton(title: "Button 3", position: CGPoint(x: size.width/2, y: size.height/2 - 30))
        
        // Create the close button "X"
        let closeButton = createButton(title: "X", position: CGPoint(x: size.width - 20, y: size.height - 20))
        
        // Add buttons to the menu scene
        addChild(button1)
        addChild(button2)
        addChild(button3)
        addChild(closeButton)
    }
    
    func createButton(title: String, position: CGPoint) -> SKLabelNode {
        let button = SKLabelNode(text: title)
        button.position = position
        button.fontSize = 20
        button.fontColor = .black
        return button
    }
    
    override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
        let node = atPoint(location)
        
        if let button = node as? SKLabelNode {
            if button.text == "X" {
                // Close the menu scene
                close()
            } else if button.text == "Button 1" {
                // Handle button 1 action
                print("Button 1 pressed")
            } else if button.text == "Button 2" {
                // Handle button 2 action
                print("Button 2 pressed")
            } else if button.text == "Button 3" {
                // Handle button 3 action
                print("Button 3 pressed")
            }
        }
    }
    
    func show() {
        if let view = self.view {
            view.presentScene(self)
        }
    }
    
    func close() {
        self.removeFromParent()
    }
}
