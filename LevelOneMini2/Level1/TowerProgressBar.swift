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
        progressBar = SKSpriteNode(imageNamed: "TowerProgBarBG")
        progressBar.position = position
        progressBar.zPosition = SKSpriteNode.Layer.label.rawValue
        self.addChild(progressBar)
        
        progressBarBg = SKSpriteNode(imageNamed: "RedTowerProgBarMask")
        progressBarBg.position = position
        progressBarBg.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        
        progressBarMask = SKSpriteNode(imageNamed: "TowerProgBarBG")
        progressBarMask.anchorPoint = CGPoint(x: 0, y: 0.5)
        progressBarMask.position = CGPoint(x: progressBarBg.frame.minX, y: progressBarBg.position.y)
        progressBarMask.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        progressBarMask.size = CGSize(width: 0, height: progressBarBg.size.height)
        
        cropNode = SKCropNode()
        cropNode.maskNode = progressBarMask
        cropNode.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        cropNode.addChild(progressBarBg)
        
        self.addChild(cropNode)
    }
    
    func createPurpleProgressBar(at position: CGPoint) {
        progressBar = SKSpriteNode(imageNamed: "TowerProgBarBG")
        progressBar.position = position
        progressBar.zPosition = SKSpriteNode.Layer.label.rawValue
        self.addChild(progressBar)
        
        progressBarBg = SKSpriteNode(imageNamed: "PurpleTowerProgBarMask")
        progressBarBg.position = position
        progressBarBg.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        
        progressBarMask = SKSpriteNode(imageNamed: "TowerProgBarBG")
        progressBarMask.anchorPoint = CGPoint(x: 0, y: 0.5)
        progressBarMask.position = CGPoint(x: progressBarBg.frame.minX, y: progressBarBg.position.y)
        progressBarMask.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        progressBarMask.size = CGSize(width: 0, height: progressBarBg.size.height)
        
        cropNode = SKCropNode()
        cropNode.maskNode = progressBarMask
        cropNode.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        cropNode.addChild(progressBarBg)
        
        self.addChild(cropNode)
    }
    
    func createBlueProgressBar(at position: CGPoint) {
        progressBar = SKSpriteNode(imageNamed: "TowerProgBarBG")
        progressBar.position = position
        progressBar.zPosition = SKSpriteNode.Layer.label.rawValue
        self.addChild(progressBar)
        
        progressBarBg = SKSpriteNode(imageNamed: "BlueTowerProgBarMask")
        progressBarBg.position = position
        progressBarBg.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        
        progressBarMask = SKSpriteNode(imageNamed: "TowerProgBarBG")
        progressBarMask.anchorPoint = CGPoint(x: 0, y: 0.5)
        progressBarMask.position = CGPoint(x: progressBarBg.frame.minX, y: progressBarBg.position.y)
        progressBarMask.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        progressBarMask.size = CGSize(width: 0, height: progressBarBg.size.height)
        
        cropNode = SKCropNode()
        cropNode.maskNode = progressBarMask
        cropNode.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        cropNode.addChild(progressBarBg)
        
        self.addChild(cropNode)
    }
    
    func createGreenProgressBar(at position: CGPoint) {
        progressBar = SKSpriteNode(imageNamed: "TowerProgBarBG")
        progressBar.position = position
        progressBar.zPosition = SKSpriteNode.Layer.label.rawValue
        self.addChild(progressBar)
        
        progressBarBg = SKSpriteNode(imageNamed: "GreenTowerProgBarMask")
        progressBarBg.position = position
        progressBarBg.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        
        progressBarMask = SKSpriteNode(imageNamed: "TowerProgBarBG")
        progressBarMask.anchorPoint = CGPoint(x: 0, y: 0.5)
        progressBarMask.position = CGPoint(x: progressBarBg.frame.minX, y: progressBarBg.position.y)
        progressBarMask.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        progressBarMask.size = CGSize(width: 0, height: progressBarBg.size.height)
        
        cropNode = SKCropNode()
        cropNode.maskNode = progressBarMask
        cropNode.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        cropNode.addChild(progressBarBg)
        
        self.addChild(cropNode)
    }
    
    func updateProgressBar(_ buttonPressedType: Double) {
        let progress = min(buttonPressedType / maxPressedTime, 1.0)
        progressBarMask.size.width = progress * progressBarBg.size.width
    }
    
    func deactiveRedTower(_ deactiveTime: Double) {
        let deactiveTime = TimeInterval(deactiveTime)
        let resizeAction = SKAction.resize(toWidth: -190, duration: deactiveTime)
        let completeAction = SKAction.run { [self] in
            SKAction.removeFromParent()
            removeChildren(in: [progressBar, progressBarBg, cropNode])
            towerRedActivate = false
            towerRedActivated.removeFromParent()
            addChild(towerRed)
        }
        
        let sequence = SKAction.sequence([resizeAction, completeAction])
        progressBarMask.run(sequence)
    }
    
//    func deactivePurpleTower(_ deactiveTime: Double) {
//        let deactiveTime = TimeInterval(deactiveTime)
//        let resizeAction = SKAction.resize(toWidth: -190, duration: deactiveTime)
//        let completeAction = SKAction.run { [self] in
//            SKAction.removeFromParent()
//            removeChildren(in: [progressBar, progressBarBg, cropNode])
//            towerPurpleActivate = false
//            towerPurpleActivated.removeFromParent()
//            addChild(towerPurple)
//        }
//        
//        let sequence = SKAction.sequence([resizeAction, completeAction])
//        progressBarMask.run(sequence)
//    }
//    
//    func deactiveBlueTower(_ deactiveTime: Double) {
//        let deactiveTime = TimeInterval(deactiveTime)
//        let resizeAction = SKAction.resize(toWidth: -190, duration: deactiveTime)
//        let completeAction = SKAction.run { [self] in
//            SKAction.removeFromParent()
//            removeChildren(in: [progressBar, progressBarBg, cropNode])
//            towerBlueActivate = false
//            towerBlueActivated.removeFromParent()
//            addChild(towerBlue)
//        }
//        
//        let sequence = SKAction.sequence([resizeAction, completeAction])
//        progressBarMask.run(sequence)
//    }
//    
//    func deactiveGreenTower(_ deactiveTime: Double) {
//        let deactiveTime = TimeInterval(deactiveTime)
//        let resizeAction = SKAction.resize(toWidth: -190, duration: deactiveTime)
//        let completeAction = SKAction.run { [self] in
//            SKAction.removeFromParent()
//            removeChildren(in: [progressBar, progressBarBg, cropNode])
//            towerGreenActivate = false
//            towerGreenActivated.removeFromParent()
//            addChild(towerPurple)
//        }
//        
//        let sequence = SKAction.sequence([resizeAction, completeAction])
//        progressBarMask.run(sequence)
//    }
    
    func removeProgressBar() {
        SKAction.removeFromParent()
        removeChildren(in: [progressBar, progressBarBg, cropNode])
    }
    
}
