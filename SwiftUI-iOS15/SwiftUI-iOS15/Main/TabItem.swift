//
//  TabItem.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/6.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "首页", icon: "house", tab: .home, color: .teal),
    TabItem(text: "搜索", icon: "magnifyingglass", tab: .explore, color: .blue),
    TabItem(text: "消息", icon: "bell", tab: .notifications, color: .red),
    TabItem(text: "资料", icon: "rectangle.stack", tab: .library, color: .pink)
]


enum Tab: String {
    case home
    case explore
    case notifications
    case library
}

struct TabPreferencenKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
