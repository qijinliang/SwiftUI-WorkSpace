//
//  Handbook.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/17.
//

import SwiftUI

struct Handbook: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var logo: String
    var image: String
    var color1: Color
    var color2: Color
}

var handbooks = [
    Handbook(title: "SwiftUI 开发", subtitle: "80 课时 - 9 小时", text: "助 SwiftUI，您可以利用 Swift 的强大功能打造适合各个 Apple 平台的精美 app", logo: "Logo 1", image: "Illustration 1", color1: .teal, color2: .blue),
    Handbook(title: "React 开发", subtitle: "30 课时 - 3 小时", text: "用于构建用户界面的 JavaScript 库", logo: "Logo 1", image: "Illustration 2", color1: .purple, color2: .pink)
]

