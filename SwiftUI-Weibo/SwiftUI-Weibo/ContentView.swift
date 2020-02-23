//
//  ContentView.swift
//  SwiftUI-Weibo
//
//  Created by qjinliang on 2020/2/23.
//  Copyright © 2020 qjinliang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PostCell(post: Post(avatra: "005tnxzUly8gab4i2r73xj30u00u0js8.jpg", vip: true, name: "用户昵称", date: "2020-2-21 00:00", isFollowed: true))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
