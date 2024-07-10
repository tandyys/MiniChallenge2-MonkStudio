//
//  StoryBoard.swift
//  LevelOneMini2
//
//  Created by Sena Kristiawan on 26/06/24.
//

import SpriteKit

class ChooseCharacterScene: SKScene{
    override func didMove(to view: SKView) {
            let intro = SKSpriteNode(imageNamed: "selectChar")
            intro.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            intro.zPosition = SKSpriteNode.Layer.backMenu.rawValue
            intro.name = "background"
            addChild(intro)
            
            
//            let introAction = SKAction.run { [unowned self] in
//                self.addChild(intro)
//            }
//
//            let buttonAction = SKAction.run { [unowned self] in
//                self.addChild(button)
//            }
//
//            let logoAction = SKAction.run { [unowned self] in
//                self.addChild(logo)
//            }
//
//            let removeAction = SKAction.run { [unowned self] in
//                intro.removeFromParent()
//                button.removeFromParent()
//                logo.removeFromParent()
//            }
//
//            run(SKAction.sequence([introAction, SKAction.wait(forDuration: 2.0), buttonAction, SKAction.wait(forDuration: 2.0), logoAction, SKAction.wait(forDuration: 2.0), removeAction]))
    }
    
    override func mouseDown(with event: NSEvent) {
        let locationMouse = event.location(in: self)
        let touchedNode = self.atPoint(locationMouse)
            
            if touchedNode.name == "background" {
                startGame()
            }
    }
    
    func startGame(){
        let reveal = SKTransition.fade(withDuration: 0.5)
        let scene = PrologVideoScene(size: size)
        view?.scene?.scaleMode = .aspectFit
        self.view?.presentScene(scene, transition:reveal)
    }
    
}
