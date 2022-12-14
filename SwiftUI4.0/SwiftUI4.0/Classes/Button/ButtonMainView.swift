//
//  ButtonMainView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/26.
//

import SwiftUI

struct ButtonMainView: View {
    var body: some View {
        Section {
            NavigationLink(destination: ButtonShowView()) {
                Text("Button")
            }
        }
    }
}

struct ButtonMainView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonMainView()
    }
}
