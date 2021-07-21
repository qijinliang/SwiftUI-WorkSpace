//
//  HStack2SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/17.
//

import SwiftUI

struct HStack2SwiftUIView: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("HStack")
                .font(.largeTitle)
                .foregroundColor(.white)
            Text("Spacing")
                .font(.largeTitle)
                .foregroundColor(.gray)
            
            VStack() {
                Text("The HStack initalizer allows you to set the spacing between all the views inside the HStack.")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange)
            
            Text("Default Spacing")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            HStack() {
                Image.init(systemName: "1.circle")
                Image.init(systemName: "2.circle")
                Image.init(systemName: "3.circle")
            }
            .font(.largeTitle)
            
            Text("Spacing: 100")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            HStack(spacing: 100) {
                Image.init(systemName: "1.circle")
                Image.init(systemName: "2.circle")
                Image.init(systemName: "3.circle")
            }
            .font(.largeTitle)
        }
    }
}

struct HStack2SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HStack2SwiftUIView().preferredColorScheme(.dark)
    }
}
