//
//  BackgroundManager.swift
//  LevelOneMini2
//
//  Created by Christian Gunawan on 25/06/24.
//
import SpriteKit

class BackgroundManager {
    
    let backgroundImage: SKSpriteNode
    let foregroundImage: SKSpriteNode
    
    init(scene: SKScene) {
        backgroundImage = SKSpriteNode(imageNamed: "cave-background1x")
        backgroundImage.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
        backgroundImage.zPosition = SKSpriteNode.Layer.background.rawValue
        
        foregroundImage = SKSpriteNode(imageNamed: "cave-foreground1x")
        foregroundImage.position = CGPoint(x: scene.frame.midX, y: 400)
        foregroundImage.setScale(1.0)
        foregroundImage.zPosition = SKSpriteNode.Layer.foreground.rawValue
        
        scene.addChild(backgroundImage)
        scene.addChild(foregroundImage)
    }
}

// 2880, height: 1864))
