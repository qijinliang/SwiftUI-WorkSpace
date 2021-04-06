//
//  ZStack2SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/28.
//

import SwiftUI

struct ZStack2SwiftUIView: View {
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Text("ZStack")
                    .font(.largeTitle).foregroundColor(.black)
                Text("Edges lgonring Safe Area")
                    .font(.title).foregroundColor(.white)
                
                VStack() {
                    Text("lgnoring the Safe Areas will extend a view to fill the whole secen.")
                        .font(.title)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                Spacer()
            }
        }
    }
}

struct ZStack2SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack2SwiftUIView()
    }
}
