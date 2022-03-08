//
//  HomeView.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/7.
//

import SwiftUI

struct HomeView: View {
    
    @State var hasScrolled = false
    
    var body: some View {
        ZStack {
            
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                GeometryReader { proxy in
                    Color.clear.preference(key: ScrollPreferencenKey.self, value: proxy.frame(in: .named("scroll")).minY)
                }
                .frame(height: 0)
                TabView {
                    ForEach(courses) { item in
                        FeaturedItem(course: item)
                    }
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 430)
                .background(
                    Image("Blob 1")
                        .offset(x: 250, y: -100)
                )
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
