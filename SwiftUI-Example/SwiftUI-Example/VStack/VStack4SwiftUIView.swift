//
//  VStack4SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/12.
//

import SwiftUI

struct VStack4SwiftUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("VStack")
                .font(.largeTitle)
            Text("Alignment")
                .font(.title)
                .foregroundColor(.gray)
            
            VStack() {
                Text("By default, views in a VStack are cneter aligned")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            
            VStack(alignment: .leading, spacing: 40) {
                Text("Leading Alignment")
                    .font(.title)
                    .foregroundColor(.white)
                Divider()
                Image.init(systemName: "arrow.left")
            }
            .padding()
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.blue)
            .padding()
        }
    }
}

struct VStack4SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack4SwiftUIView()
    }
}
