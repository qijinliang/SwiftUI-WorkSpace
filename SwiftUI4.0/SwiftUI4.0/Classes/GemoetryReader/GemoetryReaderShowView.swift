//
//  GemoetryReaderShowView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/27.
//

import SwiftUI

struct GemoetryReaderShowView: View {
    var body: some View {
        Form {
            Section() {
                NavigationLink(destination: GeometryReaderSwiftUIView()) {
                    Text("GemoetryReader")
                }
                
                NavigationLink(destination: GeometryReader2SwiftUIView()) {
                    Text("GemoetryReader2")
                }
                
                NavigationLink(destination: GeometryReader3SwiftUIView()) {
                    Text("GemoetryReader3")
                }
                
                NavigationLink(destination: GeometryReader4SwiftUIView()) {
                    Text("GemoetryReader4")
                }
                
                NavigationLink(destination: GeometryReader5SwiftUIView()) {
                    Text("GemoetryReader5")
                }
            }
        }
    }
}

struct GemoetryReaderShowView_Previews: PreviewProvider {
    static var previews: some View {
        GemoetryReaderShowView()
    }
}
