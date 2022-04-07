//
//  RestaurantPhotosView.swift
//  SwiftUI-Discover
//
//  Created by Cheney on 2022/3/24.
//

import SwiftUI

struct RestaurantPhotosView: View {
    
    let photoUrlStrings = [
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/e2f3f5d4-5993-4536-9d8d-b505d7986a5c",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a4d85eff-4c79-4141-a0d6-761cca48eae1",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/20a6783b-3de7-4e58-9e22-bcc6a43b6df6",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/0d1d2e79-2f10-4cfd-82da-a1c2ab3638d2",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/3923d237-3931-44e5-836f-5de40ec04b31",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/254c0418-2b55-4a2b-b530-a31a9799c7d5",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/fa20d064-b6d7-4df9-8f44-0f25f6ee5a19",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a441d22b-5324-4444-8ddf-22b99128838c",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/6b5d013b-dc3b-4e5e-93d9-ec932f42aead",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a6de1d65-8fa3-4674-a6ce-a207b8f86b15",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/5c6bc68c-a8a1-42ac-ab3a-947927826807",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a5e83c0c-c815-4129-bfd4-17e73fa1da78",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/f6ee5fb7-b21b-42c1-b1d8-a455742d0247",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/c22e8d9e-10f2-4559-8c81-375491295e84",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/3a352f87-3dc1-4fa7-affe-fb12fa8691fe",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/8ca76521-1f52-4043-8b86-d2a573342daf",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/73f69749-f986-46ac-9b8b-d7b1d42bddc5"
        ]
    
    @State var mode = "grid"
    
    init() {
        UISegmentedControl.appearance().backgroundColor = .black
        UISegmentedControl.appearance().selectedSegmentTintColor = .orange
        let titleTextAttributs = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributs, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributs, for: .normal)
    }
    
    
    @State var shouldShowFullscreenMoldal = false
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                
                
                Picker("Test",selection: $mode) {
                    Text("Grid").tag("grid")
                    Text("List").tag("List")
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                
                Spacer().fullScreenCover(isPresented: $shouldShowFullscreenMoldal, content: {
                    ZStack(alignment: .topLeading) {
                        Color.black.ignoresSafeArea()
                        RestaurantCarouselContainer(imageUrlStrings: photoUrlStrings)
                        Button(action: {
                            shouldShowFullscreenMoldal.toggle()
                        }, label: {
                            Image(systemName: "xmark")

                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                        })
                    }
                })
                if mode == "grid" {
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: proxy.size.width / 3 - 4, maximum: 300), spacing: 2)
                        
                    ], spacing: 4, content:  {
                        ForEach(photoUrlStrings, id: \.self) { urlString in
                            
                            Button(action: {
                                shouldShowFullscreenMoldal.toggle()
                            }, label: {
                                AsyncImage(url: URL(string: urlString)) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: proxy.size.width / 3 - 3, height: proxy.size.width / 3 - 3)
                                        .clipped()
                                } placeholder: {
                                    ProgressView()
                                }
                            })
                        }
                    }).padding(.horizontal, 2)
                }else{
                    ForEach(photoUrlStrings, id: \.self) { urlString in
                        VStack(alignment: .leading, spacing: 8) {
                            AsyncImage(url: URL(string: urlString)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            
                            HStack {
                                Image(systemName: "heart")
                                Image(systemName: "bubble.right")
                                Image(systemName: "paperplane")
                                Spacer()
                                Image(systemName: "bookmark")
                            }
                            .padding(.horizontal, 8)
                            .font(.system(size: 22))
                            
                            Text("2018年9月10日，“中国菜”正式发布，“麻婆豆腐“被评为“中国菜”四川十大经典名菜")
                                .font(.system(size: 14))
                                .padding(.horizontal, 8)
                            
                            Text("日期 11/4/20")
                                .font(.system(size: 14))
                                .padding(.horizontal, 8)
                                .foregroundColor(.gray)
                        } .padding(.bottom)
                    }
                }
            }
        }
        .navigationBarTitle("All Photos",displayMode: .inline)
    }
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantPhotosView().preferredColorScheme(.dark)
        }
    }
}
