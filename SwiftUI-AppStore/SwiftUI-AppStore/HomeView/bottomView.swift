//
//  bottomView.swift
//  SwiftUI-AppStore
//
//  Created by qjinliang on 2020/6/24.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct bottomView: View {
    @State var show = false
    struct type: Identifiable {
        var id: Int
        var name: String
        var price: String
        var image: String
    }
    
    var bottomlist = [type(id: 0, name: "守护者", price: "$29.99",image: "h1"),
    type(id: 1, name: "王国骑士", price: "$15.99",image: "h2"),
    type(id: 2, name: "龙之英雄", price: "$9.99",image: "h3"),
    type(id: 3, name: "皇冠战争", price: "$19.99",image: "h4")]
    
    
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 10) {
                Capsule().fill(Color("Color")).frame(width: 5, height: 25)
                Text("新款游戏")
                Spacer()
                Text("->").foregroundColor(Color("Color"))
            }.padding(.vertical, 15)
                .onTapGesture {
                self.show.toggle()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(bottomlist) { i in
                        VStack(alignment: .leading, spacing: 8) {
                            Image(i.image).renderingMode(.original)
                            Text(i.name)
                            Image("os")
                            Text(i.price).foregroundColor(Color("Color"))
                        }
                    }
                }
            }
        }
    }
}

struct bottomView_Previews: PreviewProvider {
    static var previews: some View {
        bottomView()
    }
}
