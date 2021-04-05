//
//  TextShowView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct TextShowView: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: Text1View()) {
                    Text("Text1")
                }
                NavigationLink(destination: Text2View()) {
                    Text("Text2")
                }
                NavigationLink(destination: Text3View()) {
                    Text("Text3")
                }
                NavigationLink(destination: Text4View()) {
                    Text("Text4")
                }
                NavigationLink(destination: Text5View()) {
                    Text("Text5")
                }
                NavigationLink(destination: Text6View()) {
                    Text("Text6")
                }
            }
        }
    }
}

struct TextShowView_Previews: PreviewProvider {
    static var previews: some View {
        TextShowView()
    }
}
