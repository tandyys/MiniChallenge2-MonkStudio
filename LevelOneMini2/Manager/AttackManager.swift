import Foundation
import SpriteKit

class AttackManager {
    
    let bos = Bos()
    let kecil = Kecil()
    let gendut = Gendut()
    var gameOverState:Bool = false
    var youWinState:Bool = false
    

    
    func performAttack(damageAmount: Double, currentHealth: Double) -> Double {
        
        var updatedHealth = currentHealth
        
        updatedHealth -= damageAmount
        if updatedHealth < 0 {
            updatedHealth = 0
        }
        
        return updatedHealth
    }
    
    
    func bosGotAttack(bos: Bos, healthBarBos: HpProgressBar, totalhpBos: Double, damage: CGFloat, attackedBosHit: inout Bool) {
        bos.hpBos -= damage
        healthBarBos.updateInnerBarWidth(health: bos.hpBos, totalHealth: CGFloat(totalhpBos))
        print("\(bos.hpBos)")
        attackedBosHit = false
        if bos.hpBos < 0 {
            bos.hpBos = 0
            healthBarBos.updateInnerBarWidth(health: bos.hpBos, totalHealth: CGFloat(totalhpBos))
            youWin()
        }
    }
    
    func kecilGotAttack(kecil: Kecil, healthBarKecil: HpProgressBar, totalhpKecil: Double, damage: CGFloat, attackedKecilHit: inout Bool) {
        kecil.hp -= damage
        healthBarKecil.updateInnerBarWidth(health: kecil.hp, totalHealth: CGFloat(totalhpKecil))
        print("\(kecil.hp)")
        attackedKecilHit = false
        if kecil.hp < 1 {
            kecil.hp = 0
            gameOver()
            healthBarKecil.updateInnerBarWidth(health: kecil.hp, totalHealth: CGFloat(totalhpKecil))
        }
    }
    
    func gendutGotAttack(gendut: Gendut, healthBarGendut: HpProgressBar, totalhpGendut: Double, damage: CGFloat, attackedGendutHit: inout Bool) {
        gendut.hp -= damage
        healthBarGendut.updateInnerBarWidth(health: gendut.hp, totalHealth: CGFloat(totalhpGendut))
        print("\(gendut.hp)")
        attackedGendutHit = false
        if gendut.hp < 1 {
            gendut.hp = 0
            gameOver()
            healthBarGendut.updateInnerBarWidth(health: gendut.hp, totalHealth: CGFloat(totalhpGendut))
        }
    }
    func gameOver() {
        gameOverState = true
    }
    
    func youWin(){
        youWinState = true
        
    }

}
    
    
