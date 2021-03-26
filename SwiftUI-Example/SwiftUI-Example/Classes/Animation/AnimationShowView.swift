//
//  AnimationShowView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/26.
//

import SwiftUI

struct AnimationShowView: View {
    var body: some View {
        Form {
            Section {
                NavigationLink(destination: PopSwiftUIView()) {
                    Text("POP")
                }
                
                NavigationLink(destination: ShadowSwiftUIView()) {
                    Text("Shadow")
                }
            }
        }
    }
}

struct AnimationShowView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationShowView()
    }
}
