//
//  StoryBoard.swift
//  LevelOneMini2
//
//  Created by Sena Kristiawan on 26/06/24.
//

import SpriteKit

class Intro: SKScene{
    override func didMove(to view: SKView) {
            let intro = SKSpriteNode(imageNamed: "mainMenu_bg")
            intro.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
            intro.zPosition = SKSpriteNode.Layer.backMenu.rawValue
            addChild(intro)
            
            let button = SKSpriteNode(imageNamed: "mainMenu_button")
            button.position = CGPoint(x: self.frame.midX, y: self.frame.midY-400)
            button.zPosition = SKSpriteNode.Layer.buttonMenu.rawValue
            button.name = "mainMenuButton"
            addChild(button)
            
            
            let logo = SKSpriteNode(imageNamed: "mainMenu_logo")
//            logo.size = CGSize(width: 100, height: 100)
            logo.position = CGPoint(x: self.frame.midX, y: self.frame.midY+400)
            logo.zPosition = SKSpriteNode.Layer.logoMenu.rawValue
            addChild(logo)
    }
    
    override func mouseDown(with event: NSEvent) {
        let locationMouse = event.location(in: self)
        let touchedNode = self.atPoint(locationMouse)
            
            if touchedNode.name == "mainMenuButton" {
                startGame()
            }
    }
    
    func startGame(){
        let reveal = SKTransition.fade(withDuration: 0.5)
        let scene = ChooseCharacterScene(size: size)
        view?.scene?.scaleMode = .aspectFit
        self.view?.presentScene(scene, transition:reveal)
    }
    
}
