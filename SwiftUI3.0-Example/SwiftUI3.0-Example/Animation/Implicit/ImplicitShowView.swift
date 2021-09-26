//
//  ImplicitShowView.swift
//  SwiftUI3.0-Example
//
//  Created by Cheney on 2021/9/26.
//

import SwiftUI

struct ImplicitShowView: View {
    var body: some View {
        Form() {
            Section() {
                NavigationLink(destination: Implicit1()) {
                    Text("Implicit1")
                }
            }
        }
    }
}

struct ImplicitShowView_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitShowView()
    }
}
