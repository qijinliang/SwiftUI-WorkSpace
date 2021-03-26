//
//  HStackSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/10.
//

import SwiftUI

struct HStackSwiftUIView: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("HStack")
                .font(.largeTitle)
            Text("Introducation")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack() {
                Text("An HStack will horizontally arrange other views within it.")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            
            HStack(spacing: 30) {
                ForEach(0..<3) { text in
                    Text("View\(text)")
                        .font(.title)
                }
            }
        }
    }
}

struct HStackSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HStackSwiftUIView().preferredColorScheme(.dark)
    }
}
