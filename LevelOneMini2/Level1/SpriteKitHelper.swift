//
//  SpriteKitHelper.swift
//  LevelOneMini2
//
//  Created by tandyys on 18/06/24.
//

import Foundation
import SpriteKit

extension SKSpriteNode {
    
    enum Layer: CGFloat {
        case background
        case tree
        case gate
        case towerUp
        case characterKecilFront
        case characterGendut
        case characterKecilBack
        case monster
        case towerDown
        case decor
        case label
        case progressBar
    }
    
    enum PhysicsCategory {
        static let none: UInt32 = 0
        static let gendut: UInt32 = 0b1 //1
        static let kecil: UInt32 = 0b10 //2
        static let monster: UInt32 = 0b100 //4
        static let towerRedNotActivated: UInt32 = 0b1000 //8
        static let towerPurpleNotActivated: UInt32 = 0b10000 //16
        static let towerBlueNotActivated:UInt32 = 0b100000 //32
        static let towerGreenNotActivated:UInt32 = 0b1000000 //64
        static let towerActivated: UInt32 = 0b10000000 //128
        static let gate: UInt32 = 0b100000000 //256
    }
    
    func loadAnimation(atlas: String, prefix: String, startAt: Int, stopAt: Int) -> [SKTexture] {
        var textureArray = [SKTexture]()
        let textureAtlas = SKTextureAtlas(named: atlas)
        
        for i in startAt...stopAt {
            let textureName = "\(prefix)\(i)"
            let temp = textureAtlas.textureNamed(textureName)
            textureArray.append(temp)
        }
        
        return textureArray
    }
    
    // Start the animation using a name and a count (0 = repeat forever)
    func startAnimation(textures: [SKTexture], speed: Double, name: String, count: Int, resize: Bool, restore: Bool) {
        //Run animation only if animation key doesnt already exist
        if(action(forKey: name) == nil) {
            let animation = SKAction.animate(with: textures, timePerFrame: speed, resize: resize, restore: restore)
            if count == 0 {
                //Run animation until stop
                let repeatAction = SKAction.repeatForever(animation)
                run(repeatAction, withKey: name)
            } else if count == 1 {
                run(animation, withKey: name)
            } else {
                let repeatAction = SKAction.repeat(animation, count: count)
                run(repeatAction, withKey: name)
            }
        }
    }
    
}
