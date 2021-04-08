//
//  ScrollView3View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/8.
//

import SwiftUI

struct ScrollView3View: View {
    @State private var photos = ["头像5","头像2","赵小臭4","头像4"]
    @State private var currentIndex = 0
    var body: some View {
        GeometryReader() { geometry in
            VStack() {
                ScrollViewReader() { scrollView in
                    ScrollView(.horizontal) {
                        HStack(alignment: .center) {
                            ForEach(photos.indices) { index in
                                Image.init(photos[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(25)
                                    .frame(width: geometry.size.width - 50)
                                    .padding(.horizontal, 25)
                                    .id(index)
                            }
                        }
                    }
                    HStack() {
                        Button(action: {
                            withAnimation{
                                scrollView.scrollTo(0)
                            }
                        }){
                            Image.init(systemName: "backward.end.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .font(.system(size: 40))
                                .foregroundColor(Color.black)
                        }
                        
                        Button(action: {
                            withAnimation{
                                currentIndex = (currentIndex == 0) ? currentIndex : currentIndex - 1
                                scrollView.scrollTo(currentIndex)
                            }
                        }){
                            Image.init(systemName: "arrowtriangle.backward.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .font(.system(size: 50))
                                .foregroundColor(Color.black)
                        }
                        
                        Button(action: {
                            withAnimation{
                                currentIndex = (currentIndex == photos .count - 1) ? currentIndex : currentIndex + 1
                                scrollView.scrollTo(currentIndex)
                            }
                        }){
                            Image.init(systemName: "arrowtriangle.forward.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .font(.system(size: 50))
                                .foregroundColor(Color.black)
                        }
                        
                        Button(action: {
                            withAnimation{
                                scrollView.scrollTo(photos.count - 1)
                            }
                        }){
                            Image.init(systemName: "forward.end.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .font(.system(size: 50))
                                .foregroundColor(Color.black)
                        }
                    }
                    .frame(height: 70)
                }
            }
        }
    }
}

struct ScrollView3View_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView3View()
    }
}
