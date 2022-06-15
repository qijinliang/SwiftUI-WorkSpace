//
//  ZStack5SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/28.
//

import SwiftUI

struct ZStack5SwiftUIView: View {
    var body: some View {
        ZStack() {
            VStack(spacing: 20) {
                Text("ZStack")
                    .font(.largeTitle)
                Text("Layering & Aligning")
                    .font(.title)
                    .foregroundColor(Color.gray)
                
                VStack() {
                    Text("ZStacks are great for layering views.For example, putting text on top of an image.")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                
                ZStack() {
                    
                    Image.init("胡歌1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                    
                    //MARK: 第一种方法
//                    VStack() {
//                        Text("Yosemite National Parl")
//                            .font(.title)
//                    }
//                    .padding()
//                    .frame(maxWidth: .infinity, maxHeight: 50)
//                    .background(Color.white.opacity(0.6))
                    
                    //MARK: 第一种方法
                    Rectangle()
                        .fill(Color.white.opacity(0.6))
                        .frame(maxWidth: .infinity, maxHeight: 50)
                    Text("Yosemite National Parl")
                        .font(.title)
                    
                }
                
                VStack() {
                    Text("But what if you wanted to have all the views align to the bottom?")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
            }
        }
    }
}

struct ZStack5SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack5SwiftUIView()
    }
}
