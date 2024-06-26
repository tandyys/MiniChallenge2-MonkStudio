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
        case backMenu
        case buttonMenu
        case logoMenu
        
        case background
        case bos
        case platform
        case tree
        case gate
        case towerUp
        
        case characterKecilFront
        case characterGendut
        case characterKecilBack
        
        case towerFrontGendutFrontKecil
        case kecilFrontGendutBackTower
        case gendutBackKecilBackTower
        
        case towerFrontKecilFrontGendut
        case gendutFrontKecilBackTower
        case kecilBackGendutBackTower
        
        case gendutFrontKecilFrontTower
        case towerFrontKecilBackGendut
        case kecilBackTowerBackGendut
        
        case gendutFrontTowerFrontKecil
        case kecilFrontTowerBackGendut
        case towerBackKecilBackGendut
        
        case kecilFrontTowerFrontGendut
        case gendutFrontTowerBackKecil
        case towerBackGendutBackKecil
        
        case kecilFrontGendutFrontTower
        case towerFrontGendutBackKecil
        case gendutBackTowerBackKecil
        
        case towerDown
        case decor
        case label
        case progressBar
        case boundaries
        case monster
        case projectile
    }
    
    enum PhysicsCategory {
        static let none: UInt32                     = 0
        static let gendut: UInt32                   = 0b1 //1
        static let kecil: UInt32                    = 0b10 //2
        static let monster: UInt32                  = 0b100 //4
        static let towerRedNotActivated: UInt32     = 0b1000 //8
        static let towerPurpleNotActivated: UInt32  = 0b10000 //16
        static let towerBlueNotActivated:UInt32     = 0b100000 //32
        static let towerGreenNotActivated:UInt32    = 0b1000000 //64
        static let towerActivated: UInt32           = 0b10000000 //128
        static let gate: UInt32                     = 0b100000000 //256
        static let towerWhite1Destroyed: UInt32     = 0b1000000000
        static let towerWhite1NotActivated: UInt32  = 0b10000000000
        static let towerWhite1Activated: UInt32     = 0b100000000000
        static let towerWhite2Destroyed: UInt32     = 0b1000000000000
        static let towerWhite2NotActivated: UInt32  = 0b10000000000000
        static let towerWhite2Activated: UInt32     = 0b100000000000000
        static let towerWhite3Destroyed: UInt32     = 0b1000000000000000
        static let towerWhite3NotActivated: UInt32  = 0b10000000000000000
        static let towerWhite3Activated: UInt32     = 0b100000000000000000
        static let platform: UInt32                 = 0b1000000000000000000
        static let bos: UInt32                      = 0b10000000000000000000
        static let projectile: UInt32               = 0b100000000000000000000
        static let projectileCharacter: UInt32      = 0b1000000000000000000000
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
