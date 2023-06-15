//
//  Text5View.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct Text5View: View {
    @State var show = false
    @State var offsetY = 0.0
    
    var body: some View {
        ScrollView {
            Text("Large Title")
                .font(.system(size: offsetY < 59 ? 30 : 17)).bold()
                .padding(.horizontal, 20)
                .overlay(
                    geometry
                )
            
            Text("Text Animation")
                .font(.system(size: show ? 100 : 17)).fontWeight(.bold)
                .onTapGesture {
                    withAnimation {
                        show.toggle()
                    }
                }
                .padding(20)
        }
        .onPreferenceChange(TextPreferenceKey.self) { value in
            offsetY = value
        }
    }
    
    var geometry: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: TextPreferenceKey.self, value: proxy.frame(in: .global).minY)
        }
    }
}

struct TextPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct Text5View_Previews: PreviewProvider {
    static var previews: some View {
        Text5View()
    }
}
