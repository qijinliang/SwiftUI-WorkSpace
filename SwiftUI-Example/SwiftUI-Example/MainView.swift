//
//  ContentView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/28.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            //MARK: 基本常用的控件示例
            ListSwiftUIView().tabItem {
                Label.init(
                    title: { Text("SwiftUI") },
                    icon: { Image(systemName: "list.bullet") }
                )
            }
            //MARK: 动画示例
            AnimationShowView().tabItem {
                Label.init(
                    title: { Text("Animation")},
                    icon: { Image(systemName: "rectangle.fill.on.rectangle.fill") }
                )
            }
            //MARK: 小型综合示例
            ProjectMainView().tabItem {
                Label.init(
                    title: { Text("Project") },
                    icon: { Image(systemName: "swift") }
                )
            }
        }
        .edgesIgnoringSafeArea(.all)
        .accentColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
