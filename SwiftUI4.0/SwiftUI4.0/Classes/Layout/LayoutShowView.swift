//
//  LayoutShowView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/27.
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
                
                NavigationLink(destination: Layout3View()) {
                    Text("Layout3")
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
