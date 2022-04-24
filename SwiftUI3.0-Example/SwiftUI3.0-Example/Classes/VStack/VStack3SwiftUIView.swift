//
//  VStack3SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/10.
//

import SwiftUI

struct VStack3SwiftUIView: View {
    var body: some View {
        VStack(spacing: 80) {
            Text("间距")
                .font(.title)
                .foregroundColor(.gray)
            VStack() {
                Text("使用spacing可以使得上下间距")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.blue)
            .font(.title)
            
            Image.init(systemName: "arrow.up.and.down.circle.fill")
                .font(.system(size: 40))
        }
    }
}

struct VStack3SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack3SwiftUIView()
    }
}
