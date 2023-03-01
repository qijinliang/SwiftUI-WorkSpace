//
//  ContentView.swift
//  SwiftUI4.0
//
//  Created by Cheney on 2022/12/13.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
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
        }
        .edgesIgnoringSafeArea(.all)
//        .accentColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}