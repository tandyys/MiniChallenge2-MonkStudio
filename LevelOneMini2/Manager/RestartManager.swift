//
//  RestartManager.swift
//  LevelOneMini2
//
//  Created by Christian Gunawan on 26/06/24.
//

import SpriteKit
import Foundation
import GameplayKit
import Carbon

extension GameScene {
    
    func restartGameScene() {
        bos.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 100) //
        canonLeft.position =  CGPoint(x: 150, y: 450)
        canonRight.position = CGPoint(x: foregroundImage.size.width - 750, y: 450)
        bosIsAttacking = false
        canonLeftShoot = false
        canonRightShoot = false
        CanonContactLeft = false
        CanonContactRight = false
        activateCanonLeftButtonAvailable = false
        activateCanonRightButtonAvailable = false
        contactObstacleFromBoss = false
        attackedBosHit = false
        attackedKecilHit = false
        attackedGendutHit = false
        BosLagiAttackKeCharacter = false

        healthBarBos.updateInnerBarWidth(health: bos.hpBos, totalHealth: bos.hpTotalBos)
        healthBarGendut.updateInnerBarWidth(health: gendut.hpTotalGendut, totalHealth: gendut.hpTotalGendut)
        healthBarKecil.updateInnerBarWidth(health: kecil.hpTotalKecil, totalHealth: kecil.hpTotalKecil)

    }
    
    

}
