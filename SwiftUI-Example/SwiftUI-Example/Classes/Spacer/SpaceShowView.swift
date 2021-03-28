//
//  SpaceShowView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/28.
//

import SwiftUI

struct SpaceShowView: View {
    var body: some View {
        Form {
            Section {
                NavigationLink(destination: SpacerSwiftUIView()) {
                    Text("Space")
                }
                
                NavigationLink(destination: Spacer2SwiftUIView()) {
                    Text("Space2")
                }
                
                NavigationLink(destination: Spacer3SwiftUIView()) {
                    Text("Space3")
                }
                
                NavigationLink(destination: Spacer4SwiftUIView()) {
                    Text("Space4")
                }
            }
        }
    }
}

struct SpaceShowView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceShowView()
    }
}
