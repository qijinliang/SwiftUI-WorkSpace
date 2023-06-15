//
//  GeometryReader2SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/20.
//

import SwiftUI

struct GeometryReader2SwiftUIView: View {
    var body: some View {
        VStack(spacing: 10) {
           
            Text("GeometryReader")
                .font(.largeTitle)
                .foregroundColor(.black)
            
            Text("Alignment")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("Child views within the GeometryReader are aligned in the upper left corner by default")
                .font(.title)
                .padding()
            
            GeometryReader () { _ in
                Image.init(systemName: "arrow.up.left")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.pink)
        }
        //MARK: 适配齐刘海
//        .edgesIgnoringSafeArea(.all)
    }
}

struct GeometryReader2SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader2SwiftUIView()
    }
}
