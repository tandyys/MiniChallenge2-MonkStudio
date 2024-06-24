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
        redProgressBar = SKSpriteNode(imageNamed: "TowerProgBarBG")
        redProgressBar.position = position
        redProgressBar.zPosition = SKSpriteNode.Layer.label.rawValue
        self.addChild(redProgressBar)
        
        redProgressBarBg = SKSpriteNode(imageNamed: "RedTowerProgBarMask")
        redProgressBarBg.position = position
        redProgressBarBg.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        
        redProgressBarMask = SKSpriteNode(imageNamed: "TowerProgBarBG")
        redProgressBarMask.anchorPoint = CGPoint(x: 0, y: 0.5)
        redProgressBarMask.position = CGPoint(x: redProgressBarBg.frame.minX, y: redProgressBarBg.position.y)
        redProgressBarMask.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        redProgressBarMask.size = CGSize(width: 0, height: redProgressBarBg.size.height)
        
        redCropNode = SKCropNode()
        redCropNode.maskNode = redProgressBarMask
        redCropNode.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        redCropNode.addChild(redProgressBarBg)
        
        self.addChild(redCropNode)
    }
    
    func createPurpleProgressBar(at position: CGPoint) {
        purpleProgressBar = SKSpriteNode(imageNamed: "TowerProgBarBG")
        purpleProgressBar.position = position
        purpleProgressBar.zPosition = SKSpriteNode.Layer.label.rawValue
        self.addChild(purpleProgressBar)
        
        purpleProgressBarBg = SKSpriteNode(imageNamed: "PurpleTowerProgBarMask")
        purpleProgressBarBg.position = position
        purpleProgressBarBg.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        
        purpleProgressBarMask = SKSpriteNode(imageNamed: "TowerProgBarBG")
        purpleProgressBarMask.anchorPoint = CGPoint(x: 0, y: 0.5)
        purpleProgressBarMask.position = CGPoint(x: purpleProgressBarBg.frame.minX, y: purpleProgressBarBg.position.y)
        purpleProgressBarMask.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        purpleProgressBarMask.size = CGSize(width: 0, height: purpleProgressBarBg.size.height)
        
        purpleCropNode = SKCropNode()
        purpleCropNode.maskNode = purpleProgressBarMask
        purpleCropNode.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        purpleCropNode.addChild(purpleProgressBarBg)
        
        self.addChild(purpleCropNode)
    }
    
    func createBlueProgressBar(at position: CGPoint) {
        blueProgressBar = SKSpriteNode(imageNamed: "TowerProgBarBG")
        blueProgressBar.position = position
        blueProgressBar.zPosition = SKSpriteNode.Layer.label.rawValue
        self.addChild(blueProgressBar)
        
        blueProgressBarBg = SKSpriteNode(imageNamed: "BlueTowerProgBarMask")
        blueProgressBarBg.position = position
        blueProgressBarBg.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        
        blueProgressBarMask = SKSpriteNode(imageNamed: "TowerProgBarBG")
        blueProgressBarMask.anchorPoint = CGPoint(x: 0, y: 0.5)
        blueProgressBarMask.position = CGPoint(x: blueProgressBarBg.frame.minX, y: blueProgressBarBg.position.y)
        blueProgressBarMask.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        blueProgressBarMask.size = CGSize(width: 0, height: blueProgressBarBg.size.height)
        
        blueCropNode = SKCropNode()
        blueCropNode.maskNode = blueProgressBarMask
        blueCropNode.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        blueCropNode.addChild(blueProgressBarBg)
        
        self.addChild(blueCropNode)
    }
    
    func createGreenProgressBar(at position: CGPoint) {
        greenProgressBar = SKSpriteNode(imageNamed: "TowerProgBarBG")
        greenProgressBar.position = position
        greenProgressBar.zPosition = SKSpriteNode.Layer.label.rawValue
        self.addChild(greenProgressBar)
        
        greenProgressBarBg = SKSpriteNode(imageNamed: "GreenTowerProgBarMask")
        greenProgressBarBg.position = position
        greenProgressBarBg.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        
        greenProgressBarMask = SKSpriteNode(imageNamed: "TowerProgBarBG")
        greenProgressBarMask.anchorPoint = CGPoint(x: 0, y: 0.5)
        greenProgressBarMask.position = CGPoint(x: greenProgressBarBg.frame.minX, y: greenProgressBarBg.position.y)
        greenProgressBarMask.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        greenProgressBarMask.size = CGSize(width: 0, height: greenProgressBarBg.size.height)
        
        greenCropNode = SKCropNode()
        greenCropNode.maskNode = greenProgressBarMask
        greenCropNode.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        greenCropNode.addChild(greenProgressBarBg)
        
        self.addChild(greenCropNode)
    }
    
    func updateRedProgressBar(_ buttonPressedType: Double) {
        let redProgress = min(buttonPressedType / maxPressedTime, 1.0)
        redProgressBarMask.size.width = redProgress * redProgressBarBg.size.width
    }
    func updatePurpleProgressBar(_ buttonPressedType: Double) {
        let purpleProgress = min(buttonPressedType / maxPressedTime, 1.0)
        purpleProgressBarMask.size.width = purpleProgress * purpleProgressBarBg.size.width
    }
    func updateBlueProgressBar(_ buttonPressedType: Double) {
        let blueProgress = min(buttonPressedType / maxPressedTime, 1.0)
        blueProgressBarMask.size.width = blueProgress * blueProgressBarBg.size.width
    }
    func updateGreenProgressBar(_ buttonPressedType: Double) {
        let greenProgress = min(buttonPressedType / maxPressedTime, 1.0)
        greenProgressBarMask.size.width = greenProgress * greenProgressBarBg.size.width
    }
    
    func deactiveRedTower(_ deactiveTime: Double) {
        let deactiveTime = TimeInterval(deactiveTime)
        let resizeAction = SKAction.resize(toWidth: -190, duration: deactiveTime)
        let completeAction = SKAction.run { [self] in
            SKAction.removeFromParent()
            removeChildren(in: [redProgressBar, redProgressBarBg, redCropNode])
            towerRedActivate = false
            towerRedActivated.removeFromParent()
            addChild(towerRed)
        }
        
        let sequence = SKAction.sequence([resizeAction, completeAction])
        redProgressBarMask.run(sequence)
    }
    
    func deactivePurpleTower(_ deactiveTime: Double) {
        let deactiveTime = TimeInterval(deactiveTime)
        let resizeAction = SKAction.resize(toWidth: -190, duration: deactiveTime)
        let completeAction = SKAction.run { [self] in
            SKAction.removeFromParent()
            removeChildren(in: [purpleProgressBar, purpleProgressBarBg, purpleCropNode])
            towerPurpleActivate = false
            towerPurpleActivated.removeFromParent()
            addChild(towerPurple)
        }
        
        let sequence = SKAction.sequence([resizeAction, completeAction])
        purpleProgressBarMask.run(sequence)
    }
    
    func deactiveBlueTower(_ deactiveTime: Double) {
        let deactiveTime = TimeInterval(deactiveTime)
        let resizeAction = SKAction.resize(toWidth: -190, duration: deactiveTime)
        let completeAction = SKAction.run { [self] in
            SKAction.removeFromParent()
            removeChildren(in: [blueProgressBar, blueProgressBarBg, blueCropNode])
            towerBlueActivate = false
            towerBlueActivated.removeFromParent()
            addChild(towerBlue)
        }
        
        let sequence = SKAction.sequence([resizeAction, completeAction])
        blueProgressBarMask.run(sequence)
    }
    
    func deactiveGreenTower(_ deactiveTime: Double) {
        let deactiveTime = TimeInterval(deactiveTime)
        let resizeAction = SKAction.resize(toWidth: -190, duration: deactiveTime)
        let completeAction = SKAction.run { [self] in
            SKAction.removeFromParent()
            removeChildren(in: [greenProgressBar, greenProgressBarBg, greenCropNode])
            towerGreenActivate = false
            towerGreenActivated.removeFromParent()
            addChild(towerPurple)
        }
        
        let sequence = SKAction.sequence([resizeAction, completeAction])
        greenProgressBarMask.run(sequence)
    }
    
    func removeRedProgressBar() {
        SKAction.removeFromParent()
        removeChildren(in: [redProgressBar, redProgressBarBg, redCropNode])
    }
    func removePurpleProgressBar() {
        SKAction.removeFromParent()
        removeChildren(in: [purpleProgressBar, purpleProgressBarBg, purpleCropNode])
    }
    func removeBlueProgressBar() {
        SKAction.removeFromParent()
        removeChildren(in: [blueProgressBar, blueProgressBarBg, blueCropNode])
    }
    func removeGreenProgressBar() {
        SKAction.removeFromParent()
        removeChildren(in: [greenProgressBar, greenProgressBarBg, greenCropNode])
    }
    
}
