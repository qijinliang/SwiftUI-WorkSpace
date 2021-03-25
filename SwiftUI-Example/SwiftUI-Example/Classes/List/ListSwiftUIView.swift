//
//  ListSwiftUIView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/25.
//

import SwiftUI

struct ListSwiftUIView: View {
    var body: some View {
        NavigationView {
            List{
                Text("HStack")
            }
            .navigationBarTitle("SwiftUI示例")
        }
    }
}

struct ListSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ListSwiftUIView()
    }
}
