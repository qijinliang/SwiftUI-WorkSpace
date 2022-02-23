//
//  DiscoverCategoriesView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/2/22.
//

import SwiftUI

struct Category: Hashable {
    let name,imageName: String
}

struct DiscoverCategoriesView: View {
    
    let categories: [Category] = [
        .init(name: "艺术", imageName: "paintpalette.fill"),
        .init(name: "运动", imageName: "sportscourt.fill"),
        .init(name: "现场活动", imageName: "music.mic"),
        .init(name: "美食", imageName: "music.mic"),
        .init(name: "历史记录", imageName: "music.mic"),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment:.top,spacing: 14) {
                ForEach(categories, id: \.self) { category in
                    VStack(spacing: 8) {
                        Image(systemName: category.imageName)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 64, height: 64)
                            .background(Color.gray)
                            .cornerRadius(64)
                            .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        Text(category.name)
                            .font(.system(size: 12, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }.frame(width: 68)
                }
            }  .padding(.horizontal)
        }
    }
}
