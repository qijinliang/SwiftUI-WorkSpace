//
//  GameScene.swift
//  Watermelon
//
//  Created by 金亮齐 on 2021/5/2.
//

import Foundation
import SpriteKit
import SwiftUI

class GameScene: SKScene {
    
    var nowFruit: SKSpriteNode!
    var scoreNode: SKSpriteNode!
    var fruitUtil: FruitUtil!
    var groundFruits: [SKSpriteNode] = []
}


struct GameScene_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
