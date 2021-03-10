//
//  VStack3SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/10.
//

import SwiftUI

struct VStack3SwiftUIView: View {
    var body: some View {
        VStack(spacing: 80) {
            Text("VStack")
                .font(.largeTitle)
            Text("Spacing")
                .font(.title)
                .foregroundColor(.gray)
            VStack() {
                Text("The VStack initialize allows you to set the spacing between all the views inside the VStack")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.blue)
            .font(.title)
            
            Image.init(systemName: "arrow.up.and.down.circle.fill")
                .font(.system(size: 40))
            
            Text("The spacing here between all of these view is 80")
                .font(.title)
        }
    }
}

struct VStack3SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack3SwiftUIView()
    }
}
