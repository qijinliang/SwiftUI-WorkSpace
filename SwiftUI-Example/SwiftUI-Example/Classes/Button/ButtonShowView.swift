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
            }
        }
    }
}

struct ButtonShowView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonShowView()
    }
}
