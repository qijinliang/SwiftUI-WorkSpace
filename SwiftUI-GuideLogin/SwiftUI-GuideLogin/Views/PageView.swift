//
//  PageView.swift
//  SwiftUI-GuideLogin
//
//  Created by qjinliang on 2020/6/18.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct PageView: View {
    
    var page = Page.getAll.first!
    
    
    var body: some View {
        
        VStack {
            Image("screen-1")
            VStack {
                Text(page.heading)
                    .font(.title).bold()
                    .layoutPriority(1)
                    .multilineTextAlignment(.center)
                Text(page.subSubheading)
                    .multilineTextAlignment(.center)
            }.padding()
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
