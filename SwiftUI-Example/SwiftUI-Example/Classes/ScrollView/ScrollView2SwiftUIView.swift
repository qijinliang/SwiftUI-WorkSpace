//
//  ScrollView2SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/13.
//

import SwiftUI

struct ScrollView2SwiftUIView: View {
    
    var colors: [Color]
    
    var body: some View {
        ScrollView.init(.horizontal, showsIndicators: true){
            HStack(spacing: 20) {
                ForEach(colors, id: \.self) { color in
                    Rectangle()
                        .foregroundColor(color)
                        .frame(width: 200, height: 300, alignment: .center)
                }
            }
        }
    }
}

struct ScrollView2SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView2SwiftUIView(colors: [.blue, .red,.orange,.pink])
    }
}
