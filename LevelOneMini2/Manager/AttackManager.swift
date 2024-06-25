import Foundation
import SpriteKit

class AttackManager {
    
    func performAttack(damageAmount: Double, currentHealth: Double) -> Double {
        
        var updatedHealth = currentHealth // Use a different variable name to avoid redeclaration
        
        updatedHealth -= damageAmount
        
        // Ensure health doesn't go below 0
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
            gameOver()
        }
    }
    
    func kecilGotAttack(kecil: Kecil, healthBarKecil: HpProgressBar, totalhpKecil: Double, damage: CGFloat, attackedKecilHit: inout Bool) {
        kecil.hp -= damage
        healthBarKecil.updateInnerBarWidth(health: kecil.hp, totalHealth: CGFloat(totalhpKecil))
        print("\(kecil.hp)")
        attackedKecilHit = false
        if kecil.hp < 0 {
            kecil.hp = 0
            gameOver()
            print("kecil")
            healthBarKecil.updateInnerBarWidth(health: kecil.hp, totalHealth: CGFloat(totalhpKecil))
        }
    }
    
    func gendutGotAttack(gendut: Gendut, healthBarGendut: HpProgressBar, totalhpGendut: Double, damage: CGFloat, attackedGendutHit: inout Bool) {
        gendut.hp -= damage
        healthBarGendut.updateInnerBarWidth(health: gendut.hp, totalHealth: CGFloat(totalhpGendut))
        print("\(gendut.hp)")
        attackedGendutHit = false
        if gendut.hp < 0 {
            gendut.hp = 0
            gameOver()
            print("gendut")
            healthBarGendut.updateInnerBarWidth(health: gendut.hp, totalHealth: CGFloat(totalhpGendut))
        }
    }
    
    func gameOver() {
        print("Lu Mati")
    }

}
    
    
