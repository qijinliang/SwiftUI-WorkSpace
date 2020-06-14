//
//  FullWidthModifiner.swift
//  SwiftUI-MovieTicket
//
//  Created by qjinliang on 2020/6/14.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct FullWidthModifiner: ViewModifier {
    var alignment: Alignment = .leading
    func body(content: Content) -> some View {
        content.frame(minWidth: 0, maxWidth: .infinity, alignment: alignment)
    }
}

extension View {
    func fullWidthModifiner(alignment: Alignment) -> some View {
        self.modifier(FullWidthModifiner(alignment: alignment))
    }
}
