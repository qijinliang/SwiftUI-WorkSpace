//
//  ContentView.swift
//  SwiftUI-WikiApp
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    @State private var currentHeight: CGFloat = 0.0
    @State private var movingOffset: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView( showsIndicators: false) {
                    VStack(spacing: 20){
                        HStack(spacing: 20){
                            WikiCard()
                            WikiCard(icon: "lock.fill", color: "blue", text: "私人")
                        }
                        
                        HStack(spacing: 20){
                            WikiCard(icon: "bookmark.fill", color: "purple", text: "书签")
                            WikiCard(icon: "macwindow", color: "green", text: "模板")
                        }
                        
                    }
                }.padding(.horizontal)
                    .padding(.bottom, 30)
                    .navigationBarTitle("百科列表")
                    .navigationBarItems(leading: Button(action: {
                    }) {
                        Image(systemName: "chart.bar").resizable().modifier(NavIconStyle())
                        }, trailing: Button(action: {
                            
                        }){
                            Image(systemName: "chart.pie").resizable().modifier(NavIconStyle())
                    })
            }
            
            CustomSheetView(currentHeight: self.$currentHeight, movingOffset: self.$movingOffset)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
