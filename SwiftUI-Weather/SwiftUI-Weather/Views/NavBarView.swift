//
//  NavBarView.swift
//  SwiftUI-Weather
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct NavBarView: View {
    
    var country = "深圳天气"
    
    var body: some View{
        HStack {
            Image(systemName: "ellipsis.circle.fill")
                .resizable()
                .frame(width: 25, height: 25)
            Spacer()
            Text(country).font(.title)
            Spacer()
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 25, height: 25)
            
        }.padding()
    }
}


struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
    }
}
