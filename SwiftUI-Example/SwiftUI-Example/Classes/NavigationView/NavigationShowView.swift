//
//  NavigationShowView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/26.
//

import SwiftUI

struct NavigationShowView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: NavigationSwiftUIView()) {
                Text("NavigationView")
                    .font(.title3)
                    .fontWeight(.heavy)
            }
        }
    }
}

struct NavigationShowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationShowView()
    }
}
