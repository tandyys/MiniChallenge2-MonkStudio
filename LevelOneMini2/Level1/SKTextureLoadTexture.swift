//
//  SKTextureLoadTexture.swift
//  LevelOneMini2
//
//  Created by tandyys on 27/06/24.
//

import Foundation
import SpriteKit

extension SKTexture {
    static func loadTextures(atlas: String, prefix: String, startsAt: Int, stopsAt: Int) -> [SKTexture] {
        var textureArray = [SKTexture]()
        let textureAtlas = SKTextureAtlas(named: atlas) 
        for i in startsAt...stopsAt {
            let textureName = "\(prefix)\(i)"
            let temp = textureAtlas.textureNamed(textureName) 
            textureArray.append(temp)
        }
        return textureArray
    }
}
