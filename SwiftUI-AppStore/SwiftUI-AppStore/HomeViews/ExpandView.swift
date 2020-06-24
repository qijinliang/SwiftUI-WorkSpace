//
//  ExpandView.swift
//  SwiftUI-AppStore
//
//  Created by qjinliang on 2020/6/24.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct ExpandView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            ZStack {
                Image("top").resizable().frame(height: 250)
                Button(action: {
                    
                }) {
                    Image(systemName: "play.circle.fill").font(.largeTitle)
                }.foregroundColor(.white)
            }.overlay(
                VStack {
                    HStack {
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Image(systemName: "chevron.left").font(.body)
                        }.foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image("search")
                        }.foregroundColor(.white)
                    }.padding()
                    Spacer()
                }
            )
            ScrollView(.vertical, showsIndicators: false) {
                expandBottom()
            }
        }
    }
}

struct ExpandView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandView(show: .constant(false))
    }
}
