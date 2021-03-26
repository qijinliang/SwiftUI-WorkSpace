//
//  ScrollMainView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/26.
//

import SwiftUI

struct ScrollMainView: View {
    var body: some View {
        Section {
            NavigationLink(destination: ScrollShowView()) {
                Text("ScrollView")
            }
        }
    }
}

struct ScrollMainView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollMainView()
    }
}
