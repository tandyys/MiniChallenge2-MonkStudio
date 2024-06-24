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
        case bos
        case foreground
        case character
        case projectile
        case canon
        case label
        case progressBar
      
        
    }
    
    enum PhysicsCategory {
        static let none: UInt32 = 0
        static let gendut: UInt32 = 0b1 //1
        static let kecil: UInt32 = 0b10 //2
        static let monster: UInt32 = 0b100 //4
        static let tower: UInt32 = 0b1000 //8
        static let bos: UInt32 = 0b100000 
        static let canonLeft: UInt32 = 0b1000000
        static let canonRight: UInt32 = 0b1000000
        static let canonLeftNotActivated: UInt32 = 0b10000000
        static let canonRightNotActivated: UInt32 = 0b100000000
        static let projectile: UInt32 = 0b1000000000 
        
        

        
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
