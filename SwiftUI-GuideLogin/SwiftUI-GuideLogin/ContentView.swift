//
//  ContentView.swift
//  SwiftUI-GuideLogin
//
//  Created by qjinliang on 2020/6/18.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            PageViewContainer(viewControllers: Page.getAll.map({
                UIHostingController(rootView: PageView(page: $0))}))
        }.frame(maxWidth: .infinity)
            .background(Color.backgroundColor).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
