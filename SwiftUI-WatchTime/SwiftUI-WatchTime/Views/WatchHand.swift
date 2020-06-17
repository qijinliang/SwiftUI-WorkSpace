//
//  WatchHand.swift
//  SwiftUI-WatchTime
//
//  Created by qjinliang on 2020/6/17.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct WatchHand: View {
    
    var handWidth: CGFloat = 10
    var handHeight: CGFloat = 100
    var color: Color = Color.blue
    
    var body: some View {
        VStack(spacing: -(handWidth / 2)) {
            Capsule().frame(width: handWidth, height: handHeight).foregroundColor(color)
            Circle().frame(width: handWidth * 2, height: handWidth * 2).foregroundColor(color)
        }
    }
}

struct WatchHand_Previews: PreviewProvider {
    static var previews: some View {
        WatchHand()
    }
}
