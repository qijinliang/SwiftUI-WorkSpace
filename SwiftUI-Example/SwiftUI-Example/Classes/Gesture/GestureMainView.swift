//
//  GestureMainView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/26.
//

import SwiftUI

struct GestureMainView: View {
    var body: some View {
        Section {
            NavigationLink(destination: GestureSwiftUIView()) {
                Text("Gesture")
            }
        }
    }
}

struct GestureMainView_Previews: PreviewProvider {
    static var previews: some View {
        GestureMainView()
    }
}
