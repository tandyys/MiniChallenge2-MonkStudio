import SpriteKit
import GameController
import Carbon

class GameScene: SKScene {

    let menuScene = MenuScene()
    
    let gendut = Gendut()
    let kecil = Kecil()
    
    private var progressBar: HpProgressBarBos!
    private var progressBarKecil: HpProgressBarBos!
    private var progressBarGendut: HpProgressBarBos!
    let canonLeft = Canon_Left()
    let canonRight = Canon_Right()
    
    let bos = Bos()
    
    let bosHpName =  SKSpriteNode(imageNamed: "hpBosLabel")

    var gendutUpPressed:Bool = false
    var gendutDownPressed:Bool = false
    var gendutLeftPressed:Bool = false
    var gendutRightPressed:Bool = false
    
    var kecilUpPressed:Bool = false
    var kecilDownPressed:Bool = false
    var kecilLeftPressed:Bool = false
    var kecilRightPressed:Bool = false
    
    var activateCanonLeftButtonAvailable = false
    var activateCanonRightButtonAvailable:Bool = false

    
    let backgroundImage = SKSpriteNode(imageNamed: "cave-background1x")
    let foregroundImage = SKSpriteNode(imageNamed: "cave-foreground1x")
    
    var connectedControllers: [GCController] = []
    var playerControllers: [Int: GCController] = [:]
    let maximumControllerCount = 2
    

    override func didMove(to view: SKView) {

   
        backgroundImage.position = CGPoint(x: frame.midX, y: frame.midY)
        backgroundImage.scale(to: CGSize(width: 2880, height: 1864))
        backgroundImage.zPosition = SKSpriteNode.Layer.background.rawValue

        foregroundImage.position = CGPoint(x: frame.midX, y: 400)
        foregroundImage.setScale(1.0)
        foregroundImage.zPosition = SKSpriteNode.Layer.foreground.rawValue
        
        
        addChild(backgroundImage)
        addChild(foregroundImage)
        
        gendut.position = CGPoint(x: 600, y: 900)
        addChild(gendut)
        
        
        kecil.position = CGPoint(x: 100, y: 300)
        addChild(kecil)
        
        
        canonLeft.position = CGPoint(x: 150, y: 450)
        addChild(canonLeft)
        
        canonRight.position = CGPoint(x: foregroundImage.size.width - 750, y: 450)
        addChild(canonRight)
        
        bos.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 50)
        addChild(bos)
        
        bosHpName.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - 200)
        bosHpName.zPosition = SKSpriteNode.Layer.label.rawValue
        addChild(bosHpName)
        
        let progressBarSize = CGSize(width: 1264, height: 39)
        progressBar = HpProgressBarBos(size: progressBarSize, backgroundImage: "hpProgressBarBosTexture", progressImage: "HpProgressBarBos")
        progressBar.position = CGPoint(x: size.width / 2, y: frame.maxY - 280)
        addChild(progressBar)
        
        let progressBarSizeKecil = CGSize(width: 195/1.4, height: 27.42/1.4)
        progressBarKecil = HpProgressBarBos(size: progressBarSizeKecil, backgroundImage: "HpProgressBarCharacterTexture", progressImage: "HpProgressBarCharacter")
        progressBarKecil.position = CGPoint(x: kecil.position.x, y: kecil.position.y + 10)
        
        let progressBarSizeBesar = CGSize(width: 195/1.4, height: 27.42/1.4)
        progressBarGendut = HpProgressBarBos(size: progressBarSizeBesar, backgroundImage: "HpProgressBarCharacterTexture", progressImage: "HpProgressBarCharacter")
        progressBarGendut.position = CGPoint(x: gendut.position.x, y: gendut.position.y + 10)
        
        addChild(progressBarKecil)
        addChild(progressBarGendut)
        
        
                
        canonLeft.shoot()
        canonRight.shoot()
        

        NotificationCenter.default.addObserver(self, selector: #selector(didConnectController(_:)), name: NSNotification.Name.GCControllerDidConnect, object: nil)
        
        physicsWorld.contactDelegate = self
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
       
        let movement = Movement()
        
        
        progressBarKecil.position = CGPoint(x: kecil.position.x + 19, y: kecil.position.y + 140)
        progressBarGendut.position = CGPoint(x: gendut.position.x + 19, y: gendut.position.y + 200)
        
        
        let newProgress = progressBar.progress + 0.0001
        progressBar.setProgress(newProgress)
        let newHpKecil = progressBar.progress + 0.0001
        let newHpGendut = progressBar.progress + 0.0001
        progressBarKecil.setProgress(newHpKecil)
        progressBarGendut.setProgress(newHpGendut)
        
        outOfBounds(gendut: gendut, kecil: kecil, foregroundImage: foregroundImage)
        movement.moveGendutAnimation(gendut: gendut,gendutUpPressed: gendutUpPressed, gendutDownPressed: gendutDownPressed, gendutLeftPressed: gendutLeftPressed, gendutRightPressed: gendutRightPressed)
        movement.moveKecilAnimation(kecil: kecil, kecilUpPressed: kecilUpPressed, kecilDownPressed: kecilDownPressed, kecilLeftPressed: kecilLeftPressed, kecilRightPressed: kecilRightPressed)
         
    }
    

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    func displayTextCanon(at position: CGPoint) {
        let text = SKLabelNode(text: "Press A to activate")
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
