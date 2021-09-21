//
//  LayoutMainView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/7.
//

import SwiftUI

struct LayoutMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: LayoutShowView()) {
                Text("Layout")
            }
        }
    }
}

struct LayoutMainView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutMainView()
    }
}
