//
//  GeometryReader4SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/21.
//

import SwiftUI

struct GeometryReader4SwiftUIView: View {
    var body: some View {
        VStack() {
            VStack(spacing: 20) {
                Text("GeometryReader")
                    .font(.largeTitle)
                Text("Getting Size")
                    .font(.title)
                    .foregroundColor(.gray)
            }
            
            GeometryReader() { geometryProxy in
                VStack(spacing: 20) {
                    Text("width:\(geometryProxy.size.width)")
                    Text("height:\(geometryProxy.size.height)")
                }
                .padding()
                .font(.title)
                .foregroundColor(.white)
            }
            .background(Color.pink)
        }
    }
}

struct GeometryReader4SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader4SwiftUIView()
    }
}
