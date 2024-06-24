import Foundation

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
}
