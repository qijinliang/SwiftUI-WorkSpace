//
//  GameScene.swift
//  Watermelon
//
//  Created by 金亮齐 on 2021/5/2.
//

import Foundation
import SpriteKit
import SwiftUI

class GameScene: SKScene,SKPhysicsContactDelegate {
    
    var nowFruit: SKSpriteNode!
    var scoreNode: SKSpriteNode!
    
    var score: Int = 0 {
        didSet {
            updateScore()
        }
    }
    
    var groundFruits: [SKSpriteNode] = []
    
    var fruitUtil: FruitUtil!
    
    var ground: SKSpriteNode!
    
    let falldownAudio = AudioUtil(resourceName: "falldown")
    let winAudio = AudioUtil(resourceName: "win")
    let bombAudio = AudioUtil(resourceName: "bomb")
    
    
    var groundCollision = false
    
    
    var redline: SKSpriteNode!
    var isShowingRedline = false
    
    var gameover = false
    var gameoverNode: SKSpriteNode!
    var restart: SKSpriteNode!
    
    func initGame() {
        fruitUtil = FruitUtil()
        
        makeUI()
        makeNowFruit()
        makeScoreNode()
        makeRedline()
    }
}


struct GameScene_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
