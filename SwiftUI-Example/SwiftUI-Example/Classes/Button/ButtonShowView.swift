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
            }
        }
    }
}

struct ButtonShowView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonShowView()
    }
}
