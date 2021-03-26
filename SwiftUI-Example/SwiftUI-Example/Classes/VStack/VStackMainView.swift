//
//  VStackMainView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/26.
//

import SwiftUI

struct VStackMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: VStackShowView()) {
                Text("View")
                    .font(.title3)
                    .fontWeight(.heavy)
            }
        }
    }
}

struct VStackMainView_Previews: PreviewProvider {
    static var previews: some View {
        VStackMainView()
    }
}
