//
//  GameScene+LoadUI.swift
//  Watermelon
//
//  Created by 金亮齐 on 2021/5/15.
//

import SpriteKit
import SwiftUI

//MARK: - Load UI
extension GameScene {
    override func didMove(to view: SKView) {
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        makeUI()
        makeNowFruit()
        makeScoreNode()
        
    }
    
    func makeNowFruit() {
        nowFruit = SKSpriteNode(imageNamed: "grape")
        nowFruit.position = CGPoint(x: screen.width / 2, y: screen.height - 50)
        nowFruit.setScale(0.5)
        nowFruit.physicsBody = SKPhysicsBody(circleOfRadius: nowFruit.size.height / 2)
        addChild(nowFruit)
    }
    
    func makeScoreNode() {
        scoreNode = SKSpriteNode(imageNamed: "number/0")
        scoreNode.position = CGPoint(x: 30, y: screen.height - 50)
        scoreNode.setScale(0.5)
        addChild(scoreNode)
    }
    
    func makeUI() {
        let background = SKSpriteNode(color: #colorLiteral(red: 0.9843137255, green: 0.9098039216, blue: 0.6509803922, alpha: 1), size: CGSize(width: screen.width, height: screen.height))
        background.anchorPoint = CGPoint.zero
        background.position = CGPoint.zero
        
        addChild(background)
        
        let solid = SKSpriteNode(color: #colorLiteral(red: 0.4588235294, green: 0.3333333333, blue: 0.2352941176, alpha: 1), size: CGSize(width: screen.width, height: screen.height / 5))
        solid.anchorPoint = CGPoint.zero
        solid.position = CGPoint.zero
        
        addChild(solid)
        
        let ground = SKSpriteNode(color: #colorLiteral(red: 0.6745098039, green: 0.537254902, blue: 0.3490196078, alpha: 1), size: CGSize(width: screen.width, height: 10))
        ground.anchorPoint = CGPoint.zero
        ground.position = CGPoint(x: 0, y: screen.height / 5)
        ground.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: ground.size.height), to: CGPoint(x: ground.size.width, y: ground.size.height))
        addChild(ground)
    }
    
}
