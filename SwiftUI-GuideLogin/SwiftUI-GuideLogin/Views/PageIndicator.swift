//
//  PageIndicator.swift
//  SwiftUI-GuideLogin
//
//  Created by qjinliang on 2020/6/18.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct PageIndicator: View {
    
    var currentIndex: Int = 0
    var pagesCount: Int = 4
    var onColor: Color = Color.accentColor
    var offColor: Color = Color.offColor
    var diameter: CGFloat = 10
    
    var body: some View {
        HStack {
            ForEach(0..<pagesCount) { i in
                Image(systemName: "circle.fill").resizable()
                    .foregroundColor(i == self.currentIndex ? self.onColor : self.offColor)
                    .frame(width: self.diameter, height: self.diameter)
            }
        }
    }
}

struct PageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicator()
    }
}
