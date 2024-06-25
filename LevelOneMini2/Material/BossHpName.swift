//
//  BossHpName.swift
//  LevelOneMini2
//
//  Created by Christian Gunawan on 25/06/24.
//

import Foundation
import SpriteKit

class BossHpName: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "hpBosLabel")
        super.init(texture: texture, color: .clear, size: CGSize(width: texture.size().width * 0.4, height: texture.size().height * 0.4))
        
        self.position = CGPoint(x: self.frame.minX + 900, y: self.frame.maxY - 220)
        self.zPosition = CGFloat(SKSpriteNode.Layer.label.rawValue)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
