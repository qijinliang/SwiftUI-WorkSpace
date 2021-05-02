//
//  File.swift
//  Watermelon
//
//  Created by 金亮齐 on 2021/5/2.
//

import Foundation
import SpriteKit

class FruiteFactory {
    static func randomFruit() ->SKSpriteNode  {
        let fruit = SKSpriteNode(imageNamed: "kiwi")
        fruit.position = CGPoint(x: screen.width / 2, y: screen.height - 50)
        fruit.setScale(0.5)
        return fruit
    }
}
