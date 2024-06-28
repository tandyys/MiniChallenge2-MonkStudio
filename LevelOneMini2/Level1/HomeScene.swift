//
//  HomeScene.swift
//  LevelOneMini2
//
//  Created by tandyys on 28/06/24.
//

import Foundation
import SpriteKit

class HomeScene: SKScene {
    override func didMove(to view: SKView) {
        let homeBG = SKSpriteNode(imageNamed: "HomeView")
        homeBG.anchorPoint = CGPoint.zero
        addChild(homeBG)
        
        let gameLogo = SKSpriteNode(imageNamed: "HomeViewLogo")
        gameLogo.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        gameLogo.position = CGPoint(x: frame.width/2, y: frame.height/2)
        gameLogo.size = CGSize(width: 1131, height: 984)
        addChild(gameLogo)
    }
}
