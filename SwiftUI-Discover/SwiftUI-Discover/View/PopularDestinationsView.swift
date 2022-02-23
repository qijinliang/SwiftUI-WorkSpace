//
//  DiscoverCategoriesView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/2/22.
//

import SwiftUI

struct Destination: Hashable {
    let name, country, imageName: String
}

struct PopularDestinationsView: View {
    
    let destinations: [Destination] = [
        .init(name: "澳大利亚", country: "悉尼", imageName: "new_york"),
        .init(name: "日本", country: "东京", imageName: "japan"),
        .init(name: "法国", country: "巴黎", imageName: "eiffel_tower")
    ]
    
    var body: some View {
        VStack() {
            HStack {
                Text("打卡地点")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("查看所有")
                    .font(.system(size: 13, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(destinations,id: \.self) { destination in
                        VStack(alignment: .leading, spacing: 0) {
                            Image(destination.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 125, height: 125)
                                .cornerRadius(4)
                                .padding(.horizontal,6)
                                .padding(.vertical,6)
                            
                            Text(destination.name)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.horizontal,12)
                            Text(destination.country)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.horizontal,12)
                                .padding(.bottom,8)
                        }
                        .background(Color(.init(white: 0.9, alpha: 1)))
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
