//
//  DiscoverCategoriesView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/2/22.
//

import SwiftUI


struct PopularRestaurantsView: View {
    var body: some View {
        VStack() {
            HStack {
                Text("Popular Places to eat")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("Sell All")
                    .font(.system(size: 13, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(0..<5,id: \.self) { num in
                        Spacer()
                            .frame(width: 180, height: 64)
                            .background(Color.gray)
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                            .padding(.bottom)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
