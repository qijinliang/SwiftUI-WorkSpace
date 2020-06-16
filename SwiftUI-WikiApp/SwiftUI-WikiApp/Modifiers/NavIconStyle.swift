//
//  NavIconStyle.swift
//  SwiftUI-WikiApp
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//
import SwiftUI

struct NavIconStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(width: 20, height: 20).foregroundColor(Color.black)
    }
}

