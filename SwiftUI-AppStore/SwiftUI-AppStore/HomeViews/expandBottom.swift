//
//  expandBottom.swift
//  SwiftUI-AppStore
//
//  Created by qjinliang on 2020/6/24.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct expandBottom: View {
    
    var infos = ["info1","info2","info3"]
    
    var options = ["信息","评论1"]
    
    @State var selected = "信息"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Image("logo").renderingMode(.original)
                VStack(alignment: .leading, spacing: 8) {
                    Text("猫任务")
                    Text("卡夫软件")
                    Image("os")
                }.padding(.leading, 10)
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("heartplus").renderingMode(.original).resizable()
                    .frame(width: 22, height: 20)

                }.padding(.bottom, 35)
            }
            
            HStack(spacing: 15) {
                Spacer()
                
                Text("$9.9").foregroundColor(Color("Color"))
                
                Button(action: {
                    
                }) {
                    Text("购买").padding(.horizontal, 16).padding(.vertical, 10)
                }.foregroundColor(.white)
                    .background(Capsule().fill(Color("Color")))
            }
            
            Text("屏幕截图").fontWeight(.heavy)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(infos, id: \.self) { i in
                        Image(i).renderingMode(.original)
                    }
                }
            }.padding(.vertical, 15)
            
            HStack {
                Spacer()
                
                ForEach(options, id: \.self) { i in
                    
                    Button(action: {
                        self.selected = i
                    }) {
                        Text(i)
                        .padding()
                            .font(.system(size: 18))
                            .foregroundColor(self.selected == i ? Color("Color") : Color.gray)
                        .overlay(
                            Capsule()
                                .fill(self.selected == i ? Color("Color") : Color.clear)
                            .frame(height: 5)
                                .padding(.top, 30)
                        )
                    }
                }
                Spacer()
            }
            
            if self.selected == "信息" {
                Text("跳入邪恶的德拉科斯（Drakoth）和您被绑架的姐姐进行龙，魔法和猫的盛大冒险！ 探索Felingard的巨大世界地图，冒着生命危险和四肢潜入地牢中以进行史诗般的战利品，并在一系列辅助任务中借用爪子给一连串的角色。.")
                    .padding()
            }
            
        }.padding()
            .animation(.spring())
    }
}

struct expandBottom_Previews: PreviewProvider {
    static var previews: some View {
        expandBottom()
    }
}
