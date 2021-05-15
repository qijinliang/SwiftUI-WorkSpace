//
//  File.swift
//  Watermelon
//
//  Created by 金亮齐 on 2021/5/2.
//

import Foundation
import SpriteKit

class FruitUtil {
    
    private let mixList = [
        FruitTexture.grape,
        FruitTexture.cherry,
        FruitTexture.orange,
        FruitTexture.lemon,
        FruitTexture.kiwi,
        FruitTexture.tomato,
        FruitTexture.peach,
        FruitTexture.pineapple,
        FruitTexture.cocount,
        FruitTexture.halfwatermelon,
        FruitTexture.watermelon
    ]
    
    func getFruitScore(fruitName: String) -> Int {
        mixList.firstIndex{ $0.name == fruitName }! + 1
    }
    
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
    
    func mixFruit(fruitName: String) -> SKSpriteNode? {
        let index = mixList.firstIndex{ fruitName == $0.name }
        if index == nil || index! == mixList.count - 1 {
            print("fatal error: fruitName not found")
            return nil
        }
        let name = mixList[index! + 1].name
        let fruit = SKSpriteNode(imageNamed: name)
        fruit.name = name
        return fruit
    }
}
