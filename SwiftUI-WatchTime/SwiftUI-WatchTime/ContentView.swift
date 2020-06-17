//
//  ContentView.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isExpanded: Bool = false
    private let headerHeight: CGFloat = 100
    
    var body: some View {
        
        let screenSize = UIScreen.main.bounds
        let phoneRatio = String(format: "%.3f", screenSize.width / screenSize.height)
        let refRatio =   String(format: "%.3f",  9.0 / 16.0)
        let isXorAbove = phoneRatio != refRatio
        let sheetTopSpace: CGFloat = isXorAbove ? 60 : 40
        
        return VStack {
            if !isExpanded {
                Header().transition(.move(edge: .leading))
            }
            if !isExpanded {
                WatchView(diameter: 170).transition(.scale)
            }
            if !isExpanded {
                SavedTimeZones().transition(.move(edge: .leading))
            }
            
            if isExpanded{
                Spacer()
            }
            
            BottomToolbar().overlay(
                ZStack(alignment: .bottom) {
                    HStack {
                        if self.isExpanded {
                            VStack {
                                Text("Hello world")
                            }
                        }
                    }.frame(width: self.isExpanded ? UIScreen.main.bounds.width : 50, height: self.isExpanded ?  UIScreen.main.bounds.height - headerHeight - sheetTopSpace : 50)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("justBlue") , Color("heavenBlue") ]) , startPoint: .topTrailing, endPoint: .bottomLeading))
                    .cornerRadius(isExpanded ? 0 : 10)
                    .clipShape(TopRoundedShape(cornerRadius: isExpanded ? 40 : 10 ))
                                               .offset(x: isExpanded ? 0 :  UIScreen.main.bounds.width / 3, y: isExpanded ? 0 : -50)
                    AddButton(isExpanded: self.$isExpanded)
                },alignment: .bottom
            )
        }.edgesIgnoringSafeArea(.bottom)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
