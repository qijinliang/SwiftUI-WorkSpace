//
//  DiscoverCategoriesView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/2/22.
//

import SwiftUI


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
                        NavigationLink(
                            destination: RestaurantDetailsView(restaurant: restaurant),
                            label: {
                                RestaurantTile(restaurant: restaurant)
                                    .foregroundColor(Color(.label))
                            })
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}

struct RestaurantTile: View {
    
    let restaurant: Restaurant
    
    var body: some View {
        HStack(spacing: 8) {
            Image(restaurant.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(5)
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
                    Text("4.7 • Sushi • $$")
                }
                
                Text("Tokyo, Japan")
            }.font(.system(size: 12, weight: .semibold))
            
            Spacer()
        }
        .frame(width: 240)
        .asTile()
    }
}


struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
