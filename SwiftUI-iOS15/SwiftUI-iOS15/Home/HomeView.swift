//
//  HomeView.swift
//  SwiftUI-iOS15
//
//  Created by Cheney on 2022/3/7.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            FeaturedItem()
            Color.clear.frame(height: 1000)
        }
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(
            NavigationBar(title: "个人中心")
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
