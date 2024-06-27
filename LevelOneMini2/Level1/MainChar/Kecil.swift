//
//  Kecil.swift
//  LevelOneMini2
//
//  Created by tandyys on 18/06/24.
//

import Foundation
import SpriteKit
import GameplayKit
import AVFoundation

class Kecil: SKSpriteNode {
    enum PlayerAnimationType:String {
        case walk
        case idle
    }
    
    private var kecilWalkTexture: [SKTexture]?
    private var kecilIdleTexture: [SKTexture]?
    var audioPlayer: AVAudioPlayer?
    
    var playerAgent: GKAgent2D
    var hp:Double = 500
    var hpTotalKecil:Double = 500
    
    init() {
        let texture = SKTexture(imageNamed: "run-k-1")
        self.playerAgent = GKAgent2D()
        
        super.init(texture: texture, color: .clear, size: texture.size())
        loadSoundEffect()
        
        self.kecilWalkTexture = self.loadAnimation(atlas: "Kecil", prefix: "run-k-", startAt: 1, stopAt: 16)
        self.kecilIdleTexture = self.loadAnimation(atlas: "KecilIdle", prefix: "idle-k-", startAt: 1, stopAt: 6)
        
        self.name = "Kecil"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.zPosition = SKSpriteNode.Layer.character.rawValue
        
        //Physics body settings
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height/2), center: CGPoint(x: 0, y: self.size.height/2))
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.kecil
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.towerRedNotActivated | SKSpriteNode.PhysicsCategory.towerBlueNotActivated | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated | SKSpriteNode.PhysicsCategory.towerGreenNotActivated | SKSpriteNode.PhysicsCategory.towerActivated
        | SKSpriteNode.PhysicsCategory.towerWhite1Destroyed | SKSpriteNode.PhysicsCategory.towerWhite1NotActivated
        
        | SKSpriteNode.PhysicsCategory.towerWhite2Destroyed | SKSpriteNode.PhysicsCategory.towerWhite2NotActivated
        
        | SKSpriteNode.PhysicsCategory.towerWhite3Destroyed | SKSpriteNode.PhysicsCategory.towerWhite3NotActivated
        | SKSpriteNode.PhysicsCategory.canonLeft | SKSpriteNode.PhysicsCategory.canonRight | SKSpriteNode.PhysicsCategory.canonLeftNotActivated | SKSpriteNode.PhysicsCategory.canonRightNotActivated | SKSpriteNode.PhysicsCategory.jatuhan
        
        self.physicsBody?.collisionBitMask =
        SKSpriteNode.PhysicsCategory.gendut | SKSpriteNode.PhysicsCategory.monster
        | SKSpriteNode.PhysicsCategory.towerRedNotActivated | SKSpriteNode.PhysicsCategory.towerBlueNotActivated | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated | SKSpriteNode.PhysicsCategory.towerGreenNotActivated
        
        | SKSpriteNode.PhysicsCategory.towerActivated
        
        | SKSpriteNode.PhysicsCategory.platform
        
        | SKSpriteNode.PhysicsCategory.towerWhite1Destroyed | SKSpriteNode.PhysicsCategory.towerWhite1Activated | SKSpriteNode.PhysicsCategory.towerWhite1NotActivated
        
        | SKSpriteNode.PhysicsCategory.towerWhite2Destroyed | SKSpriteNode.PhysicsCategory.towerWhite2Activated | SKSpriteNode.PhysicsCategory.towerWhite2NotActivated
        
        | SKSpriteNode.PhysicsCategory.towerWhite3Destroyed | SKSpriteNode.PhysicsCategory.towerWhite3Activated | SKSpriteNode.PhysicsCategory.towerWhite3NotActivated
        | SKSpriteNode.PhysicsCategory.canonLeft | SKSpriteNode.PhysicsCategory.canonRight | SKSpriteNode.PhysicsCategory.canonLeftNotActivated | SKSpriteNode.PhysicsCategory.canonRightNotActivated | SKSpriteNode.PhysicsCategory.jatuhan
        
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = false
        playerAgent.position = SIMD2(Float(self.position.x), Float(self.position.y))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    func loadSoundEffect() {
        if let soundURL = Bundle.main.url(forResource: "walking", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.prepareToPlay()
                audioPlayer?.volume = 0.5
            } catch {
                print("Error loading sound file: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found")
        }
    }
    
    func walk() {
        //Check the texture
        guard let walkTexture = kecilWalkTexture else {
            preconditionFailure("Cant find kecil texture")
        }
        
        //Run animation
        audioPlayer?.play()
        startAnimation(textures: walkTexture, speed: 0.05, name: PlayerAnimationType.walk.rawValue, count: 0, resize: true, restore: true)
    }
    
    func stop() {
        removeAction(forKey: PlayerAnimationType.walk.rawValue)
//        removeAllActions()
        audioPlayer?.stop()
    }
    
    func idle(){
        guard let idleTexture = kecilIdleTexture else{
            preconditionFailure("Cant find kecil idle texture")
        }
        
        startAnimation(textures: idleTexture, speed: 0.2, name: PlayerAnimationType.idle.rawValue, count: 0, resize: true, restore: true)
    }
}
