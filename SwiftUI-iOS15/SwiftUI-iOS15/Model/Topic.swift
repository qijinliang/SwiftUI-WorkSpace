//
//  Topic.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/17.
//

import SwiftUI


struct Topic: Identifiable {
    let id = UUID()
    var title: String
    var icon: String
}

var topics = [
    Topic(title: "iOS 程序员", icon: "iphone"),
    Topic(title: "UI 设计师", icon: "eyedropper"),
    Topic(title: "前端开发", icon: "laptopcomputer")
]

