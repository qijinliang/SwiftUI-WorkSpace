//
//  Header.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct Header: View {
    
    var headerHeight: CGFloat = 100
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "person.crop.circle")
                .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.horizontal)
            }
            Text("北京时间")
            Text("2020年6月17日")
        }.frame(height: self.headerHeight)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
