import SpriteKit
import GameController
import Carbon

class GameScene: SKScene {

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
    
    let backgroundImage = SKSpriteNode(imageNamed: "cave-background1x")
    let foregroundImage = SKSpriteNode(imageNamed: "cave-foreground1x")

    var connectedControllers: [GCController] = []
    var playerControllers: [Int: GCController] = [:]
    let maximumControllerCount = 2
    
    
    
    
    override func didMove(to view: SKView) {
        backgroundImage.position = CGPoint(x: frame.midX, y: frame.midY)
        backgroundImage.scale(to: CGSize(width: 2880, height: 1864))
        backgroundImage.zPosition = -1

        foregroundImage.position = CGPoint(x: frame.midX, y: 400)
        foregroundImage.setScale(1.0)
        foregroundImage.zPosition = 0
        
        addChild(backgroundImage)
        addChild(foregroundImage)
        
        gendut.position = CGPoint(x: 600, y: 900)
        addChild(gendut)
         
        kecil.position = CGPoint(x: 100, y: 300)
        addChild(kecil)
        
        
       
        
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
        outOfBounds()
        movement.moveGendutAnimation(gendut: gendut,gendutUpPressed: gendutUpPressed, gendutDownPressed: gendutDownPressed, gendutLeftPressed: gendutLeftPressed, gendutRightPressed: gendutRightPressed)
        movement.moveKecilAnimation(kecil: kecil, kecilUpPressed: kecilUpPressed, kecilDownPressed: kecilDownPressed, kecilLeftPressed: kecilLeftPressed, kecilRightPressed: kecilRightPressed)
        
    }
    
    
    func outOfBounds() {
        if gendut.position.x < 150 {
            gendut.position.x = 150
        } else if gendut.position.x > foregroundImage.size.width - 150 {
            gendut.position.x = foregroundImage.size.width - 150
        }

        if gendut.position.y < 150 {
            gendut.position.y = 150
        } else if gendut.position.y > foregroundImage.size.height - 150 {
            gendut.position.y = foregroundImage.size.height - 150
        }
        
        if kecil.position.x < 150 {
            kecil.position.x = 150
        } else if kecil.position.x > foregroundImage.size.width - 150 {
            kecil.position.x = foregroundImage.size.width - 150
        }
        
        if kecil.position.y < 150 {
            kecil.position.y = 150
        } else if kecil.position.y > foregroundImage.size.height - 150 {
            kecil.position.y = foregroundImage.size.height - 150
        }
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
