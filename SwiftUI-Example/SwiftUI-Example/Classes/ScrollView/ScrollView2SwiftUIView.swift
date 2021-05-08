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
        ScrollView.init(.horizontal, showsIndicators: false){
            HStack(alignment: .center,spacing: 230) {
                ForEach(colors, id: \.self) { color in
                    GeometryReader { geometry in
                        Rectangle()
                            .foregroundColor(color)
                            .frame(width: 200, height: 300, alignment: .center)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 210) / -20), axis: (x: 0, y: 1.0, z: 0))
                    }
                }
            }.padding(.horizontal, 210)
        }
    }
}

struct ScrollView2SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView2SwiftUIView(colors: [.blue, .red,.orange,.pink])
    }
}
