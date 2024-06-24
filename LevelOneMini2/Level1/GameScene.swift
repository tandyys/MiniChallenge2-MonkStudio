//
//  GameScene.swift
//  LevelOneMini2
//
//  Created by tandyys on 18/06/24.
//

import SpriteKit
import GameplayKit
import Carbon

class GameScene: SKScene {
    
    let gendut = Gendut()
    let kecil = Kecil()
    
    var gendutUpPressed:Bool = false
    var gendutDownPressed:Bool = false
    var gendutLeftPressed:Bool = false
    var gendutRightPressed:Bool = false
    
    var kecilUpPressed:Bool = false
    var kecilDownPressed:Bool = false
    var kecilLeftPressed:Bool = false
    var kecilRightPressed:Bool = false
    
    //Tower Not Activated
    let towerRed = Tower.towerRed()
    let towerPurple = Tower.towerPurple()
    let towerBlue = Tower.towerBlue()
    let towerGreen = Tower.towerGreen()
    //Tower Activated
    let towerRedActivated = Tower.towerRedActivated()
    let towerPurpleActivated = Tower.towerPurpleActivated()
    let towerBlueActivated = Tower.towerBlueActivated()
    let towerGreenActivated = Tower.towerGreenActivated()
    
    //Tower activating
    //Does the tower is active?
    var towerRedActivate:Bool = false
    var towerPurpleActivate:Bool = false
    var towerBlueActivate:Bool = false
    var towerGreenActivate:Bool = false
    
    //Does the button to activate tower is pressed?
    var activateRedTowerButtonPressed:Bool = false
    var activatePurpleTowerButtonPressed:Bool = false
    var activateBlueTowerButtonPressed:Bool = false
    var activateGreenTowerButtonPressed:Bool = false
    //Does the button to activate tower is available?
    var activateRedTowerButtonAvailable:Bool = false
    var activatePurpleTowerButtonAvailable:Bool = false
    var activateBlueTowerButtonAvailable:Bool = false
    var activateGreenTowerButtonAvailable:Bool = false
    
    var redPressedTime:Double = 0.0 
    var purplePressedTime:Double = 0.0
    var bluePressedTime:Double = 0.0
    var greenPressedTime:Double = 0.0
    
    //Progress Bar node
    var progressBar = SKShapeNode(rectOf: CGSize(width: 50, height: 50), cornerRadius: 5)
    let border = SKShapeNode(rectOf: CGSize(width: 250, height: 50), cornerRadius: 5)

    override func didMove(to view: SKView) {
        
        let ground = SKSpriteNode(imageNamed: "ground_new")
        ground.anchorPoint = CGPoint.zero
        ground.zPosition = SKSpriteNode.Layer.background.rawValue
        addChild(ground)
        
        let tree = SKSpriteNode(imageNamed: "tree_new")
        tree.size = CGSize(width: 3000, height: 800)
        tree.anchorPoint = CGPoint(x: 0, y: 1.0)
        tree.position = CGPoint(x: 0, y: frame.maxY)
        tree.zPosition = SKSpriteNode.Layer.tree.rawValue
        addChild(tree)
        
        let decor = SKSpriteNode(imageNamed: "decor")
        decor.scale(to: CGSize(width: 2800, height: 800))
        decor.anchorPoint = CGPoint(x: 0.12, y: 0.18)
        decor.position = CGPoint.zero
        decor.zPosition = SKSpriteNode.Layer.decor.rawValue
        addChild(decor)
        
        let gate = SKSpriteNode(imageNamed: "gate")
        gate.size = CGSize(width: 1100, height: 800)
        gate.anchorPoint = CGPoint(x: 0, y: 0.5)
        gate.position = CGPoint(x: 1750, y: 1480)
        gate.zPosition = SKSpriteNode.Layer.gate.rawValue
        gate.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: gate.size.width, height: gate.size.height), center: CGPoint(x: gate.size.width/2, y: 0.5))
        gate.physicsBody?.affectedByGravity = false
        gate.physicsBody?.isDynamic = false
        gate.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.gate
        gate.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.gendut
        gate.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        addChild(gate)
        
        addChild(gendut)
        addChild(kecil)
        
        towerRed.position = CGPoint(x: 300, y: 1300)
        towerRed.size = CGSize(width: gendut.size.width/1.5, height: gendut.size.height*1.5)
        towerRed.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: towerRed.size.width/1.5, height: towerRed.size.height/4), center: CGPoint(x: 0, y: towerRed.size.height/2.5))
        towerRed.physicsBody?.affectedByGravity = false
        towerRed.physicsBody?.isDynamic = false
        towerRed.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerRedNotActivated
        towerRed.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        towerRed.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        addChild(towerRed)
//        createProgressBar(at: CGPoint(x: towerRed.position.x, y: towerRed.position.y))
//        createNewProgressBar(at: CGPoint(x: towerRed.position.x, y: towerRed.position.y))
        
        towerPurple.size = CGSize(width: gendut.size.width/1.5, height: gendut.size.height*1.5)
        towerPurple.position = CGPoint(x: 900, y: 20)
        towerPurple.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: towerPurple.size.width/1.5, height: towerPurple.size.height/4), center: CGPoint(x: 0, y: towerPurple.size.height/5))
        towerPurple.physicsBody?.affectedByGravity = false
        towerPurple.physicsBody?.isDynamic = false
        towerPurple.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerPurpleNotActivated
        towerPurple.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        towerPurple.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        addChild(towerPurple)
        
        towerBlue.size = CGSize(width: gendut.size.width/1.5, height: gendut.size.height*1.5)
        towerBlue.position = CGPoint(x: 2750, y: 50)
        towerBlue.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: towerBlue.size.width/1.5, height: towerBlue.size.height/4), center: CGPoint(x: 0, y: towerBlue.size.height/5))
        towerBlue.physicsBody?.affectedByGravity = false
        towerBlue.physicsBody?.isDynamic = false
        towerBlue.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerBlueNotActivated
        towerBlue.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        towerBlue.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        addChild(towerBlue)
        
        towerGreen.size = CGSize(width: gendut.size.width/1.5, height: gendut.size.height*1.5)
        towerGreen.position = CGPoint(x: 1700, y: 1180)
        towerGreen.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: towerGreen.size.width/1.5, height: towerGreen.size.height/4), center: CGPoint(x: 0, y: towerGreen.size.height/2.5))
        towerGreen.physicsBody?.affectedByGravity = false
        towerGreen.physicsBody?.isDynamic = false
        towerGreen.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerGreenNotActivated
        towerGreen.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        towerGreen.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        addChild(towerGreen)

        physicsWorld.contactDelegate = self
        
    }
    
    override func keyDown(with event: NSEvent) {
        switch Int(event.keyCode) {
            case kVK_ANSI_W:
                gendutUpPressed = true
            case kVK_ANSI_A:
                gendutLeftPressed = true
            case kVK_ANSI_S:
                gendutDownPressed = true
            case kVK_ANSI_D:
                gendutRightPressed = true
            case kVK_UpArrow:
                kecilUpPressed = true
            case kVK_DownArrow:
                kecilDownPressed = true
            case kVK_LeftArrow:
                kecilRightPressed = true
            case kVK_RightArrow:
                kecilLeftPressed = true
            case kVK_ANSI_Q:
            if activateRedTowerButtonAvailable == true {
                activateRedTowerButtonPressed = true
            }
            if activatePurpleTowerButtonAvailable == true {
                activatePurpleTowerButtonPressed = true
            }
            if activateBlueTowerButtonAvailable == true {
                activateBlueTowerButtonPressed = true
            }
            if activateGreenTowerButtonAvailable == true {
                activateGreenTowerButtonPressed = true
            }
            default:
                break
        }
    }
    
    override func keyUp(with event: NSEvent) {
        switch Int(event.keyCode) {
        case kVK_ANSI_W:
            gendutUpPressed = false
            gendut.stop()
        case kVK_ANSI_A:
            gendutLeftPressed = false
            gendut.stop()
        case kVK_ANSI_S:
            gendutDownPressed = false
            gendut.stop()
        case kVK_ANSI_D:
            gendutRightPressed = false
            gendut.stop()
        case kVK_UpArrow:
            kecilUpPressed = false
            kecil.stop()
        case kVK_DownArrow:
            kecilDownPressed = false
            kecil.stop()
        case kVK_LeftArrow:
            kecilRightPressed = false
            kecil.stop()
        case kVK_RightArrow:
            kecilLeftPressed = false
            kecil.stop()
        case kVK_ANSI_Q:
            if activateRedTowerButtonPressed {
                activateRedTowerButtonPressed = false
//                self.removeAction(forKey: "redTowerActivation")
            }
            if activatePurpleTowerButtonPressed {
                activatePurpleTowerButtonPressed = false
//                self.removeAction(forKey: "purpleTowerActivation")
            }
            if activateBlueTowerButtonPressed {
                activateBlueTowerButtonPressed = false
//                self.removeAction(forKey: "blueTowerActivation")
            }
            if activateGreenTowerButtonPressed {
                activateGreenTowerButtonPressed = false
//                self.removeAction(forKey: "greenTowerActivation")
            }
        default:
            break
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        //Gendut movement
        //Case up-down
        if gendutUpPressed == true {
            gendut.position.y += 1.5
            gendut.walk()
        } else if gendutDownPressed == true {
            gendut.position.y -= 1.5
            gendut.walk()
        }
        
        //Case left-right
        if gendutLeftPressed == true {
            gendut.position.x -= 1.5
            gendut.xScale = -1
            gendut.walk()
        } else if gendutRightPressed == true {
            gendut.position.x += 1.5
            gendut.xScale = 1
            gendut.walk()
        }
        
        //Kecil movement
        //Case up-down
        if kecilUpPressed == true {
            kecil.position.y += 3
            kecil.walk()
        } else if kecilDownPressed == true {
            kecil.position.y -= 3
            kecil.walk()
        }
        
        //Case left-right
        if kecilLeftPressed == true {
            kecil.position.x += 3
            kecil.xScale = 1
            kecil.walk()
        } else if kecilRightPressed == true {
            kecil.position.x -= 3
            kecil.xScale = -1
            kecil.walk()
        }
        
        //Out of bounds
        if gendut.position.x < 0 {
            gendut.position.x = 0
        } else if gendut.position.x > self.size.width {
            gendut.position.x = self.size.width
        }

        if gendut.position.y < 0 {
            gendut.position.y = 0
        } else if gendut.position.y > frame.maxY - 500 {
            gendut.position.y = frame.maxY - 500
        }
        
        if kecil.position.x < 0 {
            kecil.position.x = 0
        } else if kecil.position.x > self.size.width {
            kecil.position.x = self.size.width
        }
        
        if kecil.position.y < 0 {
            kecil.position.y = 0
        } else if kecil.position.y > frame.maxY - 500 {
            kecil.position.y = frame.maxY - 500
        }
        
        //Overlaying character
        if kecil.position.y < gendut.position.y {
            kecil.zPosition = SKSpriteNode.Layer.characterKecilBack.rawValue
        } else if kecil.position.y > gendut.position.y {
            kecil.zPosition = SKSpriteNode.Layer.characterKecilFront.rawValue
        }
                
        //Tower Activation mechanism
        if activateRedTowerButtonPressed {
            redPressedTime += 1.0
            if redPressedTime == 900.0 {
                self.towerRedActivate = true
            }
        } else if !activateRedTowerButtonPressed {
            redPressedTime = 0.0
        }
        
        if activatePurpleTowerButtonPressed {
            purplePressedTime += 1.0
            if purplePressedTime == 900.0 {
                self.towerPurpleActivate = true
            }
        } else if !activatePurpleTowerButtonPressed {
            purplePressedTime = 0.0
        }
        
        if activateBlueTowerButtonPressed {
            bluePressedTime += 1.0
            if bluePressedTime == 900.0 {
                self.towerBlueActivate = true
            }
        } else if !activateBlueTowerButtonPressed {
            bluePressedTime = 0.0
        }
        
        if activateGreenTowerButtonPressed {
            greenPressedTime += 1.0
            if greenPressedTime == 900.0 {
                self.towerGreenActivate = true
            }
        } else if !activateGreenTowerButtonPressed {
            greenPressedTime = 0.0
        }
        
        
//        if activateRedTowerButtonPressed {
//            let waitRed = SKAction.wait(forDuration: 15.0)
//            let activatingRedTower = SKAction.run {
//                self.towerRedActivate = true
//            }
//            let sequenceRed = SKAction.sequence([waitRed, activatingRedTower])
//            self.run(sequenceRed, withKey: "redTowerActivation")
//        }
//        else {
//            self.removeAction(forKey: "redTowerActivation")
//        }
        
//        if activatePurpleTowerButtonPressed {
//            let waitPurple = SKAction.wait(forDuration: 15.0)
//            let activatingPurpleTower = SKAction.run {
//                self.towerPurpleActivate = true
//            }
//            let sequencePurple = SKAction.sequence([waitPurple, activatingPurpleTower])
//            self.run(sequencePurple, withKey: "purpleTowerActivation")
//        }
//        else {
//            self.removeAction(forKey: "purpleTowerActivation")
//        }
        
//        if activateBlueTowerButtonPressed {
//            let waitBlue = SKAction.wait(forDuration: 15.0)
//            let activatingBlueTower = SKAction.run {
//                self.towerBlueActivate = true
//            }
//            let sequenceBlue = SKAction.sequence([waitBlue, activatingBlueTower])
//            self.run(sequenceBlue, withKey: "blueTowerActivation")
//        }
//        else {
//            self.removeAction(forKey: "blueTowerActivation")
//        }
        
//        if activateGreenTowerButtonPressed {
//            let waitGreen = SKAction.wait(forDuration: 15.0)
//            let activatingGreenTower = SKAction.run {
//                self.towerGreenActivate = true
//            }
//            let sequenceGreen = SKAction.sequence([waitGreen, activatingGreenTower])
//            self.run(sequenceGreen, withKey: "greenTowerActivation")
//        }
//        else {
//            self.removeAction(forKey: "greenTowerActivation")
//        }
        
        if towerRedActivate == true {
            if let parent = towerRed.parent {
                let position = towerRed.position
                let zPos = towerRed.zPosition
                towerRedActivated.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: towerRed.size.width/1.5, height: towerRed.size.height/4), center: CGPoint(x: 0, y: towerRed.size.height/5))
                towerRedActivated.physicsBody?.affectedByGravity = false
                towerRedActivated.physicsBody?.isDynamic = false
                towerRedActivated.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerActivated
                towerRedActivated.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.none
                towerRedActivated.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
                towerRed.removeFromParent()
                towerRedActivated.size = CGSize(width: 300, height: 600)
                towerRedActivated.position = position
                towerRedActivated.zPosition = zPos
                parent.addChild(towerRedActivated)
            }
        }
        
        if towerPurpleActivate == true {
            if let parent = towerPurple.parent {
                let position = towerPurple.position
                let zPos = towerPurple.zPosition
                towerPurpleActivated.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: towerPurple.size.width/1.5, height: towerPurple.size.height/4), center: CGPoint(x: 0, y: towerPurple.size.height/5))
                towerPurpleActivated.physicsBody?.affectedByGravity = false
                towerPurpleActivated.physicsBody?.isDynamic = false
                towerPurpleActivated.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerActivated
                towerPurpleActivated.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.none
                towerPurpleActivated.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
                towerPurple.removeFromParent()
                towerPurpleActivated.size = CGSize(width: 300, height: 600)
                towerPurpleActivated.position = position
                towerPurpleActivated.zPosition = zPos
                parent.addChild(towerPurpleActivated)
            }
        }

        if towerBlueActivate == true {
            if let parent = towerBlue.parent {
                let position = towerBlue.position
                let zPos = towerBlue.zPosition
                towerBlueActivated.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: towerBlue.size.width/1.5, height: towerBlue.size.height/4), center: CGPoint(x: 0, y: towerBlue.size.height/5))
                towerBlueActivated.physicsBody?.affectedByGravity = false
                towerBlueActivated.physicsBody?.isDynamic = false
                towerBlueActivated.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerActivated
                towerBlueActivated.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.none
                towerBlueActivated.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
                towerBlue.removeFromParent()
                towerBlueActivated.size = CGSize(width: 300, height: 600)
                towerBlueActivated.position = position
                towerBlueActivated.zPosition = zPos
                parent.addChild(towerBlueActivated)
            }
        }
        
        if towerGreenActivate == true {
            if let parent = towerGreen.parent {
                let position = towerGreen.position
                let zPos = towerGreen.zPosition
                towerGreenActivated.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: towerGreen.size.width/1.5, height: towerGreen.size.height/4), center: CGPoint(x: 0, y: towerGreen.size.height/5))
                towerGreenActivated.physicsBody?.affectedByGravity = false
                towerGreenActivated.physicsBody?.isDynamic = false
                towerGreenActivated.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerActivated
                towerGreenActivated.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.none
                towerGreenActivated.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
                towerGreen.removeFromParent()
                towerGreenActivated.size = CGSize(width: 300, height: 600)
                towerGreenActivated.position = position
                towerGreenActivated.zPosition = zPos
                parent.addChild(towerGreenActivated)
            }
        }

    }
    
    func displayTextTower(at position: CGPoint) {
        let text = SKLabelNode(text: "Press Q to activate")
        text.position = position
        text.zPosition = SKSpriteNode.Layer.label.rawValue
        text.fontName = "Helvetica-Bold"
        text.fontSize = 36
        text.fontColor = SKColor.white
        addChild(text)
        
        text.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.0),
            SKAction.removeFromParent()
        ]))
    }
    
}
