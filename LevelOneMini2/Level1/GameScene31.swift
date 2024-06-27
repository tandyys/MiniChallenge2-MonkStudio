import SpriteKit
import GameController
import Carbon

class GameScene31: SKScene {

    let menuScene = MenuScene()
    
    var messageTemp:String = ""
    
    let gendut = Gendut()
    let kecil = Kecil()
    let bos = Bos()
    var gedeProjectile : GedeProjectile?
    var kecilProjectile : KecilProjectile?
    
    let attackManager = AttackManager()
    var healthBarBos: HpProgressBar!
     var healthBarGendut: HpProgressBar!
     var healthBarKecil: HpProgressBar!
    let BosHpNameLabel = BossHpName()
    
    var gendutShoot: Bool = false
    var kecilShoot: Bool = false
    
    var totalMonsterOnScreen: Int = 0
    var monsterDelay: TimeInterval = 2.0
    
    var gendutUpPressed:Bool = false
    var gendutDownPressed:Bool = false
    var gendutLeftPressed:Bool = false
    var gendutRightPressed:Bool = false
    
    var collectibleItemsTower1:Double = 0.0
    var collectibleItemsTower2:Double = 0.0
    var collectibleItemsTower3:Double = 0.0
    
    var keysProjectile:CGPoint = CGPoint(x: 0, y: 0)
    var aimXKecil: Double = 0
    var aimYKecil: Double = 0
    var aimXGendut: Double = 0
    var aimYGendut: Double = 0
    
    var aimDestinationKecil: CGPoint = CGPoint(x: 0, y: 0)
    var aimDestinationGendut: CGPoint = CGPoint(x: 0, y: 0)
    
    var viewWidth:Double = 0.0
    var viewHeight:Double = 0.0
    
    var kecilUpPressed:Bool = false
    var kecilDownPressed:Bool = false
    var kecilLeftPressed:Bool = false
    var kecilRightPressed:Bool = false
    var kecilQPressed:Bool = false
    
    var aimKecil :Bool = true
    
    let buildText = SKLabelNode(text: "Press Q to build")
    let activateText = SKLabelNode(text: "Press Q to activate")
    var damage = 200
    
    var white1BuiltPressedTime:Double = 0.0
    var white2BuiltPressedTime:Double = 0.0
    var white3BuiltPressedTime:Double = 0.0
    
    var white1ActivatePressedTime:Double = 0.0
    var white2ActivatePressedTime:Double = 0.0
    var white3ActivatePressedTime:Double = 0.0
    let maxPressedTime:Double = 200.0
    
    let tower1White = Tower.tower1White()
    let tower1WhiteBuilt = Tower.tower1WhiteBuilt()
    let tower1WhiteActivated = Tower.tower1WhiteActivated()
    let domain1White = Domain.tower1WhiteDomain()
    
    let tower2White = Tower.tower2White()
    let tower2WhiteBuilt = Tower.tower2WhiteBuilt()
    let tower2WhiteActivated = Tower.tower2WhiteActivated()
    let domain2White = Domain.tower2WhiteDomain()
    
    let tower3White = Tower.tower3White()
    let tower3WhiteBuilt = Tower.tower3WhiteBuilt()
    let tower3WhiteActivated = Tower.tower3WhiteActivated()
    let domain3White = Domain.tower3WhiteDomain()
    
    
    var buildWhite1TowerAvailable:Bool = false
    var buildWhite1TowerPressed:Bool = false
    var towerWhite1BuildBool:Bool = false
    var activateWhite1TowerButtonAvailable:Bool = false
    var activateWhite1TowerButtonPressed:Bool = false
    var towerWhite1ActivateBool: Bool = false
    var plusAllDamage: Bool = false
    
    var buildWhite2TowerAvailable:Bool = false
    var buildWhite2TowerPressed:Bool = false
    var towerWhite2BuildBool:Bool = false
    var activateWhite2TowerButtonAvailable:Bool = false
    var activateWhite2TowerButtonPressed:Bool = false
    var towerWhite2ActivateBool: Bool = false
    
    var buildWhite3TowerAvailable:Bool = false
    var buildWhite3TowerPressed:Bool = false
    var towerWhite3BuildBool:Bool = false
    var activateWhite3TowerButtonAvailable:Bool = false
    var activateWhite3TowerButtonPressed:Bool = false
    var towerWhite3ActivateBool: Bool = false

    var connectedControllers: [GCController] = []
    var playerControllers: [Int: GCController] = [:]
    let maximumControllerCount = 2
    
    var white1ProgressBar: SKSpriteNode!
    var white1ProgressBarBg: SKSpriteNode!
    var white1ProgressBarMask: SKSpriteNode!
    var white1CropNode: SKCropNode!
        
    var white2ProgressBar: SKSpriteNode!
    var white2ProgressBarBg: SKSpriteNode!
    var white2ProgressBarMask: SKSpriteNode!
    var white2CropNode: SKCropNode!
        
    var white3ProgressBar: SKSpriteNode!
    var white3ProgressBarBg: SKSpriteNode!
    var white3ProgressBarMask: SKSpriteNode!
    var white3CropNode: SKCropNode!
    let progressBarSize = CGSize(width: 1264, height: 39)
    let progressBarSizeGendut = CGSize(width: 195/1.4, height: 27.42/1.4)
    let progressBarSizeKecil = CGSize(width: 195/1.4, height: 27.42/1.4)
    var attackedBosHit:Bool = false
       var attackedKecilHit:Bool = false
       var attackedGendutHit:Bool = false
    
//    private var healthBarBos: HpProgressBar!
//    private var healthBarGendut: HpProgressBar!
//    private var healthBarKecil: HpProgressBar!
    
    var entityManager: EntityManager!

        //Minion spawn set up
        let blueMinion = "b"
        let redMinion = "r"
        let purpleMinion = "p"
        
        var minionCount = 0
        var maxMinion = 24
    
    let totalhpBos = 10000 // kalau ganti ini ganti juga ke class bos
    let totalhpKecil = 500
    let totalhpGendut = 1000

    let bosHpName =  SKSpriteNode(imageNamed: "GiantRatLabel")
    
    var isGamePaused = false
    var pauseMenuScene: PauseMenuScene?
    
    func pauseGame() {
            isGamePaused = true
            self.view?.isPaused = true
            
            // Present the pause menu
            pauseMenuScene = PauseMenuScene(size: self.size)
            pauseMenuScene?.gameScene = self
            self.view?.presentScene(pauseMenuScene)
        }
        
        func resumeGame() {
            isGamePaused = false
            self.view?.isPaused = false
            
            // Remove the pause menu
            pauseMenuScene?.removeFromParent()
            pauseMenuScene = nil
        }
    
    override func touchesBegan(with event: NSEvent) {
    }

    override func didMove(to view: SKView) {
        
        entityManager = EntityManager(scene: self)
        viewWidth = view.frame.width
        viewHeight = view.frame.height
        
        bos.walk()
        
        let physicsOutline = SKShapeNode(rect: CGRect(x: -50, y: -50, width: 100, height: 100))
        //        physicsOutline.strokeColor = SKColor.black
        let backgroundImage = SKSpriteNode(imageNamed: "cave-background1x")
        backgroundImage.position = CGPoint(x: frame.midX, y: frame.midY)
        backgroundImage.zPosition = SKSpriteNode.Layer.background.rawValue
        addChild(backgroundImage)
        
        let foregroundTexture = SKTexture(imageNamed: "cave-foreground1x")
        let foregroundNode = SKSpriteNode(texture: foregroundTexture)
        foregroundNode.position = CGPoint(x: frame.midX, y: frame.midY)
        foregroundNode.zPosition =  SKSpriteNode.Layer.platform.rawValue
        physicsOutline.position = foregroundNode.position
        addChild(foregroundNode)
        
        
        tower1White.position = CGPoint(x: 500, y: 700)
        //        towerWhite.size = CGSize(width: gendut.size.width/1.5, height: gendut.size.height*1.5)
        tower1White.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower1White.size.width/1.5, height: tower1White.size.height/4), center: CGPoint(x: 0, y: tower1White.size.height/2.5))
        tower1White.physicsBody?.affectedByGravity = false
        tower1White.physicsBody?.isDynamic = false
        tower1White.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerWhite1Destroyed
        tower1White.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        tower1White.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        addChild(tower1White)
        
        tower2White.position = CGPoint(x: 650, y: 200)
        //        towerWhite.size = CGSize(width: gendut.size.width/1.5, height: gendut.size.height*1.5)
        tower2White.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower2White.size.width/1.5, height: tower2White.size.height/4), center: CGPoint(x: 0, y: tower2White.size.height/2.5))
        tower2White.physicsBody?.affectedByGravity = false
        tower2White.physicsBody?.isDynamic = false
        tower2White.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerWhite2Destroyed
        tower2White.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        tower2White.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        addChild(tower2White)
        
        tower3White.position = CGPoint(x: 2000, y: 100)
        //        towerWhite.size = CGSize(width: gendut.size.width/1.5, height: gendut.size.height*1.5)
        tower3White.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower3White.size.width/1.5, height: tower3White.size.height/4), center: CGPoint(x: 0, y: tower3White.size.height/2.5))
        tower3White.physicsBody?.affectedByGravity = false
        tower3White.physicsBody?.isDynamic = false
        tower3White.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerWhite3Destroyed
        tower3White.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
        tower3White.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
        addChild(tower3White)
        
        let boundaries = SKShapeNode(rectOf: CGSize(width: frame.width+1000, height: 20))
        boundaries.lineWidth = 0
        boundaries.position = CGPoint(x: frame.size.width/2, y: size.height - frame.size.height/2 + 100 )
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
        //                boundaries.fillColor = NSColor.white
        addChild(boundaries)
        
        let boundaries2 = SKShapeNode(rectOf: CGSize(width: frame.height, height: 20))
        boundaries2.lineWidth = 0
        boundaries2.position = CGPoint(x: 20, y: size.height - frame.size.height/2+100)
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
        boundaries3.lineWidth = 0
        boundaries3.position = CGPoint(x: size.width - 100, y: frame.size.height/3)
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
        
        bos.position = CGPoint(x: frame.maxX - frame.maxX * 0.325, y: self.frame.midY + 150)
        bos.color = NSColor.black
        addChild(bos)

        addChild(BosHpNameLabel)
        
        healthBarBos = HpProgressBar(size: progressBarSize, backgroundImage: "HpProgressBarBos", progressImage: "hpProgressBarBosTexture")
        healthBarBos.position = CGPoint(x: size.width / 2, y: frame.maxY - 175)
        healthBarGendut = HpProgressBar(size: progressBarSizeGendut, backgroundImage: "HpProgressBarCharacter", progressImage: "HpProgressBarCharacterTexture")
        healthBarGendut.position = CGPoint(x: gendut.position.x, y: gendut.position.y + 1000)
        healthBarKecil = HpProgressBar(size: progressBarSizeKecil, backgroundImage: "HpProgressBarCharacter", progressImage: "HpProgressBarCharacterTexture")
        healthBarKecil.position = CGPoint(x: kecil.position.x, y: kecil.position.y + 1000)
        
        addChild(healthBarBos)
        addChild(healthBarGendut)
        addChild(healthBarKecil)
        
        physicsWorld.contactDelegate = self
        print(String(collectibleItemsTower1))
        addLabelTowerWhite(message: String(collectibleItemsTower1), position: tower1White.position)
        addLabelTowerWhite(message: String(collectibleItemsTower2), position: tower2White.position)
        addLabelTowerWhite(message: String(collectibleItemsTower3), position: tower3White.position)
//        NotificationCenter.default.addObserver(self, selector: #selector(didConnectController(_:)), name: NSNotification.Name.GCControllerDidConnect, object: nil)
        let stopAction = SKAction.run { [self] in
                    if minionCount >= maxMinion {
                        self.removeAction(forKey: "Spawn")
                    }
                }
                
                let spawnSequence = SKAction.sequence([
                    SKAction.run { [self] in
                        if minionCount < maxMinion {
                            spawnMonster(blueMinion)
                            minionCount += 1
                        }
                    },
                    SKAction.wait(forDuration: 5),
                    SKAction.run { [self] in
                        if minionCount < maxMinion {
                            spawnMonster(redMinion)
                            minionCount += 1
                        }
                    },
                    SKAction.wait(forDuration: 5),
                    SKAction.run { [self] in
                        if minionCount < maxMinion {
                            spawnMonster(purpleMinion)
                            minionCount += 1
                        }
                    },
                    SKAction.wait(forDuration: 5),
                    stopAction
                ])
                run(SKAction.repeatForever(spawnSequence), withKey: "Spawn")
                
                physicsWorld.contactDelegate = self
        
    }
    
    
//    @objc func didConnectController(_ notification: Notification) {
//        guard connectedControllers.count < maximumControllerCount else { return }
//        if let controller = notification.object as? GCController {
//            connectedControllers.append(controller)
//            if playerControllers[0] == nil {
//                playerControllers[0] = controller
//                print("Controller connected and assigned to Player 1 (Gendut).")
//                setupGamepadInputGendut(for: controller)
//                
//            } else if playerControllers[1] == nil {
//                playerControllers[1] = controller
//                print("Controller connected and assigned to Player 2 (Kecil). ")
//                setupGamepadInputKecil(for: controller)
//            }
//        }
//    }
    
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


    
//    func setupGamepadInputKecil(for controller: GCController) {
//
//        if let extendedGamepad = controller.extendedGamepad {
//            let handlerInstance = Handler()
//            extendedGamepad.buttonMenu.valueChangedHandler = handlerInstance.buttonMenuValueChangedHandler
//            extendedGamepad.buttonX.valueChangedHandler = handlerInstance.buttonXValueChangedHandler
//            extendedGamepad.leftThumbstick.valueChangedHandler = { (thumbstick, xValue, yValue) in
//                if controller == self.playerControllers[1] {
//                    if xValue < -0.5 {
//                        self.kecilRightPressed = true
//                    } else if xValue > 0.5 {
//                        self.kecilLeftPressed = true
//                    } else {
//                        self.kecilLeftPressed = false
//                        self.kecilRightPressed = false
//     
//                    }
//                    if yValue < -0.5 {
//                        self.kecilDownPressed = true
//                    } else if yValue > 0.5 {
//                        self.kecilUpPressed = true
//                    } else {
//                        self.kecilDownPressed = false
//                        self.kecilUpPressed = false
//                    }
//                    self.kecil.stop()
//                
//                }
//                
//            }
//        }
//    }
    
    override func keyDown(with event: NSEvent) {
        func getKeysPressed() -> Set<Int> {
                var keysPressed = Set<Int>()
                
                if gendutUpPressed {
                    keysPressed.insert(kVK_ANSI_W)
                }
                if gendutLeftPressed {
                    keysPressed.insert(kVK_ANSI_A)
                }
                if gendutDownPressed {
                    keysPressed.insert(kVK_ANSI_S)
                }
                if gendutRightPressed {
                    keysPressed.insert(kVK_ANSI_D)
                }
                if kecilUpPressed {
                    keysPressed.insert(kVK_UpArrow)
                }
                if kecilDownPressed {
                    keysPressed.insert(kVK_DownArrow)
                }
                if kecilLeftPressed {
                    keysPressed.insert(kVK_LeftArrow)
                }
                if kecilRightPressed {
                    keysPressed.insert(kVK_RightArrow)
                }
                
                return keysPressed
            }
        switch Int(event.keyCode) {
            case kVK_ANSI_Y:
            gendutShoot = true
            shootGedeProjectile(keysPressed: getKeysPressed())
            
            
            case kVK_ANSI_U:
            kecilShoot = true
            shootKecilProjectile(keysPressed: getKeysPressed())
            
            case kVK_Escape:
            
//            let scene = self
//            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
//            let gameOverScene = GameOverScene(size: scene.size, won: false)
//            scene.view?.presentScene(gameOverScene, transition: reveal)
//            
            let scene = self
            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
            let pauseMenuScene = PauseMenuScene(size: scene.size)
            scene.view?.presentScene(pauseMenuScene, transition: reveal)

            
            case kVK_ANSI_Q:
//            print("Q pressed down")
            if towerWhite1BuildBool == true && activateWhite1TowerButtonAvailable == true{
                activateWhite1TowerButtonPressed = true
            }
            if towerWhite2BuildBool == true && activateWhite2TowerButtonAvailable == true{
                activateWhite2TowerButtonPressed = true
            }
            if towerWhite3BuildBool == true && activateWhite3TowerButtonAvailable == true{
                activateWhite3TowerButtonPressed = true
            }
            if buildWhite1TowerAvailable == true {
                    buildWhite1TowerPressed = true
            }
            if buildWhite2TowerAvailable == true {
                    buildWhite2TowerPressed = true
            }
            if buildWhite3TowerAvailable == true {
                    buildWhite3TowerPressed = true
            }
    
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
                    kecilLeftPressed = true
                case kVK_RightArrow:
                    kecilRightPressed = true
                
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
        case kVK_ANSI_Q:
            if activateWhite1TowerButtonPressed{
                activateWhite1TowerButtonPressed = false
            }
            if activateWhite2TowerButtonPressed{
                activateWhite2TowerButtonPressed = false
            }
            if activateWhite3TowerButtonPressed{
                activateWhite3TowerButtonPressed = false
            }
            
            if buildWhite1TowerPressed {
                
                buildWhite1TowerPressed = false
//                self.removeAction(forKey: "redTowerActivation")
            }
            
            if buildWhite2TowerPressed {
                buildWhite2TowerPressed = false
//                self.removeAction(forKey: "redTowerActivation")
            }
            
            if buildWhite3TowerPressed {
                buildWhite3TowerPressed = false
//                self.removeAction(forKey: "redTowerActivation")
            }
            
            
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
            kecilLeftPressed = false

            kecil.stop()
        case kVK_RightArrow:
            kecilRightPressed = false
            kecil.stop()
        default:
            break
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        healthBarGendut.position = CGPoint(x: gendut.position.x + 19, y: gendut.position.y + 350)
                healthBarKecil.position = CGPoint(x: kecil.position.x + 19, y: kecil.position.y + 220)
        
//        healthBarGendut.position = CGPoint(x: gendut.position.x + 19, y: gendut.position.y + 350)
//        healthBarKecil.position = CGPoint(x: kecil.position.x + 19, y: kecil.position.y + 220)
        
        if gendut.position.y < kecil.position.y && gendut.position.y < tower1White.position.y && kecil.position.y < tower1White.position.y{
            gendut.zPosition = SKSpriteNode.Layer.gendutBackKecilBackTower.rawValue
            kecil.zPosition = SKSpriteNode.Layer.kecilFrontGendutBackTower.rawValue
            tower2White.zPosition = SKSpriteNode.Layer.towerFrontGendutFrontKecil.rawValue
        }
        else if kecil.position.y < gendut.position.y && kecil.position.y < tower1White.position.y && gendut.position.y < tower1White.position.y{
            kecil.zPosition = SKSpriteNode.Layer.kecilBackGendutBackTower.rawValue
            gendut.zPosition = SKSpriteNode.Layer.gendutFrontKecilBackTower.rawValue
            tower1White.zPosition = SKSpriteNode.Layer.towerFrontKecilFrontGendut.rawValue
        }
        else if kecil.position.y < tower1White.position.y && kecil.position.y < gendut.position.y && tower1White.position.y < gendut.position.y{
            kecil.zPosition = SKSpriteNode.Layer.kecilBackTowerBackGendut.rawValue
            tower1White.zPosition = SKSpriteNode.Layer.towerFrontKecilBackGendut.rawValue
            gendut.zPosition = SKSpriteNode.Layer.gendutFrontKecilFrontTower.rawValue
        }
        else if tower1White.position.y < kecil.position.y && tower1White.position.y < gendut.position.y && kecil.position.y < gendut.position.y{
            tower1White.zPosition = SKSpriteNode.Layer.towerBackKecilBackGendut.rawValue
            kecil.zPosition = SKSpriteNode.Layer.kecilFrontTowerBackGendut.rawValue
            gendut.zPosition = SKSpriteNode.Layer.gendutFrontTowerFrontKecil.rawValue
        }
        else if tower1White.position.y < gendut.position.y && tower1White.position.y < kecil.position.y && gendut.position.y < kecil.position.y{
            tower1White.zPosition = SKSpriteNode.Layer.towerBackGendutBackKecil.rawValue
            gendut.zPosition = SKSpriteNode.Layer.gendutFrontTowerBackKecil.rawValue
            kecil.zPosition = SKSpriteNode.Layer.kecilFrontTowerFrontGendut.rawValue
        }
        else if gendut.position.y < tower1White.position.y && gendut.position.y < kecil.position.y && tower1White.position.y < kecil.position.y{
            gendut.zPosition = SKSpriteNode.Layer.gendutBackTowerBackKecil.rawValue
            tower1White.zPosition = SKSpriteNode.Layer.towerFrontGendutBackKecil.rawValue
            kecil.zPosition = SKSpriteNode.Layer.kecilFrontGendutFrontTower.rawValue
        }
        
        //        print(towerWhite1ActivateBool)]
//        print(towerWhite1BuildBool)
        
        if plusAllDamage == true{
            damage = 300
        }else if plusAllDamage == false{
            damage = 50
        }
        
        if towerWhite1ActivateBool == true{
            removeActivateTextTower()
            if let parent = tower1WhiteBuilt.parent {
                let position = tower1WhiteBuilt.position
                let zPos = tower1WhiteBuilt.zPosition
                tower1WhiteActivated.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower1WhiteBuilt.size.width/1.5, height: tower1WhiteBuilt.size.height/4), center: CGPoint(x: 0, y: tower1WhiteBuilt.size.height/5))
                tower1WhiteActivated.physicsBody?.affectedByGravity = false
                tower1WhiteActivated.physicsBody?.isDynamic = false
                tower1WhiteActivated.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerWhite1Activated
                tower1WhiteActivated.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
                tower1WhiteActivated.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
                tower1WhiteBuilt.removeFromParent()
//                tower1WhiteActivated.size = CGSize(width: 300, height: 600)
                tower1WhiteActivated.position = position
                tower1WhiteActivated.zPosition = zPos
                parent.addChild(tower1WhiteActivated)
                
                if let parent = tower1WhiteActivated.parent{
                    let position = tower1WhiteBuilt.position
                    let Zpos = tower1WhiteBuilt.zPosition
                    domain1White.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower1WhiteBuilt.size.width, height: tower1WhiteBuilt.size.height/2), center: CGPoint(x: 0, y: tower1WhiteBuilt.size.height/5))
                    domain1White.physicsBody?.affectedByGravity = false
                    domain1White.physicsBody?.isDynamic = false
                    domain1White.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.domain1White
                    domain1White.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.gendut
                    domain1White.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
                    domain1White.position = position
                    tower1White.zPosition = zPos
                    parent.addChild(domain1White)
                }
                
            }
        }
        
        if towerWhite2ActivateBool == true{
            removeActivateTextTower()
            if let parent = tower2WhiteBuilt.parent {
                let position = tower2WhiteBuilt.position
                let zPos = tower2WhiteBuilt.zPosition
                tower2WhiteActivated.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower2WhiteBuilt.size.width/1.5, height: tower2WhiteBuilt.size.height/4), center: CGPoint(x: 0, y: tower2WhiteBuilt.size.height/5))
                tower2WhiteActivated.physicsBody?.affectedByGravity = false
                tower2WhiteActivated.physicsBody?.isDynamic = false
                tower2WhiteActivated.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerWhite2Activated
                tower2WhiteActivated.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
                tower2WhiteActivated.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
                tower2WhiteBuilt.removeFromParent()
//                tower2WhiteActivated.size = CGSize(width: 300, height: 600)
                tower2WhiteActivated.position = position
                tower2WhiteActivated.zPosition = zPos
                parent.addChild(tower2WhiteActivated)
                if let parent = tower2WhiteActivated.parent{
                    let position = tower2WhiteBuilt.position
                    let Zpos = tower2WhiteBuilt.zPosition
                    domain2White.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower2WhiteBuilt.size.width, height: tower2WhiteBuilt.size.height/2), center: CGPoint(x: 0, y: tower2WhiteBuilt.size.height/5))
                    domain2White.physicsBody?.affectedByGravity = false
                    domain2White.physicsBody?.isDynamic = false
                    domain2White.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.domain2White
                    domain2White.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.gendut
                    domain2White.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
                    domain2White.position = position
                    tower2White.zPosition = zPos
                    parent.addChild(domain2White)
                }
            }
            
        }
        
        if towerWhite3ActivateBool == true{
            removeActivateTextTower()
            if let parent = tower3WhiteBuilt.parent {
                let position = tower3WhiteBuilt.position
                let zPos = tower3WhiteBuilt.zPosition
                tower3WhiteActivated.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower3WhiteBuilt.size.width/1.5, height: tower3WhiteBuilt.size.height/4), center: CGPoint(x: 0, y: tower3WhiteBuilt.size.height/5))
                tower3WhiteActivated.physicsBody?.affectedByGravity = false
                tower3WhiteActivated.physicsBody?.isDynamic = false
                tower3WhiteActivated.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerWhite3Activated
                tower3WhiteActivated.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
                tower3WhiteActivated.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
                tower3WhiteBuilt.removeFromParent()
//                tower3WhiteActivated.size = CGSize(width: 300, height: 600)
                tower3WhiteActivated.position = position
                tower3WhiteActivated.zPosition = zPos
                parent.addChild(tower3WhiteActivated)
                if let parent = tower3WhiteActivated.parent{
                    let position = tower3WhiteBuilt.position
                    let Zpos = tower3WhiteBuilt.zPosition
                    domain3White.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower3WhiteBuilt.size.width, height: tower3WhiteBuilt.size.height/2), center: CGPoint(x: 0, y: tower3WhiteBuilt.size.height/5))
                    domain3White.physicsBody?.affectedByGravity = false
                    domain3White.physicsBody?.isDynamic = false
                    domain3White.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.domain3White
                    domain3White.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.gendut
                    domain3White.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
                    domain3White.position = position
                    tower3White.zPosition = zPos
                    parent.addChild(domain3White)
                }
            }
        }
        
        if towerWhite1BuildBool == true {
            removeBuildTextTower()
            if let parent = tower1White.parent {
                let position = tower1White.position
                let zPos = tower1White.zPosition
                tower1WhiteBuilt.position = position
                tower1WhiteBuilt.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower1White.size.width/1.5, height: tower1White.size.height/4), center: CGPoint(x: 0, y: tower1White.size.height/5))
                tower1WhiteBuilt.physicsBody?.affectedByGravity = false
                tower1WhiteBuilt.physicsBody?.isDynamic = false
                tower1WhiteBuilt.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerWhite1NotActivated
                tower1WhiteBuilt.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
                tower1WhiteBuilt.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
                tower1White.removeFromParent()
//                tower1WhiteBuilt.size = CGSize(width: 300, height: 600)
                tower1WhiteBuilt.position = position
                tower1WhiteBuilt.zPosition = zPos
                parent.addChild(tower1WhiteBuilt)
            }
        }
        
        if towerWhite2BuildBool == true {
            removeBuildTextTower()
            if let parent = tower2White.parent {
                let position = tower2White.position
                let zPos = tower2White.zPosition
                tower2WhiteBuilt.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower2White.size.width/1.5, height: tower2White.size.height/4), center: CGPoint(x: 0, y: tower2White.size.height/5))
                tower2WhiteBuilt.physicsBody?.affectedByGravity = false
                tower2WhiteBuilt.physicsBody?.isDynamic = false
                tower2WhiteBuilt.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerWhite2NotActivated
                tower2WhiteBuilt.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
                tower2WhiteBuilt.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
                tower2White.removeFromParent()
//                tower2WhiteBuilt.size = CGSize(width: 300, height: 600)
                tower2WhiteBuilt.position = position
                tower2WhiteBuilt.zPosition = zPos
                parent.addChild(tower2WhiteBuilt)
            }
        }
        
        if towerWhite3BuildBool == true {
            removeBuildTextTower()
            if let parent = tower3White.parent {
                let position = tower3White.position
                let zPos = tower3White.zPosition
                tower3WhiteBuilt.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: tower3White.size.width/1.5, height: tower3White.size.height/4), center: CGPoint(x: 0, y: tower3White.size.height/5))
                tower3WhiteBuilt.physicsBody?.affectedByGravity = false
                tower3WhiteBuilt.physicsBody?.isDynamic = false
                tower3WhiteBuilt.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.towerWhite3NotActivated
                tower3WhiteBuilt.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil
                tower3WhiteBuilt.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.none
                tower3White.removeFromParent()
//                tower3WhiteBuilt.size = CGSize(width: 300, height: 600)
                tower3WhiteBuilt.position = position
                tower3WhiteBuilt.zPosition = zPos
                parent.addChild(tower3WhiteBuilt)
            }
        }
        
        
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
        
        if gendutUpPressed == false && gendutDownPressed == false && gendutLeftPressed == false && gendutRightPressed == false{
            gendut.idle()
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
            kecil.position.x -= 5
            kecil.xScale = -1
            kecil.walk()
        } else if kecilRightPressed == true {
            kecil.position.x += 5
            kecil.xScale = 1
            kecil.walk()
        }
        if kecilUpPressed == false && kecilDownPressed == false && kecilLeftPressed == false && kecilRightPressed == false{
            kecil.idle()
        }
    
        if buildWhite1TowerPressed {
            white1BuiltPressedTime += 1.0
            if white1BuiltPressedTime == 2.0 {
                self.towerWhite1BuildBool = true
            }
        } else if !buildWhite1TowerPressed {
            white1BuiltPressedTime = 0.0
        }
        if buildWhite2TowerPressed {
            white2BuiltPressedTime += 1.0

            if white2BuiltPressedTime == 2.0 {
                self.towerWhite2BuildBool = true
            }
        } else if !buildWhite2TowerPressed {
            white2BuiltPressedTime = 0.0
        }
        if buildWhite3TowerPressed {
            white3BuiltPressedTime += 1.0
            if white3BuiltPressedTime == 2.0 {
                self.towerWhite3BuildBool = true
            }
        } else if !buildWhite3TowerPressed {
            white3BuiltPressedTime = 0.0
        }
        
        if activateWhite1TowerButtonPressed{
            white1ActivatePressedTime += 1.0
            updateWhite1ProgressBar(white1ActivatePressedTime)
            if white1ActivatePressedTime == maxPressedTime {
                self.towerWhite1ActivateBool = true
                self.plusAllDamage = true
            }else if white1ActivatePressedTime > maxPressedTime{
                removeWhite1ProgressBar()
            }
        } else if !activateWhite1TowerButtonPressed {
            white1ActivatePressedTime = 0.0
        }
        
        
        if activateWhite2TowerButtonPressed{
            white2ActivatePressedTime += 1.0
            updateWhite2ProgressBar(white2ActivatePressedTime)
            if white2ActivatePressedTime == maxPressedTime {
                self.towerWhite2ActivateBool = true
                self.plusAllDamage = true
            }else if white2ActivatePressedTime > maxPressedTime{
                removeWhite2ProgressBar()
            }
        } else if !activateWhite2TowerButtonPressed {
            white2ActivatePressedTime = 0.0
        }
        
        if activateWhite3TowerButtonPressed{
            white3ActivatePressedTime += 1.0
            self.updateWhite3ProgressBar(white3ActivatePressedTime)
            if white3ActivatePressedTime == maxPressedTime {
                self.towerWhite3ActivateBool = true
                self.plusAllDamage = true
            }else if white3ActivatePressedTime > maxPressedTime{
                removeWhite3ProgressBar()
            }
        } else if !activateWhite3TowerButtonPressed {
            white3ActivatePressedTime = 0.0
        }
        
        if let entityManager = entityManager {
            entityManager.update(currentTime)
        } else {
//            print("entityManager is nil. Unable to update.")
        }
        
        if let kecilNode = self.childNode(withName: "Kecil") as? Kecil {
            kecilNode.playerAgent.position = vector_float2(x: Float(kecilNode.position.x), y: Float(kecilNode.position.y))
            kecilNode.playerAgent.update(deltaTime: currentTime)
        }
        
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func displayBuildTextTower(at position: CGPoint) {
        buildText.position = position
        buildText.zPosition = SKSpriteNode.Layer.label.rawValue
        buildText.fontName = "Helvetica-Bold"
        buildText.fontSize = 36
        buildText.fontColor = SKColor.white
        
        if buildText.parent == nil{
            addChild(buildText)
        }
    }
    
    func removeBuildTextTower() {
        SKAction.removeFromParent()
        removeChildren(in: [buildText])
    }
    func removeActivateTextTower() {
        SKAction.removeFromParent()
        removeChildren(in: [activateText])
    }
    
    
    func displayActivateTextTower(at position: CGPoint) {
        activateText.position = position
        activateText.zPosition = SKSpriteNode.Layer.label.rawValue
        activateText.fontName = "Helvetica-Bold"
        activateText.fontSize = 36
        activateText.fontColor = SKColor.white
        
        if activateText.parent == nil {
            addChild(activateText)
        }
        
    }
    
    func addLabelTowerWhite(message: String, position: CGPoint){
        let label = TowerWhite1Label(message: message, position: position)
        self.messageTemp = message
        print(message)
        
    }
    
    func shootGedeProjectile(keysPressed: Set<Int>){
        gendut.attack()
        let projectile = GedeProjectile()
        projectile.position = CGPoint(x: gendut.position.x + 200, y: gendut.position.y + 200)
        addChild(projectile)
        
        var direction = CGVector(dx: 0, dy: 0)
        
        if keysPressed.contains(kVK_ANSI_W) {
            direction.dy += 1
        }
        if keysPressed.contains(kVK_ANSI_A) {
            direction.dx -= 1
        }
        if keysPressed.contains(kVK_ANSI_S) {
            direction.dy -= 1
        }
        if keysPressed.contains(kVK_ANSI_D) {
            direction.dx += 1
        }
        
        if direction != CGVector.zero {
            let length = sqrt(direction.dx * direction.dx + direction.dy * direction.dy)
            let normalizedDirection = CGVector(dx: direction.dx / length * 10, dy: direction.dy / length * 10)
            
            let shootAmount = CGVector(dx: normalizedDirection.dx * 1000, dy: normalizedDirection.dy * 1000)
            
            let realDest = CGVector(dx: gendut.position.x + shootAmount.dx, dy: gendut.position.y + shootAmount.dy)
            
            let actionMove = SKAction.move(to: CGPoint(x: realDest.dx, y: realDest.dy), duration: 10.0)
            let actionMoveDone = SKAction.removeFromParent()
            projectile.run(SKAction.sequence([actionMove, actionMoveDone]))
            direction.dx = 0
            direction.dy = 0
        }else{
            direction = CGVector(dx: 10, dy: 0)
            let length = sqrt(direction.dx * direction.dx + direction.dy * direction.dy)
            let normalizedDirection = CGVector(dx: direction.dx / length * 10, dy: direction.dy / length * 10)
            
            let shootAmount = CGVector(dx: normalizedDirection.dx * 1000, dy: normalizedDirection.dy * 1000)
            
            let realDest = CGVector(dx: gendut.position.x + shootAmount.dx, dy: gendut.position.y + shootAmount.dy)
            
            let actionMove = SKAction.move(to: CGPoint(x: realDest.dx, y: realDest.dy), duration: 10.0)
            let actionMoveDone = SKAction.removeFromParent()
            projectile.run(SKAction.sequence([actionMove, actionMoveDone]))
        }
    }
    
    func shootKecilProjectile(keysPressed: Set<Int>) {
        let projectile = KecilProjectile()
        projectile.position = CGPoint(x: kecil.position.x + 100, y: kecil.position.y + 100)
        addChild(projectile)
        
        var direction = CGVector(dx: 0, dy: 0)
        
        if keysPressed.contains(kVK_UpArrow) {
            direction.dy += 1
        }
        if keysPressed.contains(kVK_LeftArrow) {
            direction.dx -= 1
        }
        if keysPressed.contains(kVK_DownArrow) {
            direction.dy -= 1
        }
        if keysPressed.contains(kVK_RightArrow) {
            direction.dx += 1
        }
        
        if direction != CGVector.zero {
            let length = sqrt(direction.dx * direction.dx + direction.dy * direction.dy)
            let normalizedDirection = CGVector(dx: direction.dx / length * 10, dy: direction.dy / length * 10)
            
            let shootAmount = CGVector(dx: normalizedDirection.dx * 1000, dy: normalizedDirection.dy * 1000)
            
            let realDest = CGVector(dx: kecil.position.x + shootAmount.dx, dy: kecil.position.y + shootAmount.dy)
            
            let actionMove = SKAction.move(to: CGPoint(x: realDest.dx, y: realDest.dy), duration: 10.0)
            let actionMoveDone = SKAction.removeFromParent()
            projectile.run(SKAction.sequence([actionMove, actionMoveDone]))
        }else{
            direction = CGVector(dx: 10, dy: 0)
            let length = sqrt(direction.dx * direction.dx + direction.dy * direction.dy)
            let normalizedDirection = CGVector(dx: direction.dx / length * 10, dy: direction.dy / length * 10)
            
            let shootAmount = CGVector(dx: normalizedDirection.dx * 1000, dy: normalizedDirection.dy * 1000)
            
            let realDest = CGVector(dx: kecil.position.x + shootAmount.dx, dy: kecil.position.y + shootAmount.dy)
            
            let actionMove = SKAction.move(to: CGPoint(x: realDest.dx, y: realDest.dy), duration: 10.0)
            let actionMoveDone = SKAction.removeFromParent()
            projectile.run(SKAction.sequence([actionMove, actionMoveDone]))
        }
    }
}
