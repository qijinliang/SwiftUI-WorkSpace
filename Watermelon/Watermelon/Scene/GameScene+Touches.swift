//
//  GameScene+Touches.swift
//  Watermelon
//
//  Created by 金亮齐 on 2021/5/15.
//

import SpriteKit
import SwiftUI

//MARK: - Touches
extension GameScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first  else {
            return
        }
        
        let location = touch.location(in: self)
        
        nowFruit.run(.sequence([
            .moveTo(x: location.x, duration: 0.1),
            .run {
                self.nowFruit.physicsBody = SKPhysicsBody(circleOfRadius: self.nowFruit.size.height / 2)
            },
            .wait(forDuration: 0.5),
            .run {
                self.groundFruits.append(self.nowFruit)
                self.nowFruit = FruiteFactory.randomFruit()
                self.addChild(self.nowFruit)
                self.nowFruit.setScale(0)
                self.nowFruit.run(.scale(to: 0.5, duration: 0.1))
            }
        ]))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
