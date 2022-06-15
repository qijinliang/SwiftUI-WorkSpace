//
//  LayoutShowView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/27.
//

import SwiftUI

struct LayoutShowView: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: LayoutSwiftUIView()) {
                    Text("Layout1")
                }
                
                NavigationLink(destination: Layout2SwiftUIView()) {
                    Text("Layout2")
                }
                
            }
        }
    }
}

struct LayoutShowView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutShowView()
    }
}
