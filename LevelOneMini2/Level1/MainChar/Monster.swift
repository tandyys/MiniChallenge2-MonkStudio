//
//  Monster.swift
//  LevelOneMini2
//
//  Created by Sena Kristiawan on 25/06/24.
//

import Foundation
import SpriteKit

class Monster: SKSpriteNode{
    enum MonsterAnimationType: String{
        case walk
        case attack
        case dead
    }
    
    private var monsterWalkTexture: [SKTexture]?
    
    init(frameWidth: CGFloat, frameHeight: CGFloat){
        let texture = SKTexture(imageNamed: "Walk1_1")
        super.init(texture: texture, color: .clear, size: texture.size())
        self.monsterWalkTexture = self.loadAnimation(atlas: "Monster1_Walk", prefix: "Walk1_", startAt: 1, stopAt: 6)
        self.monsterWalkTexture = self.loadAnimation(atlas: "Monster1_Attack", prefix: "Attack1_", startAt: 1, stopAt: 6)
        self.monsterWalkTexture = self.loadAnimation(atlas: "Monster1_Dead", prefix: "Dead1_", startAt: 1, stopAt: 6)
        
        self.name = "monster1"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.zPosition = Layer.monster.rawValue
        
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.categoryBitMask = PhysicsCategory.monster
        self.physicsBody?.contactTestBitMask = PhysicsCategory.projectile | PhysicsCategory.gendut | PhysicsCategory.kecil
        self.physicsBody?.collisionBitMask =
        SKSpriteNode.PhysicsCategory.towerRedNotActivated | SKSpriteNode.PhysicsCategory.towerBlueNotActivated | SKSpriteNode.PhysicsCategory.towerPurpleNotActivated
        | SKSpriteNode.PhysicsCategory.towerGreenNotActivated
        
        | SKSpriteNode.PhysicsCategory.towerActivated
        
        | SKSpriteNode.PhysicsCategory.towerWhite1Destroyed | SKSpriteNode.PhysicsCategory.towerWhite1Activated | SKSpriteNode.PhysicsCategory.towerWhite1NotActivated
        
        | SKSpriteNode.PhysicsCategory.towerWhite2Destroyed | SKSpriteNode.PhysicsCategory.towerWhite2Activated | SKSpriteNode.PhysicsCategory.towerWhite2NotActivated
        
        | SKSpriteNode.PhysicsCategory.towerWhite3Destroyed | SKSpriteNode.PhysicsCategory.towerWhite3Activated | SKSpriteNode.PhysicsCategory.towerWhite3NotActivated
        
        print(frame.size.height/2)
        print(self.size.height/2)
        
        let spawnFromSide = Bool.random()
        
        if spawnFromSide{
            let spawnRight = Bool.random()
            let actualY = random(min: CGFloat(self.size.height/2), max: CGFloat(frameHeight/2 - self.size.height/2))
            if spawnRight{
                
                self.position = CGPoint(x: frameWidth + self.size.width/2, y: actualY)
            }else{
                self.position = CGPoint(x: frameWidth - self.size.width/2, y: actualY)
            }
        }else{
            let spawnTop = Bool.random()
            let actualX = random(min: CGFloat(self.size.width/2), max: CGFloat(frameWidth - self.size.width/2))
            if spawnTop{
                self.position = CGPoint(x: actualX, y: frameWidth + self.size.height/2)
            }else{
                self.position = CGPoint(x: actualX, y: frameWidth - self.size.height/2)
            }
        }
    }
    func walk() {
        //Check the texture
        guard let walkTexture = monsterWalkTexture else {
            preconditionFailure("Cant find kecil texture")
        }
        
        //Run animation
        startAnimation(textures: walkTexture, speed: 0.150, name: MonsterAnimationType.walk.rawValue, count: 0, resize: true, restore: true)
    }
    
    func moveTowardsPlayer(playerPosition : CGPoint){
//        walk()
        let movementSpeed = random(min: CGFloat(2.0), max: CGFloat(10.0))
        let angle = atan2(playerPosition.y - self.position.y, playerPosition.x - self.position.y)
        let dx = movementSpeed * cos(angle)
        let dy = movementSpeed * sin(angle)
        self.position.x += dx
        self.position.y += dy
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat.random(in: min...max)
    }
    
    
}
