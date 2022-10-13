//
//  ChartsMainView.swift
//  SwiftUI4.0-Example
//
//  Created by Cheney on 2022/10/11.
//

import SwiftUI

struct ChartsMainView: View {
    var body: some View {
        Section() {
            NavigationLink(destination: ChartsShowView()) {
                Text("图形")
            }
        }
    }
}

struct ChartsMainView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsMainView()
    }
}
