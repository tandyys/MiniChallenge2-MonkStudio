import SpriteKit
import GameController
import Carbon

class GameScene31: SKScene {

    let menuScene = MenuScene()
    
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
    
    let towerWhite = Tower.towerWhite()
    let towerWhiteBuilt = Tower.towerWhiteBuilt()
    let towerWhiteActivated = Tower.towerWhiteActivated()
    

    var connectedControllers: [GCController] = []
    var playerControllers: [Int: GCController] = [:]
    let maximumControllerCount = 2
    
    
    override func didMove(to view: SKView) {
        
        let physicsOutline = SKShapeNode(rect: CGRect(x: -50, y: -50, width: 100, height: 100))
        physicsOutline.strokeColor = SKColor.black
        let backgroundImage = SKSpriteNode(imageNamed: "caveSVG")
        backgroundImage.position = CGPoint(x: frame.midX, y: frame.midY)
        backgroundImage.zPosition = SKSpriteNode.Layer.background.rawValue
        addChild(backgroundImage)
        
        let foregroundTexture = SKTexture(imageNamed: "cave-foreground1x")
        let foregroundNode = SKSpriteNode(texture: foregroundTexture)
        foregroundNode.position = CGPoint(x: frame.midX, y: frame.midY)
        foregroundNode.zPosition =  SKSpriteNode.Layer.platform.rawValue
        physicsOutline.position = foregroundNode.position
        addChild(foregroundNode)
        
        
        towerWhite.position = CGPoint(x: 300, y: 1000)
        towerWhite.size = CGSize(width: gendut.size.width/1.5, height: gendut.size.height*1.5)
        towerWhite.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: towerWhite.size.width/1.5, height: towerWhite.size.height/4), center: CGPoint(x: 0, y: towerWhite.size.height/2.5))
        towerWhite.physicsBody?.affectedByGravity = false
        towerWhite.physicsBody?.isDynamic = false
        towerWhite.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerWhiteDestroyed
        towerWhite.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        towerWhite.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        addChild(towerWhite)
        
        let boundaries = SKShapeNode(rectOf: CGSize(width: frame.width+1000, height: 20))
        boundaries.position = CGPoint(x: frame.size.width/2, y: size.height - frame.size.height/2 + 20 )
        boundaries.zPosition = SKSpriteNode.Layer.boundaries.rawValue
        boundaries.zRotation = -CGFloat.pi / 12
        let boundaryPhysics = SKPhysicsBody(rectangleOf: CGSize(width: frame.width+1000, height: 20))
        boundaryPhysics.categoryBitMask = SKSpriteNode.PhysicsCategory.platform
        boundaryPhysics.contactTestBitMask = SKSpriteNode.PhysicsCategory.none
        boundaryPhysics.collisionBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.gendut
        boundaryPhysics.isDynamic = false
        boundaryPhysics.affectedByGravity = false
        boundaryPhysics.allowsRotation = true
        boundaries.physicsBody = boundaryPhysics
        //        boundaries.fillColor = NSColor.white
        addChild(boundaries)
        
        let boundaries2 = SKShapeNode(rectOf: CGSize(width: frame.height, height: 20))
        boundaries2.position = CGPoint(x: 20, y: size.height - frame.size.height/2)
        boundaries2.zPosition = SKSpriteNode.Layer.boundaries.rawValue
        boundaries2.zRotation = CGFloat.pi/5
        let boundaries2Physics = SKPhysicsBody(rectangleOf: CGSize(width: frame.height, height: 20))
        boundaries2Physics.categoryBitMask = SKSpriteNode.PhysicsCategory.platform
        boundaries2Physics.contactTestBitMask = SKSpriteNode.PhysicsCategory.none
        boundaries2Physics.collisionBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.gendut
        boundaries2Physics.isDynamic = false
        boundaries2Physics.affectedByGravity = false
        boundaries2Physics.allowsRotation = true
        boundaries2.physicsBody = boundaries2Physics
//        boundaries2.fillColor = NSColor.white
        addChild(boundaries2)
                               
        
        let boundaries3 = SKShapeNode(rectOf: CGSize(width: frame.height, height: 20 ))
        boundaries3.position = CGPoint(x: size.width - 100, y: frame.size.height/3 )
        boundaries3.zPosition = SKSpriteNode.Layer.boundaries.rawValue
        boundaries3.zRotation = CGFloat.pi/3
        let boundaries3Physics = SKPhysicsBody(rectangleOf: CGSize(width: frame.height, height: 20))
        boundaries3Physics.categoryBitMask = SKSpriteNode.PhysicsCategory.platform
        boundaries3Physics.contactTestBitMask = SKSpriteNode.PhysicsCategory.none
        boundaries3Physics.collisionBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.gendut
        boundaries3Physics.isDynamic = false
        boundaries3Physics.affectedByGravity = false
        boundaries3Physics.allowsRotation = true
        boundaries3.physicsBody = boundaries3Physics
//        boundaries3.fillColor = NSColor.white
        addChild(boundaries3)
                                     
        gendut.position = CGPoint(x: gendut.size.width - kecil.size.width, y: 450)
        addChild(gendut)
        
        kecil.position = CGPoint(x: kecil.size.width - kecil.size.width/2, y: 650)
        addChild(kecil)
        
        physicsWorld.contactDelegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(didConnectController(_:)), name: NSNotification.Name.GCControllerDidConnect, object: nil)
    }
    
    
    @objc func didConnectController(_ notification: Notification) {
        guard connectedControllers.count < maximumControllerCount else { return }
        if let controller = notification.object as? GCController {
            connectedControllers.append(controller)
            if playerControllers[0] == nil {
                playerControllers[0] = controller
                print("Controller connected and assigned to Player 1 (Gendut).")
                setupGamepadInputGendut(for: controller)
                
            } else if playerControllers[1] == nil {
                playerControllers[1] = controller
                print("Controller connected and assigned to Player 2 (Kecil). ")
                setupGamepadInputKecil(for: controller)
            }
        }
    }
    
    func setupGamepadInputGendut(for controller: GCController) {
        if let extendedGamepad = controller.extendedGamepad {
            let handlerInstance = Handler()
            extendedGamepad.buttonMenu.valueChangedHandler = handlerInstance.buttonMenuValueChangedHandler
            extendedGamepad.buttonX.valueChangedHandler = handlerInstance.buttonXValueChangedHandler
            extendedGamepad.leftThumbstick.valueChangedHandler = { (thumbstick, xValue, yValue) in
                if controller == self.playerControllers[0] {
                    if xValue < -0.5 {
                        self.gendutLeftPressed = true
                    } else if xValue > 0.5 {
                        self.gendutRightPressed = true
                    } else {
                        self.gendutLeftPressed = false
                        self.gendutRightPressed = false
                    }
                    
                    if yValue < -0.5 {
                        self.gendutDownPressed = true
                    } else if yValue > 0.5{
                        self.gendutUpPressed = true
                    } else {
                        self.gendutDownPressed = false
                        self.gendutUpPressed = false
                    }
                    self.gendut.stop()
                }
            }
        }
    }


    
    func setupGamepadInputKecil(for controller: GCController) {

        if let extendedGamepad = controller.extendedGamepad {
            let handlerInstance = Handler()
            extendedGamepad.buttonMenu.valueChangedHandler = handlerInstance.buttonMenuValueChangedHandler
            extendedGamepad.buttonX.valueChangedHandler = handlerInstance.buttonXValueChangedHandler
            extendedGamepad.leftThumbstick.valueChangedHandler = { (thumbstick, xValue, yValue) in
                if controller == self.playerControllers[1] {
                    if xValue < -0.5 {
                        self.kecilRightPressed = true
                    } else if xValue > 0.5 {
                        self.kecilLeftPressed = true
                    } else {
                        self.kecilLeftPressed = false
                        self.kecilRightPressed = false
     
                    }
                    if yValue < -0.5 {
                        self.kecilDownPressed = true
                    } else if yValue > 0.5 {
                        self.kecilUpPressed = true
                    } else {
                        self.kecilDownPressed = false
                        self.kecilUpPressed = false
                    }
                    self.kecil.stop()
                
                }
                
            }
        }
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
            default:
                break
        }
        
        
        if let controller = playerControllers[0] {
            if let extendedGamepad = controller.extendedGamepad {
                let thumbstick = extendedGamepad.leftThumbstick
                if thumbstick.xAxis.value < -0.5 {
                    gendutLeftPressed = true
                } else if thumbstick.xAxis.value > 0.5 {
                    gendutRightPressed = true
                }
                if thumbstick.yAxis.value < -0.5 {
                    gendutDownPressed = true
                } else if thumbstick.yAxis.value > 0.5 {
                    gendutUpPressed = true
                }
            }
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
        default:
            break
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        //Gendut
        //Case up-down
        if gendutUpPressed == true {
            gendut.position.y += 2.5
            gendut.walk()
        } else if gendutDownPressed == true {
            gendut.position.y -= 2.5
            gendut.walk()
        }
        
        //Case left-right
        if gendutLeftPressed == true {
            gendut.position.x -= 2.5
            gendut.xScale = -1
            gendut.walk()
        } else if gendutRightPressed == true {
            gendut.position.x += 2.5
            gendut.xScale = 1
            gendut.walk()
        }
        
        //Kecil
        //Case up-down
        if kecilUpPressed == true {
            kecil.position.y += 5
            kecil.walk()
        } else if kecilDownPressed == true {
            kecil.position.y -= 5
            kecil.walk()
        }
        
        //Case left-right
        if kecilLeftPressed == true {
            kecil.position.x += 5
            kecil.xScale = 1
            kecil.walk()
        } else if kecilRightPressed == true {
            kecil.position.x -= 5
            kecil.xScale = -1
            kecil.walk()
        }
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
