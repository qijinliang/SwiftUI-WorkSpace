//
//  RestaurantPhotosView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/3/24.
//

import SwiftUI

struct RestaurantPhotosView: View {
    
    let imageUrlStrings = [
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702",
        "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/6982cc9d-3104-4a54-98d7-45ee5d117531"
    ]
    
    @State var mode = "grid"
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: proxy.size.width / 3 - 4, maximum: 300), spacing: 2)

                ], spacing: 4, content:  {
                    ForEach(imageUrlStrings, id: \.self) { urlString in

                        AsyncImage(url: URL(string: urlString)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: proxy.size.width / 3 - 3, height: proxy.size.width / 3 - 3)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }).padding(.horizontal, 2)
            }
        }
        .navigationBarTitle("All Photos",displayMode: .inline)
    }
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantPhotosView()
        }
    }
}
