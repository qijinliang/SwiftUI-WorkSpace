//
//  WatchFrame.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct WatchFrame: View {
    
    var size: CGFloat = 200
    var borderSize: CGFloat = 20
    
    var body: some View {
        ZStack {
            Circle().frame(width: size, height: size)
                .foregroundColor(Color.clear)
                .background(RadialGradient(gradient: Gradient(colors: [Color.white, Color.black]), center: .center, startRadius: size * 0.41, endRadius: size))
            
            Circle().stroke(style: StrokeStyle(lineWidth: borderSize))
                .frame(width: size, height: size)
                  .foregroundColor(Color.white)
        }.cornerRadius(size / 2)
            .shadow(color: Color.gray.opacity(0.3), radius: 12, x: 0, y: 0)
    }
}

struct WatchFrame_Previews: PreviewProvider {
    static var previews: some View {
        WatchFrame()
    }
}
