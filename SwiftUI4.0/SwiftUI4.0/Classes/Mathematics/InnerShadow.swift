//
//  InnerShadow.swift
//  SwiftUI4.0
//
//  Created by Cheney on 2023/6/15.
//

import SwiftUI

struct InnerShadowSwiftUIView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.radialGradient(colors: [Color(#colorLiteral(red: 0.2970857024, green: 0.3072845936, blue: 0.4444797039, alpha: 1)), .black], center: .center, startRadius: 1, endRadius: 400))
                .ignoresSafeArea()
            
            Circle()
                .foregroundStyle(
                    .linearGradient(colors: [.black.opacity(0), .black.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .shadow(.inner(color: .white.opacity(0.5), radius: 0, x: 1, y: 1))
                    .shadow(.inner(color: .black, radius: 5, x: -10, y: -10))
                )
                .padding(40)
            
            Circle()
                .foregroundStyle(
                    .linearGradient(colors: [.black.opacity(0.5), .black.opacity(0.0)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .shadow(.inner(color: .white.opacity(0.5), radius: 0, x: -1, y: -1))
                    .shadow(.inner(color: .black, radius: 10, x: 10, y: 10))
                )
                .padding(60)
            
            VStack {
                Image(systemName: "aqi.medium")
                Text("Inner")
            }
            .font(.system(size: 70, weight: .bold))
            .foregroundStyle(
                .blue.gradient
                    .shadow(.inner(color: .white.opacity(0.3), radius: 3, x: 1, y: 1))
                    .shadow(.drop(radius: 5, x: 5, y: 5))
            )
        }
    }
}

struct InnerShadow_Previews: PreviewProvider {
    static var previews: some View {
        InnerShadowSwiftUIView()
    }
}
