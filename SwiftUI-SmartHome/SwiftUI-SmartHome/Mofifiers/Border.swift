//
//  Border.swift
//  SwiftUI-SmartHome
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct Border: ViewModifier {
   
    var cornerRadius: CGFloat = 0
    var width: CGFloat = 2
    var color: Color = Color.gray
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(color, lineWidth: width)
        )
    }
}

