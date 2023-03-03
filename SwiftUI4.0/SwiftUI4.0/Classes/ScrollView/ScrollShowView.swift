//
//  ScrollShowView.swift
//  SwiftUI-Example
//
//  Created by 金亮 on 2021/3/26.
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
            }
        }
    }
}

struct ScrollShowView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollShowView()
    }
}
