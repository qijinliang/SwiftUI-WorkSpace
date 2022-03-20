//
//  TabItem.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/6.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var name: String
    var icon: String
    var color: Color
    var selection: Tab
}

var tabItems = [
    TabItem(name: "首页", icon: "house", color: .teal, selection: .home),
    TabItem(name: "搜索", icon: "magnifyingglass", color: .blue, selection: .explore),
    TabItem(name: "消息", icon: "bell", color: .red, selection: .notifications),
    TabItem(name: "资料", icon: "rectangle.stack", color: .pink, selection: .library)
]

enum Tab: String {
    case home
    case explore
    case notifications
    case library
}
