//
//  ContentView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            //MARK: 基本常用的控件示例
            ListSwiftUIView().tabItem {
                Image.init(systemName: "list.bullet")
                Text("SwiftUI")
            }
            //MARK: 动画示例
            ZStack5SwiftUIView().tabItem {
                Image.init(systemName: "rectangle.fill.on.rectangle.fill")
                Text("Animation")
                    .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
            }
        }
        .edgesIgnoringSafeArea(.all)
        .accentColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
