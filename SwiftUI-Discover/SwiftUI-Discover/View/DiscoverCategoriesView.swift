//
//  DiscoverCategoriesView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/2/22.
//

import SwiftUI


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
                    NavigationLink(destination: CategoryDetailsView(), label: {
                        VStack(spacing: 8) {
                            Image(systemName: category.imageName)
                                .font(.system(size: 20))
                                .foregroundColor(Color(#colorLiteral(red: 0.9882131219, green: 0.6823856831, blue: 0.2509839535, alpha: 1)))
                                .frame(width: 64, height: 64)
                                .background(Color.white)
                                .cornerRadius(64)
                            Text(category.name)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }.frame(width: 68)
                    })
                }
            }  .padding(.horizontal)
        }
    }
}

struct CategoryDetailsView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<5,id: \.self) { num in
                VStack(alignment: .leading, spacing: 0) {
                    Image("art1")
                        .resizable()
                        .scaledToFill()
                    Text("Demo123")
                        .font(.system(size: 12, weight: .semibold))
                        .padding()
                }
                .asTitle()
                .padding()
            }
        }
        .navigationBarTitle("Category",displayMode: .inline)
    }
}
