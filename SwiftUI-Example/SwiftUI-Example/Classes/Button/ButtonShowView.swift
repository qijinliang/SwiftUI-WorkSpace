//
//  ButtonShowView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/26.
//

import SwiftUI

struct ButtonShowView: View {
    var body: some View {
        Form() {
            Section {
                NavigationLink(destination: ButtonSwiftUIView()) {
                    Text("Button")
                }
                NavigationLink(destination: Button2View()) {
                    Text("Button2")
                }
                NavigationLink(destination: Button3View()) {
                    Text("Button3")
                }
                NavigationLink(destination: Button4View()) {
                    Text("Button4")
                }
                NavigationLink(destination: Button5View()) {
                    Text("Button5")
                }
                NavigationLink(destination: Button6View()) {
                    Text("Button6")
                }
                NavigationLink(destination: Button7View()) {
                    Text("Button7")
                }
                NavigationLink(destination: Button8View()) {
                    Text("Button8")
                }
            }
        }
    }
}

struct ButtonShowView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonShowView()
    }
}
