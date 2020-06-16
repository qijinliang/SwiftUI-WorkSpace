//
//  Place.swift
//  SwiftUI-SmartHome
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI


struct Place:  Hashable, Identifiable{
    
    var id = UUID()
    let name: String
    let numberOfLights: Int
    let lightColor: String
    let brightnessLevel: CGFloat
    
    init(name: String = "", numberOfLights: Int = 0, lightColor: String = "", brightnessLevel: CGFloat = 0) {
        self.name = name
        self.numberOfLights = numberOfLights
        self.lightColor = lightColor
        self.brightnessLevel = brightnessLevel
    }
    
    
    static func getDummyData() -> [Place] {
        [
            Place(name: "办公室", numberOfLights: 5, lightColor: "brightGreen", brightnessLevel: 0.7),
            Place(name: "厕所", numberOfLights: 11, lightColor: "heavenBlue", brightnessLevel: 0.2),
            Place(name: "厨房", numberOfLights: 8, lightColor: "justPurple", brightnessLevel: 0.4),
            Place(name: "卧室", numberOfLights: 15, lightColor: "neatRed", brightnessLevel: 0.8),
            Place(name: "客厅", numberOfLights: 17, lightColor: "notYellow", brightnessLevel: 0.5)
        ]
    }
    
}
