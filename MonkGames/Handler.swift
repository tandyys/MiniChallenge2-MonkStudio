//
//  Handler.swift
//  Level3Stage2
//
//  Created by Christian Gunawan on 20/06/24.
//
import GameController

class Handler {
    
    static var shootCount = 0
    func buttonMenuValueChangedHandler(button: GCControllerButtonInput, value: Float, pressed: Bool) {
        if pressed {
            print("ini menu")
        }
    }
    
    func buttonXValueChangedHandler(button: GCControllerButtonInput, value: Float, pressed: Bool) {
       
        if pressed {
            Handler.shootCount += 1
            print("shoot \(Handler.shootCount)")
           
        }
    }
    
}
