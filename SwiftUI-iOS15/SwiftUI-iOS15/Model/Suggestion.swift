//
//  Suggestion.swift
//  SwiftUI-iOS15
//
//  Created by 醉看红尘这场梦 on 2022/3/13.
//

import SwiftUI

struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "Fultter"),
    Suggestion(text: "Design")
]
