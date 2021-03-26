//
//  JsonMainView.swift
//  SwiftUI-Example
//
//  Created by jinliang on 2021/3/26.
//

import SwiftUI

struct JsonMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: JsonShowView()) {
                Text("Json")
            }
        }
    }
}

struct JsonMainView_Previews: PreviewProvider {
    static var previews: some View {
        JsonMainView()
    }
}
