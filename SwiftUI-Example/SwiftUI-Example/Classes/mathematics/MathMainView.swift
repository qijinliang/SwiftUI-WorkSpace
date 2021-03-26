//
//  MathMainView.swift
//  SwiftUI-Example
//
//  Created by Cheney on 2021/3/26.
//

import SwiftUI

struct MathMainView: View {
    var body: some View {
        Section {
            NavigationLink(destination: MathShowView()){
                Text("Fanshaped")
            }
        }
    }
}

struct MathMainView_Previews: PreviewProvider {
    static var previews: some View {
        MathMainView()
    }
}
