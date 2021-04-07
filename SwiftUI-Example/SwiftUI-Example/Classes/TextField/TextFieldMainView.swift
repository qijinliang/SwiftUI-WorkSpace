//
//  TextFieldMiainView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/4/6.
//

import SwiftUI

struct TextFieldMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: TextFieldShowView()) {
                Text("TextField")
            }
        }
    }
}

struct TextFieldMainView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldMainView()
    }
}
