//
//  TrendingCreatorsView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/2/22.
//

import SwiftUI


struct TrendingCreatorsView: View {
    var body: some View {
        VStack() {
            HStack {
                Text("Popular Create")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("Sell All")
                    .font(.system(size: 13, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(0..<5,id: \.self) { num in
                        VStack(spacing: 4) {
                            Spacer()
                                .frame(width: 50, height: 50)
                                .background(Color.gray)
                                .cornerRadius(.infinity)
                                .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                            Text("alert")
                                .font(.system(size: 12, weight: .semibold))
                        }
                    }
                }  .padding(.horizontal)
            }
        }
    }
}
