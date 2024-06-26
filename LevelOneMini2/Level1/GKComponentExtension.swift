//
//  GKComponentExtension.swift
//  LevelOneMini2
//
//  Created by tandyys on 25/06/24.
//

import Foundation
import SpriteKit
import GameplayKit

extension GKComponent {
    var componentNode: SKNode {
        if let node = entity?.component(ofType: GKSKNodeComponent.self)?.node {
            return node
        } else if let node = entity?.component(ofType: SpriteComponent.self)?.node {
            return node
        }
        return SKNode()
    }
}
