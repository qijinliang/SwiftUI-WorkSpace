//
//  TextFieldShowView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/4/6.
//

import SwiftUI

struct TextFieldShowView: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: TextFieldSwiftUIView()) {
                    Text("TextField1")
                }
                NavigationLink(destination: TextField2View()) {
                    Text("TextField2")
                }
            }
        }

    }
}

struct TextFieldShowView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldShowView()
    }
}
