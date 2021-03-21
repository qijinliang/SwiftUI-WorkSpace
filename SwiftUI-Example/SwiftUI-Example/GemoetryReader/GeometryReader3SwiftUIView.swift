//
//  GeometryReader3SwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/21.
//

import SwiftUI

struct GeometryReader3SwiftUIView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("GemoetryReader")
                .font(.largeTitle)
            Text("SafeAreaInsets")
                .font(.title)
                .foregroundColor(.gray)

            Text("GemoetryReader can also tell you the safe area insets it has.")
                .font(.title2)
            
            GeometryReader() { geometryProxy in
                
                VStack(spacing: 20) {
                    Text("geometryProxy.safaAreaInsets.leading:\(geometryProxy.safeAreaInsets.leading)")
                    Text("geometryProxy.safaAreaInsets.trailing:\(geometryProxy.safeAreaInsets.trailing)")
                    Text("geometryProxy.safaAreaInsets.top:\(geometryProxy.safeAreaInsets.top)")
                    Text("geometryProxy.safaAreaInsets.bottom:\(geometryProxy.safeAreaInsets.bottom)")
                }
                .padding()
                .font(.title2)
                .foregroundColor(.white)
            
            }
            .background(Color.pink)
        }
    }
}

struct GeometryReader3SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader3SwiftUIView()
    }
}
