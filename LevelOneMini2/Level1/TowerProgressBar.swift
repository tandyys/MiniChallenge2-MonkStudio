//
//  TowerProgressBar.swift
//  LevelOneMini2
//
//  Created by tandyys on 23/06/24.
//

import Foundation
import SpriteKit

extension GameScene {
    
    func createRedProgressBar(at position: CGPoint) {
        border.fillColor = SKColor.black
        border.position = position
        border.lineWidth = 1
        border.strokeColor = SKColor.black
        border.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        addChild(border)
        
        progressBar.fillColor = SKColor.red
        progressBar.position = CGPoint(x: border.frame.minX + progressBar.frame.width/2, y: border.position.y)
        progressBar.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        progressBar.lineWidth = 1
        progressBar.strokeColor = SKColor.red
        addChild(progressBar)
    }
    
    func createPurpleProgressBar(at position: CGPoint) {
        border.fillColor = SKColor.black
        border.position = position
        border.lineWidth = 1
        border.strokeColor = SKColor.black
        border.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        addChild(border)
        
        progressBar.fillColor = SKColor.purple
        progressBar.position = CGPoint(x: border.frame.minX + progressBar.frame.width/2, y: border.position.y)
        progressBar.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        progressBar.lineWidth = 1
        progressBar.strokeColor = SKColor.purple
        addChild(progressBar)
    }
    
    func createBlueProgressBar(at position: CGPoint) {
        border.fillColor = SKColor.black
        border.position = position
        border.lineWidth = 1
        border.strokeColor = SKColor.black
        border.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        addChild(border)
        
        progressBar.fillColor = SKColor.blue
        progressBar.position = CGPoint(x: border.frame.minX + progressBar.frame.width/2, y: border.position.y)
        progressBar.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        progressBar.lineWidth = 1
        progressBar.strokeColor = SKColor.blue
        addChild(progressBar)
    }
    
    func createGreenProgressBar(at position: CGPoint) {
        border.fillColor = SKColor.black
        border.position = position
        border.lineWidth = 1
        border.strokeColor = SKColor.black
        border.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        addChild(border)
        
        progressBar.fillColor = SKColor.green
        progressBar.position = CGPoint(x: border.frame.minX + progressBar.frame.width/2, y: border.position.y)
        progressBar.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        progressBar.lineWidth = 1
        progressBar.strokeColor = SKColor.green
        addChild(progressBar)
    }
    
    func updateProgressBar(_ towerType: Double) {
        let scaleAction = SKAction.scaleX(to: towerType, duration: 0.1)
        progressBar.run(scaleAction)
    }
    
    func removeProgressBar() {
        SKAction.removeFromParent()
        removeChildren(in: [border, progressBar])
    }
    
}
