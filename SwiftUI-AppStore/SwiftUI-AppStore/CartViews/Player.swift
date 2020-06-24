//
//  Player.swift
//  SwiftUI-AppStore
//
//  Created by qjinliang on 2020/6/24.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct Player : Identifiable {
    
    var id : Int
    var powers : [CGFloat]
    var image : String
    var name : String
    var color : Color
}

var data = [

    Player(id: 0, powers: [0.2,0.5,0.9], image: "Player1", name: "Bomb Raider", color: Color("Color")),
    Player(id: 2, powers: [0.3,0.5,0.6], image: "Player2", name: "Pekka", color: Color("Color1")),
    Player(id: 1, powers: [0.5,0.4,0.8], image: "Player3", name: "Barberian",color: Color("Color1")),

]
