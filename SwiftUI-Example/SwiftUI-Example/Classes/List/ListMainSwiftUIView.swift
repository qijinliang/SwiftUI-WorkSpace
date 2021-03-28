//
//  ListMainSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/28.
//

import SwiftUI

struct ListMainSwiftUIView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: ListShowView()) {
                Text("List")
            }
        }
    }
}

struct ListMainSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ListMainSwiftUIView()
    }
}
