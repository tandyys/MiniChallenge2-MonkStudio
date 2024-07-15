//
//  TowerProgressBar.swift
//  LevelOneMini2
//
//  Created by tandyys on 23/06/24.
//

import Foundation
import SpriteKit

extension GameScene31{
    
    func createWhite1ProgressBar(at position: CGPoint) {
        white1ProgressBar = SKSpriteNode(imageNamed: "TowerProgBarBG")
        white1ProgressBar.position = position
        white1ProgressBar.zPosition = SKSpriteNode.Layer.backProgBar.rawValue
        self.addChild(white1ProgressBar)
        
        white1ProgressBarBg = SKSpriteNode(imageNamed: "WhiteTowerProgBarMask")
        white1ProgressBarBg.position = position
        white1ProgressBarBg.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        
        white1ProgressBarMask = SKSpriteNode(imageNamed: "TowerProgBarBG")
        white1ProgressBarMask.anchorPoint = CGPoint(x: 0, y: 0.5)
        white1ProgressBarMask.position = CGPoint(x: white1ProgressBarBg.frame.minX, y: white1ProgressBarBg.position.y)
        white1ProgressBarMask.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        white1ProgressBarMask.size = CGSize(width: 0, height: white1ProgressBarBg.size.height)
        
        white1CropNode = SKCropNode()
        white1CropNode.maskNode = white1ProgressBarMask
        white1CropNode.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        white1CropNode.addChild(white1ProgressBarBg)
        
        self.addChild(white1CropNode)
    }
    func createWhite2ProgressBar(at position: CGPoint) {
        white2ProgressBar = SKSpriteNode(imageNamed: "TowerProgBarBG")
        white2ProgressBar.position = position
        white2ProgressBar.zPosition = SKSpriteNode.Layer.backProgBar.rawValue
        self.addChild(white2ProgressBar)
        
        white2ProgressBarBg = SKSpriteNode(imageNamed: "WhiteTowerProgBarMask")
        white2ProgressBarBg.position = position
        white2ProgressBarBg.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        
        white2ProgressBarMask = SKSpriteNode(imageNamed: "TowerProgBarBG")
        white2ProgressBarMask.anchorPoint = CGPoint(x: 0, y: 0.5)
        white2ProgressBarMask.position = CGPoint(x: white2ProgressBarBg.frame.minX, y: white2ProgressBarBg.position.y)
        white2ProgressBarMask.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        white2ProgressBarMask.size = CGSize(width: 0, height: white2ProgressBarBg.size.height)
        
        white2CropNode = SKCropNode()
        white2CropNode.maskNode = white2ProgressBarMask
        white2CropNode.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        white2CropNode.addChild(white2ProgressBarBg)
        
        self.addChild(white2CropNode)
    }
    func createWhite3ProgressBar(at position: CGPoint) {
        white3ProgressBar = SKSpriteNode(imageNamed: "TowerProgBarBG")
        white3ProgressBar.position = position
        white3ProgressBar.zPosition = SKSpriteNode.Layer.backProgBar.rawValue
        self.addChild(white3ProgressBar)
        
        white3ProgressBarBg = SKSpriteNode(imageNamed: "WhiteTowerProgBarMask")
        white3ProgressBarBg.position = position
        white3ProgressBarBg.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        
        white3ProgressBarMask = SKSpriteNode(imageNamed: "TowerProgBarBG")
        white3ProgressBarMask.anchorPoint = CGPoint(x: 0, y: 0.5)
        white3ProgressBarMask.position = CGPoint(x: white3ProgressBarBg.frame.minX, y: white3ProgressBarBg.position.y)
        white3ProgressBarMask.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        white3ProgressBarMask.size = CGSize(width: 0, height: white3ProgressBarBg.size.height)
        
        white3CropNode = SKCropNode()
        white3CropNode.maskNode = white3ProgressBarMask
        white3CropNode.zPosition = SKSpriteNode.Layer.progressBar.rawValue
        white3CropNode.addChild(white3ProgressBarBg)
        
        self.addChild(white3CropNode)
    }
    
    func updateWhite1ProgressBar(_ buttonPressedType: Double) {
        let white1Progress = min(buttonPressedType / maxPressedTime, 1.0)
        white1ProgressBarMask.size.width = white1Progress * white1ProgressBarBg.size.width
    }
    
    func updateWhite2ProgressBar(_ buttonPressedType: Double) {
        let white2Progress = min(buttonPressedType / maxPressedTime, 1.0)
        white2ProgressBarMask.size.width = white2Progress * white2ProgressBarBg.size.width
    }
    
    func updateWhite3ProgressBar(_ buttonPressedType: Double) {
        let white3Progress = min(buttonPressedType / maxPressedTime, 1.0)
        white3ProgressBarMask.size.width = white3Progress * white3ProgressBarBg.size.width
    }

    func deactiveWhite1Tower(_ deactiveTime: Double) {
        let deactiveTime = TimeInterval(deactiveTime)
        let resizeAction = SKAction.resize(toWidth: -190, duration: deactiveTime)
        let completeAction = SKAction.run { [self] in
            SKAction.removeFromParent()
            removeChildren(in: [white1ProgressBar, white1ProgressBarBg, white3CropNode])
            towerWhite1ActivateBool = false
            tower1WhiteActivated.removeFromParent()
            addChild(tower1White)
        }
        
        let sequence = SKAction.sequence([resizeAction, completeAction])
        white1ProgressBarMask.run(sequence)
    }
    func deactiveWhite2Tower(_ deactiveTime: Double) {
        let deactiveTime = TimeInterval(deactiveTime)
        let resizeAction = SKAction.resize(toWidth: -190, duration: deactiveTime)
        let completeAction = SKAction.run { [self] in
            SKAction.removeFromParent()
            removeChildren(in: [white2ProgressBar, white2ProgressBarBg, white2CropNode])
            towerWhite2ActivateBool = false
            tower2WhiteActivated.removeFromParent()
            addChild(tower2White)
        }
        
        let sequence = SKAction.sequence([resizeAction, completeAction])
        white2ProgressBarMask.run(sequence)
    }
    func deactiveWhite3Tower(_ deactiveTime: Double) {
        let deactiveTime = TimeInterval(deactiveTime)
        let resizeAction = SKAction.resize(toWidth: -190, duration: deactiveTime)
        let completeAction = SKAction.run { [self] in
            SKAction.removeFromParent()
            removeChildren(in: [white3ProgressBar, white3ProgressBarBg, white3CropNode])
            towerWhite3ActivateBool = false
            tower3WhiteActivated.removeFromParent()
            addChild(tower3White)
        }
        
        let sequence = SKAction.sequence([resizeAction, completeAction])
        white3ProgressBarMask.run(sequence)
    }
    
    func removeWhite1ProgressBar() {
        SKAction.removeFromParent()
        removeChildren(in: [white1ProgressBar, white1ProgressBarBg, white1CropNode])
    }
    func removeWhite2ProgressBar() {
        SKAction.removeFromParent()
        removeChildren(in: [white2ProgressBar, white2ProgressBarBg, white2CropNode])
    }
    func removeWhite3ProgressBar() {
        SKAction.removeFromParent()
        removeChildren(in: [white3ProgressBar, white3ProgressBarBg, white3CropNode])
    }
}

extension GameScene1 {
    
    func createRedProgressBar(at position: CGPoint) {
        redProgressBar = SKSpriteNode(imageNamed: "TowerProgBarBG")
        redProgressBar.position = position
        redProgressBar.zPosition = SKSpriteNode.Layer.backProgBar.rawValue
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
        purpleProgressBar.zPosition = SKSpriteNode.Layer.backProgBar.rawValue
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
        blueProgressBar.zPosition = SKSpriteNode.Layer.backProgBar.rawValue
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
        greenProgressBar.zPosition = SKSpriteNode.Layer.backProgBar.rawValue
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

    

