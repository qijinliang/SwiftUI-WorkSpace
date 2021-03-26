//
//  JsonShowView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/26.
//

import SwiftUI

struct JsonShowView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: JsonSwiftUIView()) {
                Text("Json")
            }
        }
    }
}

struct JsonShowView_Previews: PreviewProvider {
    static var previews: some View {
        JsonShowView()
    }
}
