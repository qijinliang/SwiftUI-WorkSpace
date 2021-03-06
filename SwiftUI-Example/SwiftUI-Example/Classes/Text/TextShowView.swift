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
                NavigationLink(destination: Text7View()) {
                    Text("Text7")
                }
                NavigationLink(destination: Text8View()) {
                    Text("Text8")
                }
                NavigationLink(destination: Text9View()) {
                    Text("Text9")
                }
                NavigationLink(destination: Text10View()) {
                    Text("Text10")
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
