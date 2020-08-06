//
//  HorizontalScrollView.swift
//  SwiftUI-AppStore
//
//  Created by qjinliang on 2020/8/2.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct HorizontalScrollView: View {
    
    var items : [gameData]
    
    var body: some View {
        VStack {
            
            HStack {
                VStack {
                    Text("Jay").font(Font.system(size: 25)).bold()
                    Text("杰伦").font(Font.caption).foregroundColor(.gray)
                }
                Spacer()
                Button(action: self.seeAll, label: {Text("查看所有")})
            }.padding()
            ScrollView(.horizontal, showsIndicators: false) {
                ForEach(0 ..< 3) { row in
                    HStack {
                        ForEach(0 ..< self.items.count / 3) { column in
                            GameCell(data: self.items[self.datermineCurrentCell(row: row, column: column)])
                        }
                    }
                }
            }
        }
    }
    
    func datermineCurrentCell(row: Int, column: Int) -> Int {
        return ((((column + 1) * 3) - row) - 1)
    }
    
    func seeAll() {
        
    }
}

struct GameCell: View {
    var data: gameData
    var hasInAppPurchass: Bool = true
    var body: some View {
        HStack {
            Image(data.image).resizable().frame(width: 70, height: 70, alignment: .leading)
                .cornerRadius(15)
            VStack(alignment: .leading) {
                Text(data.title).font(Font.system(size: 20))
                Text(data.subtitle).font(.system(size: 12)).foregroundColor(Color.gray)
            }
            Spacer()
            VStack(spacing: 5) {
                Button(action: self.get, label: {Text("获取").padding(EdgeInsets.init(top: 3, leading: 30, bottom: 3, trailing: 30))}).background(Color.gray.opacity(0.3)).cornerRadius(15)
                if hasInAppPurchass == true {
                    Text("关于").font(.system(size: 10)).foregroundColor(.gray)
                }
            }
        }.padding().frame(width: 400, alignment: .leading)
    }
    func get() {
        
    }
}

struct HorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalScrollView(items: GameStorage().thisWeekGames)
    }
}
