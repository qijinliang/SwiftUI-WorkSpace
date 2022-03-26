//
//  RestauranDetailsView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/3/26.
//

import SwiftUI

struct RestaurantDetails: Decodable {
    let description: String
}

class RestaurantDeatailsViewModel: ObservableObject {
    @Published var isLoading = true
    
    @Published var details: RestaurantDetails?
    
    init() {
        
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=0"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp,err) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.details = try? JSONDecoder().decode(RestaurantDetails.self, from: data)
            }
        }.resume()
    }
}

struct RestauranDetailsView: View {
    
    @ObservedObject var vm = RestaurantDeatailsViewModel()
    
    let restaurant: Restaurant
    
    var body: some View {
    
        ScrollView {
            
            ZStack(alignment: .bottomLeading) {
                Image(restaurant.imageName)
                    .resizable()
                    .scaledToFill()
                
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                
                HStack() {
                    VStack(alignment: .leading) {
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(size: 18,weight: .bold))
                        
                        HStack {
                            ForEach(0..<5, id: \.self) { num in
                                Image(systemName: "star.fill")
                            }.foregroundColor(.orange)
                        }
                    }
                    
                    Spacer()
                    
                    Text("查看更多")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(width: 80)
                        .multilineTextAlignment(.trailing)
                }
                .padding()
            }
            
            VStack(alignment: .leading,spacing: 8) {
                Text("地理位置")
                    .font(.system(size: 16,weight: .bold))
                
                Text("东京，日本")
                
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "dollarsign.circle.fill")
                    }.foregroundColor(.orange)
                }
                
                Text(vm.details?.description ?? "")
                    .padding(.top, 8)
                    .font(.system(size: 14, weight: .regular))
            }
            .padding()
            
            HStack {
                Text("图片")
                    .font(.system(size: 16,weight: .bold))
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(sampleDishPhotos, id: \.self) { num in
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: num)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 80)
                                    .cornerRadius(5)
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                                    .shadow(radius: 2)
                                    .padding(.vertical, 2)
                            } placeholder: {
                                ProgressView()
                            }
                            Text("日本美食")
                                .font(.system(size: 14, weight: .bold))
                            
                            Text("80照片")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                        }
                    }
                }.padding(.horizontal)
            }
        }
        .navigationBarTitle("详情", displayMode: .inline)
    }
    
    let sampleDishPhotos = [
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/0d1d2e79-2f10-4cfd-82da-a1c2ab3638d2",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/3a352f87-3dc1-4fa7-affe-fb12fa8691fe"
    ]
}

struct RestauranDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestauranDetailsView(restaurant: .init(name: "Japans", imageName: "tapas", price: "123", city: "123"))
        }
    }
}
