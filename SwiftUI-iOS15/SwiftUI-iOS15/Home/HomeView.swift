//
//  HomeView.swift
//  SwiftUI-iOS15
//
//  Created by Cheney on 2022/3/7.
//

import SwiftUI

struct HomeView: View {
    
    @State var hasScrolled = false
    
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                Color.clear.preference(key: ScrollPreferencenKey.self, value: proxy.frame(in: .named("scroll")).minY)
            }
            .frame(height: 0)
            FeaturedItem()
            Color.clear.frame(height: 1000)
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollPreferencenKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                }else{
                    hasScrolled = false
                }
            }
        })
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(
            NavigationBar(title: "个人中心", hasScrolled: $hasScrolled)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
