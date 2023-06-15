//
//  Tab.swift
//  SwiftUI4.0
//
//  Created by 金亮 on 2023/6/2.
//

import SwiftUI

enum TabItemType {
    case TabType
    case ButtonType
}

struct TabItem: Identifiable {
    
    var id = UUID()
    
    var type: TabItemType
    var icon: String
    var text: String
    var tab: Tab?
    
}

enum Tab: String {
    case home
    case calendar
    case notifications
    case profile
}

var tabItems = [
    TabItem(type: .TabType, icon: "house", text: "首页", tab: .home),
    TabItem(type: .TabType, icon: "calendar", text: "动画", tab: .calendar),
    TabItem(type: .ButtonType, icon: "plus", text: "新增", tab: nil),
    TabItem(type: .TabType, icon: "bell", text: "通知", tab: .notifications),
    TabItem(type: .TabType, icon: "person", text: "我的", tab: .profile),
]
