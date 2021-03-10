//
//  ZStackSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/10.
//

import SwiftUI

struct ZStackSwiftUIView: View {
    var body: some View {
        ZStack() {
            Color.gray
            VStack(spacing: 30) {
                Text("ZStack")
                    .font(.largeTitle)
                
                Text("Introducation")
                    .font(.title)
                    .foregroundColor(.white)
                
                VStack() {
                    Text("ZStack are great for setting a background color.")
                        .font(.title)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                
                VStack() {
                    Text("But notice the Color stops at the Safe Areas(white areas on top and bottom)")
                        .font(.title)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
            }
        }
    }
}

struct ZStackSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ZStackSwiftUIView()
    }
}
