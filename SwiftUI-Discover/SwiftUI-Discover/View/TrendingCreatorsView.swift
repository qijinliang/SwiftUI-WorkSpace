//
//  TrendingCreatorsView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/2/22.
//

import SwiftUI


struct Trending: Hashable {
    let name,imageName: String
}


struct TrendingCreatorsView: View {
    
    let TrendingCategories: [Trending] = [
            .init(name: "艺术", imageName: "paintpalette.fill"),
            .init(name: "运动", imageName: "sportscourt.fill"),
            .init(name: "现场活动", imageName: "music.mic"),
            .init(name: "美食", imageName: "music.mic"),
            .init(name: "历史记录", imageName: "music.mic"),
    ]
    
    var body: some View {
        VStack() {
            HStack {
                Text("人物打卡")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("查看所有")
                    .font(.system(size: 13, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment:.top,spacing: 14) {
                    ForEach(TrendingCategories,id: \.self) { TrendingCategorie in
                        VStack(spacing: 8) {
                            Image(systemName: TrendingCategorie.imageName)
                                .frame(width: 64, height: 64)
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .background(Color.gray)
                                .cornerRadius(64)
                                .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                            Text(TrendingCategorie.name)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }.frame(width: 68)
                    }
                }  .padding(.horizontal)
            }
        }
    }
}
