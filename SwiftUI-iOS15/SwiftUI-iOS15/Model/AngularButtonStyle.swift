//
//  AngularButtonStyle.swift
//  SwiftUI-iOS15
//
//  Created by Cheney on 2022/3/13.
//

import SwiftUI

struct AngularButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(Color(.systemBackground))
            .cornerRadius(20)
    }
}

extension ButtonStyle where Self == AngularButtonStyle {
    static var angular: Self {
        return .init()
    }
}
