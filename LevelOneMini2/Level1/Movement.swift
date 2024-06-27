//
//  Movement.swift
//  Level3Stage2
//
//  Created by Christian Gunawan on 21/06/24.
//

class Movement{

    
    func moveGendutAnimation(gendut: Gendut, gendutUpPressed: Bool, gendutDownPressed: Bool, gendutLeftPressed: Bool, gendutRightPressed: Bool){
        //Gendut
        //Case up-down
        if gendutUpPressed == true {
            gendut.position.y += 2.5
            gendut.walk()
            
        } else if gendutDownPressed == true {
            gendut.position.y -= 2.5
            gendut.walk()
        }
        
        if gendutLeftPressed == true {
            gendut.position.x -= 2.5
            gendut.xScale = -1
            gendut.walk()
        } else if gendutRightPressed == true {
            gendut.position.x += 2.5
            gendut.xScale = 1
            gendut.walk()
        }
    }
    
    func moveKecilAnimation(kecil: Kecil, kecilUpPressed: Bool, kecilDownPressed: Bool, kecilLeftPressed: Bool, kecilRightPressed: Bool){
        
        //Kecil
        //Case up-down
        if kecilUpPressed == true {
            kecil.position.y += 5
            kecil.walk()
        } else if kecilDownPressed == true {
            kecil.position.y -= 5
            kecil.walk()
        }
        
        //Case left-right
        if kecilLeftPressed == true {
            kecil.position.x += 5
            kecil.xScale = 1
            kecil.walk()
        } else if kecilRightPressed == true {
            kecil.position.x -= 5
            kecil.xScale = -1
            kecil.walk()
        }
    }
    
    
}
