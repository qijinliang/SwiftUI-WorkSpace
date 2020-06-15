//
//  FullWidthModifiner.swift
//  SwiftUI-MovieTicket
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct FullWidthModifiner: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct CardStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
    }
}
