//
//  Modifiers.swift
//  DesignCode
//
//  Created by Meng To on 2019-12-10.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct FontModifier: ViewModifier {
    var size: CGFloat = 17
    var weight: Font.Weight = .regular
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: .default))
    }
}

struct CustomFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("WorkSans-Bold", size: 28))
    }
}

struct CornerModifier: ViewModifier {
    var radius: CGFloat = 20
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
    }
}

struct ShadowModifier: ViewModifier {
    var color: Color = Color.black
    var radius: CGFloat = 20
    func body(content: Content) -> some View {
        content
            .shadow(color: color.opacity(0.2), radius: radius, x: 0, y: radius)
            .shadow(color: color.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}
