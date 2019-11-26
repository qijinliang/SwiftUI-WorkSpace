//
//  TabBar.swift
//  SwiftUI-DesignCode
//
//  Created by Jerry on 2019/11/26.
//  Copyright © 2019 QijinLiang. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem{
                Image("IconHome")
                Text("首页")
            }
            .tag(1)
            ContentView().tabItem{
                Image("IconCards")
                Text("卡片")
            }
            .tag(2)
            Settings().tabItem{
                Image("IconSettings")
                Text("设置")
            }
            .tag(3)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
