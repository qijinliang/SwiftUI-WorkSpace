//
//  NavigationShowView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/26.
//

import SwiftUI

struct NavigationShowView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: NavigationSwiftUIView()) {
                Text("NavigationView")
            }
        }
    }
}

struct NavigationShowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationShowView()
    }
}
