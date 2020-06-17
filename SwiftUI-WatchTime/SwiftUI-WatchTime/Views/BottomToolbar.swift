//
//  BottomToolbar.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct BottomToolbar: View {

    var body: some View {
        HStack {
            Image(systemName: "square.grid.2x2").resizable().frame(width: 20, height: 20)
            Spacer()
            Image(systemName: "alarm").resizable().frame(width: 20, height: 20)
            Spacer()
            Image(systemName: "person").resizable().frame(width: 20, height: 20)
            Spacer()
        }.padding(30).frame(maxWidth: .infinity, alignment: .top).background(Color.white)
        .clipShape(TopRoundedShape(cornerRadius: 30))
            .shadow(color: Color.gray.opacity(0.2), radius: 10, x: 0, y: -5)
    }
}

struct BottomToolbar_Previews: PreviewProvider {
    static var previews: some View {
        BottomToolbar()
    }
}
