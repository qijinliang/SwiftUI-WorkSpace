//
//  PreferencenKey.swift
//  SwiftUI-iOS15
//
//  Created by Cheney on 2022/3/7.
//

import SwiftUI

struct ScrollPreferencenKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

