//
//  AnimationComponent.swift
//  LevelOneMini2
//
//  Created by tandyys on 27/06/24.
//

import Foundation
import SpriteKit
import GameplayKit

struct Animation {
    let textures: [SKTexture]
    var timePerFrame: TimeInterval
    let repeatTexturesForever: Bool
    let resizeTexture: Bool
    let restoreTexture: Bool
    init(textures: [SKTexture], timePerFrame: TimeInterval = TimeInterval(1.0 / 5.0), repeatTexturesForever: Bool = true, resizeTexture: Bool = true, restoreTexture: Bool = true) {
        self.textures = textures
        self.timePerFrame = timePerFrame
        self.repeatTexturesForever = repeatTexturesForever
        self.resizeTexture = resizeTexture
        self.restoreTexture = restoreTexture
    }
}

class AnimationComponent: GKComponent {
    override func didAddToEntity() {
    
    }
    
    override class var supportsSecureCoding: Bool {
        true
    }
}
