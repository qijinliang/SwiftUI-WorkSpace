//
//  ContentView.swift
//  SwiftUI-AppStore
//
//  Created by qjinliang on 2020/6/24.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView {
                Home().tabItem {
                    Image("home")
                }
                
                GameHome().tabItem {
                    Image("globe")
                }
                
                CartView().tabItem {
                    Image("cart")
                }
                
                PictureList().tabItem {
                    Image("heart")
                }
                
                ProfileView().tabItem {
                    Image("user")
                }
            }.accentColor(Color("Color"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}