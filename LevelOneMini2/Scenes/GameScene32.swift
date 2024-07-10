import SpriteKit
import GameController
import Carbon
import AVFoundation
import GameplayKit

class GameScene32: SKScene {
    
    var entityManager: EntityManager!
    var backgroundMusic: SKAudioNode?
    let pauseScene = PauseMenuScene()
    
    let gendut = Gendut()
    let kecil = Kecil()
    //let minion = Minion()
    
    var gendutShoot: Bool = false
    var kecilShoot: Bool = false
    let bos = Bos()
    let attackManager = AttackManager()
    let bossHpLabel = BossHpName()
    var healthBarBos: HpProgressBar!
    var healthBarGendut: HpProgressBar!
    var healthBarKecil: HpProgressBar!
    let canonLeft = Canon_Left()
    let canonRight = Canon_Right()
    let BosHpNameLabel = BossHpName()
    
    
    let displayManager = DisplayTextManager()
    var backgroundManager: BackgroundManager!
    
    var audioManager = AudioManager()
    
    var bosIsAttacking: Bool = false
    
    let blueMinion = "b"
    let redMinion = "r"
    let purpleMinion = "p"
    
    var minionCount = 0
    var maxMinion = 10000000000
    
    var canonLeftShoot: Bool = false
    var canonRightShoot: Bool = false
    var CanonContactLeft: Bool = false
    var CanonContactRight: Bool = false
    
    var gendutUpPressed:Bool = false
    var gendutDownPressed:Bool = false
    var gendutLeftPressed:Bool = false
    var gendutRightPressed:Bool = false
    
    var kecilUpPressed:Bool = false
    var kecilDownPressed:Bool = false
    var kecilLeftPressed:Bool = false
    var kecilRightPressed:Bool = false
    
    var activateCanonLeftButtonAvailable:Bool = false
    var activateCanonRightButtonAvailable:Bool = false
    
    var contactObstacleFromBoss:Bool = false
    
    var attackedBosHit:Bool = false
    var attackedKecilHit:Bool = false
    var attackedGendutHit:Bool = false
    
    var BosLagiAttackKeCharacter:Bool = false
    
    let backgroundImage = SKSpriteNode(imageNamed: "final-background1x")
    let foregroundImage = SKSpriteNode(imageNamed: "final-foreground1x")
    
    var connectedControllers: [GCController] = []
    var playerControllers: [Int: GCController] = [:]
    let maximumControllerCount = 2
    
    let progressBarSize = CGSize(width: 1264, height: 39)
    let progressBarSizeGendut = CGSize(width: 195/1.4, height: 27.42/1.4)
    let progressBarSizeKecil = CGSize(width: 195/1.4, height: 27.42/1.4)
    
    override func didMove(to view: SKView) {
        gendut.position = CGPoint(x: 600, y: 450)
        kecil.position = CGPoint(x: 100, y: 300)
        
        
        
        backgroundManager = BackgroundManager(scene: self)
        audioManager.playBackgroundMusic(in: self)
        addChild(gendut)
        addChild(kecil)
        
        addChild(canonLeft)
        
        canonRight.position = CGPoint(x: foregroundImage.size.width - 750, y: 450)
        addChild(canonRight)
        
        
        bos.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 100)
        addChild(bos)
        
        addChild(BosHpNameLabel)
        addChild(displayManager)
        
        healthBarBos = HpProgressBar(size: progressBarSize, backgroundImage: "HpProgressBarBos", progressImage: "hpProgressBarBosTexture")
        healthBarBos.position = CGPoint(x: size.width / 2, y: frame.maxY - 175)
        healthBarGendut = HpProgressBar(size: progressBarSizeGendut, backgroundImage: "HpProgressBarCharacter", progressImage: "HpProgressBarCharacterTexture")
        healthBarGendut.position = CGPoint(x: gendut.position.x, y: gendut.position.y + 10)
        healthBarKecil = HpProgressBar(size: progressBarSizeKecil, backgroundImage: "HpProgressBarCharacter", progressImage: "HpProgressBarCharacterTexture")
        healthBarKecil.position = CGPoint(x: kecil.position.x, y: kecil.position.y + 10)
        
        addChild(healthBarBos)
        addChild(healthBarGendut)
        addChild(healthBarKecil)
        
        //minion.position = CGPoint(x: 1000, y: 300)
        //minion.walk()
        //addChild(minion)
        bos.walk()
        
        entityManager = EntityManager(scene: self)
        
        
        //minion.walk()
        //Limited Spawn Minion
        //        let stopAction = SKAction.run { [self] in
        //            if minionCount >= maxMinion {
        //                self.removeAction(forKey: "Spawn")
        //            }
        //        }
        //
        //        let spawnSequence = SKAction.sequence([
        //            SKAction.run { [self] in
        //                if minionCount < maxMinion {
        //                    spawnMonster(blueMinion)
        //                    minionCount += 1
        //                }
        //            },
        //            SKAction.wait(forDuration: 5),
        //            SKAction.run { [self] in
        //                if minionCount < maxMinion {
        //                    spawnMonster(redMinion)
        //                    minionCount += 1
        //                }
        //            },
        //            SKAction.wait(forDuration: 5),
        //            SKAction.run { [self] in
        //                if minionCount < maxMinion {
        //                    spawnMonster(purpleMinion)
        //                    minionCount += 1
        //                }
        //            },
        //            SKAction.wait(forDuration: 5),
        //            stopAction
        //        ])
        //        run(SKAction.repeatForever(spawnSequence), withKey: "Spawn")
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run({ [self] in spawnMonster(blueMinion)}),
                SKAction.wait(forDuration: 3),
                SKAction.run({ [self] in spawnMonster(redMinion)}),
                SKAction.wait(forDuration: 3),
                SKAction.run({ [self] in spawnMonster(purpleMinion)}),
                SKAction.wait(forDuration: 3)
            ])
        ))
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(didConnectController(_:)), name: NSNotification.Name.GCControllerDidConnect, object: nil)
        physicsWorld.contactDelegate = self
        
        attackManager.bosGotAttack(bos: bos, healthBarBos: healthBarBos, totalhpBos: bos.hpTotalBos, damage: CGFloat(0), attackedBosHit: &attackedBosHit)
        
        
        
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
            
        case kVK_ANSI_Y:
            if CanonContactLeft == true{
                canonLeftShoot = true
                canonLeft.shootAnimation()
            }
        case kVK_ANSI_U:
            if CanonContactRight == true{
                canonRightShoot = true
                canonRight.shootAnimation()
            }
        case kVK_ANSI_W:
            gendut.stop()
            gendutUpPressed = true
        case kVK_ANSI_A:
            gendut.stop()
            gendutLeftPressed = true
        case kVK_ANSI_S:
            gendut.stop()
            gendutDownPressed = true
        case kVK_ANSI_D:
            gendut.stop()
            gendutRightPressed = true
        case kVK_UpArrow:
            kecil.stop()
            kecilUpPressed = true
        case kVK_DownArrow:
            kecil.stop()
            kecilDownPressed = true
        case kVK_LeftArrow:
            kecil.stop()
            kecilRightPressed = true
        case kVK_RightArrow:
            kecil.stop()
            kecilLeftPressed = true
        default:
            break
        }
    }
    override func keyUp(with event: NSEvent) {
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
            canonLeftShoot = false
            CanonContactLeft = false
            canonLeft.stop()
        case kVK_ANSI_U:
            canonRightShoot = false
            CanonContactRight = false
            canonRight.stop()
        case kVK_ANSI_W:
            gendutUpPressed = false
            gendut.stop()
            gendut.idle()
        case kVK_ANSI_A:
            gendutLeftPressed = false
            gendut.stop()
            gendut.idle()
            canonRight.stop()
        case kVK_ANSI_S:
            gendutDownPressed = false
            gendut.stop()
            gendut.idle()
        case kVK_ANSI_D:
            gendutRightPressed = false
            gendut.stop()
            gendut.idle()
        case kVK_UpArrow:
            kecilUpPressed = false
            kecil.stop()
            kecil.idle()
        case kVK_DownArrow:
            kecilDownPressed = false
            kecil.stop()
            kecil.idle()
        case kVK_LeftArrow:
            kecilRightPressed = false
            kecil.stop()
            kecil.idle()
        case kVK_RightArrow:
            kecilLeftPressed = false
            kecil.stop()
            kecil.idle()
            
        case kVK_ANSI_F:
            gendutShoot = true
            shootGedeProjectile(keysPressed: getKeysPressed())
            
        case kVK_Escape:
            let scene = self
            let reveal = SKTransition.fade(withDuration: 0.5)
            let pauseMenuScene = PauseMenuScene(size: scene.size)
            scene.view?.presentScene(pauseMenuScene, transition: reveal)
            
            
            //        case kVK_ANSI_U:
            //        kecilShoot = true
            //        shootKecilProjectile(keysPressed: getKeysPressed())
            
        default:
            break
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if kecil.hp < 1{
            let scene = self
            let reveal = SKTransition.fade(withDuration: 0.5)
            let gameOverScene = GameOverSceneSena(size: scene.size)
            view?.scene?.scaleMode = .aspectFit
            scene.view?.presentScene(gameOverScene, transition: reveal)
            
        }
        if gendut.hp < 1{
            let scene = self
            let reveal = SKTransition.fade(withDuration: 0.5)
            let gameOverScene = GameOverSceneSena(size: scene.size)
            view?.scene?.scaleMode = .aspectFit
            scene.view?.presentScene(gameOverScene, transition: reveal)
            
        }   
        
        let movement = Movement()
        healthBarGendut.position = CGPoint(x: gendut.position.x + 19, y: gendut.position.y + 300)
        healthBarKecil.position = CGPoint(x: kecil.position.x + 19, y: kecil.position.y + 180)
        
        if bos.BosLagiAttackKeCharacter == true {
            bos.stopWalk()
            bos.attackAnimation()
            bosIsAttacking = true
            
        } else {
            bosIsAttacking = false
            bos.stopAttack()
            bos.walk()
        }
        if canonLeftShoot == true {
            canonLeft.shootAction(movementSpeed: 1000)
            canonLeftShoot = false
        }
        
        if canonRightShoot == true {
            canonRight.shootAction(movementSpeed: 1000)
            canonRightShoot = false
        }
        
        if attackManager.gameOverState == true {
            restartGameScene()
        }
        
        if attackManager.youWinState == false {
            playVideo()
        }
        
        outOfBounds(gendut: gendut, kecil: kecil, foregroundImage: foregroundImage)
        movement.moveGendutAnimation(gendut: gendut,gendutUpPressed: gendutUpPressed, gendutDownPressed: gendutDownPressed, gendutLeftPressed: gendutLeftPressed, gendutRightPressed: gendutRightPressed)
        movement.moveKecilAnimation(kecil: kecil, kecilUpPressed: kecilUpPressed, kecilDownPressed: kecilDownPressed, kecilLeftPressed: kecilLeftPressed, kecilRightPressed: kecilRightPressed)
        
        entityManager.update(currentTime)
        
        if let kecilNode = self.childNode(withName: "Kecil") as? Kecil {
            kecilNode.playerAgent.position = vector_float2(x: Float(kecilNode.position.x), y: Float(kecilNode.position.y))
        }
        
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    func shootGedeProjectile(keysPressed: Set<Int>){
        let projectile = GedeProjectile()
        projectile.position = CGPoint(x: gendut.position.x + 100, y: gendut.position.y + 150)
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
            let normalizedDirection = CGVector(dx: direction.dx / length * 5, dy: direction.dy / length * 5)
            
            let shootAmount = CGVector(dx: normalizedDirection.dx * 1000, dy: normalizedDirection.dy * 1000)
            
            let realDest = CGVector(dx: gendut.position.x + shootAmount.dx, dy: gendut.position.y + shootAmount.dy)
            
            let actionMove = SKAction.move(to: CGPoint(x: realDest.dx, y: realDest.dy), duration: 10.0)
            let actionMoveDone = SKAction.removeFromParent()
            projectile.run(SKAction.sequence([actionMove, actionMoveDone]))
        }else{
            direction = CGVector(dx: 10, dy: 0)
            let length = sqrt(direction.dx * direction.dx + direction.dy * direction.dy)
            let normalizedDirection = CGVector(dx: direction.dx / length * 5, dy: direction.dy / length * 5)
            
            let shootAmount = CGVector(dx: normalizedDirection.dx * 1000, dy: normalizedDirection.dy * 1000)
            
            let realDest = CGVector(dx: gendut.position.x + shootAmount.dx, dy: gendut.position.y + shootAmount.dy)
            
            let actionMove = SKAction.move(to: CGPoint(x: realDest.dx, y: realDest.dy), duration: 10.0)
            let actionMoveDone = SKAction.removeFromParent()
            projectile.run(SKAction.sequence([actionMove, actionMoveDone]))
        }
    }
    
    func playVideo(){
        if let videoURL = Bundle.main.url(forResource: "EpiLogue Video", withExtension: "mp4") {
            let gameManager = GameManager.shared
            gameManager.closeCurrentScene()
            gameManager.playVideo(videoURL: videoURL, view: self.view!)
                
        } else {
            print("Video file not found.")
        }
        
        
        
    }
    
    func spawnMonster(_ imageCode: String) {
        let minSpawn = 100
        let maxSpawn = 4000
        let position = Int.random(in: minSpawn...maxSpawn )
        let minionTexture = SKTexture(imageNamed: "walk-\(imageCode)-1")
        let healthBarSize = CGSize(width: 100, height: 20)
        let maxHealth = 100.0
        let minion = Minion(texture: minionTexture, healthBarSize: healthBarSize, maxHealth: maxHealth, entityManager: entityManager, position: position)
        
        if let spriteComponent = minion.component(ofType: SpriteComponent.self) {
    
            entityManager.add(minion)
            
            minion.setTargetAgent(kecil.playerAgent)

            
            let updateAction = SKAction.run { [self] in
                minion.minionAgent.update(deltaTime: 1.0/60.0)
                spriteComponent.node.position = CGPoint(x: CGFloat(minion.minionAgent.position.x), y: CGFloat(minion.minionAgent.position.y))
                
                if minion.minionAgent.position.x < kecil.playerAgent.position.x {
                    spriteComponent.node.xScale = -1
                } else {
                    spriteComponent.node.xScale = 1
                }
            }
            
            let updateLoop = SKAction.repeatForever(SKAction.sequence([updateAction, SKAction.wait(forDuration: 1.0 / 60.0)]))
            
            run(updateLoop)
        }
    }
    
}
