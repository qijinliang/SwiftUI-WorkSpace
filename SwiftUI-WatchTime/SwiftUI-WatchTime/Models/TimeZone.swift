//
//  TimeZone.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import Foundation

struct TimeZone: Identifiable {
    let id: UUID
    let Country: String
    let City: String
    let time: String
    
    static func data() -> [TimeZone] {
        return [
            TimeZone(id: UUID(), Country: "美国", City: "芝加哥", time: "7:00 AM"),
            TimeZone(id: UUID(), Country: "克罗地亚", City: "萨格勒布", time: "5:00 AM"),
            TimeZone(id: UUID(), Country: "爱尔兰", City: "利默里克", time: "15:00 AM"),
            TimeZone(id: UUID(), Country: "布隆迪", City: "布琼布拉", time: "10:00 AM"),
        ]
    }
}
