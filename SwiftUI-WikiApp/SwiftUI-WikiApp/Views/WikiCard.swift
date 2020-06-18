//
//  WikiCard.swift
//  SwiftUI-WikiApp
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//
import SwiftUI

struct WikiCard: View {
        var icon = "book.fill"
       var color = "orange"
       var text = "全部百科"
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 15 ){
                Image(systemName: icon).foregroundColor(Color.white)
                Text(text).foregroundColor(Color.white)
            }.padding()
                .frame(minWidth: 0.0, maxWidth: .infinity, alignment: .leading)
                .background(Color(color))
                .cornerRadius(15)
            
            HStack {
                Spacer()
                Image(systemName: icon).resizable()
                    .foregroundColor(Color.white.opacity(0.3))
                    .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: .fit)
                    
            }.padding()
            
        }.shadow(color: Color(color).opacity(0.4), radius: 10, x: 0, y: 5)
    }
}

struct WikiCard_Previews: PreviewProvider {
    static var previews: some View {
        WikiCard()
    }
}
