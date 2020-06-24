//
//  Home.swift
//  SwiftUI-AppStore
//
//  Created by qjinliang on 2020/6/24.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State var selected = "Games"
    var scorlllist = ["游戏","应用","预购","应用购买"]
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("游戏商店").fontWeight(.heavy).font(.title)
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("search").renderingMode(.original)
                }
            }.padding(.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(scorlllist,id: \.self) {i in
                        Button(action: {
                            self.selected = i
                        }) {
                            Text(i).padding().foregroundColor(self.selected == i ? Color.black : Color.gray).overlay(
                                Capsule()
                                    .fill(self.selected == i ? Color("Color") : Color.clear)
                                    .frame(height: 5)
                                    .padding(.top, 30)
                            )
                        }
                    }
                }
            }
            middleView()
            bottomView()
        }.padding()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
