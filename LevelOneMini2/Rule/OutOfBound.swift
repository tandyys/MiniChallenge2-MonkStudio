
import SpriteKit

func outOfBounds(gendut:Gendut, kecil:Kecil, foregroundImage: SKSpriteNode ) {
    if gendut.position.x < 150 {
        gendut.position.x = 150
    } else if gendut.position.x > foregroundImage.size.width - 150 {
        gendut.position.x = foregroundImage.size.width - 150
    }

    if gendut.position.y < 150 {
        gendut.position.y = 150
    } else if gendut.position.y > foregroundImage.size.height - 150 {
        gendut.position.y = foregroundImage.size.height - 150
    }
    
    if kecil.position.x < 150 {
        kecil.position.x = 150
    } else if kecil.position.x > foregroundImage.size.width - 150 {
        kecil.position.x = foregroundImage.size.width - 150
    }
    
    if kecil.position.y < 150 {
        kecil.position.y = 150
    } else if kecil.position.y > foregroundImage.size.height - 150 {
        kecil.position.y = foregroundImage.size.height - 150
    }
}
