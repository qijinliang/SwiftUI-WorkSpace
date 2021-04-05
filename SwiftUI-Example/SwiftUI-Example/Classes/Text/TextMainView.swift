//
//  TextMainView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/4/3.
//

import SwiftUI

struct TextMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: TextShowView()) {
                Text("Text")
            }
        }
    }
}

struct TextMainView_Previews: PreviewProvider {
    static var previews: some View {
        TextMainView()
    }
}
