//
//  Gendut.swift
//  LevelOneMini2
//
//  Created by tandyys on 18/06/24.
//

import Foundation
import SpriteKit
import GameplayKit
import AVFoundation

class Gendut: SKSpriteNode {
    enum PlayerAnimationType:String {
        case idle
        case walk
        
        case attack
    }
    
    private var gendutWalkTexture: [SKTexture]?
    private var gendutIdleTexture: [SKTexture]?
    private var gendutAttackTexture: [SKTexture]?
    var audioPlayer: AVAudioPlayer?
    var attackAudio: AVAudioPlayer?
    
    var playerAgent: GKAgent2D
    var hp:Double = 1000
    var hpTotalGendut:Double = 1000
    
    init() {
        let texture = SKTexture(imageNamed: "run-b-1")
 
        self.playerAgent = GKAgent2D()
        
        super.init(texture: texture, color: .clear, size: texture.size())
        loadSoundEffect()
        loadAttackEffect()
        
        self.gendutWalkTexture = self.loadAnimation(atlas: "Gendut", prefix: "run-b-", startAt: 1, stopAt: 17)
        self.gendutAttackTexture = self.loadAnimation(atlas: "GendutAtt", prefix: "attack-b-", startAt: 1, stopAt: 1)
        self.gendutIdleTexture = self.loadAnimation(atlas: "GendutIdle", prefix: "idle-b-", startAt: 1, stopAt: 5)
        
        self.name = "gendut"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.zPosition = SKSpriteNode.Layer.character.rawValue
        
        //Physics body settings
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width - 120, height: self.size.height/3), center: CGPoint(x: self.size.width - 250, y: self.size.height/3))
        self.physicsBody?.categoryBitMask = SKSpriteNode.PhysicsCategory.gendut
        self.physicsBody?.contactTestBitMask = SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster | SKSpriteNode.PhysicsCategory.towerRedNotActivated | SKSpriteNode.PhysicsCategory.towerBlueNotActivated | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated | SKSpriteNode.PhysicsCategory.towerGreenNotActivated | SKSpriteNode.PhysicsCategory.towerActivated | SKSpriteNode.PhysicsCategory.canonLeft | SKSpriteNode.PhysicsCategory.canonRight | SKSpriteNode.PhysicsCategory.canonLeftNotActivated | SKSpriteNode.PhysicsCategory.canonRightNotActivated | SKSpriteNode.PhysicsCategory.jatuhan
        self.physicsBody?.collisionBitMask =
        SKSpriteNode.PhysicsCategory.kecil | SKSpriteNode.PhysicsCategory.monster
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
    func loadAttackEffect() {
        if let soundURL = Bundle.main.url(forResource: "whoosh", withExtension: "mp3") {
            do {
                attackAudio = try AVAudioPlayer(contentsOf: soundURL)
                attackAudio?.prepareToPlay()
                attackAudio?.volume = 0.5
            } catch {
                print("Error loading sound file: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found")
        }
    }
    
    func walk() {
        //Check the texture
        guard let walkTexture = gendutWalkTexture else {
            preconditionFailure("Cant find gendut texture")
        }
        
        //Run animation
        audioPlayer?.play()
        startAnimation(textures: walkTexture, speed: 0.07, name: PlayerAnimationType.walk.rawValue, count: 0, resize: true, restore: true)
    }
    
    func stop() {
        removeAction(forKey: PlayerAnimationType.walk.rawValue)
        removeAction(forKey: PlayerAnimationType.idle.rawValue)
        removeAction(forKey: PlayerAnimationType.attack.rawValue)
        audioPlayer?.stop()
//        removeAllActions()
    }
    
    func attack(){
        guard let attackTexture = gendutAttackTexture else{
            preconditionFailure("Cant find kecil idle texture")
        }
        startAnimation(textures: attackTexture, speed: 0.1, name: PlayerAnimationType.attack.rawValue, count: 0, resize: true, restore: true)

    }
    
    func idle(){
        guard let idleTexture = gendutIdleTexture else{
            preconditionFailure("Cant find kecil idle texture")
        }
        
        startAnimation(textures: idleTexture, speed: 0.2, name: PlayerAnimationType.idle.rawValue, count: 0, resize: true, restore: true)
    }
}
