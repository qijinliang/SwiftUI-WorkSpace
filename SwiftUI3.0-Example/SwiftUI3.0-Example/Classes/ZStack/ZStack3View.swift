//
//  ZStack3View.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/4/2.
//

import SwiftUI

struct ZStack3View: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("ZStack")
                .font(.largeTitle)
            Text("Aligning")
                .font(.title)
                .foregroundColor(.gray)
            VStack() {
                Text("The ZStack allows you to align all the views within it")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            
            ZStack(alignment: .topLeading) {
                Image.init("胡歌2")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                Rectangle()
                    .fill(Color.white.opacity(0.6))
                    .frame(maxWidth: .infinity, maxHeight: 50)
                Text("Yosemite National Park")
                    .font(.largeTitle).padding()
                    .padding(.top,-10)
            }
            
            ZStack(alignment: .bottomLeading) {
                Image.init("胡歌2")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                Rectangle()
                    .fill(Color.white.opacity(0.6))
                    .frame(maxWidth: .infinity, maxHeight: 50)
                Text("Yosemite National Park")
                    .font(.largeTitle).padding()
                    .padding(.bottom,-10)
            }
        }
    }
}

struct ZStack3View_Previews: PreviewProvider {
    static var previews: some View {
        ZStack3View()
    }
}
