//
//  DisplayTextManager.swift
//  LevelOneMini2
//
//  Created by Christian Gunawan on 25/06/24.
//

import SpriteKit

class DisplayTextManager: SKNode {
    
    func displayTextCanonLeft(at position: CGPoint) {
        let text = SKLabelNode(text: "Press Y to activate")
        text.position = position
        text.zPosition = SKSpriteNode.Layer.label.rawValue
        text.fontName = "Helvetica-Bold"
        text.fontSize = 36
        text.fontColor = SKColor.white
        addChild(text)
        
        text.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.0),
            SKAction.removeFromParent()
        ]))
    }
    
    func displayTextCanonRight(at position: CGPoint) {
        let text = SKLabelNode(text: "Press U to activate")
        text.position = position
        text.zPosition = SKSpriteNode.Layer.label.rawValue
        text.fontName = "Helvetica-Bold"
        text.fontSize = 36
        text.fontColor = SKColor.white
        addChild(text)
        
        text.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.0),
            SKAction.removeFromParent()
        ]))
    }
    
    func displayAmno(at position: CGPoint, currentAmmo: Int, AmmoMax: Int) {
        let text = SKLabelNode(text: "\(currentAmmo)|\(AmmoMax)")
        text.position = position
        text.zPosition = SKSpriteNode.Layer.label.rawValue
        text.fontName = "Helvetica-Bold"
        text.fontSize = 36
        text.fontColor = SKColor.white
        addChild(text)
        
        text.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.0),
            SKAction.removeFromParent()
        ]))
    }
    
}

