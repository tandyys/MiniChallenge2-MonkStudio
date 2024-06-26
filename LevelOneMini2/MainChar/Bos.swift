import SpriteKit

class Bos: SKSpriteNode {
    enum PlayerAnimationType: String {
        case move
        case attack
    }
    

    private var bosMoveTexture: [SKTexture]?
    private var bosMoveTextureAttack: [SKTexture]?
    var hpBos: Double = 10000
    var hpTotalBos: Double  = 10000
    var BosLagiAttackKeCharacter: Bool = false
    
    
    init() {
        let texture = SKTexture(imageNamed: "ratBoss_0")
        super.init(texture: texture, color: .clear, size: texture.size())
        self.bosMoveTexture = self.loadAnimation(atlas: "bos", prefix: "ratBoss_", startAt: 0, stopAt: 5)
        self.bosMoveTextureAttack = self.loadAnimation(atlas: "bosAttack", prefix: "ratbossAttack_", startAt: 0, stopAt: 11)
        self.name = "Bos"
        self.setScale(1.4)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = SKSpriteNode.Layer.bos.rawValue
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height / 3), center: CGPoint(x: 0, y: self.size.height / 3))
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.bos
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.projectile
        self.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.projectile
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.allowsRotation = false
        
        // Start the attack cycle
        startAttackCycle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func walk() {
        guard let bosTexture = bosMoveTexture else {
            preconditionFailure("Can't find bos texture")
        }
        startAnimation(textures: bosTexture, speed: 0.15, name: PlayerAnimationType.move.rawValue, count: 0, resize: true, restore: true)
    }
    
    func attackAnimation() {
        guard let bosMoveTextureAttack = bosMoveTextureAttack else {
            preconditionFailure("Can't find bos attack texture")
        }
        startAnimation(textures: bosMoveTextureAttack, speed: 0.15, name: PlayerAnimationType.attack.rawValue, count: 0, resize: true, restore: true)
    }
    
    func stopWalk() {
        removeAction(forKey: PlayerAnimationType.move.rawValue)
    }
    
    func stopAttack() {
        removeAction(forKey: PlayerAnimationType.attack.rawValue)
    
    }
    
    func startAttackCycle() {
        let wait = SKAction.wait(forDuration: 5.0)
        let startAttack = SKAction.run {
            self.BosLagiAttackKeCharacter = true
            self.spawnAttackingMaterialFromBoss()
        }
        let attackDuration = SKAction.wait(forDuration: 2.0)
        let stopAttack = SKAction.run {
            self.BosLagiAttackKeCharacter = false
        }
        let sequence = SKAction.sequence([wait, startAttack, attackDuration, stopAttack])
        let repeatForever = SKAction.repeatForever(sequence)
        run(repeatForever, withKey: "attackCycle")
    }
    
    func spawnAttackingMaterialFromBoss() {
        
        let minSpawn = 1
        let maxSpawn = 10
        let numberOfJatuhan = Int.random(in: minSpawn...maxSpawn )
        print("Spawning \(numberOfJatuhan) jatuhan nodes")

        for _ in 0..<numberOfJatuhan {
            let jatuhanTexture = SKTexture(imageNamed: "stalaktit1")
            let jatuhan = SKSpriteNode(texture: jatuhanTexture)
            let randomX = CGFloat.random(in: 100...2880)
            let randomY = CGFloat.random(in: 2880...2880)
            
            jatuhan.size = CGSize(width: jatuhan.size.width * 2, height: jatuhan.size.height * 2)
            let bodySize = CGSize(width: jatuhan.size.width * 0.7, height: jatuhan.size.height)
            let bodyPosition = CGPoint(x: jatuhan.size.width-150, y: jatuhan.size.height - 150 )
   
            jatuhan.name = "jatuhan"
            jatuhan.zPosition = SKSpriteNode.Layer.jatuhan.rawValue
            jatuhan.physicsBody = SKPhysicsBody(rectangleOf: bodySize, center: bodyPosition)
            jatuhan.physicsBody?.isDynamic = true
            jatuhan.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.jatuhan
            jatuhan.physicsBody?.collisionBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.gendut
            jatuhan.physicsBody?.affectedByGravity = false
            
            print("Random X: \(randomX), Random Y: \(randomY)")
            jatuhan.position = CGPoint(x: randomX, y: randomY)
            jatuhan.zPosition = SKSpriteNode.Layer.jatuhan.rawValue
            scene?.addChild(jatuhan)
            
            // Add code here to animate the jatuhan falling down
            let moveAction = SKAction.moveTo(y: -200, duration: 3)
            jatuhan.run(moveAction)
            
            
        }
    }
}
