//
//  ScrollShowView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/26.
//

import SwiftUI

struct ScrollShowView: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: ScrollViewSwiftUIView()) {
                    Text("ScrollView")
                }
                
                NavigationLink(destination: ScrollViewFoodView()) {
                    Text("ScrollViewFoodView")
                }
                
                NavigationLink(destination: ScrollView3View()) {
                    Text("ScrollView3")
                }
            }
        }
    }
}

struct ScrollShowView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollShowView()
    }
}
