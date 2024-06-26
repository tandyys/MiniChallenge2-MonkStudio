//
//  HealthbarMinionComponent.swift
//  LevelOneMini2
//
//  Created by tandyys on 25/06/24.
//

import Foundation
import SpriteKit
import GameplayKit

class SpriteComponent: GKComponent {
    let node: SKSpriteNode
    init(texture: SKTexture) {
        node = SKSpriteNode(texture: texture, color: .clear, size: texture.size())
        super .init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
}
