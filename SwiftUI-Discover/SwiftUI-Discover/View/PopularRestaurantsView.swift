//
//  DiscoverCategoriesView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/2/22.
//

import SwiftUI

struct Restaurant: Hashable {
    let name, imageName,price,city: String
}


struct PopularRestaurantsView: View {
    
    let restaurants: [Restaurant] = [
        .init(name: "手抓饼", imageName: "tapas",price: "5RMB",city: "中国"),
        .init(name: "肯德基 ", imageName: "bar_grill",price: "10RMB",city: "美国"),
    ]
    
    var body: some View {
        VStack() {
            HStack {
                Text("当地美食")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("查看所有")
                    .font(.system(size: 13, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(restaurants,id: \.self) { restaurant in
                        HStack(spacing : 8) {
                            Image(restaurant.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipped()
                                .padding(.leading, 6)
                                .padding(.vertical, 6)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Text(restaurant.name)
                                    Spacer()
                                    Button(action: {}, label: {
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.gray)
                                    })
                                }
                                
                                HStack {
                                    Image(systemName: "star.fill")
                                    Text(restaurant.price)
                                }
                                Text(restaurant.city)
                            }.font(.system(size: 12, weight: .semibold))
                            Spacer()
                        }
                        .frame(width: 240)
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
