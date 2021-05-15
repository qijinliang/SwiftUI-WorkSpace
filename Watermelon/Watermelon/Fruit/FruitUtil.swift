//
//  File.swift
//  Watermelon
//
//  Created by 金亮齐 on 2021/5/2.
//

import Foundation
import SpriteKit

class FruitUtil {
    func randomFruit() ->SKSpriteNode  {
        let fruit = SKSpriteNode(imageNamed: "kiwi")
        fruit.position = CGPoint(x: screen.width / 2, y: screen.height - 50)
        fruit.setScale(0.5)
        fruit.name = "kiwi"
        return fruit
    }
    
    func getFruitTextureByName(fruitName: String) -> FruitTexture {
        FruitTexture.allCases.first{ $0.name == fruitName }!
    }
}
