//
//  Animations.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/9.
//

import SwiftUI

extension Animation {
    static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
}
