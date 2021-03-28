//
//  ListShowView.swift
//  SwiftUI-Example
//
//  Created by 金亮齐 on 2021/3/28.
//

import SwiftUI

struct ListShowView: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: ScrollViewSwiftUIView()) {
                    Text("List")
                }
                NavigationLink(destination: ScrollViewSwiftUIView()) {
                    Text("Lis2")
                }
                NavigationLink(destination: ScrollViewSwiftUIView()) {
                    Text("List")
                }
            }
        }
    }
}

struct ListShowView_Previews: PreviewProvider {
    static var previews: some View {
        ListShowView()
    }
}
