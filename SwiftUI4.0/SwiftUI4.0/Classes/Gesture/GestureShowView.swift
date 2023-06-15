//
//  SwiftUIView.swift
//  SwiftUI4.0
//
//  Created by Cheney on 2023/6/15.
//

import SwiftUI

struct GestureShowView: View {
    var body: some View {
        Form() {
            Section {
                NavigationLink(destination: GestureSwiftUIView()) {
                    Text("Gesture")
                }
                NavigationLink(destination: Gesture2SwiftUIView()) {
                    Text("Gesture2")
                }

            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GestureShowView()
    }
}
