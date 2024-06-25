//
//  MonsterGeneratorComponent.swift
//  LevelOneMini2
//
//  Created by tandyys on 25/06/24.
//

import Foundation
import SpriteKit
import GameplayKit

class MonsterGeneratorComponent: GKComponent {
    @GKInspectable var monsterType: String = "b"
    @GKInspectable var maxMonsters: Int = 50
    @GKInspectable var monsterHealth: CGFloat = 100
    @GKInspectable var waitTime: TimeInterval = 3
    
    weak var entityManager: EntityManager!
    
    override func didAddToEntity() {
        let wait = SKAction.wait(forDuration: waitTime)
        let spawn = SKAction.run {
            [unowned self] in self.spawnMonsterEntity()
        }
        let sequence = SKAction.sequence([wait, spawn])
        
        let repeatAction: SKAction?
        if maxMonsters == 0 {
            repeatAction = SKAction.repeatForever(sequence)
        } else {
            repeatAction = SKAction.repeat(sequence, count: maxMonsters)
        }
        componentNode.run(repeatAction!, withKey: "spawnMonster")
    }
    
    override class var supportsSecureCoding: Bool {
        true
    }
    
    func spawnMonsterEntity() {
        let healthBarSize = CGSize(width: 100, height: 20)
        let monsterEntity = Minion(texture: SKTexture(imageNamed: "walk-\(monsterType)-1"), monsterType: monsterType, healthBarSize: healthBarSize, maxHealth: monsterHealth, entityManager: entityManager)
        entityManager.add(monsterEntity)
        
        if let monsterNode = monsterEntity.component(ofType: SpriteComponent.self)?.node {
            monsterNode.position = CGPoint(x: 0.5, y: 0.5)
            entityManager.add(monsterEntity)
            monsterNode.run(SKAction.moveBy(x: 100, y: 0, duration: 1.0))
        }
    }
}
